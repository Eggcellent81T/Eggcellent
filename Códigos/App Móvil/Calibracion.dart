//import 'package:firebase_core/firebase_core.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:incubadoradehuevos/IncubacionActual.dart';
import 'package:incubadoradehuevos/Principal.dart';
import 'package:flutter_blue/flutter_blue.dart';

class Calibracion extends StatefulWidget{
  @override
  CaliIni createState() => CaliIni();
}

class CaliIni extends State<Calibracion> {
  final user = FirebaseAuth.instance.currentUser!;
  final can = TextEditingController();
  final pes = TextEditingController();
  final temp = TextEditingController();
  final hum = TextEditingController();

  // Crea una instancia de FlutterBlue
  FlutterBlue flutterBlue = FlutterBlue.instance;
  BluetoothDevice? selectedDevice;

  @override
  void initState() {
    super.initState();
    // Escanea y encuentra los dispositivos Bluetooth disponibles
    scanDevices();
  }

  Future<void> scanDevices() async {
    flutterBlue.scanResults.listen((results) {
      for (ScanResult result in results) {
        // Aquí puedes filtrar y seleccionar el dispositivo Bluetooth adecuado
        if (result.device.name == 'Nombre del dispositivo Bluetooth') {
          setState(() {
            selectedDevice = result.device;
          });
          break;
        }
      }
    });
    flutterBlue.startScan();
  }

  Future<void> connectToDevice() async {
    if (selectedDevice != null) {
      await selectedDevice!.connect();
    }
  }

  Future<void> sendData(String data) async {
    if (selectedDevice != null && selectedDevice!.state == BluetoothDeviceState.connected) {
      List<BluetoothService> services = await selectedDevice!.discoverServices();
      for (BluetoothService service in services) {
        for (BluetoothCharacteristic characteristic in service.characteristics) {
          if (characteristic.uuid.toString() == 'característica_uuid') {
            await characteristic.write(data.codeUnits);
            break;
          }
        }
      }
    }
  }

  Future agregar() async{
    int? cant = int.tryParse(can.text.trim());
    int? pe = int.tryParse(pes.text.trim());
    int? tempe = int.tryParse(temp.text.trim());
    if (cant != null && pe != null && tempe != null) {
      await FirebaseFirestore.instance.collection('users').doc(user.uid).set(
          {
            'cantidad': cant,
            'peso': pe,
            'temperatura': tempe,
          }, SetOptions(merge: true));
    }else{
      // mostrar un mensaje de error al usuario porque los valores no son enteros
    }
  }

  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Calibración inicial',
      home: Scaffold(
        extendBodyBehindAppBar: true,
        backgroundColor: Color(0xFF6CF5FE),
        appBar: AppBar(
          toolbarHeight: 110,
          title: Text('Calibración inicial',
              style: TextStyle(color: Colors.black, fontSize: 30)),
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
                        'Ingrese cantidad de huevos (máximo 9)',
                        style: TextStyle(color: Colors.black, fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                ),
              ),
              Padding(padding: EdgeInsets.only(left: 20,top: 20, right: 10),
                child: Center(
                  child: TextField(
                    controller: can,
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      labelText: 'Cantidad de huevos',
                      hintText: 'Ej: 2; 5; 9; (solo cantidad total)',
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
                        'Ingrese el peso medio de los huevos',
                        style: TextStyle(color: Colors.black, fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                ),
              ),
              Padding(padding: EdgeInsets.only(left: 20,top: 20, right: 10),
                child: Center(
                  child: TextField(
                    controller: pes,
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      labelText: 'Peso medio de los huevos en gramos',
                      hintText: 'Ej: 360; 240; 150',
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
                        'Ingrese la temperatura para la incubadora (usa grados celcius C°)',
                        style: TextStyle(color: Colors.black, fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                ),
              ),
              Padding(padding: EdgeInsets.only(left: 20,top: 20, right: 10),
                child: Center(
                  child: TextField(
                    controller: temp,
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      labelText: 'Grados celsius',
                      hintText: 'Ej: 20; 45; 35; (solo cantidad total)',
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20)
                      ),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(left: 20, top: 50, right: 10),
                child: Center(
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                      padding: const EdgeInsets.all(0.0),
                      elevation: 5,
                    ),
                    onPressed: () async {
                      if (can.text.trim().isEmpty || pes.text.trim().isEmpty || temp.text.trim().isEmpty) {
                        Fluttertoast.showToast(
                          msg: 'Por favor, complete todos los campos.',
                          toastLength: Toast.LENGTH_SHORT,
                          gravity: ToastGravity.BOTTOM,
                          timeInSecForIosWeb: 1,
                          backgroundColor: Color(0xFFFC817B),
                          textColor: Colors.white,
                          fontSize: 16.0,
                        );
                      } else {
                        // Envía los datos a la placa Arduino
                        if (temp.text.trim().isNotEmpty) {
                          await sendData(temp.text.trim());
                        }
                        // Continúa con la lógica existente
                        agregar();
                        Navigator.push(context, MaterialPageRoute(builder: (_) => IncubacionActual()));
                      }
                    },
                    child: Ink(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        gradient: LinearGradient(
                          colors: [Color(0xFFFACD6C), Color(0xFFFAFA6C)],
                          begin: Alignment.bottomCenter,
                          end: Alignment.topCenter,
                        ),
                      ),
                      child: Container(
                        color: Colors.transparent,
                        padding: const EdgeInsets.all(10),
                        child: Text(
                          'Empezar incubación',
                          style: TextStyle(fontSize: 20, color: Colors.black),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(left: 20, top: 32, right: 10),
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
                        'La temperatura de debe de acoplar en base a la cantidad de huevos que se vaya a introducir',
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
