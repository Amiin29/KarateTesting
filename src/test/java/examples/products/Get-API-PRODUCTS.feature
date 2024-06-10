Feature: Test de l'API analytics.dev.sparklink.mobelite.local

  Background:
    * url 'http://analytics.dev.sparklink.mobelite.local/api/analytic/statistics'

  Scenario: Obtenir des statistiques d'analyse pour les produits
    Given request { "fieldIds": [ 18 ], "analyticTypes": ["APPS"] }
    When method POST
    Then status 200

