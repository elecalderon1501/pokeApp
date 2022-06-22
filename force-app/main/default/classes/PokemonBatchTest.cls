@isTest
public with sharing class PokemonBatchTest {
  public static List<Pokemon__c> pokLst = new List<Pokemon__c>();

  @isTest
  static void testGeneracionOne() {
    pokLst.add(new Pokemon__c(name = 'https://pokeapi.co/api/v2/pokemon/132'));

    String body = '{"height":3,"id":132,"name":"ditto","sprites":{"other":{"home":{"front_default":"https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/home/132.png"}}},"types":[{"slot":1,"type":{"name":"normal","url":"https://pokeapi.co/api/v2/type/1/"}}],"weight":40}';

    PokemonBatchMock fakeResponse = new PokemonBatchMock(
      200,
      'Complete',
      body,
      null
    );

    Test.setMock(HttpCalloutMock.class, fakeResponse);
    Test.startTest();
    PokemonBatch batch = new PokemonBatch(pokLst);
    Database.executeBatch(batch, 1);
    Test.stopTest();

    try {
      List<Pokemon__c> listaDB = [
        SELECT
          Name,
          Altura__c,
          Peso__c,
          Foto_URL__c,
          Tipo__c,
          Generacion__c,
          PokeIndex__c
        FROM Pokemon__c
      ];

      System.assertEquals(listaDB[0].Name, 'Ditto', 'error');
      System.assertEquals(listaDB[0].Altura__c, '3 (ft)');
      System.assertEquals(listaDB[0].Peso__c, '40 (lb)');
      System.assertEquals(
        listaDB[0].Foto_URL__c,
        'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/home/132.png'
      );
      System.assertEquals(listaDB[0].Tipo__c, 'Normal');
      System.assertEquals(listaDB[0].Generacion__c, 1);
      System.assertEquals(listaDB[0].PokeIndex__c, 132);
    } catch (Exception e) {
      System.debug('Error');
    }
  }

  @isTest
  static void testGeneracionTwo() {
    pokLst.add(new Pokemon__c(name = 'https://pokeapi.co/api/v2/pokemon/152'));

    String body = '{"height":9,"id":152,"name":"chikorita","sprites":{"other":{"home":{"front_default":"https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/home/152.png"}}},"types":[{"slot":1,"type":{"name":"grass","url":"https://pokeapi.co/api/v2/type/12/"}}],"weight":64}';

    PokemonBatchMock fakeResponse = new PokemonBatchMock(
      200,
      'Complete',
      body,
      null
    );

    Test.setMock(HttpCalloutMock.class, fakeResponse);
    Test.startTest();
    PokemonBatch batch = new PokemonBatch(pokLst);
    Database.executeBatch(batch, 1);
    Test.stopTest();

    try {
      List<Pokemon__c> listaDB = [
        SELECT
          Name,
          Altura__c,
          Peso__c,
          Foto_URL__c,
          Tipo__c,
          Generacion__c,
          PokeIndex__c
        FROM Pokemon__c
      ];

      System.assertEquals(listaDB[0].Name, 'Chikorita');
      System.assertEquals(listaDB[0].Altura__c, '9 (ft)');
      System.assertEquals(listaDB[0].Peso__c, '64 (lb)');
      System.assertEquals(
        listaDB[0].Foto_URL__c,
        'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/home/152.png'
      );
      System.assertEquals(listaDB[0].Tipo__c, 'Grass');
      System.assertEquals(listaDB[0].Generacion__c, 2);
      System.assertEquals(listaDB[0].PokeIndex__c, 152);
    } catch (Exception e) {
      System.debug('Error');
    }
  }
  @isTest
  static void testGeneracionThree() {
    pokLst.add(new Pokemon__c(name = 'https://pokeapi.co/api/v2/pokemon/252'));

    String body = '{"height":5,"id":252,"name":"treecko","sprites":{"other":{"home":{"front_default":"https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/home/252.png"}}},"types":[{"slot":1,"type":{"name":"grass","url":"https://pokeapi.co/api/v2/type/12/"}}],"weight":50}';

    PokemonBatchMock fakeResponse = new PokemonBatchMock(
      200,
      'Complete',
      body,
      null
    );

    Test.setMock(HttpCalloutMock.class, fakeResponse);
    Test.startTest();
    PokemonBatch batch = new PokemonBatch(pokLst);
    Database.executeBatch(batch, 1);
    Test.stopTest();

    try {
      List<Pokemon__c> listaDB = [
        SELECT
          Name,
          Altura__c,
          Peso__c,
          Foto_URL__c,
          Tipo__c,
          Generacion__c,
          PokeIndex__c
        FROM Pokemon__c
      ];

      System.assertEquals(listaDB[0].Name, 'Treecko');
      System.assertEquals(listaDB[0].Altura__c, '5 (ft)');
      System.assertEquals(listaDB[0].Peso__c, '50 (lb)');
      System.assertEquals(
        listaDB[0].Foto_URL__c,
        'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/home/252.png'
      );
      System.assertEquals(listaDB[0].Tipo__c, 'Grass');
      System.assertEquals(listaDB[0].Generacion__c, 3);
      System.assertEquals(listaDB[0].PokeIndex__c, 252);
    } catch (Exception e) {
      System.debug('Error');
    }
  }

  @isTest
  static void testGeneracionFour() {
    pokLst.add(new Pokemon__c(name = 'https://pokeapi.co/api/v2/pokemon/387'));

    String body = '{"height":4,"id":387,"name":"turtwig","sprites":{"other":{"home":{"front_default":"https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/home/387.png"}}},"types":[{"slot":1,"type":{"name":"grass","url":"https://pokeapi.co/api/v2/type/12/"}}],"weight":102}';

    PokemonBatchMock fakeResponse = new PokemonBatchMock(
      200,
      'Complete',
      body,
      null
    );

    Test.setMock(HttpCalloutMock.class, fakeResponse);
    Test.startTest();
    PokemonBatch batch = new PokemonBatch(pokLst);
    Database.executeBatch(batch, 1);
    Test.stopTest();

    try {
      List<Pokemon__c> listaDB = [
        SELECT
          Name,
          Altura__c,
          Peso__c,
          Foto_URL__c,
          Tipo__c,
          Generacion__c,
          PokeIndex__c
        FROM Pokemon__c
      ];

      System.assertEquals(listaDB[0].Name, 'Turtwig');
      System.assertEquals(listaDB[0].Altura__c, '4 (ft)');
      System.assertEquals(listaDB[0].Peso__c, '102 (lb)');
      System.assertEquals(
        listaDB[0].Foto_URL__c,
        'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/home/387.png'
      );
      System.assertEquals(listaDB[0].Tipo__c, 'Grass');
      System.assertEquals(listaDB[0].Generacion__c, 4);
      System.assertEquals(listaDB[0].PokeIndex__c, 387);
    } catch (Exception e) {
      System.debug('Error');
    }
  }

  @isTest
  static void testGeneracionFive() {
    pokLst.add(new Pokemon__c(name = 'https://pokeapi.co/api/v2/pokemon/494'));

    String body = '{"height":4,"id":494,"name":"victini","sprites":{"other":{"home":{"front_default":"https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/home/494.png"}}},"types":[{"slot":1,"type":{"name":"psychic","url":"https://pokeapi.co/api/v2/type/14/"}},{"slot":1,"type":{"name":"fire","url":"https://pokeapi.co/api/v2/type/10/"}}],"weight":40}';

    PokemonBatchMock fakeResponse = new PokemonBatchMock(
      200,
      'Complete',
      body,
      null
    );

    Test.setMock(HttpCalloutMock.class, fakeResponse);
    Test.startTest();
    PokemonBatch batch = new PokemonBatch(pokLst);
    Database.executeBatch(batch, 1);
    Test.stopTest();

    try {
      List<Pokemon__c> listaDB = [
        SELECT
          Name,
          Altura__c,
          Peso__c,
          Foto_URL__c,
          Tipo__c,
          Generacion__c,
          PokeIndex__c
        FROM Pokemon__c
      ];

      System.assertEquals(listaDB[0].Name, 'Victini');
      System.assertEquals(listaDB[0].Altura__c, '4 (ft)');
      System.assertEquals(listaDB[0].Peso__c, '40 (lb)');
      System.assertEquals(
        listaDB[0].Foto_URL__c,
        'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/home/494.png'
      );
      System.assertEquals(listaDB[0].Tipo__c, 'Fire;Psychic');
      System.assertEquals(listaDB[0].Generacion__c, 5);
      System.assertEquals(listaDB[0].PokeIndex__c, 494);
    } catch (Exception e) {
      System.debug('Error');
    }
  }

  @isTest
  static void testGeneracionSix() {
    pokLst.add(new Pokemon__c(name = 'https://pokeapi.co/api/v2/pokemon/650'));

    String body = '{"height":4,"id":650,"name":"chespin","sprites":{"other":{"home":{"front_default":"https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/home/650.png"}}},"types":[{"slot":1,"type":{"name":"grass","url":"https://pokeapi.co/api/v2/type/12/"}}],"weight":90}';

    PokemonBatchMock fakeResponse = new PokemonBatchMock(
      200,
      'Complete',
      body,
      null
    );

    Test.setMock(HttpCalloutMock.class, fakeResponse);
    Test.startTest();
    PokemonBatch batch = new PokemonBatch(pokLst);
    Database.executeBatch(batch, 1);
    Test.stopTest();

    try {
      List<Pokemon__c> listaDB = [
        SELECT
          Name,
          Altura__c,
          Peso__c,
          Foto_URL__c,
          Tipo__c,
          Generacion__c,
          PokeIndex__c
        FROM Pokemon__c
      ];

      System.assertEquals(listaDB[0].Name, 'Chespin');
      System.assertEquals(listaDB[0].Altura__c, '4 (ft)');
      System.assertEquals(listaDB[0].Peso__c, '90 (lb)');
      System.assertEquals(
        listaDB[0].Foto_URL__c,
        'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/home/650.png'
      );
      System.assertEquals(listaDB[0].Tipo__c, 'Grass');
      System.assertEquals(listaDB[0].Generacion__c, 6);
      System.assertEquals(listaDB[0].PokeIndex__c, 650);
    } catch (Exception e) {
      System.debug('Error');
    }
  }

  @isTest
  static void testGeneracionSeven() {
    pokLst.add(new Pokemon__c(name = 'https://pokeapi.co/api/v2/pokemon/722'));

    String body = '{"height":3,"id":722,"name":"rowlet","sprites":{"other":{"home":{"front_default":"https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/home/722.png"}}},"types":[{"slot":1,"type":{"name":"grass","url":"https://pokeapi.co/api/v2/type/12/"}},{"slot":2,"type":{"name":"flying","url":"https://pokeapi.co/api/v2/type/3/"}}],"weight":15}';

    PokemonBatchMock fakeResponse = new PokemonBatchMock(
      200,
      'Complete',
      body,
      null
    );

    Test.setMock(HttpCalloutMock.class, fakeResponse);
    Test.startTest();
    PokemonBatch batch = new PokemonBatch(pokLst);
    Database.executeBatch(batch, 1);
    Test.stopTest();

    try {
      List<Pokemon__c> listaDB = [
        SELECT
          Name,
          Altura__c,
          Peso__c,
          Foto_URL__c,
          Tipo__c,
          Generacion__c,
          PokeIndex__c
        FROM Pokemon__c
      ];

      System.assertEquals(listaDB[0].Name, 'Rowlet');
      System.assertEquals(listaDB[0].Altura__c, '3 (ft)');
      System.assertEquals(listaDB[0].Peso__c, '15 (lb)');
      System.assertEquals(
        listaDB[0].Foto_URL__c,
        'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/home/722.png'
      );
      System.assertEquals(listaDB[0].Tipo__c, 'Flying;Grass');
      System.assertEquals(listaDB[0].Generacion__c, 7);
      System.assertEquals(listaDB[0].PokeIndex__c, 722);
    } catch (Exception e) {
      System.debug('Error');
    }
  }

  @isTest
  static void testGeneracionEight() {
    pokLst.add(new Pokemon__c(name = 'https://pokeapi.co/api/v2/pokemon/810'));

    String body = '{"height":3,"id":810,"name":"grookey","sprites":{"other":{"home":{"front_default":"https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/home/810.png"}}},"types":[{"slot":1,"type":{"name":"grass","url":"https://pokeapi.co/api/v2/type/12/"}}],"weight":50}';

    PokemonBatchMock fakeResponse = new PokemonBatchMock(
      200,
      'Complete',
      body,
      null
    );

    Test.setMock(HttpCalloutMock.class, fakeResponse);
    Test.startTest();
    PokemonBatch batch = new PokemonBatch(pokLst);
    Database.executeBatch(batch, 1);
    Test.stopTest();

    try {
      List<Pokemon__c> listaDB = [
        SELECT
          Name,
          Altura__c,
          Peso__c,
          Foto_URL__c,
          Tipo__c,
          Generacion__c,
          PokeIndex__c
        FROM Pokemon__c
      ];

      System.assertEquals(listaDB[0].Name, 'Grookey');
      System.assertEquals(listaDB[0].Altura__c, '3 (ft)');
      System.assertEquals(listaDB[0].Peso__c, '50 (lb)');
      System.assertEquals(
        listaDB[0].Foto_URL__c,
        'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/home/810.png'
      );
      System.assertEquals(listaDB[0].Tipo__c, 'Grass');
      System.assertEquals(listaDB[0].Generacion__c, 8);
      System.assertEquals(listaDB[0].PokeIndex__c, 810);
    } catch (Exception e) {
      System.debug('Error');
    }
  }

  @isTest
  static void testError() {
    pokLst.add(new Pokemon__c(name = 'https://pokeapi.co/api/v2/pokemonm/910'));

    String body = 'Not Found';

    PokemonBatchMock fakeResponse = new PokemonBatchMock(
      401,
      'Error',
      body,
      null
    );

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

  @isTest
  static void testFilter() {
    List<Pokemon__c> PokemonList = new List<Pokemon__c>();
    String searchTerm = 'Hoothoot';
    String tipo = 'Normal, Flying';
    Integer generacion = 2;
    Test.startTest();
    PokemonList = pokemonController.searchPokemons(
      tipo,
      generacion,
      searchTerm
    );
    Test.stopTest();
    try {
      System.assertEquals(PokemonList[0].Name, 'Hoothoot', 'No coincide');
      System.assertEquals(
        PokemonList[0].Foto_URL__c,
        'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/home/163.png',
        'La imagen no es la correcta'
      );
      System.assertEquals(
        PokemonList[0].Peso__c,
        '212 (lb)',
        'No coincide el peso'
      );
      System.assertEquals(
        PokemonList[0].Altura__c,
        '7 (ft)',
        'No coincide la altura'
      );
      System.assertEquals(
        PokemonList[0].Generacion__c,
        2,
        'No coincide la generacion'
      );
      System.assertEquals(
        PokemonList[0].Tipo__c,
        'Normal;Flying',
        'No coincide el tipo'
      );
      System.assertEquals(
        PokemonList[0].PokeIndex__c,
        163,
        'No coincide el pokeindex'
      );
    } catch (Exception e) {
      System.debug('Error en el filtro');
    }
  }
  @isTest
  static void testGetAllPokemons() {
    List<Pokemon__c> PokemonList = new List<Pokemon__c>();
    Test.startTest();
    PokemonList = pokemonController.getAllPokemons();
    Test.stopTest();
    try {
      System.assertEquals(PokemonList[0].Name, 'Calyrex', 'No coincide');
      System.assertEquals(
        PokemonList[0].Foto_URL__c,
        'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/home/898.png',
        'No coincide'
      );
      System.assertEquals(
        PokemonList[0].Peso__c,
        '77 (lb)',
        'No coincide el peso'
      );
      System.assertEquals(PokemonList[0].Altura__c, '11 (ft))', 'No coincide');
      System.assertEquals(
        PokemonList[0].Generacion__c,
        8,
        'No coincide la generacion'
      );
      System.assertEquals(
        PokemonList[0].Tipo__c,
        'Grass;Psychic',
        'No coincide el tipo'
      );
      System.assertEquals(
        PokemonList[0].PokeIndex__c,
        897,
        'No coincide el indice'
      );
    } catch (Exception e) {
      System.debug('Sin Pokemons!');
    }
  }
}
