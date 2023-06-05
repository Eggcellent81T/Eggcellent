//import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:incubadoradehuevos/Calibracion.dart';

import 'CrearOIngresar.dart';

class Principal extends StatefulWidget{
  @override
  Prins createState() => Prins();
}

class Prins extends State<Principal> {
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Incubadora de huevos',
      home: Scaffold(
        extendBodyBehindAppBar: true,
        backgroundColor: Color(0xFF6CF5FE),
       appBar: AppBar(
          toolbarHeight: 110,
          title: Text('EGGCELENT',
              style: TextStyle(color: Colors.black, fontSize: 35)),
          centerTitle: true,
          flexibleSpace: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.only(bottomLeft: Radius.circular(30), bottomRight: Radius.circular(30)),
              gradient: LinearGradient(
                  colors: [Color(0xFF6CF5FE),Color(0xFF16BBC6)],
                  begin: Alignment.bottomCenter,
                  end: Alignment.topCenter
              ),
            ),
          ),
          backgroundColor: Colors.transparent,
          elevation: 10,
          /* leading: IconButton(
            onPressed: () {},
            icon: IconButton(
            icon: const Icon(Icons.menu),
            onPressed: () {},
          ),
        ), */
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: EdgeInsets.only(left: 20, top: 150, right: 10),
                child: Center(
                  child: Container(
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: [Color(0xFFFACD6C),Color(0xFFFAFA6C)],
                      ),
                      //border: Border.all(color: Colors.black, width: 2),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Padding(
                      padding: EdgeInsets.all(10),
                      child: Text(
                        'Bienvenido',
                        style: TextStyle(color: Colors.black, fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                ),
              ),
              Padding(padding: EdgeInsets.only(left: 20,top: 30,right: 20),
                child: Center(
                  child: Container(
                   /* decoration: BoxDecoration(
                      border: Border.all(color: Colors.amberAccent, width: 4),
                      borderRadius: BorderRadius.circular(15),
                    ),*/
                    width: 330,
                    height: 330,
                    child: InkWell(
                      child: Ink.image(
                        image: AssetImage('image/logoeggcelent.png'),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),
              ),
              Padding(padding: EdgeInsets.only(left: 20,top: 50, right: 10),
                child: Center(
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      shape:RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                      padding: const EdgeInsets.all(0.0),
                      elevation: 5,
                    ),
                    onPressed: (){
                      //print('Botón presionado');
                      Navigator.push(context,MaterialPageRoute(builder: (_)=> CrearOIngresar()) );
                    },
                    child: Ink(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        gradient: LinearGradient(
                          colors: [Color(0xFFFACD6C),Color(0xFFFAFA6C)],
                          begin: Alignment.bottomCenter,
                          end: Alignment.topCenter,
                        ),
                      ),
                      child: Container(
                        color: Colors.transparent,
                        padding: const EdgeInsets.all(10),
                        //constraints: const BoxConstraints(minWidth: 150.0),
                        child: Text('Ingresar',
                            style: TextStyle(fontSize: 20, color: Colors.black)),
                      ),
                    ),
                  ),
                ),
              ),
              Padding(padding: EdgeInsets.only(left: 20, top: 32, right: 10),
                child: Center(
                  child: Container(
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: [Color(0xFFFACD6C),Color(0xFFFAFA6C)],
                      ),
                      //border: Border.all(color: Colors.black, width: 2),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Padding(padding: EdgeInsets.all(10),
                      child: Text(
                        'LA INCUBADORA DEBE CALIBRARSE CADA VEZ QUE SE EMPIECE UN NUEVO PROCESO DE INCUBACIÓN',
                        style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
