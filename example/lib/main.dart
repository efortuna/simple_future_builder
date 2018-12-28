import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:simple_future_builder/simple_future_builder.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(body: Center(child: HttpResult())),
    );
  }
}

class HttpResult extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SimpleFutureBuilder<http.Response>(
        future: http.get('https://flutter.io/'),
        builder: (BuildContext context, http.Response result) =>
            Text('Response from pinging flutter.io: ${result.statusCode}'));
  }
}
