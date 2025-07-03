*** Settings ***
Documentation    Testes de cadastro de usuário

Resource         ../../resources/base.resource
Suite Setup      Start Session 


*** Test Cases ***
Cadastrar usuário com e-mail já existente
    [Tags]    cadastro duplicado
    # Cadastra primeiro usuário
    Gerar dados de usuário dinâmico para o cadastro
    Abrir página de cadastro
    Preencher formulário de cadastro
    Enviar formulário de cadastro
    Verificar cadastro com sucesso

    # Tenta cadastrar novamente com o mesmo e-mail
    Abrir página de cadastro
    Preencher formulário de cadastro
    Enviar formulário de cadastro
    Verificar erro de usuário existente


Cadastro de usuario
    [Tags]    cadastro usuario
    Gerar dados de usuário dinâmico para o cadastro
    Abrir página de cadastro
    Preencher formulário de cadastro
    Enviar formulário de cadastro
    Verificar cadastro com sucesso
