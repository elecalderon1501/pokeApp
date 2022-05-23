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
    public static Pokemon__c[] searchPokemons(String tipo, Integer generacion, String searchTerm) {
        // Return all bears when no search term
        searchTerm = searchTerm.trim();
        // if (String.isBlank(searchTerm) && String.isBlank(tipo) && generacion ==0) {
        //     return getAllPokemons();
        // }
            if(searchTerm == '' && tipo == 'Todos' && generacion == 0){
                return getAllPokemons();
                
            }
        // Prepare query paramters
        searchTerm = '%' + searchTerm + '%';

        String query = 'SELECT Id, Name, Altura__c, Peso__c, Generacion__c, Tipo__c, Foto_URL__c, PokeIndex__c FROM Pokemon__c';

        if(searchTerm != ''){
            query += ' WHERE Name LIKE :searchTerm ';
        } 
        if(tipo != 'Todos'){
            query += ' AND Tipo__c INCLUDES(:tipo) ';
        }
        if(generacion != 0){
            query += ' AND Generacion__c =:generacion ';
        }
        query +=' ORDER BY PokeIndex__c';

        return Database.query(query);

        // if (!String.isBlank(searchTerm) && String.isBlank(tipo) && generacion ==0){
        //     return [
        //     SELECT
        //         Id,
        //         Name,
        //         Altura__c,
        //         Peso__c,
        //         Generacion__c,
        //         Tipo__c,
        //         Foto_URL__c,
        //         PokeIndex__c
        //     FROM Pokemon__c
        //     WHERE Name LIKE :searchTerm
        //     WITH SECURITY_ENFORCED
        //     ORDER BY PokeIndex__c
        //     LIMIT 50
        // ];
        // } else if (generacion == 0) {
        //     return [
        //     SELECT
        //         Id,
        //         Name,
        //         Altura__c,
        //         Peso__c,
        //         Generacion__c,
        //         Tipo__c,
        //         Foto_URL__c,
        //         PokeIndex__c
        //     FROM Pokemon__c
        //     WHERE Tipo__c INCLUDES (:tipo) AND 
        //     Name LIKE :searchTerm
        //     WITH SECURITY_ENFORCED
        //     ORDER BY PokeIndex__c
        //     LIMIT 50
        // ];
        // } else if (String.isBlank(tipo)){
        //     return [
        //         SELECT
        //             Id,
        //             Name,
        //             Altura__c,
        //             Peso__c,
        //             Generacion__c,
        //             Tipo__c,
        //             Foto_URL__c,
        //             PokeIndex__c
        //         FROM Pokemon__c
        //         WHERE Generacion__c = :generacion AND 
        //         Name LIKE :searchTerm
        //         WITH SECURITY_ENFORCED
        //         ORDER BY PokeIndex__c
        //         LIMIT 50
        // ];
        // } else {
        //     return [
        //     SELECT
        //         Id,
        //         Name,
        //         Altura__c,
        //         Peso__c,
        //         Generacion__c,
        //         Tipo__c,
        //         Foto_URL__c,
        //         PokeIndex__c
        //     FROM Pokemon__c
        //     WHERE Tipo__c INCLUDES(:tipo) AND 
        //     Name LIKE :searchTerm AND
        //     Generacion__c = :generacion
        //     WITH SECURITY_ENFORCED
        //     ORDER BY PokeIndex__c
        //     LIMIT 50
        // ];
        // }
        
    }
}