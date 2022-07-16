import "package:flutter/material.dart";

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Material(
        color: Colors.blue,
        child: Center(
          child: Container(
            child: Text(
              "Wellcome to Flutter",
              style: TextStyle(color: Colors.green, fontSize: 35),
            ),
          ),
        ),
      ),
    );
  }
}
