import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:incubadoradehuevos/Actualizar.dart';
import 'package:incubadoradehuevos/HistoIncuba.dart';
import 'package:incubadoradehuevos/IniciarSesion.dart';
import 'package:flutter_blue/flutter_blue.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:intl/intl.dart';
import 'package:timer_builder/timer_builder.dart';

class IncubacionActual extends StatefulWidget{
  @override
  IncAct createState() => IncAct();
}

class IncAct extends State<IncubacionActual> {
  final user = FirebaseAuth.instance.currentUser!;
  final can = TextEditingController();
  final pes = TextEditingController();
  final temp = TextEditingController();
  final hum = TextEditingController();

  _fetch() async {
    final user = await FirebaseAuth.instance.currentUser!;
    if (user != null) {
      await FirebaseFirestore.instance.collection('users').doc(user.uid).get().then((ds) {
        temp.text = ds.get('temperatura').toString();
        can.text = ds.get('cantidad').toString();
        pes.text = ds.get('peso').toString();
        print(temp);
        print(can);
        print(pes);
      });

      FlutterBlue flutterBlue = FlutterBlue.instance;
      BluetoothDevice? device;

      // Buscar y conectar con el dispositivo Arduino
      flutterBlue.scan().listen((scanResult) {
        if (scanResult.device.name == 'Nombre del dispositivo Arduino') {
          device = scanResult.device;
          device!.connect();
        }
      });

      // Leer los datos en tiempo real desde la placa Arduino
      device!.state.listen((state) {
        if (state == BluetoothDeviceState.connected) {
          device!.discoverServices().then((services) {
            services.forEach((service) {
              if (service.uuid.toString() == '0000ffe0-0000-1000-8000-00805f9b34fb') {
                service.characteristics.forEach((characteristic) {
                  if (characteristic.uuid.toString() == '0000ffe1-0000-1000-8000-00805f9b34fb') {
                    characteristic.setNotifyValue(true);
                    characteristic.value.listen((value) {
                      // Parsear los datos de temperatura, peso y humedad desde la cadena de texto recibida
                      List<String> data = String.fromCharCodes(value).split(',');
                      if (data.length >= 3) {
                        setState(() {
                          temp.text = data[0];
                          pes.text = data[1];
                          hum.text = data[2];
                          _saveDataToFirestore(); // Agregar esta línea
                        });
                      }
                    });
                  }
                });
              }
            });
          });
        }
      });
    }
  }

  _saveDataToFirestore() async {
    final user = await FirebaseAuth.instance.currentUser!;
    if (user != null) {
      final now = DateTime.now();
      final formattedDate = DateFormat('yyyy-MM-dd').format(now);
      final formattedTime = DateFormat('HH:mm:ss').format(now);

      await FirebaseFirestore.instance
          .collection('users')
          .doc(user.uid)
          .collection('historical_data')
          .doc(formattedDate)
          .set({
        'tiempo': formattedTime,
        'temperatura': temp.text,
        'peso': pes.text,
        'humedad': hum.text,
      });
    }
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
          title: Text('Incubación actual',
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
                        'Tiempo aproximado para la eclosión de los huevos:',
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
                    //controller: controllerDireccion; para un futuro: controllerTemperatura
                    decoration: InputDecoration(
                      //labelText: 'Dirección del establecimiento',
                      hintText: '20 días',
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
                        colors: [Color(0xFF30F80C),Color(0xFF8FF57D)],
                      ),
                      //border: Border.all(color: Colors.black, width: 2),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Padding(
                      padding: EdgeInsets.all(10),
                      child: Text(
                        'NO SE HAN PROGRAMADO LOS DEMÁS TEXTOS, SE NECESITAN TENER DATOS PARA ELLO',
                        style: TextStyle(color: Colors.black, fontSize: 20, fontWeight: FontWeight.bold),
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
                      Navigator.push(context,MaterialPageRoute(builder: (_)=> Actualizar()) );
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
                        child: Text('Actualizar temperatura',
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
                      Navigator.push(context,MaterialPageRoute(builder: (_)=> HistoIncuba()) );
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
                        child: Text('Ver historial de incubación',
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
                      FirebaseAuth.instance.signOut();
                      Navigator.push(context,MaterialPageRoute(builder: (_)=> Iniciarsesion()) );
                      Fluttertoast.showToast(msg: 'Hasta pronto',
                          toastLength: Toast.LENGTH_SHORT,
                          gravity: ToastGravity.BOTTOM,
                          timeInSecForIosWeb: 2,
                          backgroundColor: Colors.white60,
                          textColor: Colors.black,
                          fontSize: 15);
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
                        child: Text('Logout',
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

  /*void _saveDataToFirestore() async {
    final user = FirebaseAuth.instance.currentUser;
    if (user != null) {
      await FirebaseFirestore.instance
          .collection('users')
          .doc(user.uid)
          .set({
        'temperatura_estatica': temp.text,
        'peso_estatico': pes.text,
        'humedad_estatica': hum.text,
      }, SetOptions(merge: true));
    }
  }*/
}
