import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'PokeList.dart';
import 'dart:convert';
// Poke List Screen
import 'pokemon.dart';
// This is The first Screen
class PokeList extends StatefulWidget {
  static const String url =  'https://pokeapi.co/api/v2/pokemon?limit=151&offset=0';
  @override
  _PokeListState createState() => _PokeListState();
}

class _PokeListState extends State<PokeList> {
 List listOfPokemon;
 Map mapRes;
 Pokemons pokemons;


  Future<List<Pokemons>> _fetchData() async{
   final response = await http.get(PokeList.url);
   final decode = json.decode(response.body);
   final data = Pokemons.fromJson(decode['results']);
   print(data.pokemons);
   if(response.statusCode == 200){
     mapRes = decode;
     listOfPokemon = mapRes['results'];
   }

   setState(() {
     pokemons = data;
   });
   return _fetchData();
  }

  void initState(){
    _fetchData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueGrey[900],
      appBar: AppBar(
        title: Text('Pokedex @pp'),
        backgroundColor: Colors.red,
        actions: [
          IconButton(icon: Icon(Icons.search), onPressed: (){
          showSearch(context: context, delegate: PokemonSearch());
          })

        ],
      ),
      body:
       Container(
            child:
            pokemons == null ?
            Center(
              child: CircularProgressIndicator(
                valueColor: AlwaysStoppedAnimation<Color>(Colors.blue),
              ),
            )
                : ListView(
              shrinkWrap: true,
              scrollDirection: Axis.vertical,
              children: List.generate(pokemons.pokemons.length,
                      (index) =>
                          ListPokemon(
                    url: pokemons.pokemons[index].url,
                  )),
            ),
          ),


      );

  }
}
class PokemonSearch extends SearchDelegate<Pokemon>{
  Pokemon pokemons;
  final pokemon = [
  "Bulbasaur",
	"Ivysaur",
	"Venusaur",
	"Charmander",
	"Charmeleon",
	"Charizard",
	"Squirtle",
	"Wartortle",
	"Blastoise",
	"Caterpie",
	"Metapod",
	"Butterfree",
	"Weedle",
	"Kakuna",
	"Beedrill",
	"Pidgey",
	"Pidgeotto",
	"Pidgeot",
	"Rattata",
	"Raticate",
	"Spearow",
	"Fearow",
	"Ekans",
	"Arbok",
	"Pikachu",
	"Raichu",
	"Sandshrew",
	"Sandslash",
	"Nidoran♀",
	"Nidorina",
	"Nidoqueen",
	"Nidoran♂",
	"Nidorino",
	"Nidoking",
	"Clefairy",
	"Clefable",
	"Vulpix",
	"Ninetales",
	"Jigglypuff",
	"Wigglytuff",
	"Zubat",
	"Golbat",
	"Oddish",
	"Gloom",
	"Vileplume",
	"Paras",
	"Parasect",
	"Venonat",
	"Venomoth",
	"Diglett",
	"Dugtrio",
	"Meowth",
	"Persian",
	"Psyduck",
	"Golduck",
	"Mankey",
	"Primeape",
	"Growlithe",
	"Arcanine",
	"Poliwag",
	"Poliwhirl",
	"Poliwrath",
	"Abra",
	"Kadabra",
	"Alakazam",
	"Machop",
	"Machoke",
	"Machamp",
	"Bellsprout",
	"Weepinbell",
	"Victreebel",
	"Tentacool",
	"Tentacruel",
	"Geodude",
	"Graveler",
	"Golem",
	"Ponyta",
	"Rapidash",
	"Slowpoke",
	"Slowbro",
	"Magnemite",
	"Magneton",
	"Farfetch’d",
	"Doduo",
	"Dodrio",
	"Seel",
	"Dewgong",
	"Grimer",
	"Muk",
	"Shellder",
	"Cloyster",
	"Gastly",
	"Haunter",
	"Gengar",
	"Onix",
	"Drowzee",
	"Hypno",
	"Krabby",
	"Kingler",
	"Voltorb",
	"Electrode",
	"Exeggcute",
	"Exeggutor",
	"Cubone",
	"Marowak",
	"Hitmonlee",
	"Hitmonchan",
	"Lickitung",
	"Koffing",
	"Weezing",
	"Rhyhorn",
	"Rhydon",
	"Chansey",
	"Tangela",
	"Kangaskhan",
	"Horsea",
	"Seadra",
	"Goldeen",
	"Seaking",
	"Staryu",
	"Starmie",
	"Mr. Mime",
	"Scyther",
	"Jynx",
	"Electabuzz",
	"Magmar",
	"Pinsir",
	"Tauros",
	"Magikarp",
	"Gyarados",
	"Lapras",
	"Ditto",
	"Eevee",
	"Vaporeon",
	"Jolteon",
	"Flareon",
	"Porygon",
	"Omanyte",
	"Omastar",
	"Kabuto",
	"Kabutops",
	"Aerodactyl",
	"Snorlax",
	"Articuno",
	"Zapdos",
	"Moltres",
	"Dratini",
	"Dragonair",
	"Dragonite",
	"Mewtwo",
	"Mew",
  ];

final recentResult = [
  "Dratini",
	"Dragonair"
  ];
  @override
  List<Widget> buildActions(BuildContext context) {
    return [
      IconButton(icon: Icon(Icons.clear), onPressed: (){
        query = '';
      }
      
      
      )
    ];
    }
  
    @override
    Widget buildLeading(BuildContext context) {
      return IconButton(
        icon: Icon(Icons.arrow_back), onPressed: (){
        close(context , null);
        });
    }
  
    @override
    Widget buildResults(BuildContext context) {
    return Scaffold(
    backgroundColor: Colors.black,
    appBar: AppBar(
      leading: IconButton(
        icon: Icon(Icons.arrow_back), onPressed: (){
        close(context , null);
        }),
      
      backgroundColor: Colors.red, title: Text('Pokedex @pp', style: TextStyle(fontSize: 18),),),
      body:
      Container(
      child: Column(
        children:[
        Image.network("https://images.unsplash.com/photo-1610692567145-2c1fe6bf9c3f?ixid=MXwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=966&q=80",
              height: 150,
              width: 200),
        Text(query , style: TextStyle(fontSize: 40 , color: Colors.white),),
        RaisedButton(
          elevation: 50,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),

          padding: EdgeInsets.symmetric(vertical:20 , horizontal:20),
          color: Colors.white,
          onPressed: (){
          close(context, null);
        },
          child: Center(
            child: Text('Return To Homepage'),
          )
        
        )
        ]
      )
     
      
      )
    );
    
    }
    @override
    Widget buildSuggestions(BuildContext context) {
     final suggestionList = query.isEmpty?recentResult:pokemon.where((element) => 
     element.startsWith(query)).toList();
     return suggestionList.isEmpty? Center(child:Text('Nothing Found' , style: TextStyle(fontSize: 20 , color: Colors.grey),)): ListView.builder(
       itemCount: suggestionList.length,
       itemBuilder: (context , index) => 
     ListTile(
      onTap: (){
        showResults(context);
      },

       title: RichText(
         text: TextSpan(
           children: [
            TextSpan(
              text: suggestionList[index].substring(query.length),
              style: TextStyle(color: Colors.grey)
            )
           ],
         text: suggestionList[index].substring(0 , query.length),
         style: TextStyle(color: Colors.black , 
         fontWeight: FontWeight.bold
         ),
         
       ),

     )
     )
     );

     
      }

    }



