*** Settings ***
Documentation    Teste de login como usuário e administrador

Resource         ../../resources/base.resource

Suite Setup      Start Session 

*** Test Cases ***
Login com admin
    Abrir página de login
    Preencher login    ${LOGIN_ADM_EMAIL}    ${LOGIN_SENHA_ADM}
    Enviar login
    Verificar login com sucesso

Login com usuário comum
    Abrir página de login
    Preencher login    ${LOGIN_USER_EMAIL}    ${LOGIN_SENHA_USER}
    Enviar login
    Verificar login com sucesso

Login com senha inválida
    [Documentation]    Teste de login inválido com captura de tela do erro

    Abrir página de login
    Preencher login    ${LOGIN_USER_EMAIL}    senha_errada_123456_blabla
    Enviar login
    Wait For Elements State    css=.alert-error    visible    5
    Wait For Elements State    css=h1:has-text("Login")    visible    5

