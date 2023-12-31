#language:pt

    Feature: Home

        Scenario: Displayed amount
            Given the access user home
            When he selects an option show value
            Then displays its value: "R$ 5.500.00"
