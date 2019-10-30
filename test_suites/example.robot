*** Settings ***
Documentation   Suite description
Library  SeleniumLibrary
Library  StringFormat
Resource  ../resources/example_resources.robot
Variables  ../locators/example_locators.yaml

*** Variables ***
${HOODIE}   Hoodie with Zipper

*** Test Cases ***
First Test Case
    [Documentation]     this is a test
    [Tags]  test
    navigate to QA Playground
    is QA Playground displayed

Search For Hoodie Test
    [Documentation]     this is another test
    [Tags]  test
    Search For Hoodie   hoodie
    is your hoodie displayed?   ${HOODIE}
