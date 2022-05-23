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
    public static Pokemon__c[] searchPokemons(String searchTerm, String tipo, Integer generacion) {
        // Return all bears when no search term
        searchTerm = searchTerm.trim();
        if (String.isBlank(searchTerm) && String.isBlank(tipo) && generacion ==null) {
            return getAllPokemons();
        }
        // Prepare query paramters
        searchTerm = '%' + searchTerm + '%';
        if (!String.isBlank(searchTerm) && String.isBlank(tipo) && generacion ==null){
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
        } else if (generacion == null) {
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
            WHERE Tipo__c INCLUDES (:tipo) AND 
            Name LIKE :searchTerm
            WITH SECURITY_ENFORCED
            ORDER BY PokeIndex__c
            LIMIT 50
        ];
        } else if (String.isBlank(tipo)){
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
                WHERE Generacion__c = :generacion AND 
                Name LIKE :searchTerm
                WITH SECURITY_ENFORCED
                ORDER BY PokeIndex__c
                LIMIT 50
        ];
        } else {
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
            WHERE Tipo__c INCLUDES(:tipo) AND 
            Name LIKE :searchTerm AND
            Generacion__c = :generacion
            WITH SECURITY_ENFORCED
            ORDER BY PokeIndex__c
            LIMIT 50
        ];
        }
        
    }
}