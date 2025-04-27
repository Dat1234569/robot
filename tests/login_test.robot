*** Settings ***
Library    SeleniumLibrary

*** Variables ***
${URL}       https://opensource-demo.orangehrmlive.com/web/index.php/auth/login
${BROWSER}   chrome

*** Test Cases ***
Login Successfully With Valid Credentials
    Open Browser    ${URL}    ${BROWSER}
    Input Text    name=username    Admin
    Input Text    name=password    admin123
    Click Button    xpath=//button[@type='submit']
    Wait Until Page Contains Element    xpath=//p[text()='Dashboard']    timeout=10s
    Close Browser

Login Failed With Invalid Credentials
    Open Browser    ${URL}    ${BROWSER}
    Input Text    name=username    Admin
    Input Text    name=password    wrongpassword
    Click Button    xpath=//button[@type='submit']
    Wait Until Page Contains    Invalid credentials    timeout=10s
    Close Browser
