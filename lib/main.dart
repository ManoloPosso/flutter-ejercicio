import 'package:flutter/material.dart';
import 'package:flutter_application/views/listviewclientes.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // return MaterialApp(
    //   title: 'Material App',
    //   home: Scaffold(
    //     appBar: AppBar(
    //       title: Text('Material App Bar'),
    //     ),
    //     body: Center(
    //       child: Container(
    //         child: Text('Hello World'),
    //       ),
    //     ),
    //   ),
    // );
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Prueba MP - Flutter',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: ListUsers(),
    );
  }
}
