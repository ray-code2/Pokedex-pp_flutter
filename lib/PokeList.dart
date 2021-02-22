import 'dart:convert';

import 'package:flutter/material.dart';
import 'pokemon.dart';
import 'package:http/http.dart' as http;
import 'pokemonInfo.dart';
class ListPokemon extends StatefulWidget {
  const ListPokemon({Key key , this.url}) : super(key: key);
   final String url;
  @override
  _ListPokemonState createState() => _ListPokemonState();
}

class _ListPokemonState extends State<ListPokemon> {
  Pokemon pokemons;
  fetchDataPoke() async{
    final response = await http.get(widget.url);
    final object = json.decode(response.body);
    final data = Pokemon.fromJson(object);

    setState(() {
      pokemons = data;

    });


  }
  void initState(){
    fetchDataPoke();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
     return Container(
         child: Column(
           children: [
             Padding(
               padding: const EdgeInsets.fromLTRB(10, 20 , 10 , 20),
               child: Column(
                 mainAxisAlignment: MainAxisAlignment.start,
               children: [
                 SizedBox(
                 height: 75,
                 width: 400,
                 child:  Card(
                   color: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15)
                    ),
                    
                    child: InkWell(
                      onTap: (){
                        Navigator.push(context, new MaterialPageRoute(builder: (context) => 
                        PokemonInfo(pokemons)));
                      },
                      child: pokemons == null ? Center(
                        child: CircularProgressIndicator(),
                      ) : 
                    
                    ListView.builder(
                      itemCount: 1,
                      itemBuilder: (context , index){
                      return ListTile(
                      title: Center(child: Text('This is ' + pokemons.name , style: TextStyle(
                        color: Colors.black ,
                        fontSize: 20,
                        fontWeight: FontWeight.bold
                        ),),),
                      leading: CircleAvatar(
                        backgroundImage: NetworkImage(pokemons.sprites.frontShiny),
                        radius: 30
                        ),
                        trailing: Icon(Icons.keyboard_arrow_right),

                      );
                    }
                    )
                    )
                  ),
               
                  )  
               ],
     
               ),
             ),
           ],
         ),
       );
    
  }
}