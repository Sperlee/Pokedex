import 'package:flutter/material.dart';
import 'package:pokedex_app/page2.dart';

const Color cor_cinza = const Color.fromARGB(255, 155, 155, 155);

class Menu extends StatefulWidget {
  const Menu({super.key});

  Widget fundo_pokebola(){
    return Stack(
          alignment: Alignment.center,
          children: [
            Container(
              child: Column(
                children: [
                  Expanded(
                    child: Container(
                      color: Colors.red,
                  )),
                  Expanded(
                    child: Container(
                      color: Colors.white,
                    ))
                ],
              ),
            ),
            Container(
              width: double.infinity, 
              height: 60,             
              color: cor_cinza, 
            ),

            SizedBox(
          width: 200,
          height: 200,
          ),
          ]);
  }

  @override
  State<Menu> createState() => _MenuState();
}

class _MenuState extends State<Menu> {


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: 
      Center(
        child:
        Stack(
          alignment: Alignment.center,
          children: [
            Container(
              child: Column(
                children: [
                  Expanded(
                    child: Container(
                      color: Colors.red,
                  )),
                  Expanded(
                    child: Container(
                      color: Colors.white,
                    ))
                ],
              ),
            ),
            Container(
              width: double.infinity, 
              height: 60,             
              color: cor_cinza, 
            ),

            SizedBox(
          width: 200,
          height: 200,

          child:ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: cor_cinza,
              foregroundColor: Colors.white,
              shadowColor:const Color.fromARGB(255, 0, 0, 0),
             
            ),
            onPressed: (){
              setState(() {
                Navigator.push(context, MaterialPageRoute(builder: (context) => Page2()));
              });
            }, 
            child: Container(
              width: 150,
              height: 150,
              child: CircleAvatar(
                backgroundColor: const Color.fromARGB(248, 255, 255, 255),
                child: Text("Iniciar",style: TextStyle(color: Colors.black,fontSize: 30),
              ),
            )
          )
        )
        ),
            Container(

            )

          ],

          ),
        )
    );
  }
}