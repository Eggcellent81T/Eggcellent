//import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:incubadoradehuevos/DatoDia.dart';
import 'package:incubadoradehuevos/IncubacionActual.dart';
import 'package:incubadoradehuevos/Principal.dart';

class HistoIncuba extends StatefulWidget{
  @override
  HsIncuba createState() => HsIncuba();
}

class HsIncuba extends State<HistoIncuba> {
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Actualizar temperatura',
      home: Scaffold(
        extendBodyBehindAppBar: true,
        backgroundColor: Color(0xFF6CF5FE),
        appBar: AppBar(
          toolbarHeight: 110,
          leading: IconButton(
            icon: Icon(Icons.arrow_back),
            color: Colors.black,
            iconSize: 35,
            onPressed: () => Navigator.push(context,MaterialPageRoute(builder: (_)=> IncubacionActual()) ),
          ),
          title: Text('Historial de incubación',
              style: TextStyle(color: Colors.black, fontSize: 27)),
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
          /*leading: IconButton(
            onPressed: () {},
            icon: IconButton(
            icon: const Icon(Icons.menu),
            onPressed: () {},
          ),
        ),*/
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              Padding(padding: EdgeInsets.only(left: 20,top: 150, right: 10),
                child: Center(
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      shape:RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                      padding: const EdgeInsets.all(0.0),
                      elevation: 5,
                    ),
                    onPressed: (){
                      //print('Botón presionado');
                      Navigator.push(context,MaterialPageRoute(builder: (_)=> DatoDia()) );
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
                        child: Text('Día 1',
                            style: TextStyle(fontSize: 20, color: Colors.black)),
                      ),
                    ),
                  ),
                ),
              ),
              Padding(padding: EdgeInsets.only(left: 20,top: 20, right: 10),
                child: Center(
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      shape:RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                      padding: const EdgeInsets.all(0.0),
                      elevation: 5,
                    ),
                    onPressed: (){
                      //print('Botón presionado');
                      Navigator.push(context,MaterialPageRoute(builder: (_)=> DatoDia()) );
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
                        child: Text('Día 2',
                            style: TextStyle(fontSize: 20, color: Colors.black)),
                      ),
                    ),
                  ),
                ),
              ),
              Padding(padding: EdgeInsets.only(left: 20,top: 20, right: 10),
                child: Center(
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      shape:RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                      padding: const EdgeInsets.all(0.0),
                      elevation: 5,
                    ),
                    onPressed: (){
                      //print('Botón presionado');
                      Navigator.push(context,MaterialPageRoute(builder: (_)=> DatoDia()) );
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
                        child: Text('Día 3',
                            style: TextStyle(fontSize: 20, color: Colors.black)),
                      ),
                    ),
                  ),
                ),
              ),
              Padding(padding: EdgeInsets.only(left: 20,top: 20, right: 10),
                child: Center(
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      shape:RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                      padding: const EdgeInsets.all(0.0),
                      elevation: 5,
                    ),
                    onPressed: (){
                      //print('Botón presionado');
                      Navigator.push(context,MaterialPageRoute(builder: (_)=> DatoDia()) );
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
                        child: Text('Día 4',
                            style: TextStyle(fontSize: 20, color: Colors.black)),
                      ),
                    ),
                  ),
                ),
              ),
              Padding(padding: EdgeInsets.only(left: 20,top: 20, right: 10),
                child: Center(
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      shape:RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                      padding: const EdgeInsets.all(0.0),
                      elevation: 5,
                    ),
                    onPressed: (){
                      //print('Botón presionado');
                      Navigator.push(context,MaterialPageRoute(builder: (_)=> DatoDia()) );
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
                        child: Text('Día 5',
                            style: TextStyle(fontSize: 20, color: Colors.black)),
                      ),
                    ),
                  ),
                ),
              ),
              Padding(padding: EdgeInsets.only(left: 20,top: 20, right: 10),
                child: Center(
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      shape:RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                      padding: const EdgeInsets.all(0.0),
                      elevation: 5,
                    ),
                    onPressed: (){
                      //print('Botón presionado');
                      Navigator.push(context,MaterialPageRoute(builder: (_)=> DatoDia()) );
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
                        child: Text('Día 6',
                            style: TextStyle(fontSize: 20, color: Colors.black)),
                      ),
                    ),
                  ),
                ),
              ),
              Padding(padding: EdgeInsets.only(left: 20,top: 20, right: 10),
                child: Center(
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      shape:RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                      padding: const EdgeInsets.all(0.0),
                      elevation: 5,
                    ),
                    onPressed: (){
                      //print('Botón presionado');
                      Navigator.push(context,MaterialPageRoute(builder: (_)=> DatoDia()) );
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
                        child: Text('Día 7',
                            style: TextStyle(fontSize: 20, color: Colors.black)),
                      ),
                    ),
                  ),
                ),
              ),
              Padding(padding: EdgeInsets.only(left: 20,top: 20, right: 10),
                child: Center(
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      shape:RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                      padding: const EdgeInsets.all(0.0),
                      elevation: 5,
                    ),
                    onPressed: (){
                      //print('Botón presionado');
                      Navigator.push(context,MaterialPageRoute(builder: (_)=> DatoDia()) );
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
                        child: Text('Día 8',
                            style: TextStyle(fontSize: 20, color: Colors.black)),
                      ),
                    ),
                  ),
                ),
              ),
              Padding(padding: EdgeInsets.only(left: 20,top: 20, right: 10),
                child: Center(
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      shape:RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                      padding: const EdgeInsets.all(0.0),
                      elevation: 5,
                    ),
                    onPressed: (){
                      //print('Botón presionado');
                      Navigator.push(context,MaterialPageRoute(builder: (_)=> DatoDia()) );
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
                        child: Text('Día 9',
                            style: TextStyle(fontSize: 20, color: Colors.black)),
                      ),
                    ),
                  ),
                ),
              ),
              Padding(padding: EdgeInsets.only(left: 20,top: 20, right: 10),
                child: Center(
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      shape:RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                      padding: const EdgeInsets.all(0.0),
                      elevation: 5,
                    ),
                    onPressed: (){
                      //print('Botón presionado');
                      Navigator.push(context,MaterialPageRoute(builder: (_)=> DatoDia()) );
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
                        child: Text('Día 10',
                            style: TextStyle(fontSize: 20, color: Colors.black)),
                      ),
                    ),
                  ),
                ),
              ),
              Padding(padding: EdgeInsets.only(left: 20,top: 20, right: 10),
                child: Center(
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      shape:RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                      padding: const EdgeInsets.all(0.0),
                      elevation: 5,
                    ),
                    onPressed: (){
                      //print('Botón presionado');
                      Navigator.push(context,MaterialPageRoute(builder: (_)=> DatoDia()) );
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
                        child: Text('Día 11',
                            style: TextStyle(fontSize: 20, color: Colors.black)),
                      ),
                    ),
                  ),
                ),
              ),
              Padding(padding: EdgeInsets.only(left: 20,top: 20, right: 10),
                child: Center(
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      shape:RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                      padding: const EdgeInsets.all(0.0),
                      elevation: 5,
                    ),
                    onPressed: (){
                      //print('Botón presionado');
                      Navigator.push(context,MaterialPageRoute(builder: (_)=> DatoDia()) );
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
                        child: Text('Día 12',
                            style: TextStyle(fontSize: 20, color: Colors.black)),
                      ),
                    ),
                  ),
                ),
              ),
              Padding(padding: EdgeInsets.only(left: 20,top: 20, right: 10),
                child: Center(
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      shape:RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                      padding: const EdgeInsets.all(0.0),
                      elevation: 5,
                    ),
                    onPressed: (){
                      //print('Botón presionado');
                      Navigator.push(context,MaterialPageRoute(builder: (_)=> DatoDia()) );
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
                        child: Text('Día 13',
                            style: TextStyle(fontSize: 20, color: Colors.black)),
                      ),
                    ),
                  ),
                ),
              ),
              Padding(padding: EdgeInsets.only(left: 20,top: 20, right: 10),
                child: Center(
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      shape:RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                      padding: const EdgeInsets.all(0.0),
                      elevation: 5,
                    ),
                    onPressed: (){
                      //print('Botón presionado');
                      Navigator.push(context,MaterialPageRoute(builder: (_)=> DatoDia()) );
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
                        child: Text('Día 14',
                            style: TextStyle(fontSize: 20, color: Colors.black)),
                      ),
                    ),
                  ),
                ),
              ),
              Padding(padding: EdgeInsets.only(left: 20,top: 20, right: 10),
                child: Center(
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      shape:RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                      padding: const EdgeInsets.all(0.0),
                      elevation: 5,
                    ),
                    onPressed: (){
                      //print('Botón presionado');
                      Navigator.push(context,MaterialPageRoute(builder: (_)=> DatoDia()) );
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
                        child: Text('Día 15',
                            style: TextStyle(fontSize: 20, color: Colors.black)),
                      ),
                    ),
                  ),
                ),
              ),
              Padding(padding: EdgeInsets.only(left: 20,top: 20, right: 10),
                child: Center(
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      shape:RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                      padding: const EdgeInsets.all(0.0),
                      elevation: 5,
                    ),
                    onPressed: (){
                      //print('Botón presionado');
                      Navigator.push(context,MaterialPageRoute(builder: (_)=> DatoDia()) );
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
                        child: Text('Día 16',
                            style: TextStyle(fontSize: 20, color: Colors.black)),
                      ),
                    ),
                  ),
                ),
              ),
              Padding(padding: EdgeInsets.only(left: 20,top: 20, right: 10),
                child: Center(
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      shape:RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                      padding: const EdgeInsets.all(0.0),
                      elevation: 5,
                    ),
                    onPressed: (){
                      //print('Botón presionado');
                      Navigator.push(context,MaterialPageRoute(builder: (_)=> DatoDia()) );
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
                        child: Text('Día 17',
                            style: TextStyle(fontSize: 20, color: Colors.black)),
                      ),
                    ),
                  ),
                ),
              ),
              Padding(padding: EdgeInsets.only(left: 20,top: 20, right: 10),
                child: Center(
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      shape:RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                      padding: const EdgeInsets.all(0.0),
                      elevation: 5,
                    ),
                    onPressed: (){
                      //print('Botón presionado');
                      Navigator.push(context,MaterialPageRoute(builder: (_)=> DatoDia()) );
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
                        child: Text('Día 18',
                            style: TextStyle(fontSize: 20, color: Colors.black)),
                      ),
                    ),
                  ),
                ),
              ),
              Padding(padding: EdgeInsets.only(left: 20,top: 20, right: 10),
                child: Center(
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      shape:RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                      padding: const EdgeInsets.all(0.0),
                      elevation: 5,
                    ),
                    onPressed: (){
                      //print('Botón presionado');
                      Navigator.push(context,MaterialPageRoute(builder: (_)=> DatoDia()) );
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
                        child: Text('Día 19',
                            style: TextStyle(fontSize: 20, color: Colors.black)),
                      ),
                    ),
                  ),
                ),
              ),
              Padding(padding: EdgeInsets.only(left: 20,top: 20, right: 10),
                child: Center(
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      shape:RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                      padding: const EdgeInsets.all(0.0),
                      elevation: 5,
                    ),
                    onPressed: (){
                      //print('Botón presionado');
                      Navigator.push(context,MaterialPageRoute(builder: (_)=> DatoDia()) );
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
                        child: Text('Día 20',
                            style: TextStyle(fontSize: 20, color: Colors.black)),
                      ),
                    ),
                  ),
                ),
              ),
              Padding(padding: EdgeInsets.only(left: 20, top: 30, right: 10),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
