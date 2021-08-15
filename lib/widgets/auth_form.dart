import 'dart:io';
import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import './user_image_picker.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';

class AuthForm extends StatefulWidget {
  AuthForm(
      this.submitFn,
      this.isLoading,
      );

  final bool isLoading;
  final void Function(
      String email,
      String password,
      String userName,
      String birth,
      String address,
      File image,
      bool isLogin,
      BuildContext ctx,
      ) submitFn;

  @override
  _AuthFormState createState() => _AuthFormState();
}

class _AuthFormState extends State<AuthForm> {
  final _formKey = GlobalKey<FormState>();
  var _isLogin = true;
  var _userEmail = '';
  var _userName = '';
  var _userPassword = '';
  var _userBirth = "";
  var _userAddress = "" ;
  File _userImageFile;

  void _pickedImage(File image) {
    _userImageFile = image;
  }

  void _trySubmit() {
    final isValid = _formKey.currentState.validate();
    FocusScope.of(context).unfocus();

    if (_userImageFile == null && !_isLogin) {
      Scaffold.of(context).showSnackBar(
        SnackBar(
          content: Text('Please pick an image.'),
          backgroundColor: Theme.of(context).errorColor,
        ),
      );
      return;
    }

    if (isValid) {
      _formKey.currentState.save();
      widget.submitFn(
        _userEmail.trim(),
        _userPassword.trim(),
        _userName.trim(),
        _userBirth.trim(),
        _userAddress.trim(),
        _userImageFile,
        _isLogin,
        context,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    String _date = "Date of Birth";

    Widget birthPicker = Padding(key: ValueKey("date_of_birth"),padding: EdgeInsets.only(
        top: 20.0, left: 10.0, right: 10.0),
      child: Column(
        children: <Widget>[
          SizedBox(
            height: 60.0,
            child: FlatButton(
              shape: RoundedRectangleBorder(
                  side: BorderSide(
                      color: Colors.blueAccent
                  ),
                  borderRadius: BorderRadius.circular(5.0)),
              onPressed: () {
                DatePicker.showDatePicker(context,
                    theme: DatePickerTheme(
                      containerHeight: 210.0,
                    ),
                    showTitleActions: true,
                    minTime: DateTime(1900, 1, 1),
                    maxTime: DateTime.now(),
                    onConfirm: (date) {
                      print('confirm $date');
                      _date = '${date.day}/${date.month}/${date.year}';
                      _userBirth=_date;
                      setState(() {});
                    },
                    currentTime: DateTime.now(),
                    locale: LocaleType.en);
              },
              child: Container(
                alignment: Alignment.center,
                height: 50.0,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Row(
                      children: <Widget>[
                        Container(

                          child: Row(
                            children: <Widget>[
                              Text("Date of birth  "),
                              Icon(
                                Icons.cake,

                                color: Colors.blueAccent,
                              ),
                              Text(
                                "  $_userBirth",
                                style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 17.0,
                                    fontStyle: FontStyle.normal),
                              ),
                            ],
                          ),
                        )
                      ],
                    ),

                  ],
                ),
              ),
              //color: Colors.white,
            ),
          ),
// datetime()
        ],
      ),
    );

    return Center(
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(17.0),
        ),
        margin: EdgeInsets.all(20),
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.all(16),
            child: Form(
              key: _formKey,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  if (!_isLogin) UserImagePicker(_pickedImage),
                  TextFormField(
                    key: ValueKey('email'),
                    autocorrect: false,
                    textCapitalization: TextCapitalization.none,
                    enableSuggestions: false,
                    validator: (value) {
                      if (value.isEmpty || !value.contains('@')) {
                        return 'Please enter a valid email address.';
                      }
                      return null;
                    },
                    keyboardType: TextInputType.emailAddress,
                    decoration: InputDecoration(
                      labelText: 'Email address',
                    ),
                    onSaved: (value) {
                      _userEmail = value;
                    },
                  ),
                  if (!_isLogin)
                    TextFormField(
                      key: ValueKey('username'),
                      autocorrect: true,
                      textCapitalization: TextCapitalization.words,
                      enableSuggestions: false,
                      validator: (value) {
                        if (value.isEmpty || value.length < 4) {
                          return 'Please enter at least 4 characters';
                        }
                        return null;
                      },
                      decoration: InputDecoration(labelText: 'Full name'),
                      onSaved: (value) {
                        _userName = value;
                      },
                    ),
                  TextFormField(
                    key: ValueKey('password'),
                    validator: (value) {
                      if (value.isEmpty || value.length < 7) {
                        return 'Password must be at least 7 characters long.';
                      }
                      return null;
                    },
                    decoration: InputDecoration(labelText: 'Password'),
                    obscureText: true,
                    onSaved: (value) {
                      _userPassword = value;
                    },
                  ),
                  !_isLogin?birthPicker: SizedBox(width: 0, height: 0,),
                  !_isLogin?TextFormField(
                    autocorrect: false,
                    key: ValueKey("address"),
                    validator: (value) {
                      if (value.isEmpty) {
                        return 'Your permanent address is required.';
                      }
                      return null;
                    },
                    decoration: InputDecoration(labelText: 'Permanent address', hintText: "street, city, state/province, zip/postal code"),
                    onSaved: (value) {
                      _userAddress = value;
                    },
                  ): SizedBox(height: 0, width: 0,),
                  SizedBox(height: 12),
                  if (widget.isLoading) CupertinoActivityIndicator(animating: true,),
                  if (!widget.isLoading)
                    CupertinoButton(color: Colors.blue[700],
                      child: Text(_isLogin ? 'Login' : 'Sign up',style: TextStyle(color: Colors.white),),
                      onPressed: _trySubmit,
                    ),
                  if (!widget.isLoading)
                    FlatButton(
                      textColor: Theme.of(context).primaryColor,
                      child: Text(_isLogin
                          ? 'Create new account'
                          : 'I already have an account'),
                      onPressed: () {
                        setState(() {
                          _isLogin = !_isLogin;
                        });
                      },
                    )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}