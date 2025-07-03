*** Settings ***
Documentation    Testes da US-AUTH-004: Visualizar e Gerenciar Perfil do Usuário
Resource         ../../resources/base.resource
Resource         ../../resources/pages/PerfilPage.resource
Suite Setup      Start Session


*** Test Cases ***

Visualizar dados do perfil
    [Tags]    perfil
    Gerar dados de usuário dinâmico para o cadastro
    Abrir página de cadastro
    Preencher formulário de cadastro
    Enviar formulário de cadastro
    Verificar cadastro com sucesso

    Fazer login com usuário recém-cadastrado
    Abrir página de perfil
    Verificar dados do perfil visíveis
    Alterar nome do perfil
    Verificar campo alterado destacado
    Salvar alterações do perfil
    Verificar mensagem de sucesso na atualização




