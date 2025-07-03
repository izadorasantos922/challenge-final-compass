*** Settings ***
Documentation        Cenários de visualizar sessões dentro do módulo de sessões
Resource             ../../resources/base.resource

Test Setup           Start Session  

*** Test Cases ***
Visualizar detalhes de uma sessão na interface
    [Tags]    sessões disponiveis
    Abrir página de login
    Preencher login    ${LOGIN_USER_EMAIL}    ${LOGIN_SENHA_USER}
    Enviar login
    Verificar login com sucesso
    Acessar detalhes de um filme em cartaz
    Verificar sessões disponíveis