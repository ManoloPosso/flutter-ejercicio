import 'package:flutter/material.dart';
import 'package:flutter_application/controllers/databasehelpers.dart';
import 'package:flutter_application/views/editclientespage.dart';
import 'package:flutter_application/views/listviewclientes.dart';

class Detail extends StatefulWidget {
  final List list;
  final int index;

  const Detail({required this.index, required this.list});

  @override
  State<Detail> createState() => _DetailState();
}

class _DetailState extends State<Detail> {
  DataBaseHelper dataBaseHelper = DataBaseHelper();

  _navigateList(BuildContext context) async {
    final result = await Navigator.push(
        context, MaterialPageRoute(builder: (context) => ListUsers()));
    if (result) {
      setState(() {});
    }
  }

  void confirm() {
    AlertDialog alertDialog = AlertDialog(
      content:
          Text("Está seguro de eliminar '${widget.list[widget.index]['id']}'"),
      actions: <Widget>[
        RaisedButton(
          child: Text(
            "OK!",
            style: TextStyle(color: Colors.black),
          ),
          color: Colors.red,
          onPressed: () {
            dataBaseHelper
                .eliminarRegistro(widget.list[widget.index]['id'].toString());
            _navigateList(context);
          },
        ),
        RaisedButton(
          child: Text("CANCELAR", style: TextStyle(color: Colors.black)),
          color: Colors.green,
          onPressed: () => Navigator.pop(context),
        ),
      ],
    );

    showDialog(builder: (context) => alertDialog, context: context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: 270.0,
        padding: const EdgeInsets.all(20.0),
        child: Card(
          child: Center(
            child: Column(
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.only(top: 30.0),
                ),
                Text(
                  widget.list[widget.index]['nombre_1'],
                  style: TextStyle(fontSize: 20.0),
                ),
                Divider(),
                // Padding(
                //   padding: const EdgeInsets.only(top: 30.0),
                // ),
                Text(
                  widget.list[widget.index]['apellido_1'],
                  style: TextStyle(fontSize: 20.0),
                ),
                new Padding(
                  padding: const EdgeInsets.only(top: 30.0),
                ),
                Row(
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    RaisedButton(
                      child: Text("Editar"),
                      color: Colors.blueAccent,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30.0)),
                      onPressed: () => Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) => EditarClientesPage(
                            list: widget.list,
                            index: widget.index,
                          ),
                        ),
                      ),
                      // VerticalDivider(),
                      // RaisedButton(
                      //   child: Text("Eliminar"),
                      //   color: Colors.redAccent,
                      //   shape: RoundedRectangleBorder(
                      //       borderRadius: BorderRadius.circular(30.0)),
                      //   onPressed: () => confirm(),
                      // ),
                    ),
                  ],
                ),
                RaisedButton(
                  child: Text("Eliminar"),
                  color: Colors.redAccent,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30.0)),
                  onPressed: () => confirm(),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
