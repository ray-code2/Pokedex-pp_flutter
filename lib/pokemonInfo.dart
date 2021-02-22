import 'package:flutter/material.dart';
import 'pokemon.dart';
import 'package:expansion_card/expansion_card.dart';


// ignore: must_be_immutable
class PokemonInfo extends StatefulWidget {
  Pokemon pokemon;
  PokemonInfo(this.pokemon);

  @override
  _PokemonInfoState createState() => _PokemonInfoState();
}

class _PokemonInfoState extends State<PokemonInfo> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.red,
      appBar: AppBar(
        title: Text("Shiny " + widget.pokemon.name.toUpperCase()),
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          tooltip: "Return To 1 Screen",
          onPressed: (){
            Navigator.pop(context,true);
          },
          
        ),
     backgroundColor: Colors.red,

      ),
      body: Column(
        children: [
          Image(image: NetworkImage(widget.pokemon.sprites.frontShiny ),
          fit: BoxFit.cover,
          height: 150,
          width: 150

          ),
          Text(widget.pokemon.name.toUpperCase(),
            style: TextStyle(
                fontWeight: FontWeight.w400,
                fontSize: 35,
                color: Colors.white,
                letterSpacing: 3
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(0, 20, 0, 10),
            child: Text('Pokemon Type' , style: TextStyle(
                        color: Colors.white,fontSize: 20,fontWeight: FontWeight.bold,
                        ),
                        ),
          ),
          Expanded(
            child: Container(
              child: ListView.builder(
                  itemCount: widget.pokemon.types.length,
                  itemBuilder: (BuildContext contex, index) {
                    return Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                      Text( widget.pokemon.types[index].type.name,
                      style: TextStyle(
                      color: Colors.white,fontSize: 20,fontWeight: FontWeight.bold
                      ,),
                    )
                      ],
                      
                    );
                  }),
            ),
          ),
        
      Center(
            child: Padding(
              padding: const EdgeInsets.fromLTRB(0, 0, 0, 20),
              child: ExpansionCard(
                title: Container(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        "Pokemon Status",
                      ),
                    ],
                  ),
                ),
                children: <Widget>[
                  Container(
                    margin: EdgeInsets.symmetric(horizontal: 7),
                    child: Text("Detail Status", style: TextStyle(
                      color: Colors.white ,
                       fontSize: 18 , 
                       fontWeight: FontWeight.bold),
                  ),
                  )
                ],
              ),
            )),    
          Expanded(
            child: ListView.builder(
                itemCount: widget.pokemon.stats.length,
                itemBuilder: (context,index){
                final stats = widget.pokemon.stats[index];
                  return Padding(
                    padding: const EdgeInsets.fromLTRB(0, 0, 0, 10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text('${stats.stat.name}: ${stats.baseStat}',
                          style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                              letterSpacing: 1
                          ),
                        ),
                      ],
                    ),
                  );
                }
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(0, 10, 0, 50),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
        
                    Text(' Weight ${widget.pokemon.weight/10} Kg ',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                          color: Colors.white,)
                    ),
                     Text(' Height ${widget.pokemon.height/10} M  ',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                          color: Colors.white,)
                    ),
                  ],
                
               
                ),
          ),
         




        ],
      ),

    );
  }
}