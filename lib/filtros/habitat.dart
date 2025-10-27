import 'package:flutter/material.dart';
import 'package:pokedex_app/home.dart';
import 'package:pokedex_app/page2.dart';
import 'package:pokedex_app/telaFinal.dart';

class Habitat extends StatefulWidget {
 
  String _habitat = "";

  Habitat(String habitat){
    this._habitat = habitat;
  }

  @override
  State<Habitat> createState() => _HabitatState();
}

class _HabitatState extends State<Habitat> {

  var fundo = Menu();

  Widget botao(String texto,String apiPath){
    return ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: button_color,
          minimumSize:Size(180, 130)
        ),
        onPressed: (){
          Navigator.push(context,
        MaterialPageRoute(builder: (context) => Fim(apiPath)));
        },
        child: Text(texto,style: TextStyle(color: const Color.fromARGB(255, 255, 255, 255),fontSize: 25)));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 219, 219, 219),
      body: Center(
        child: Stack(
          children: [
            ListView(
        scrollDirection: Axis.vertical,
        children: [
          Padding(
            padding: EdgeInsetsGeometry.only(top: 20),
            child:Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              botao("Caverna ","pokemon-habitat/1/"),
              botao("Floresta","pokemon-habitat/2")
              ],
            ),
          ),
          Padding(
            padding: EdgeInsetsGeometry.only(top: 20),
            child:Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              botao("Pradaria","pokemon-habitat/3"),
              botao("Montanha","pokemon-habitat/4")
              ],
            ),
          ),
          Padding(
            padding: EdgeInsetsGeometry.only(top: 20),
            child:Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              botao("Raros","pokemon-habitat/5"),
              botao("Acidentado","pokemon-habitat/6"),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsetsGeometry.only(top: 20),
            child:Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              botao("Mar","pokemon-habitat/7"),
              botao("Urbano","pokemon-habitat/8"),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsetsGeometry.only(top: 20),
            child:Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color.fromARGB(255, 202, 132, 127),
                  minimumSize:Size(180, 130)
                ),
                onPressed: (){
                  Navigator.pop(context);
                },
                child: Text("voltar",style: TextStyle(color: const Color.fromARGB(255, 255, 255, 255),fontSize: 25))),
              botao("Beira mar","pokemon-habitat/9"), 
              ],
            ),
          ),
        ],
      ),
          ],
        ),
      ),
    );
  }
}