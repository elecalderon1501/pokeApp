@isTest 
public with sharing class PokemonBatchTest {
    public static List<Pokemon__c> pokLst = new List<Pokemon__c>();

    @isTest 
    static void testGeneracionOne(){
        pokLst.add(new Pokemon__c(name ='https://pokeapi.co/api/v2/pokemon/1'));

        String body = '{"name": "bulbasaur","height": 7,"id": 1,"sprites":{"front_default": https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/1.png}}';

        PokemonBatchMock fakeResponse = new PokemonBatchMock(200, 'Complete', body, null);

        Test.setMock(HttpCalloutMock.class, fakeResponse);
        Test.startTest();
            PokemonBatch batch = new PokemonBatch(pokLst);
            Database.executeBatch(batch, 1);
        Test.stopTest();

        try {
            List<Pokemon__c> listaDB = [SELECT Name, Altura__c, Peso__c, Foto_URL__c, Tipo__c, Generacion__c, PokeIndex__c FROM Pokemon__c];

        System.assertEquals(listaDB[0].Name, 'Bulbasaur', 'error');
        System.assertEquals(listaDB[0].Altura__c, '7 ft');
        System.assertEquals(listaDB[0].Peso__c, '69 lbs');
        System.assertEquals(listaDB[0].Foto_URL__c, 'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/1.png');
        System.assertEquals(listaDB[0].Tipo__c, 'grass');
        System.assertEquals(listaDB[0].Generacion__c, 1);
        System.assertEquals(listaDB[0].PokeIndex__c, 1);
        } catch (Exception e) {
            System.debug('Error');
        }
    }    

    @isTest 
    static void testGeneracionTwo(){
        pokLst.add(new Pokemon__c(name = 'https://pokeapi.co/api/v2/pokemon/152'));

        String body = '{"name": "chikorita","height": 9,"id": 152,"sprites":{"front_default": "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/152.png"}}';

        
        PokemonBatchMock fakeResponse = new PokemonBatchMock(200, 'Complete', body, null);

        Test.setMock(HttpCalloutMock.class, fakeResponse);
        Test.startTest();
            PokemonBatch batch = new PokemonBatch(pokLst);
            Database.executeBatch(batch, 1);
        Test.stopTest();

        try {
            List<Pokemon__c> listaDB = [SELECT Name, Altura__c, Peso__c, Foto_URL__c, 
                                    Tipo__c, Generacion__c, PokeIndex__c FROM Pokemon__c];

        System.assertEquals(listaDB[0].Name, 'Chikorita');
        System.assertEquals(listaDB[0].Altura__c, '9 ft');
        System.assertEquals(listaDB[0].Peso__c, '64 lbs');
        System.assertEquals(listaDB[0].Foto_URL__c, 'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/152.png');
        System.assertEquals(listaDB[0].Tipo__c, 'grass');
        System.assertEquals(listaDB[0].Generacion__c, 2);
        System.assertEquals(listaDB[0].PokeIndex__c, 152);
        } catch (Exception e) {
            System.debug('Error');
        }
    }
    @isTest 
    static void testGeneracionThree(){
        pokLst.add(new Pokemon__c(name ='https://pokeapi.co/api/v2/pokemon/252'));

        String body = '{"height": 5,"id": 252,"name": "treecko","sprites":{"front_default":"https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/252.png"},"types":[{"slot":1,"type":{"name": "grass","url": "https://pokeapi.co/api/v2/type/12/"}}],"weight": 50}';

        PokemonBatchMock fakeResponse = new PokemonBatchMock(200, 'Complete', body, null);

        Test.setMock(HttpCalloutMock.class, fakeResponse);
        Test.startTest();
            PokemonBatch batch = new PokemonBatch(pokLst);
            Database.executeBatch(batch, 1);
        Test.stopTest();

        try {
            List<Pokemon__c> listaDB = [SELECT Name, Altura__c, Peso__c, Foto_URL__c, 
                                    Tipo__c, Generacion__c, PokeIndex__c FROM Pokemon__c];

        System.assertEquals(listaDB[0].Name, 'Treecko');
        System.assertEquals(listaDB[0].Altura__c, '5 ft');
        System.assertEquals(listaDB[0].Peso__c, '50 lbs');
        System.assertEquals(listaDB[0].Foto_URL__c, 'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/252.png');
        System.assertEquals(listaDB[0].Tipo__c, 'grass');
        System.assertEquals(listaDB[0].Generacion__c, 3);
        System.assertEquals(listaDB[0].PokeIndex__c, 2);
        } catch (Exception e) {
            System.debug('Error');
        }
    }

    @isTest 
    static void testGeneracionFour(){
        pokLst.add(new Pokemon__c(name = 'https://pokeapi.co/api/v2/pokemon/387'));

        String body = '{"height": 4,"id": 387,"name": "turtwig","sprites":{"front_default": "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/387.png"},"types":[{"slot":1,"type":{"name": "grass","url": "https://pokeapi.co/api/v2/type/12/"}}],"weight": 102}';

        PokemonBatchMock fakeResponse = new PokemonBatchMock(200, 'Complete', body, null);

        Test.setMock(HttpCalloutMock.class, fakeResponse);
        Test.startTest();
            PokemonBatch batch = new PokemonBatch(pokLst);
            Database.executeBatch(batch, 1);
        Test.stopTest();

        try {
            List<Pokemon__c> listaDB = [SELECT Name, Altura__c, Peso__c, Foto_URL__c, 
                                    Tipo__c, Generacion__c, PokeIndex__c FROM Pokemon__c];

        System.assertEquals(listaDB[0].Name, 'Turtwig');
        System.assertEquals(listaDB[0].Altura__c, '4 ft');
        System.assertEquals(listaDB[0].Peso__c, '102 lbs');
        System.assertEquals(listaDB[0].Foto_URL__c, 'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/387.png');
        System.assertEquals(listaDB[0].Tipo__c, 'grass');
        System.assertEquals(listaDB[0].Generacion__c, 4);
        System.assertEquals(listaDB[0].PokeIndex__c, 387);
        } catch (Exception e) {
            System.debug('Error');
        }
    }


    @isTest 
    static void testGeneracionFive(){
        pokLst.add(new Pokemon__c(name = 'https://pokeapi.co/api/v2/pokemon/494'));

        String body = '{"name": "victini","height": 4,"weight": 40,"sprites":{"front_default": "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/494.png"}, "types":[{"slot":1,"type":{"name": "psychic","url": "https://pokeapi.co/api/v2/type/14/"}}],"id": 494}';

        PokemonBatchMock fakeResponse = new PokemonBatchMock(200, 'Complete', body, null);

        Test.setMock(HttpCalloutMock.class, fakeResponse);
        Test.startTest();
            PokemonBatch batch = new PokemonBatch(pokLst);
            Database.executeBatch(batch, 1);
        Test.stopTest();

        try {
            List<Pokemon__c> listaDB = [SELECT Name, Altura__c, Peso__c, Foto_URL__c, 
                                    Tipo__c, Generacion__c, PokeIndex__c FROM Pokemon__c];

        System.assertEquals(listaDB[0].Name, 'Victini');
        System.assertEquals(listaDB[0].Altura__c, '4 ft');
        System.assertEquals(listaDB[0].Peso__c, '40 lbs');
        System.assertEquals(listaDB[0].Foto_URL__c, 'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/494.png');
        System.assertEquals(listaDB[0].Tipo__c, 'psychic');
        System.assertEquals(listaDB[0].Generacion__c, 5);
        System.assertEquals(listaDB[0].PokeIndex__c, 494);
        } catch (Exception e) {
            System.debug('Error');
        }
    }


    @isTest 
    static void testGeneracionSix(){
        pokLst.add(new Pokemon__c(name = 'https://pokeapi.co/api/v2/pokemon/650'));

        String body = '{"name": "chespin","height": 4,"weight": 90,"sprites":{"front_default": "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/650.png"}, "types":[{"slot":1,"type":{"name": "grass","url": "https://pokeapi.co/api/v2/type/12/"}}],"id": 650}';

        PokemonBatchMock fakeResponse = new PokemonBatchMock(200, 'Complete', body, null);

        Test.setMock(HttpCalloutMock.class, fakeResponse);
        Test.startTest();
            PokemonBatch batch = new PokemonBatch(pokLst);
            Database.executeBatch(batch, 1);
        Test.stopTest();

        try {
            List<Pokemon__c> listaDB = [SELECT Name, Altura__c, Peso__c, Foto_URL__c, 
                                    Tipo__c, Generacion__c, PokeIndex__c FROM Pokemon__c];

        System.assertEquals(listaDB[0].Name, 'Chespin');
        System.assertEquals(listaDB[0].Altura__c, '4 ft');
        System.assertEquals(listaDB[0].Peso__c, '90 lbs');
        System.assertEquals(listaDB[0].Foto_URL__c, 'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/650.png');
        System.assertEquals(listaDB[0].Tipo__c, 'grass');
        System.assertEquals(listaDB[0].Generacion__c, 5);
        System.assertEquals(listaDB[0].PokeIndex__c, 650);
        } catch (Exception e) {
            System.debug('Error');
        }
    }


    @isTest 
    static void testGeneracionSeven(){
        pokLst.add(new Pokemon__c(name = 'https://pokeapi.co/api/v2/pokemon/722'));

        String body = '{"name": "rowlet","height": 3,"weight": 15,"sprites":{"front_default": "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/722.png"}, "types":[{"slot":1,"type":{"name": "grass","url": "https://pokeapi.co/api/v2/type/12/"}}],"id": 722}';

        PokemonBatchMock fakeResponse = new PokemonBatchMock(200, 'Complete', body, null);

        Test.setMock(HttpCalloutMock.class, fakeResponse);
        Test.startTest();
            PokemonBatch batch = new PokemonBatch(pokLst);
            Database.executeBatch(batch, 1);
        Test.stopTest();

        try {
            List<Pokemon__c> listaDB = [SELECT Name, Altura__c, Peso__c, Foto_URL__c, 
                                    Tipo__c, Generacion__c, PokeIndex__c FROM Pokemon__c];

        System.assertEquals(listaDB[0].Name, 'Rowlet');
        System.assertEquals(listaDB[0].Altura__c, '3 ft');
        System.assertEquals(listaDB[0].Peso__c, '15 lbs');
        System.assertEquals(listaDB[0].Foto_URL__c, 'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/722.png');
        System.assertEquals(listaDB[0].Tipo__c, 'grass');
        System.assertEquals(listaDB[0].Generacion__c, 5);
        System.assertEquals(listaDB[0].PokeIndex__c, 722);
        } catch (Exception e) {
            System.debug('Error');
        }
    }


    @isTest 
    static void testGeneracionEight(){
        pokLst.add(new Pokemon__c(name = 'https://pokeapi.co/api/v2/pokemon/810'));

        String body = '{"name": "grookey","height": 3,"weight": 50,"sprites":{"front_default": "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/810.png"}, "types":[{"slot":1,"type":{"name": "grass","url": "https://pokeapi.co/api/v2/type/12/"}}],"id": 810}';

        PokemonBatchMock fakeResponse = new PokemonBatchMock(200, 'Complete', body, null);

        Test.setMock(HttpCalloutMock.class, fakeResponse);
        Test.startTest();
            PokemonBatch batch = new PokemonBatch(pokLst);
            Database.executeBatch(batch, 1);
        Test.stopTest();

        try {
            List<Pokemon__c> listaDB = [SELECT Name, Altura__c, Peso__c, Foto_URL__c, 
                                    Tipo__c, Generacion__c, PokeIndex__c FROM Pokemon__c];

        System.assertEquals(listaDB[0].Name, 'Grookey');
        System.assertEquals(listaDB[0].Altura__c, '3 ft');
        System.assertEquals(listaDB[0].Peso__c, '50 lbs');
        System.assertEquals(listaDB[0].Foto_URL__c, 'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/810.png');
        System.assertEquals(listaDB[0].Tipo__c, 'grass');
        System.assertEquals(listaDB[0].Generacion__c, 5);
        System.assertEquals(listaDB[0].PokeIndex__c, 810);
        } catch (Exception e) {
            System.debug('Error');
        }
    }

    @isTest 
    static void testError(){
        pokLst.add(new Pokemon__c(name = 'https://pokeapi.co/api/v2/pokemonm/810'));

        String body = 'Not Found';

        PokemonBatchMock fakeResponse = new PokemonBatchMock(401, 'Error', body, null);

        Test.setMock(HttpCalloutMock.class, fakeResponse);
        Test.startTest();
            PokemonBatch batch = new PokemonBatch(pokLst);
            Database.executeBatch(batch, 1);
        
        try {
            
        } catch (Exception e) {
            System.assert(false, 'Exception' + e);
        }
        Test.stopTest();
    }
}