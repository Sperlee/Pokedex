import 'package:flutter/material.dart';
import 'package:pokedex_app/page2.dart';

class Menu extends StatefulWidget {
  const Menu({super.key});

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
              color: const Color.fromARGB(255, 155, 155, 155), 
            ),

            SizedBox(
          width: 200,
          height: 200,

          child:ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: const Color.fromARGB(255, 155, 155, 155),
              foregroundColor: const Color.fromARGB(255, 255, 255, 255),
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