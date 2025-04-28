*** Settings ***
Library    SeleniumLibrary

*** Variables ***
${URL}    https://opensource-demo.orangehrmlive.com/web/index.php/auth/login
${BROWSER}    Chrome
${VALID_USERNAME}    Admin
${VALID_PASSWORD}    admin123
${INVALID_USERNAME}    wronguser
${INVALID_PASSWORD}    wrongpass

*** Test Cases ***
Login Successfully With Valid Credentials
    [Documentation]    Verify user can login successfully with valid credentials.
    Open Browser    ${URL}    ${BROWSER}
    Maximize Browser Window
    Wait Until Element Is Visible    xpath=//input[@name='username']    timeout=10s
    Input Text    xpath=//input[@name='username']    ${VALID_USERNAME}
    Input Text    xpath=//input[@name='password']    ${VALID_PASSWORD}
    Click Button    xpath=//button[@type='submit']
    Wait Until Page Contains Element    xpath=//h6[text()='Dashboard']    timeout=10s
    Capture Page Screenshot
    Sleep    10s
    Close Browser

Login Fail With Invalid Credentials
    [Documentation]    Verify login fails with invalid credentials and error message is shown.
    Open Browser    ${URL}    ${BROWSER}
    Maximize Browser Window
    Wait Until Element Is Visible    xpath=//input[@name='username']    timeout=10s
    Input Text    xpath=//input[@name='username']    ${INVALID_USERNAME}
    Input Text    xpath=//input[@name='password']    ${INVALID_PASSWORD}
    Click Button    xpath=//button[@type='submit']
    Wait Until Page Contains    Invalid credentials    timeout=10s
    Capture Page Screenshot
    Sleep    10s
    Close Browser
