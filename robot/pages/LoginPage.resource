*** Settings ***
Documentation    Ações e elementos da página de login

Library          Browser
Library          DateTime
Library          RequestsLibrary
Library          BuiltIn

Resource         ../env.resource
Resource         ../base.resource
Resource         ../pages/CadastroPage.resource

*** Keywords ***

Abrir página de login
    New Page    ${BASE_URL}/login
    Wait For Elements State    css=h1:has-text("Login")    visible    5


Preencher login
    [Arguments]    ${email}    ${senha}
    Fill Text    css=#email    ${email}
    Fill Text    css=#password    ${senha}

Enviar login
    Click    css=form button[type="submit"]
Verificar login com sucesso
    Wait For Elements State    css=h1:has-text("Welcome to Cinema App")    visible    5

Fazer Logout
    Click    css=.btn-logout            
    Wait For Elements State    css=h1 >> text=Login    visible    5
    Take Screenshot    filename=${SCREENSHOT_DIR}${/}after_logout.png

Capturar Tela do Login
    [Arguments]    ${prefixo}
    ${timestamp}=    Get Current Date    result_format=%Y%m%d_%H%M%S
    Create Directory    ${SCREENSHOT_DIR}
    Take Screenshot    
    ...    filename=${SCREENSHOT_DIR}${/}${prefixo}_${timestamp}.png    
    ...    fullPage=True

Capturar Screenshot
    [Documentation]    Captura screenshot com nome descritivo
    [Arguments]    ${nome_arquivo}
    ${timestamp}=    Get Current Date    result_format=%Y%m%d_%H%M%S
    Create Directory    ${OUTPUT_DIR}${/}screenshots
    Take Screenshot    
    ...    filename=${OUTPUT_DIR}${/}screenshots${/}${nome_arquivo}_${timestamp}.png    
    ...    fullPage=True