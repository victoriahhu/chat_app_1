import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HelpPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var _controller = TextEditingController();
    return GestureDetector(
        onTap: (){FocusScopeNode currentFocus = FocusScope.of(context);

        if (!currentFocus.hasPrimaryFocus) {
          currentFocus.unfocus();
        }}, child: Scaffold(
      appBar: AppBar(
        title: Text(
          "Frequently asked questions",
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.grey[400],
      ),
      body: Column(children: [
          Padding(
            padding: EdgeInsets.all(20),
            child: TextFormField(
                controller: _controller,
              maxLines: 5,
                decoration: new InputDecoration(
                    labelText: "Send your concerns...",
                    fillColor: Colors.white,
                    border: new OutlineInputBorder(
                      borderRadius: new BorderRadius.circular(25.0),
                    ))),
          ),
          ElevatedButton.icon(
            style: ElevatedButton.styleFrom(
              alignment: Alignment.center,
                primary: Colors.blue,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20))),
            onPressed: _controller.clear,
            icon: Icon(
              Icons.send,
              color: Colors.white,
            ),
            label: Text("Send", style: TextStyle(color: Colors.white),),
          )
        ]),
    ));
  }
}
