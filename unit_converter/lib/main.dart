import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  MyAppState createState() => MyAppState();
}

class MyAppState extends State<MyApp> {
  double? _numberFrom;
  final List<String> _measures = [
    'meters',
    'kilometers',
    'grams',
    'kilograms',
    'feet',
    'miles',
    'pounds (lbs)',
    'ounces',
  ];

  @override
  void initState() {
    _numberFrom = 0;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Measure Converter",
      home: Scaffold(
        appBar: AppBar(
          title: const Text("Measure Converter"),
        ),
        body: Center(
          child: Column(
            children: [
              DropdownButton<String>(
                  items: _measures.map((String value){
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    );
                  }).toList(),
                onChanged: (_)=>{},
              ),
              TextField(
                style: TextStyle(fontSize: 28, color: Colors.black87),
                onChanged: (text) {
                  var rv = double.tryParse(text);
                  setState(() {
                    _numberFrom = rv;
                  });
                },
              ),
              Text((_numberFrom == null) ? '' : _numberFrom.toString())
            ],
          ),
        ),
      ),
    );
  }
}
