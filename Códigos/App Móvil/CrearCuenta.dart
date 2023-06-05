import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:incubadoradehuevos/Calibracion.dart';
import 'package:incubadoradehuevos/CrearOIngresar.dart';

class Crearcuenta extends StatefulWidget{
  @override
  CreacuentaApp createState() => CreacuentaApp();
}

class CreacuentaApp extends State<Crearcuenta> {
  bool _obscureText = true;
  final correo = TextEditingController();
  final contra = TextEditingController();
  final comprocontra = TextEditingController();
  final firebase = FirebaseFirestore.instance;


  Future signUp() async {
    if(passwordConfirmed()){
      await FirebaseAuth.instance.createUserWithEmailAndPassword(
          email: correo.text.trim(), password: contra.text.trim());
      await FirebaseAuth.instance.signInWithEmailAndPassword(
          email: correo.text.trim(), password: contra.text.trim());
      Navigator.push(
          context, MaterialPageRoute(builder: (_) => Calibracion()));
      Fluttertoast.showToast(msg: 'Cuenta creada con éxito. Bienvenido',
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM,
          timeInSecForIosWeb: 2,
          backgroundColor: Colors.white60,
          textColor: Colors.black,
          fontSize: 15);
      addUser(
        correo.text.trim(),
        contra.text.trim(),
      );
    } else {
      Fluttertoast.showToast(msg: 'Contraseña incorrecta. Intente de nuevo',
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM,
          timeInSecForIosWeb: 2,
          backgroundColor: Color(0xFFFC817B),
          textColor: Colors.black,
          fontSize: 15);
    }
  }

  Future addUser(String correo, String contra) async{
    final user = FirebaseAuth.instance.currentUser!;
    await FirebaseFirestore.instance.collection('users').doc(user.uid).set({
      'correo': correo,
      'contraseña': contra,
      'cantidad': '',
      'peso': '',
      'temperatura': '',
      'humedad': '',
      'ID': user.uid,
    });
  }

  bool passwordConfirmed() {
    if(contra.text.trim() == comprocontra.text.trim()){
      return true;
    } else{
      return false;
    }
  }
  @override
  void dispose(){
    correo.dispose();
    contra.dispose();
    comprocontra.dispose();
    super.dispose();
  }
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
          onPressed: () => Navigator.push(context,MaterialPageRoute(builder: (_)=> CrearOIngresar()) ),
        ),
        title: Column(
          children: [
            Text('Eggcelent',
                style: TextStyle(color: Colors.black, fontSize: 30)),
            Text('Crear cuenta',style: TextStyle(color: Colors.black, fontSize: 17)),
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
            Padding(padding: EdgeInsets.only(left: 20,top: 170,right: 10),
              child: Center(
                child: Text('''Ingrese el correo electrónico de su 
                 establecimiento''',style: TextStyle(fontSize: 20)), //asi se mete la doble linea
              ),
            ),
            Padding(padding: EdgeInsets.only(left: 20,top: 20, right: 10),
              child: Center(
                child: TextField(
                  controller: correo,
                  decoration: InputDecoration(
                    prefixIcon: Icon(Icons.mail, color: Colors.black),
                    labelText: 'Correo electrónico',
                    hintText: 'Digite su correo electrónico',
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20)
                    ),
                  ),
                ),
              ),
            ),
            Padding(padding: EdgeInsets.only(left: 20,top: 30,right: 10),
              child: Center(
                child: Text('''Ingrese la contraseña de su 
           establecimiento''',style: TextStyle(fontSize: 20)), //asi se mete la doble linea
              ),
            ),
            Padding(padding: EdgeInsets.only(left: 20,top: 20, right: 10),
              child: Center(
                child: TextField(
                  obscureText: _obscureText,
                  controller: contra,
                  decoration: InputDecoration(
                    prefixIcon: Icon(Icons.lock, color: Colors.black),
                    suffix: GestureDetector(onTap: (){
                      setState(() {
                        _obscureText=!_obscureText;
                      });
                    },
                      child: Icon(_obscureText ?Icons.visibility :Icons.visibility_off),
                    ),
                    labelText: 'Contraseña',
                    hintText: 'Digite su contraseña de acceso',
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20)
                    ),
                  ),
                ),
              ),
            ),
            Padding(padding: EdgeInsets.only(left: 20,top: 30,right: 10),
              child: Center(
                child: Text('''Confirme la contraseña de su 
             establecimiento''',style: TextStyle(fontSize: 20)), //asi se mete la doble linea
              ),
            ),
            Padding(padding: EdgeInsets.only(left: 20,top: 20, right: 10),
              child: Center(
                child: TextField(
                  obscureText: _obscureText,
                  controller: comprocontra,
                  decoration: InputDecoration(
                    prefixIcon: Icon(Icons.lock, color: Colors.black),
                    suffix: GestureDetector(onTap: (){
                      setState(() {
                        _obscureText=!_obscureText;
                      });
                    },
                      child: Icon(_obscureText ?Icons.visibility :Icons.visibility_off),
                    ),
                    labelText: 'Confirmación de contraseña',
                    hintText: 'Confirme su contraseña de acceso',
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20)
                    ),
                  ),
                ),
              ),
            ),
            Padding(padding: EdgeInsets.only(left: 20,top: 25, right: 10),
              child: Center(
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    shape:RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                    padding: const EdgeInsets.all(0.0),
                    elevation: 5,
                  ),
                  onPressed: (){
                    signUp();
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
                      child: Text('Guardar datos en el sistema',
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
