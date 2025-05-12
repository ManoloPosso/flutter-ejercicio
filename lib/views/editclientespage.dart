import 'package:flutter/material.dart';
import 'package:flutter_application/controllers/databasehelpers.dart';
import 'package:flutter_application/views/listviewclientes.dart';

class EditarClientesPage extends StatefulWidget {
  final List list;
  final int index;

  const EditarClientesPage({required this.list, required this.index});

  @override
  State<EditarClientesPage> createState() => _EditarClientesPageState();
}

class _EditarClientesPageState extends State<EditarClientesPage> {
  DataBaseHelper dataBaseHelper = new DataBaseHelper();

  late TextEditingController controllerNombre1;
  late TextEditingController controllerApellido1;
  late TextEditingController controllerSaldoCuenta;
  late TextEditingController controllerId;

  _navigateList(BuildContext context) async {
    final result = await Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => ListUsers()),
    );

    if (result) {
      setState(() {});
    }
  }

  @override
  void initState() {
    controllerId = new TextEditingController(
        text: widget.list[widget.index]['id'].toString());

    controllerNombre1 = new TextEditingController(
        text: widget.list[widget.index]['nombre_1'].toString());

    controllerApellido1 = new TextEditingController(
        text: widget.list[widget.index]['apellido_1'].toString());

    controllerSaldoCuenta = new TextEditingController(
        text: widget.list[widget.index]['saldo_cuenta'].toString());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Form(
        child: ListView(
          padding: const EdgeInsets.all(10.0),
          children: [
            Column(
              children: [
                ListTile(
                  leading: const Icon(Icons.person, color: Colors.black),
                  title: new TextFormField(
                    controller: controllerId,
                    decoration: new InputDecoration(
                      hintText: "Codigo",
                      labelText: "Codigo",
                    ),
                  ),
                ),
                ListTile(
                  leading: const Icon(Icons.person, color: Colors.black),
                  title: new TextFormField(
                    controller: controllerNombre1,
                    decoration: new InputDecoration(
                      hintText: "Primer nombre",
                      labelText: "Primer nombre",
                    ),
                  ),
                ),
                ListTile(
                  leading: const Icon(Icons.person, color: Colors.black),
                  title: new TextFormField(
                    controller: controllerApellido1,
                    decoration: new InputDecoration(
                      hintText: "Primer apellido",
                      labelText: "Primer apellido",
                    ),
                  ),
                ),
                ListTile(
                  leading: const Icon(Icons.money, color: Colors.black),
                  title: new TextFormField(
                    controller: controllerSaldoCuenta,
                    decoration: new InputDecoration(
                      hintText: "Saldo Cuenta",
                      labelText: "Saldo Cuenta",
                    ),
                  ),
                ),
                const Divider(
                  height: 1.0,
                ),
                new Padding(padding: const EdgeInsets.all(10.0)),
                RaisedButton(
                    child: new Text("Editar"),
                    color: Colors.blueAccent,
                    onPressed: () {
                      dataBaseHelper.editCliente(
                        controllerId.text.trim(),
                        controllerNombre1.text.trim(),
                        controllerApellido1.text.trim(),
                        controllerSaldoCuenta.text.trim(),
                      );
                      _navigateList(context);
                    })
              ],
            )
          ],
        ),
      ),
    );
  }
}
