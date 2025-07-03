*** Settings ***
Documentation    Ações e elementos dentro da página de reservas

Library           Browser
Library           String
Resource          ../../resources/base.resource

*** Keywords ***
Ir para página de minhas reservas
    Wait For Elements State    xpath=//a[normalize-space(text())="Minhas Reservas"]    visible    5
    Click    xpath=//a[normalize-space(text())="Minhas Reservas"]
    Wait For Elements State    css=main h1    visible    5
    Get Text    css=main h1    equal    Minhas Reservas

Extrair código da primeira reserva
    Wait For Elements State    css=.reservation-header h3 >> nth=0    visible    5
    ${texto_reserva}=    Get Text    css=.reservation-header h3 >> nth=0
    ${parts}=    Split String    ${texto_reserva}  
    ${codig_8_digits}=    Get Substring    ${parts[1]}    0    8 
    Set Test Variable    ${codig_8_digits}
    Log    Código extraído da primeira reserva: ${codig_8_digits}

Confirmar se a reserva está correta
    ${reserva_id}=    Get Text    css=.reservation-header h3 >> nth=0
    Should Contain    ${reserva_id}    ${codig_8_digits}
    Should Contain    ${reserva_id}    Reserva #
    Log    Código ${codig_8_digits} validado com sucesso na primeira reserva
