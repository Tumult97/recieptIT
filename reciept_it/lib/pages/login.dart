import 'package:flutter/material.dart';
import 'package:reciept_it/components/bordered_transparent_input.dart';
import 'package:reciept_it/storage/logic/connection.dart';

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  String email;
  String password;

  @override
  Widget build(BuildContext context) {
    //Connection.OpenDatabase();
    return Container(
      decoration: BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.bottomCenter,
              end: Alignment.topRight,
              colors: [Color.fromRGBO(11, 35, 41, 1), Color.fromRGBO(22, 70, 82, 1)],
          )
      ),
      child: Scaffold(
        resizeToAvoidBottomInset: true,
        backgroundColor: Colors.transparent,
        body: Padding(
          padding: const EdgeInsets.fromLTRB(30, 20, 30, 20),
          child: Column(
            children: <Widget>[
              Expanded(
                flex: 6,
                child: Container(
                  color: Colors.transparent,
                  child: Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Center(
                      child: Placeholder(
                        fallbackWidth: double.infinity,
                      ),
                    ),
                  ),
                ),
              ),
              Expanded(
                flex: 5,
                child: Container(
                  color: Colors.transparent,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.fromLTRB(0, 0, 0, 10),
                        child: BorderedTransparentInput(
                          hintText: "Email",
                          mainColor: Colors.white70,
                          hintColor: Colors.white38,
                          keyboardType: TextInputType.emailAddress,
                          icon: Icon(Icons.email_outlined, color: Colors.white70,),
                          obscureText: false,
                          onChanged: (value) => {
                            setState(() {
                              email = value;
                            })
                          },
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(0, 0, 0, 20),
                        child: BorderedTransparentInput(
                          hintText: "Password",
                          mainColor: Colors.white70,
                          hintColor: Colors.white38,
                          keyboardType: TextInputType.visiblePassword,
                          icon: Icon(Icons.lock, color: Colors.white70,),
                          obscureText: true,
                          onChanged: (value) => {
                            setState(() {
                              password = value;
                            })
                          },
                        ),
                      ),
                      SizedBox(
                        width: double.infinity,
                        child: OutlineButton(
                          color: Colors.transparent,
                          textColor: Colors.white70,
                          highlightedBorderColor: Colors.white,
                          padding: EdgeInsets.all(8.0),
                          splashColor: Color.fromRGBO(22, 70, 82, 1),
                          highlightColor: Colors.white54,
                          borderSide: BorderSide(
                            color: Colors.white54
                          ),
                          onPressed: () {
                            login(context);
                          },
                          child: Text(
                            "LOGIN",
                            style: TextStyle(fontSize: 20.0),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void login(BuildContext context) {
    Navigator.pushReplacementNamed(context, "/ReceiptsList");
    //Navigator.pushReplacementNamed(context, "/Test");
  }
}
