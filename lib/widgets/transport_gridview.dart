import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../models/all_models.dart';

class  TransportGridView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return
        Expanded(
          child: SizedBox(height:110,child: GridView.count(
            crossAxisCount: 3 ,
            padding: EdgeInsets.symmetric(horizontal: 20, ),
            children: List.generate(transports.length,(index){
              return Container(
                //color: Colors.white,
                height: 20,
                width: 20,
                decoration: BoxDecoration(
                  color: Colors.white,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey[600].withOpacity(0.3),
                        spreadRadius: 5,
                        blurRadius: 7,
                        offset: Offset(0, 3), // changes position of shadow
                      ),
                    ],
                    borderRadius: BorderRadius.circular(20)),
                child: Image.network(transports[index].image, fit: BoxFit.cover,),
              );
            }),
          ),)
        );
  }
}

