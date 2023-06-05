import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:incubadoradehuevos/Actualizar.dart';
import 'package:incubadoradehuevos/HistoIncuba.dart';
import 'package:incubadoradehuevos/IniciarSesion.dart';

class DatoDia extends StatefulWidget{
  @override
  Dadi createState() => Dadi();
}

class Dadi extends State<DatoDia> {
  final user = FirebaseAuth.instance.currentUser!;
  final can = TextEditingController();
  final pes = TextEditingController();
  final temp = TextEditingController();
  final hum = TextEditingController();

  _fetch() async {
    final user = await FirebaseAuth.instance.currentUser!;
    if (user != null)
      await FirebaseFirestore.instance.collection('users').doc(user.uid)
          .get()
          .then((ds) {
        temp.text = ds.get('temperatura').toString();
        can.text = ds.get('cantidad').toString();
        pes.text = ds.get('peso').toString();
        print(temp);
        print(can);
        print(pes);
      });
  }

  @override
  void initState(){
    _fetch();
    super.initState();
  }

  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Incubacion actual',
      home: Scaffold(
        extendBodyBehindAppBar: true,
        backgroundColor: Color(0xFF6CF5FE),
        appBar: AppBar(
          toolbarHeight: 110,
          //PARA LA VERSIÓN FINAL, ESTA PANTALLA NO DEBE DE IR A CALIBRACIÓN DE NUEVO
          leading: IconButton(
            icon: Icon(Icons.arrow_back),
            color: Colors.black,
            iconSize: 35,
            onPressed: () => Navigator.push(context,MaterialPageRoute(builder: (_)=> HistoIncuba()) ),
          ),
          title: Text('Día 1 de la incubación',
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
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              Padding(padding: EdgeInsets.only(left: 20, top: 150, right: 10),
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
                        'Temperatura actual de la incubadora:',
                        style: TextStyle(color: Colors.black, fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                ),
              ),
              Padding(padding: EdgeInsets.only(left: 20,top: 20, right: 10),
                child: Center(
                  child: TextField(
                    enabled: false,
                    controller: temp,
                    decoration: InputDecoration(
                      //labelText: 'Dirección del establecimiento',
                      hintText: '',
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20)
                      ),
                    ),
                  ),
                ),
              ),
              Padding(padding: EdgeInsets.only(left: 20, top: 20, right: 10),
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
                        'Humedad actual dentro de la incubadora:',
                        style: TextStyle(color: Colors.black, fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                ),
              ),
              Padding(padding: EdgeInsets.only(left: 20,top: 20, right: 10),
                child: Center(
                  child: TextField(
                    enabled: false,
                    //controller: hum,
                    decoration: InputDecoration(
                      //labelText: 'Dirección del establecimiento',
                      hintText: '7',
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20)
                      ),
                    ),
                  ),
                ),
              ),
              Padding(padding: EdgeInsets.only(left: 20, top: 20, right: 10),
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
                        'Peso medio actual de los huevos:',
                        style: TextStyle(color: Colors.black, fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                ),
              ),
              Padding(padding: EdgeInsets.only(left: 20,top: 20, right: 10),
                child: Center(
                  child: TextField(
                    enabled: false,
                    controller: pes,
                    decoration: InputDecoration(
                      //labelText: 'Dirección del establecimiento',
                      hintText: '',
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20)
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
