#language:pt

    Feature: Home

      Background:
          Given the access user home

      Scenario: Amount displayed
          When he selects an option show value
          Then displays its value: "R$ 5.500.00"

      Scenario: Hiding value
          And the value is displayed
          When he selects an option show value
          Then hide the value: "R$" 