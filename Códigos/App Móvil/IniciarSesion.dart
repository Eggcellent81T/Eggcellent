import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:incubadoradehuevos/CrearOIngresar.dart';
import 'package:incubadoradehuevos/IncubacionActual.dart';

class Iniciarsesion extends StatefulWidget{
  @override
  InicsesApp createState() => InicsesApp();
}

class InicsesApp extends State<Iniciarsesion>{
  //final user = FirebaseAuth.instance.currentUser!;
  bool _obscureText = true;
  final correo = TextEditingController();
  final contra = TextEditingController();
  final firebase=FirebaseFirestore.instance;
  Future signIn() async {
    if (contasenacorrecta()) {
      try {
        await FirebaseAuth.instance.signInWithEmailAndPassword(
            email: correo.text.trim(), password: contra.text.trim());
        Navigator.push(
          context,
          MaterialPageRoute(builder: (_) => IncubacionActual()),
        );
        Fluttertoast.showToast(
          msg: 'Bienvenido',
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM,
          timeInSecForIosWeb: 2,
          backgroundColor: Colors.white60,
          textColor: Colors.black,
          fontSize: 15,
        );
      } catch (e) {
        Fluttertoast.showToast(
          msg: 'Cuenta no encontrada u contraseña incorrecta',
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM,
          timeInSecForIosWeb: 2,
          backgroundColor: Color(0xFFFC817B),
          textColor: Colors.black,
          fontSize: 15,
        );
      }
    }
  }
  bool contasenacorrecta() {
    if(contra.text.trim() == contra.text.trim()){
      return true;
    } else{
      return false;
    }
  }
  @override
  void dispose(){
    correo.dispose();
    contra.dispose();
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
            Text('Iniciar sesión',style: TextStyle(color: Colors.black, fontSize: 17)),
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
            Padding(padding: EdgeInsets.only(left: 20,top: 230,right: 10),
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
            Padding(padding: EdgeInsets.only(left: 20,top: 50,right: 10),
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
                    prefixIcon: Icon(Icons.lock, color:Colors.black),
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
            Padding(padding: EdgeInsets.only(left: 20,top: 50, right: 10),
              child: Center(
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    shape:RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                    padding: const EdgeInsets.all(0.0),
                    elevation: 5,
                  ),
                  onPressed: (){
                    signIn();

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
                      child: Text('Ingresar a la cuenta',
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
