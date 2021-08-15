import 'dart:math';

import 'package:chatapp/models/all_models.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter/material.dart';

class MyOrdersModel extends StatelessWidget {
  final String shopName;
  final String logoUrl;
  final List<Product> items;
  final double deliveryPrice;
  final double totalPrice;
  final String orderDate;
  final String deliveryDate;
  final String address;

  MyOrdersModel(this.shopName,this.logoUrl,this.items,this.deliveryPrice,this.totalPrice,this.orderDate,this.deliveryDate,this.address);

  @override
  Widget build(BuildContext context) {
    showMaterialDialog() {
      showDialog(
          context: context,
          builder: (_) => OrdersDetailPopup(shopName,logoUrl,items,deliveryPrice,totalPrice,orderDate,deliveryDate,address));
    }
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10.0),
      child: GestureDetector(
        onTap: () {

        },
        child: Container(
          //padding: EdgeInsets.symmetric(horizontal: 20),
            height: MediaQuery.of(context).size.height*0.2,
            decoration: BoxDecoration( boxShadow: [
              BoxShadow(
                color: Colors.grey[400].withOpacity(0.3),
                spreadRadius: 5,
                blurRadius: 7,
                offset: Offset(0, 3), // changes position of shadow
              ),
            ],
              borderRadius: BorderRadius.circular(23),
              color: Colors.white,
            ),
            child: Align(
                alignment: Alignment.center,
                child: Padding(
                  padding: EdgeInsets.only(left: 20.8, right: 20.8),
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        CircleAvatar(

                          radius: 40,
                          backgroundImage: NetworkImage(logoUrl),
                        ),
                        Column(
                            children: [
                              SizedBox(height: MediaQuery.of(context).size.height*0.06,),
                              Text(
                                shopName,
                                style: GoogleFonts.lato(
                                    fontSize: 15.2,
                                    fontWeight: FontWeight.w700,
                                    color: Colors.black),
                              ),
                              SizedBox(height: MediaQuery.of(context).size.height*0.04,),
                              SizedBox(width: MediaQuery.of(context).size.width*0.5,child: Text("ordered on $orderDate       to be delivered on $deliveryDate", style: GoogleFonts.lato(
                                  color: Colors.grey[800]), overflow: TextOverflow.ellipsis, maxLines: 3, textAlign: TextAlign.center,)),
                              SizedBox(height: MediaQuery.of(context).size.height*0.04,),
                            Text("See details",style: GoogleFonts.lato(
                                color: Colors.grey[800], fontWeight: FontWeight.bold),)]
                        ),]
                  ),))),
      ),
    );
  }
}

class OrdersDetailPopup extends StatelessWidget {
  final String shopName;
  final String logoUrl;
  final List<Product> items;
  final double deliveryPrice;
  final double totalPrice;
  final String orderDate;
  final String deliveryDate;
  final String address;

  OrdersDetailPopup(this.shopName,this.logoUrl,this.items,this.deliveryPrice,this.totalPrice,this.orderDate,this.deliveryDate,this.address);
  @override
  Widget build(BuildContext context) {
    final dialog= AlertDialog(scrollable: true,
      backgroundColor: Colors.white,
      elevation: 10,
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(20.0))),
      title: Row(
        children: [
          new Container(height: 30, width: 45, child: Image.network(logoUrl, fit: BoxFit.cover,),),
          SizedBox(width: 20,),
          new Text(shopName, textAlign: TextAlign.center,style: GoogleFonts.lato(
              fontWeight: FontWeight.w700,
              color: Colors.blueAccent,
              fontSize: 16.8),),
        ],
      ),
      content: Column(children: [ListView.builder(itemCount: items.length, itemBuilder: (ctx, i) => ListTile(
        tileColor: Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(17.0),
        ),
        title: Text(
          items[i].title,
          textAlign: TextAlign.center,
        ),
        leading: Container(
          child: Text("X ${items[i].numberItems}"),
        ),
        onTap: () {

        },
        trailing: Container(
          child: Text({items[i].price * items[i].numberItems}.toString()),
        ),
      )),SizedBox(height: 20,), Text("Delivery supplement: ${deliveryPrice.toString()} \$"), SizedBox(height: 20,), Text("Total price: ${totalPrice.toString()} \$"),
        SizedBox(height: 20,), Text("ordered on $orderDate       to be delivered on $deliveryDate at $address", style: GoogleFonts.lato(
            color: Colors.grey[800]), maxLines: 3,)],
      ),
    );
    return dialog;
  }
}
