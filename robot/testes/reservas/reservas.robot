*** Settings ***
Documentation        Verificar reservas
Resource             ../../resources/base.resource

Test Setup           Start Session  

*** Test Cases ***
Verificar reserva
    [Tags]    Verficar reserva
    Abrir página de login
    Preencher login    ${LOGIN_USER_EMAIL}    ${LOGIN_SENHA_USER}
    Enviar login
    Verificar login com sucesso
    Ir para página de minhas reservas
    Extrair código da primeira reserva
    Confirmar se a reserva está correta


