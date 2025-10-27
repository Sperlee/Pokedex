import 'package:flutter/material.dart';
import 'package:pokedex_app/home.dart';
import 'package:pokedex_app/page2.dart';
import 'package:pokedex_app/telaFinal.dart';

class Tipo extends StatefulWidget {
  const Tipo({super.key});

  @override
  State<Tipo> createState() => _TipoState();
}

class _TipoState extends State<Tipo> {

  var fundo = Menu();

  Widget botao(String texto,String apiPath){
    return ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: button_color,
          minimumSize:Size(100, 50)
        ),
        onPressed: (){
          Navigator.push(context,
        MaterialPageRoute(builder: (context) => Fim(apiPath)));
        },
        child: Text(texto,style: TextStyle(color: const Color.fromARGB(255, 255, 255, 255),fontSize: 20)));
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
            padding: EdgeInsetsGeometry.only(top: 150),
            child:Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              botao("normal","type/1/"),
              botao("lutador","type/2/"),
              botao("voador","type/3/"),
              botao("veneno","type/4/")
              ],
            ),
          ),
          Padding(
            padding: EdgeInsetsGeometry.only(top: 50),
            child:Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              botao("terra","type/5/"),
              botao("pedra","type/6/"),
              botao("inseto","type/7/"),
              botao("fantasma","type/8/")
              ],
            ),
          ),
          Padding(
            padding: EdgeInsetsGeometry.only(top: 50),
            child:Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              botao("metal","type/9/"),
              botao("fogo","type/10/"),
              botao("água","type/11/"),
              botao("grama","type/12/"),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsetsGeometry.only(top: 50),
            child:Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              botao("elétrico","type/13/"),
              botao("psíquico","type/14/"),
              botao("gelo","type/15/"),
              botao("dragão","type/16/"),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsetsGeometry.only(top: 50),
            child:Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              botao("sombrio","type/17/"), 
              botao("fada","type/18/"),
              botao("estelar","type/19/"),
              ],
            ),
          ),
        ],
      ),
        Align(
          alignment: Alignment.bottomCenter,
          child:Padding(padding: EdgeInsetsGeometry.only(bottom: 25),
          child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color.fromARGB(255, 202, 132, 127),
                    minimumSize:Size(180, 130)
                  ),
                  onPressed: (){
                    Navigator.pop(context);
                  },
                  child: Text("voltar",style: TextStyle(color: const Color.fromARGB(255, 255, 255, 255),fontSize: 25))),)
             ),
          ],
        ),
      ),
    );
  }
}