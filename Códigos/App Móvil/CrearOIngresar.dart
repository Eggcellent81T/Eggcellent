import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:incubadoradehuevos/IniciarSesion.dart';
import 'package:incubadoradehuevos/Principal.dart';
import 'Crearcuenta.dart';

class CrearOIngresar extends StatefulWidget{
  @override
  CreIng createState() => CreIng();
}

class CreIng extends State<CrearOIngresar>{
  Widget build(BuildContext context){
    return Scaffold(
      extendBodyBehindAppBar: true,
      backgroundColor: Color(0xFF6CF5FE),
      appBar: AppBar(
        toolbarHeight: 110,
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          color: Colors.black,
          iconSize: 35,
          onPressed: () => Navigator.push(context,MaterialPageRoute(builder: (_)=> Principal()) ),
        ),
        title: Column(
          children: [
            Text('Eggcelent',
                style: TextStyle(color: Colors.black, fontSize: 30)),
            Text('¿Qué desea hacer?',style: TextStyle(color: Colors.black, fontSize: 17)),
          ],
        ),
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
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(padding: EdgeInsets.only(left: 20,top: 280,right: 10),
              child: Center(
                child: Text('Seleccione la opción que requiera',style: TextStyle(fontSize: 20)),
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
                    Navigator.push(context,MaterialPageRoute(builder: (_)=> Iniciarsesion()) );
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
                      child: Text('Iniciar sesión',
                          style: TextStyle(fontSize: 20, color: Colors.black)),
                    ),
                  ),
                ),
              ),
            ),
            Padding(padding: EdgeInsets.only(left: 20,top: 32, right: 10),
              child: Center(
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    shape:RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                    padding: const EdgeInsets.all(0.0),
                    elevation: 5,
                  ),
                  onPressed: (){
                    //print('Botón presionado');
                    Navigator.push(context,MaterialPageRoute(builder: (_)=> Crearcuenta()) );
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
                      child: Text('Crear cuenta',
                          style: TextStyle(fontSize: 20, color: Colors.black)),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
