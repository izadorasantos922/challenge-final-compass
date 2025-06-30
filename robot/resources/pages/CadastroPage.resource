*** Settings ***
Documentation        Ações e elementos na página de cadastro
Library              Browser
Library              FakerLibrary
Resource         ../base.resource



*** Keywords ***
Abrir página de cadastro
    New Page    ${BASE_URL}/register
    Wait For Elements State    css=h1:has-text("Cadastro")    visible    5
Gerar dados de usuário dinâmico para o cadastro
    ${username}=    FakerLibrary.Name
    ${email}=       FakerLibrary.Email
    ${password}=    FakerLibrary.Password
    Set Test Variable    &{USER}    name=${username}    email=${email}    password=${password}

Preencher formulário de cadastro
    Fill Text    id=name        ${USER.name}
    Fill Text    id=email       ${USER.email}
    Fill Text    id=password    ${USER.password}
    Fill Text    id=confirmPassword    ${USER.password}

Enviar formulário de cadastro
    Click    css=form button[type="submit"]

Verificar cadastro com sucesso
    Wait For Elements State    css=h1:has-text("Welcome to Cinema App")    visible    5

Verificar erro de usuário existente
    Wait For Elements State    css=div.alert-content:has-text("User already exists")    visible    5