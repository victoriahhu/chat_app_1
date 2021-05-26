import 'package:flutter/material.dart';

class DropDownSuper extends StatefulWidget {
  @override
  _DropDownSuperState createState() => _DropDownSuperState();
}

class _DropDownSuperState extends State<DropDownSuper> {
  String _chosenValue;

  @override
  Widget build(BuildContext context) {
    return
      Center(
        child: Container(
          padding: const EdgeInsets.all(0.0),
          child: DropdownButton<String>(dropdownColor: Colors.white,
            elevation: 10,
            value: _chosenValue,
            //elevation: 5,
            style: TextStyle(color: Colors.black),

            items: <String>[
              'Walmart',
              'Carrefour',
              'Aldi',
              'Lidl',
            ].map<DropdownMenuItem<String>>((String value) {
              return DropdownMenuItem<String>(
                value: value,
                child: Text(value),
              );
            }).toList(),
            hint: Text(
              "Choose your supermarket",
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 16,
                  fontWeight: FontWeight.w600),
            ),
            onChanged: (String value) {
              setState(() {
                _chosenValue = value;
              });
            },
          ),
        ),
      )
    ;
  }
}