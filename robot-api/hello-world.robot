*** Settings ***
Library     RequestsLibrary
Suite Setup    Create Session  tomcat  http://tomcat:8080

*** Test Cases ***
Hello World with GET
    ${resp}=     GET On Session  tomcat  /hello-world/hello
    Request Should Be Successful    ${resp}
    Should Be Equal As Strings    ${resp.json()["message"]}    Hello, World!
    Should Be Equal As Strings    ${resp.json()["method"]}    GET

Hello World with POST
    ${resp}=     POST On Session  tomcat  /hello-world/hello
    Request Should Be Successful    ${resp}
    Should Be Equal As Strings    ${resp.json()["message"]}    Hello, World!
    Should Be Equal As Strings    ${resp.json()["method"]}    POST