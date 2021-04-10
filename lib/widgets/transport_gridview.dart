import 'package:flutter/cupertino.dart';
import '../models/all_models.dart';

class  TransportGridView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return
        Expanded(
          child: SizedBox(height:MediaQuery.of(context).size.height*0.75,child: GridView.count(
            crossAxisCount: 2 ,
            padding: EdgeInsets.symmetric(horizontal: 20, ),
            children: List.generate(transports.length,(index){
              return Container(
                height: MediaQuery.of(context).size.height*0.2,
                width: MediaQuery.of(context).size.height*0.2,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20)),
                child: Image.network(transports[index].image, fit: BoxFit.cover,),
              );
            }),
          ),)
        );
  }
}

