import 'package:flutter/material.dart';
import 'package:flutter_application/controllers/databasehelpers.dart';

class AddClientePage extends StatefulWidget {
  const AddClientePage({Key? key}) : super(key: key);

  @override
  State<AddClientePage> createState() => _AddClientePage();
}

class _AddClientePage extends State<AddClientePage> {
  DataBaseHelper dataBaseHelper = DataBaseHelper();

  final TextEditingController nombre1Controller = TextEditingController();
  final TextEditingController apellido1Controller = TextEditingController();
  final TextEditingController saldocuentaController = TextEditingController();
  final TextEditingController identificacionController =
      TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: ListView(
          padding: const EdgeInsets.only(
              top: 62, left: 12.0, right: 12.0, bottom: 12.0),
          children: [
            Container(
              height: 60,
              child: TextField(
                controller: identificacionController,
                decoration: InputDecoration(
                  labelText: 'Cedula',
                  hintText: 'Cedula',
                  icon: new Icon(Icons.person),
                ),
              ),
            ),
            Container(
              height: 60,
              child: TextField(
                controller: nombre1Controller,
                decoration: InputDecoration(
                  labelText: 'nombre_1',
                  hintText: 'Primer Nombre',
                  icon: new Icon(Icons.person),
                ),
              ),
            ),
            Container(
              height: 60,
              child: TextField(
                controller: apellido1Controller,
                decoration: InputDecoration(
                  labelText: 'apellido_1',
                  hintText: 'Primer Apellido',
                  icon: new Icon(Icons.person),
                ),
              ),
            ),
            Container(
              height: 60,
              child: TextField(
                keyboardType: TextInputType.number,
                controller: saldocuentaController,
                decoration: InputDecoration(
                  labelText: 'saldo_cuenta',
                  hintText: 'Saldo Cuenta',
                  icon: new Icon(Icons.money),
                ),
              ),
            ),
            Padding(
              padding: new EdgeInsets.only(top: 44.0),
            ),
            Container(
                height: 50,
                child: RaisedButton(
                  onPressed: () {
                    dataBaseHelper.addCliente(
                        //var saldo = double.parse(saldocuentaController);
                        nombre1Controller.text.trim(),
                        apellido1Controller.text.trim(),
                        saldocuentaController.text.trim(),
                        identificacionController.text.trim());
                    Navigator.pop(context, true);
                  },
                  color: Colors.blue,
                  child: Text(
                    'Add',
                    style: TextStyle(),
                  ),
                ))
          ],
        ),
      ),
    );
  }
}
