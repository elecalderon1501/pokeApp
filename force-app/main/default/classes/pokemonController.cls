public with sharing class pokemonController {
    @AuraEnabled(Cacheable=true)
    public static Pokemon__c[] getAllPokemons() {
        return [
            SELECT
                Id,
                Name,
                Altura__c,
                Peso__c,
                Generacion__c,
                Tipo__c,
                Foto_URL__c,
                PokeIndex__c
            FROM Pokemon__c
            WITH SECURITY_ENFORCED
            ORDER BY PokeIndex__c
            LIMIT 50
        ];
    }

    @AuraEnabled(Cacheable=true)
    public static Pokemon__c[] searchPokemons(String searchTerm) {
        // Return all bears when no search term
        searchTerm = searchTerm.trim();
        if (searchTerm == '') {
            return getAllPokemons();
        }
        // Prepare query paramters
        searchTerm = '%' + searchTerm + '%';
        // Execute search query
        return [
            SELECT
                Id,
                Name,
                Altura__c,
                Peso__c,
                Generacion__c,
                Tipo__c,
                Foto_URL__c,
                PokeIndex__c
            FROM Pokemon__c
            WHERE Name LIKE :searchTerm
            WITH SECURITY_ENFORCED
            ORDER BY PokeIndex__c
            LIMIT 50
        ];
    }
}