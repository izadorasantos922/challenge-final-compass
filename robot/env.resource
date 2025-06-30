*** Settings ***
Documentation        Variáveis globais e configurações de ambiente

*** Variables ***
${BASE_URL}        http://localhost:3002

${LOGIN_ADM_EMAIL}            admin@example.com
${LOGIN_SENHA_ADM}    password123
${LOGIN_USER_EMAIL}            user@example.com
${LOGIN_SENHA_USER}    password123
${TIMEOUT}                2s
${SCREENSHOT_DIR}         ${EXECDIR}${/}results${/}screenshots