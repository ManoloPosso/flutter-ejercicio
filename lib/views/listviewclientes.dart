import 'dart:convert';
import 'dart:async';
import 'dart:math';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application/controllers/databasehelpers.dart';
import 'package:http/http.dart' as http;

import 'addclientepage.dart';
import 'detailpage.dart';

class ListUsers extends StatefulWidget {
  @override
  State<ListUsers> createState() => _ListUsersState();
}

class _ListUsersState extends State<ListUsers> {
  late List data;
  String apiEndpoint = 'http://localhost:8080/cliente/';

  Future<List> listarClientes() async {
    final Uri url = Uri.parse(apiEndpoint);

    final respuesta = await http.get(url);

    return json.decode(respuesta.body);
  }

  _navigateAddCliente(BuildContext context) async {
    final result = await Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const AddClientePage()),
    );

    if (result) {
      setState(() {});
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    this.listarClientes();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Lista Clientes'), actions: [
        RaisedButton(
          color: Colors.black12,
          child: Icon(Icons.add),
          onPressed: () => _navigateAddCliente(context),
        )
      ]),
      body: FutureBuilder<List?>(
        future: listarClientes(),
        builder: (context, snapshot) {
          if (snapshot.hasError) print(snapshot.error);
          return snapshot.hasData
              ? ItemList(
                  list: snapshot.data,
                )
              : Center(
                  child: CircularProgressIndicator(),
                );
        },
      ),
    );
  }
  // @override
  // void debugFillProperties(DiagnosticPropertiesBuilder properties) {
  //   super.debugFillProperties(properties);
  //   properties.add(IterableProperty<>('data', data));
  // }
}

class ItemList extends StatelessWidget {
  //const MyWidget({Key? key}) : super(key: key);

  final List? list;

  const ItemList({required this.list});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: list == null ? 0 : list?.length,
      itemBuilder: (context, i) {
        return Column(
          children: [
            Container(
                padding: EdgeInsets.all(10.0),
                child: GestureDetector(
                  onTap: () => Navigator.of(context).push(
                    MaterialPageRoute(
                        builder: (BuildContext context) =>
                            Detail(list: list!, index: i)),
                  ),
                  child: Container(
                    height: 150.0,
                    child: Card(
                      color: Colors
                          .primaries[Random().nextInt(Colors.primaries.length)],
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Row(
                              children: [
                                Container(
                                  child: Text(
                                    list![i]['nombre_1'].toString(),
                                    style: TextStyle(
                                        fontSize: 20.0, color: Colors.black87),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Row(
                              children: [
                                Container(
                                  child: Text(
                                    list![i]['apellido_1'].toString(),
                                    style: TextStyle(
                                        fontSize: 20.0, color: Colors.black87),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Row(
                              children: [
                                Container(
                                  child: Text(
                                    list![i]['saldo_cuenta'].toString(),
                                    style: TextStyle(
                                        fontSize: 20.0, color: Colors.black87),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ))
          ],
        );
      },
    );
  }
}
