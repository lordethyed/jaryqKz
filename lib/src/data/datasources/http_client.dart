import 'dart:io';

import 'package:http/http.dart' as http;
import 'package:http/io_client.dart' as http_io;

class MyHttpClient {
  Future<http.Response> get(String url) async {
    final client = http_io.IOClient(
      HttpClient()..badCertificateCallback = (cert, host, port) => true,
    );
    final response = await client.get(Uri.parse(url));
    client.close();
    return response;
  }

  Future<http.Response> post(String url,
      {Map<String, String>? headers, dynamic body}) async {
    final client = http_io.IOClient(
      HttpClient()..badCertificateCallback = (cert, host, port) => true,
    );
    final response =
        await client.post(Uri.parse(url), headers: headers, body: body);
    client.close();
    return response;
  }
}


class MyHttpOverrides extends HttpOverrides{
  @override
  HttpClient createHttpClient(SecurityContext? context){
    return super.createHttpClient(context)
      ..badCertificateCallback = (X509Certificate cert, String host, int port)=> true;
  }
}
