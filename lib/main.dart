import 'package:flutter/material.dart';

///flutter run --flavor staging --dart-define=APP_FLAVOR=staging
///use this for run the project

void main() {
  var flavor = const String.fromEnvironment('APP_FLAVOR', defaultValue: 'dev');

  runApp(MyApp(flavor: flavor));
}

class MyApp extends StatelessWidget {
  final String flavor;

  MyApp({required this.flavor});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Flavor Example'),
        ),
        body: Center(
          child: Text(
            'API Endpoint: ${getApiEndpoint()}',
            style: const TextStyle(fontSize: 20),
          ),
        ),
      ),
    );
  }

  String getApiEndpoint() {
    switch (flavor) {
      case 'dev':
        return 'Dev Environment: ${const String.fromEnvironment('API_ENDPOINT')}';
      case 'staging':
        return 'Staging Environment: ${const String.fromEnvironment('API_ENDPOINT')}';
      case 'production':
        return 'Production Environment: ${const String.fromEnvironment('API_ENDPOINT')}';
      default:
        return 'Unknown Flavor';
    }
  }
}
