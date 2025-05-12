import 'package:http/http.dart' as http;
import 'dart:convert';

class DataBaseHelper {
  //Crear cliente
  Future<http.Response> addCliente(
      String nombre1Controller,
      String apellido1Controller,
      String saldocuentaController,
      String identificacion) async {
    var apiEndpoint = 'http://localhost:8080/cliente/';

    final Uri url = Uri.parse(apiEndpoint);

    Map data = {
      'identificacion': '$identificacion',
      'nombre_1': '$nombre1Controller',
      'apellido_1': '$apellido1Controller',
      'saldo_cuenta': '$saldocuentaController'
    };

    var body = jsonEncode(data);

    var response = await http.post(url,
        headers: {"Content-Type": "application/json"}, body: body);

    print("${response.statusCode}");
    print("${response.body}");
    return response;
  }

  //Actualizar Cliente
  Future<http.Response> editCliente(String id, String nombre1Controller,
      String apellido1Controller, String saldocuentaController) async {
    int a = int.parse(id);

    print(a);
    var apiEndpoint = 'http://localhost:8080/cliente/';

    final Uri url = Uri.parse(apiEndpoint);

    Map data = {
      'id': '$a',
      'nombre_1': '$nombre1Controller',
      'apellido_1': '$apellido1Controller',
      'saldo_cuenta': '$saldocuentaController'
    };

    var body = json.encode(data);

    var response = await http.post(url,
        headers: {"Content-Type": "application/json"}, body: body);
    print("${response.statusCode}");
    print("${response.body}");
    return response;
  }

  Future<http.Response> eliminarRegistro(String id) async {
    int a = int.parse(id);
    print(a);

    var apiEndpoint = 'http://localhost:8080/cliente/$a';

    final Uri url = Uri.parse(apiEndpoint);

    var response =
        await http.delete(url, headers: {"Content-Type": "application/json"});
    print("${response.statusCode}");
    return response;
  }
}
