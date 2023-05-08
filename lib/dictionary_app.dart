import 'package:flutter/material.dart';

import 'dictionary_home.dart';

class DictionaryApp extends StatelessWidget {
  const DictionaryApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Dictionary App',
      theme: ThemeData(primarySwatch: Colors.amber),
      home: const DictionaryHome(),
    );
  }
}
