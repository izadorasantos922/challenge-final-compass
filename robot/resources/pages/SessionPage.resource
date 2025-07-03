*** Settings ***
Documentation    Verifica a exibição, seleção e compra de sessões de filmes na página de detalhes, incluindo horários, preços, assentos e confirmação de reserva.

Resource    ../base.resource

*** Keywords ***
Verificar sessões disponíveis
    Wait For Elements State    xpath=//h2[text()="Sessões Disponíveis"]    visible    5
    Get Text    xpath=//h2[text()="Sessões Disponíveis"]    equal    Sessões Disponíveis

    Wait For Elements State    css=[class="sessions-list"]    visible    5
    Should Not Be Empty    css=[class="sessions-list"]

    ${session_count}=    Get Element Count    css=[class="session-date-group"]
    Should Be True    ${session_count} >= 1    msg=Deve ter pelo menos 1 sessão
    Log    Encontradas ${session_count} sessões disponíveis

    ${session_time_count}=    Get Element Count    css=[class="session-time"]
    Should Be True    ${session_time_count} >= 1    msg=Deve ter pelo menos 1 horário das sessões
    Log    Encontradas ${session_time_count} horários de sessões disponíveis

    ${session_theater_count}=    Get Element Count    css=[class="session-theater"]
    Should Be True    ${session_theater_count} >= 1    msg=Deve ter pelo menos 1 theater
    Log    Encontradas ${session_theater_count} theaters disponíveis

    ${session_price_count}=    Get Element Count    css=[class="session-price"]
    Should Be True    ${session_price_count} >= 1    msg=Deve ter pelo menos 1 price das sessões
    Log    Encontradas ${session_price_count} prices de sessões disponíveis

Clicar em selecionar assentos para ir a seleção
    Wait For Elements State    xpath=(//a[text()="Selecionar Assentos"])[1]    enabled    10s
    Click    xpath=(//a[text()="Selecionar Assentos"])[1]

Selecionar assentos
    Wait For Elements State    css=button[title*="Fileira F, Assento 4"]    enabled    10s
    Click    css=button[title*="Fileira F, Assento 4"]

Resetar assentos para disponíveis
    Wait For Elements State    css=[class="btn btn-primary btn-sm reset-seats-btn"]    enabled    10s
    Click    css=[class="btn btn-primary btn-sm reset-seats-btn"]

Confirmar se assentos foram resetados
    Wait For Elements State    css=button[title*="Fileira F, Assento 4"]    enabled    10s
    Click    css=button[title*="Fileira F, Assento 4"]

Ir para pagamento e finalizar compra
    Wait For Elements State    css=[class="btn btn-primary checkout-button"]    enabled    10s
    Click    css=[class="btn btn-primary checkout-button"]
    Wait For Elements State    xpath=//h2[text()="Resumo do Pedido"]    visible    5
    Should Not Be Empty    xpath=//h2[text()="Resumo do Pedido"]
    Sleep    1s
    Click    css=[class="btn btn-primary btn-checkout"]

Verificar se a compra foi um sucesso
    Wait For Elements State    css=main h1    visible    5
    Get Text    css=main h1    equal    Reserva Confirmada!
    ${codig_complete}=    Get Text    xpath=//span[text()="Código da Reserva:"]/following-sibling::span
    ${codig_8_digits}=    Get Substring    ${codig_complete}    0    8
    Set Test Variable    ${codig_8_digits}
    Sleep    1s
