import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:pokedex_app/filtros/gera%C3%A7%C3%A3o.dart';
import 'package:pokedex_app/filtros/habitat.dart';
import 'package:pokedex_app/filtros/nome.dart';
import 'package:pokedex_app/filtros/tipo.dart';
import 'package:pokedex_app/home.dart';

const Color button_color = Color.fromARGB(255, 197, 100, 76);


class Page2 extends StatefulWidget {
  const Page2({super.key});

  @override
  State<Page2> createState() => _Page2State();
}

class _Page2State extends State<Page2> {
  String _habitat = "/pokemon-habitat/";
  var fundo = Menu();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Stack(
          //alignment: Alignment.center,
          children: [
            fundo.fundo_pokebola(),
            Padding(
              padding: EdgeInsetsGeometry.only(top: 20),
              child:Align(
              alignment: Alignment.topCenter,
              child:  Text("Filtrar por:",style: TextStyle(fontSize: 30,color: Colors.white),)
             ),
            ),
            Container(
              alignment: Alignment.center,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.white,
                          minimumSize:Size(180, 130)
                        ),
                        onPressed: (){
                          Navigator.push(context,MaterialPageRoute(builder: (context) => Geracao()));
                        },
                        child: Text("geração",style: TextStyle(color: Colors.black,fontSize: 25),)),
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.white,
                          minimumSize:Size(180, 130)
                        ),
                        onPressed: (){
                          Navigator.push(context,MaterialPageRoute(builder: (context) => Habitat(_habitat)));
                        },
                        child: Text("habitat",style: TextStyle(color: Colors.black,fontSize: 25),)),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: button_color,
                          minimumSize:Size(180, 130)
                        ),
                        onPressed: (){
                          Navigator.push(context,MaterialPageRoute(builder: (context) => Tipo()));
                        },
                        child: Text("tipo",style: TextStyle(color: const Color.fromARGB(255, 255, 255, 255),fontSize: 25))),
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: button_color,
                          minimumSize:Size(180, 130)
                        ),
                        onPressed: (){
                          Navigator.push(context,MaterialPageRoute(builder: (context) => Nome()));
                        },
                        child: Text("nome/ID",style: TextStyle(color: const Color.fromARGB(255, 255, 255, 255),fontSize: 25))),
                    ],
                  )
                ],
              ),
            ),
           Column(
            mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsetsGeometry.only(left: 20,bottom: 20),
                

                child: ElevatedButton(
                
                  style: ElevatedButton.styleFrom(
                    padding:EdgeInsets.all(20),
                    backgroundColor: const Color.fromARGB(255, 202, 132, 127),
                    minimumSize:Size(150, 100)
                    ),
                  onPressed: (){
                    Navigator.pop(context);
                  },
                  child: Text("Voltar",style: TextStyle(color: const Color.fromARGB(255, 255, 255, 255),fontSize: 25))),
              )
            ],
           )
          ]
        )  
      ),
    );
  }
}