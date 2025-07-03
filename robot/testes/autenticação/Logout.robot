*** Settings ***
Documentation    Teste de Logout como usuário

Resource    ../../resources/base.resource


Suite Setup      Start Session 

*** Test Cases ***
Logout com usuário comum
    [Tags]    logout
    Abrir página de login
    Preencher login    ${LOGIN_USER_EMAIL}    ${LOGIN_SENHA_USER}
    Enviar login
    Verificar login com sucesso
    Fazer Logout
