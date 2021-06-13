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
  String? _startMeasure;
  String? _convertedMeasure;

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

  final TextStyle inputStyle = TextStyle(
    fontSize: 20,
    color: Colors.blue.shade900,
  );

  final TextStyle labelStyle = TextStyle(
    fontSize: 24,
    color: Colors.grey.shade700,
  );

  @override
  void initState() {
    _numberFrom = 0;
    _startMeasure = "meters";
    String? _convertedMeasure = "kilometers";
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
          body: Container(
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Spacer(),
                  Text(
                    "Value",
                    style: labelStyle,
                  ),
                  Spacer(),
                  TextField(
                    style: inputStyle,
                    decoration: InputDecoration(
                        hintText: "Please input measure to convert..."),
                    onChanged: (text) {
                      var rv = double.tryParse(text);
                      setState(() {
                        _numberFrom = rv;
                      });
                    },
                  ),
                  Spacer(),
                  Text(
                    "From",
                    style: labelStyle,
                  ),
                  Spacer(),
                  DropdownButton<String>(
                    isExpanded: true,
                    style: inputStyle,
                    items: _measures.map((String item) {
                      return DropdownMenuItem<String>(
                        value: item,
                        child: Text(
                          item,
                          style: inputStyle,
                        ),
                      );
                    }).toList(),
                    onChanged: (item) {
                      setState(() {
                        _startMeasure = item;
                      });
                    },
                    value: _startMeasure,
                  ),
                  Spacer(),
                  Text(
                    "To",
                    style: labelStyle,
                  ),
                  Spacer(),
                  DropdownButton<String>(
                    isExpanded: true,
                    items: _measures.map((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(
                          value,
                          style: inputStyle,
                        ),
                      );
                    }).toList(),
                    onChanged: (value) {
                      setState(() {
                        _convertedMeasure = value;
                      });
                    },
                    value: _convertedMeasure,
                  ),
                  Spacer(
                    flex: 2,
                  ),
                  ElevatedButton(
                    child: Text(
                      "Convert",
                      style: labelStyle,
                    ),
                    onPressed: () => {},
                  ),
                  Spacer(
                    flex: 2,
                  ),
                  Text(
                    (_numberFrom == null) ? '' : _numberFrom.toString(),
                    style: labelStyle,
                  ),
                ],
              ),
            ),
          )),
    );
  }
}
