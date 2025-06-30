*** Settings ***
Documentation    Ações e seletores da Página de Perfil
Library          Browser

*** Keywords ***
Abrir página de perfil
    Click    text=Perfil
    Wait For Elements State    css=h1:has-text("Meu Perfil")    visible    5

Verificar dados do perfil visíveis
    Wait For Elements State    css=input[name="name"]    visible    5
    Wait For Elements State    css=input[name="email"]    visible    5
    Wait For Elements State    css=#currentPassword    visible    5
    Wait For Elements State    css=#newPassword    visible    5
    Wait For Elements State    css=#confirmNewPassword    visible    5

Alterar nome do perfil
    ${nomeAtual}=    Get Attribute    css=input[name="name"]    value
    ${novoNome}=     Set Variable    ${nomeAtual}_Editado
    Fill Text        css=input[name="name"]    ${novoNome}

Verificar campo alterado destacado
    Wait For Elements State    css=small.changed-field    visible    5
    ${text}=    Get Text    css=small.changed-field
    Should Contain    ${text}    Campo alterado

Salvar alterações do perfil
    Click    css=button[type="submit"]
    Wait For Elements State    css=div.alert-success    visible    5

Verificar mensagem de sucesso na atualização
    ${text}=    Get Text    css=.success-modal p
    Should Contain    ${text.lower()}    perfil atualizado com sucesso
