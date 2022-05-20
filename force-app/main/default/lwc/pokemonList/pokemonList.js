//import { publish, MessageContext } from 'lightning/messageService';
//import BEAR_LIST_UPDATE_MESSAGE from '@salesforce/messageChannel/BearListUpdate__c';
import { NavigationMixin } from 'lightning/navigation';
import { LightningElement, wire } from 'lwc';
/** BearController.searchBears(searchTerm) Apex method */
import searchPokemons from '@salesforce/apex/PokemonController.searchPokemons';
export default class pokemonList extends NavigationMixin(LightningElement) {
	
//@wire(MessageContext) messageContext;
searchTerm = '';
@wire(searchPokemons, {searchTerm: '$searchTerm'})
	
	pokemons;			
// loadPokemons(result) {
//   this.pokemons = result;
//   if (result.data) {
//     const message = {
//       pokemons: result.data
//     };
//    // publish(this.messageContext, BEAR_LIST_UPDATE_MESSAGE, message);
//   }
// }
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
}


// Filtros generacion y tipo
//     value = 'inProgress';
//     get options() {
//         return [
//             { label: 'New', value: 'new' },
//             { label: 'In Progress', value: 'inProgress' },
//             { label: 'Finished', value: 'finished' },
//         ];
//     }

//     handleChange(event) {
//         this.value = event.detail.value;
//     }

//     value = 'inProgress';
//     get options() {
//         return [
//             { label: 'New', value: 'new' },
//             { label: 'In Progress', value: 'inProgress' },
//             { label: 'Finished', value: 'finished' },
//         ];
//     }

//     handleChange(event) {
//         this.value = event.detail.value;
//     }

// }

