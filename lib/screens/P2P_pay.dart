import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:local_auth/local_auth.dart';
import 'package:flutter_svg/flutter_svg.dart';

class P2PPay extends StatefulWidget {
  @override
  _P2PPayState createState() => _P2PPayState();
}


class _P2PPayState extends State<P2PPay> {

  _showCupertinoDialog() {
    showDialog(
        context: context,
        builder: (_) => new CupertinoAlertDialog(
          title: Container(child: Image.network("https://cdn2.iconfinder.com/data/icons/security-1/512/valid_fingerprint-512.png"), width: 50,),
          content: new Text("Payment accepted"),
          actions: <Widget>[
            FlatButton(
              child: Text('Close'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            )
          ],
        ));
  }

  LocalAuthentication auth = LocalAuthentication();
  bool _canCheckBiometric;
  List <BiometricType> _availableBiometrics;
  String authorized = "Not authorized";


  Future <void> _checkBiometric() async {
    bool canCheckBiometric;
    try {
      canCheckBiometric = await auth.canCheckBiometrics;
    }
    on PlatformException catch (e) {
      print(e);
    }
    if (!mounted) return;
    setState(() {
      _canCheckBiometric = canCheckBiometric;
    });
  }

  Future<void> _getAvailableBiometric() async {
    List<BiometricType> availableBiometric;
    try {
      availableBiometric = await auth.getAvailableBiometrics();
    }
    on PlatformException catch (e) {
      print(e);
    }
    setState(() {
      _availableBiometrics = availableBiometric;
    });
  }

  Future<void> _authenticate() async {
    bool authenticated = false;
    try {
      authenticated = await auth.authenticateWithBiometrics(
          localizedReason: "Scan your finger to deliver payment", useErrorDialogs: true, stickyAuth: false);
    }
    on PlatformException catch (e){
      print(e);
    }
    if (!mounted) return;
    setState(() {
      authorized=authenticated? "Payment accepted":"Authentication failed";
      if(authenticated){
        _showCupertinoDialog();
      }
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    _checkBiometric();
    _getAvailableBiometric();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        //backgroundColor: Color(0xFF3C3E52),
        body: Padding(
          padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 24),
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Container(
                  height: 57.6,
                  margin: EdgeInsets.only(top: 28.8, left: 28.8, right: 28.8),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Container(
                        height: 57.6,
                        width: 57.6,
                        padding: EdgeInsets.all(18),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(9.6),
                          color: Color(0x080a0928),
                        ),
                        child: GestureDetector(
                          child: SvgPicture.asset(
                            'assets/svg/icon_left_arrow.svg',
                            color: Colors.grey,
                          ),
                          onTap: () {
                            Navigator.of(context).pop();
                          },
                        ),
                      ),
                      Container(
                      )
                    ],
                  ),
                ),
                Container(
                  margin: EdgeInsets.symmetric(vertical: 50),
                  child: Column(
                    children: <Widget>[
                      Image.network(
                        "https://www.techprosecurity.com/wp-content/uploads/2017/12/Access-Control-Security-Systems-Icon3.png",
                        width: 120,
                      ),
                      Text(
                        "Touch ID",
                        style: TextStyle(
                            color: Color(0xFF3C3E52),
                            fontSize: 22,
                            fontWeight: FontWeight.bold),
                      ),
                      Container(
                        margin: EdgeInsets.symmetric(vertical: 15),
                        width: 150,
                        child: TextButton(
                          child: Text(
                            "Use password instead",
                            textAlign: TextAlign.center,
                            style: TextStyle(color: Colors.grey, height: 1.5),
                          ),
                          onPressed: () {},
                        ),
                      ),
                      Padding(padding: EdgeInsets.all(10), child: Row(mainAxisAlignment: MainAxisAlignment.center, children: [Container(
                        width: 50,
                        child: TextFormField(
                          inputFormatters: [
                            new LengthLimitingTextInputFormatter(3),
                          ],
                            //controller: _controller,
                            decoration: new InputDecoration(
                                fillColor: Colors.white,
                                border: new OutlineInputBorder(
                                  borderRadius: new BorderRadius.circular(25.0),
                                )),keyboardType: TextInputType.number,),
                      ),Text("  .  ", style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),), Container(
                        width: 50,
                        child: TextFormField(
                          inputFormatters: [
                            new LengthLimitingTextInputFormatter(2),
                          ],
                          //controller: _controller,
                          decoration: new InputDecoration(
                              fillColor: Colors.white,
                              border: new OutlineInputBorder(
                                borderRadius: new BorderRadius.circular(25.0),
                              )),keyboardType: TextInputType.number,),
                      ),
                      Text("   €", style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold))
                      ],),),
                      Container(
                        height: MediaQuery.of(context).size.height*0.15,
                        width: MediaQuery.of(context).size.width*0.6,
                        padding: EdgeInsets.symmetric( vertical: 20),
                        child: CupertinoButton(onPressed: _authenticate,
                          color: Colors.blue,
                               child: Text(
                              "Transfer", style: TextStyle(color: Colors.white),),),)
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}


