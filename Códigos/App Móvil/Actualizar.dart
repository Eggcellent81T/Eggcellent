import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:flutter_blue/flutter_blue.dart';
import 'package:incubadoradehuevos/IncubacionActual.dart';
import 'package:incubadoradehuevos/Principal.dart';

class Actualizar extends StatefulWidget {
  @override
  ActuTem createState() => ActuTem();
}

class ActuTem extends State<Actualizar> {
  final user = FirebaseAuth.instance.currentUser!;
  final temp = TextEditingController();
  final hum = TextEditingController();

  final FlutterBlue flutterBlue = FlutterBlue.instance;
  BluetoothDevice? connectedDevice;
  BluetoothCharacteristic? characteristic;

  _fetch() async {
    final user = await FirebaseAuth.instance.currentUser!;
    if (user != null) {
      await FirebaseFirestore.instance
          .collection('users')
          .doc(user.uid)
          .get()
          .then((ds) {
        temp.text = ds.get('temperatura').toString();
        print(temp);
      });
    }
  }

  @override
  void initState() {
    _fetch();
    super.initState();
  }

  Future<void> scanDevices() async {
    try {
      await flutterBlue.startScan(timeout: Duration(seconds: 4));
      flutterBlue.scanResults.listen((results) {
        for (ScanResult result in results) {
          if (result.device.name == 'Arduino') {
            connectToDevice(result.device);
            break;
          }
        }
      });
    } catch (e) {
      print(e.toString());
    }
  }

  Future<void> connectToDevice(BluetoothDevice device) async {
    if (connectedDevice != null) {
      await connectedDevice!.disconnect();
      setState(() {
        connectedDevice = null;
      });
    }

    try {
      await device.connect();
      List<BluetoothService> services = await device.discoverServices();
      services.forEach((service) {
        List<BluetoothCharacteristic> characteristics = service.characteristics;
        for (BluetoothCharacteristic characteristic in characteristics) {
          if (characteristic.uuid.toString() == 'your_characteristic_uuid') {
            setState(() {
              connectedDevice = device;
              this.characteristic = characteristic;
            });
            break;
          }
        }
      });
    } catch (e) {
      print(e.toString());
    }
  }

  Future<void> sendDataToArduino(int temperature) async {
    if (connectedDevice != null && characteristic != null) {
      List<int> data = [temperature];
      await characteristic!.write(data);
    }
  }

  Future<void> agregarNuevo() async {
    int? tempe = int.tryParse(temp.text.trim());
    if (tempe != null) {
      await FirebaseFirestore.instance
          .collection('users')
          .doc(user.uid)
          .set(
        {
          'temperatura': tempe,
        },
        SetOptions(merge: true),
      );

      // Envía los datos de temperatura al Arduino
      await sendDataToArduino(tempe);
    } else {
      // mostrar un mensaje de error al usuario porque los valores no son enteros
    }
  }

  @override
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
            onPressed: () => Navigator.push(
              context,
              MaterialPageRoute(builder: (_) => IncubacionActual()),
            ),
          ),
          title: Text(
            'Actualizar temperatura',
            style: TextStyle(color: Colors.black, fontSize: 27),
          ),
          centerTitle: true,
          flexibleSpace: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(30),
                bottomRight: Radius.circular(30),
              ),
              gradient: LinearGradient(
                colors: [Color(0xFF6CF5FE), Color(0xFF16BBC6)],
                begin: Alignment.bottomCenter,
                end: Alignment.topCenter,
              ),
            ),
          ),
          backgroundColor: Colors.transparent,
          elevation: 10,
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
                        colors: [Color(0xFFFACD6C), Color(0xFFFAFA6C)],
                      ),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Padding(
                      padding: EdgeInsets.all(10),
                      child: Text(
                        'Ingrese la nueva temperatura para la incubadora:',
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 20,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(left: 20, top: 20, right: 10),
                child: Center(
                  child: TextField(
                    controller: temp,
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      hintText: '',
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20)),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(left: 20, top: 50, right: 10),
                child: Center(
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20)),
                      padding: const EdgeInsets.all(0.0),
                      elevation: 5,
                    ),
                    onPressed: () {
                      agregarNuevo();
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (_) => IncubacionActual()),
                      );
                      Fluttertoast.showToast(
                          msg: 'Datos actualizados con éxito',
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
                          colors: [Color(0xFFFACD6C), Color(0xFFFAFA6C)],
                          begin: Alignment.bottomCenter,
                          end: Alignment.topCenter,
                        ),
                      ),
                      child: Container(
                        color: Colors.transparent,
                        padding: const EdgeInsets.all(10),
                        child: Text(
                          'Confirmar actualización',
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
                        colors: [Color(0xFFFACD6C), Color(0xFFFAFA6C)],
                      ),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Padding(
                      padding: EdgeInsets.all(10),
                      child: Text(
                        'Recuerde que esta operación podría modificar la humedad interna de la incubadora, además de alterar el peso promedio de los huevos introducidos en ella',
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold),
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
