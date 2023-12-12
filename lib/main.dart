import 'package:flutter/material.dart';
import 'package:h/model.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

typedef StringDynamicMap = Map<String, dynamic>;

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  final DbHelper d = new DbHelper();
  StringDynamicMap row = {'ID': 3, 'NAME': 'dhairyaddd'};
  StringDynamicMap row1 = {'ID': 3, 'NAME': 'dhairdvdvvyaddd'};

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              ElevatedButton(
                onPressed: () {
                  d.initdb();
                },
                child: Text('create'),
              ),
              ElevatedButton(
                onPressed: () async {
                  var x = await d.read();
                  print(x);
                },
                child: Text('Read'),
              ),
              ElevatedButton(
                onPressed: () async {
                  d.update(1, row1);
                },
                child: Text('Update'),
              ),
              ElevatedButton(
                onPressed: () async {
                  d.delete(1);
                },
                child: Text('Delete'),
              ),
              ElevatedButton(
                  onPressed: () {
                    d.insert(row);
                  },
                  child: Text('insert'))
            ],
          ),
        ),
      ),
    );
  }
}
