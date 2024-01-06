#language:en

    @regression
    Feature: Home aplication

      Background:
        Given the access user home

      @amount
      Scenario: Amount displayed
        When he selects an option show value
        Then displays its value: "R$ 5.500,00"

      @contact
      Scenario: Search contact
        When select option transfer
        And search a contact
        Then displays the searched contact