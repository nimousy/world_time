import 'package:flutter/material.dart';
import 'package:world_time/pages/loading.dart';


void main() => runApp(MaterialApp(
      initialRoute: '/',
      routes: {
        '/': (context) => const Loading(),
      },
    ));