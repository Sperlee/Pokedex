import 'dart:ffi' hide Size;
import 'package:flutter/material.dart';
import 'package:flutter/services.dart' hide Size;
import 'package:pokedex_app/home.dart';
import 'package:pokedex_app/page2.dart';
import 'package:pokedex_app/telaFinal.dart';
import 'package:pokedex_app/telaFinal_nome.dart';

class Nome extends StatefulWidget {
  const Nome({super.key});

  @override
  State<Nome> createState() => _NomeState();
}

class _NomeState extends State<Nome> {

  TextEditingController _pokemon = TextEditingController();
  var fundo = Menu();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.red,
      body: Center(
        child: Stack(
          alignment: Alignment.center,
          children: [
            fundo.fundo_pokebola(),
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Padding(
                  padding: EdgeInsetsGeometry.only(),
                  child:Text(
                    "Digite o nome ou o ID do Pokemon",
                    style: TextStyle(fontSize: 20),)),
                Padding(
                  padding: EdgeInsetsGeometry.only(),
                  child:SizedBox(
                    width: 200,
                    child: Container(
                      color: Colors.white,
                      child: TextField(
                        style: TextStyle(),
                        controller: _pokemon,),
                  ),
                ) ,
              ),
                Padding(
                  padding: EdgeInsetsGeometry.only(bottom: 20),
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: button_color,
                      minimumSize:Size(150, 100)
                    ),
                    onPressed: (){
                      String pokemonName = _pokemon.text.toLowerCase().trim();

                      if (pokemonName.isNotEmpty) { 
                        print("Buscando por: $pokemonName");
                        Navigator.push(context,
                        MaterialPageRoute(

                          builder: (context) => PokemonDetailScreen(pokemonIdentifier: pokemonName)
                        ));
                      }
                    },
                    child: Text("Buscar",style: TextStyle(color: const Color.fromARGB(255, 255, 255, 255),fontSize: 25))),),

              ],
            ),
            Align(
              
              alignment: Alignment.bottomLeft,
              child: Padding(
                padding: EdgeInsetsGeometry.only(bottom: 20,left: 10),
                child:ElevatedButton(
                   style: ElevatedButton.styleFrom(
                    backgroundColor: button_color,
                    minimumSize:Size(150, 100)
                  ),
                  onPressed: (){
                    Navigator.pop(context);
                    },
                  child: Text("voltar",style: TextStyle(color: const Color.fromARGB(255, 255, 255, 255),fontSize: 25))) ,))
          ],
        )
        
      ),
    );
  }
}