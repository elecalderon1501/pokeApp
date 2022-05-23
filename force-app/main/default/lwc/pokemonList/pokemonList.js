import { NavigationMixin } from 'lightning/navigation';
import { LightningElement, wire } from 'lwc';
import searchPokemons from '@salesforce/apex/PokemonController.searchPokemons';
export default class pokemonList extends NavigationMixin(LightningElement) {
	
searchTerm = '';
tipo=null;
generacion=null; 
@wire(searchPokemons, {searchTerm: '$searchTerm', tipo: '$tipo', generacion: '$generacion'})	
// @wire(searchPokemons, {searchTerm: '$searchTerm'})
	pokemons;	
	tipo;
	generacion;		

	handleSearchTermChange(event) {
		// Debouncing this method: do not update the reactive property as
		// long as this function is being called within a delay of 300 ms.
		// This is to avoid a very large number of Apex method calls.
		window.clearTimeout(this.delayTimeout);
		const searchTerm = event.target.value;
		// eslint-disable-next-line @lwc/lwc/no-async-operation
		this.delayTimeout = setTimeout(() => {
			this.searchTerm = searchTerm;
		}, 300);
	}
	get hasResults() {
		return (this.pokemons.data.length > 0);
	}
	
	handlePokemonView(event) {
		// Get bear record id from bearview event
		const pokemonId = event.detail;
		// Navigate to bear record page
		this[NavigationMixin.Navigate]({
			type: 'standard__recordPage',
			attributes: {
				recordId: pokemonId,
				objectApiName: 'Pokemon__c',
				actionName: 'view',
			},
		});
	}



// Filtros generacion y tipo
    get tipos() {
        return [
            	{ label: 'Todos', value: null },
				{ label: 'Normal', value: 'Normal' },
				{ label: 'Fighting', value: 'Fighting' },
				{ label: 'Flying', value: 'Flying' },
				{ label: 'Poison', value: 'Poison' },
				{ label: 'Ground', value: 'Ground' },
				{ label: 'Bug', value: 'Bug' },
				{ label: 'Ghost', value: 'Ghost' },
				{ label: 'Steel', value: 'Steel' },
				{ label: 'Fire', value: 'Fire' },
				{ label: 'Water', value: 'Water' },
				{ label: 'Grass', value: 'Grass' },
				{ label: 'Electric', value: 'Electric' },
				{ label: 'Psychic', value: 'Psychic' },
				{ label: 'Ice', value: 'Ice' },
				{ label: 'Dragon', value: 'Dragon' },
				{ label: 'Dark', value: 'Dark' },
				{ label: 'Fairy', value: 'Fairy' },
				{ label: 'Rock', value: 'Rock' },
        ];
    }  

    get generaciones() {
        return [
            { label: 'Todos', value: null },
            { label: 'Primera', value: '1' },
            { label: 'Segunda', value: '2' },
			{ label: 'Tercera', value: '3' },
			{ label: 'Cuarta', value: '4' },
			{ label: 'Quinta', value: '5' },
			{ label: 'Sexta', value: '6' },
			{ label: 'Septima', value: '7' },
			{ label: 'Octava', value: '8' },
        ];
    }

	handleTipoChange(event){
        this.tipo= event.detail.value;
        const selectEvent = new CustomEvent('pokemonlist', {
            detail: {tipo:this.tipo,generacion:this.generacion}

        });

        this.dispatchEvent(selectEvent);


    }
	handleGeneracionChange(event){
        this.generacion= event.detail.value;
        const selectEvent = new CustomEvent('pokemonlist', {
            detail: {tipo:this.tipo,generacion:this.generacion}
        });
        this.dispatchEvent(selectEvent);
    }

	handlePokeFilter(event){
        this.tipo=event.detail.tipo;
        this.generacion=event.detail.generacion;
    }

	// handleTipoChange(event){
    //     this.tipo= event.detail.value;
        
    // }
    // handleGeneracionChange(event) {
    //     this.generacion = event.detail.value;
         
    // }	
}

