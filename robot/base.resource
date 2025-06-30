*** Settings ***
Documentation        Librarys, resources e Keywords para ações globais

Library              Browser
Library              JSONLibrary
Library              FakerLibrary
Library              OperatingSystem
Library              Collections
Library              String

Resource             ../resources/env.resource

Resource             ../resources/pages/LoginPage.resource
Resource             ../resources/pages/CadastroPage.resource
Resource             ../resources/pages/PerfilPage.resource




*** Keywords ***
Start Session
    New Browser    browser=chromium    headless=False

Fazer login com usuário recém-cadastrado
    Abrir página de login
    Preencher login    ${USER.email}    ${USER.password}
    Enviar login
    Verificar login com sucesso

