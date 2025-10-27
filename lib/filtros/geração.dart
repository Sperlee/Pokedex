import 'package:flutter/material.dart';
import 'package:pokedex_app/home.dart';
import 'package:pokedex_app/page2.dart';
import 'package:pokedex_app/telaFinal.dart';

class Geracao extends StatefulWidget {
  const Geracao({super.key});

  @override
  State<Geracao> createState() => _GeracaoState();
  
}

class _GeracaoState extends State<Geracao> {

  var fundo = Menu();

  Widget botao(String texto,String apiPath){
    return ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: button_color,
              minimumSize:Size(180, 130)
            ),
            onPressed: (){
              Navigator.push(context, MaterialPageRoute(builder: (context) => Fim(apiPath)));
            },
            child: Text(texto,style: TextStyle(color: const Color.fromARGB(255, 255, 255, 255),fontSize: 25)));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 219, 219, 219),
      body: Stack(
        children: [        
        ListView(
        scrollDirection: Axis.vertical,
        children: [
          Padding(
            padding: EdgeInsetsGeometry.only(top: 20),
            child:Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              botao("Gen 1","generation/1/"),
              botao("Gen 2","generation/2/")
              ],
            ),
          ),
          Padding(
            padding: EdgeInsetsGeometry.only(top: 20),
            child:Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              botao("Gen 3","generation/3/"),
              botao("Gen 4","generation/4/")
              ],
            ),
          ),
          Padding(
            padding: EdgeInsetsGeometry.only(top: 20),
            child:Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              botao("Gen 5","generation/5/"),
              botao("Gen 6","generation/6/"),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsetsGeometry.only(top: 20),
            child:Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              botao("Gen 7","generation/7/"),
              botao("Gen 8","generation/8/"),
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
              botao("Gen 9","generation/9/"), 
              ],
            ),
          ),
        ],
      ),
        ],
      )
      
      
    );
  }
}