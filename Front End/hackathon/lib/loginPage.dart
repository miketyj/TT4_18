import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'ColorConstants.dart' as colourconstants;
import 'home.dart';
class loginPage extends StatefulWidget {
  const loginPage({Key? key}) : super(key: key);

  @override
  _loginPageState createState() => _loginPageState();
}

class _loginPageState extends State<loginPage> {
  GlobalKey<FormState> formKeyLogin = GlobalKey<FormState>();
  final emailTextController = TextEditingController();
  final passwordTextController = TextEditingController();
  bool loadingUser = false;
  bool sign = false;
  bool emailVerified=false;


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //backgroundColor: Colors.redAccent,
      body: SingleChildScrollView(
        //just to make view scroll when keyboard shows up
        child: Stack(
          children: [
            backgroundLayer(),
            middleLayer(),
            //emailVerifiedLayer(),
          ],
        ),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );

  }
  Widget backgroundLayer() {
    TextStyle titleStyle = TextStyle(
        fontStyle: FontStyle.italic,
        fontWeight: FontWeight.bold,
        fontSize: 60,
        color: Colors.black);
    return Stack(
      children: [
        /*Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          //constraints: BoxConstraints.expand(),
          decoration: BoxDecoration(
            image: DecorationImage(
              fit: BoxFit.cover,
              image: Image.asset(
                'assets/LoginBG.jpg',
              ).image,
            ),
          ),
        ),*/
        Opacity(
          opacity: 0.85,
          child: Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: [
                    Colors.red,
                    Colors.blue,
                  ]),
            ),
          ),
        ),
        Container(
          child: Padding(
            padding: EdgeInsets.fromLTRB(30, 60, 30, 0),
            child: Center(
              child: Text(
                "Loan Management System",
                style: titleStyle,
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget middleLayer() {
    return loadingUser
        ? Container(
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width,
      child: Center(
        child: CircularProgressIndicator(
          backgroundColor: Colors.white,
        ),
      ),
    )
        : Column(
      mainAxisSize: MainAxisSize.max,
      children: [
        SizedBox(
          height: MediaQuery.of(context).size.height * 0.22,
        ),
        Container(
          height: MediaQuery.of(context).size.height * 0.80,
          child: Padding(
            padding: EdgeInsets.all(40),
            child: Card(
              shadowColor: Colors.transparent,
              color: Colors.transparent,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
              ),
              elevation: 6,
              child: Center(
                child: formGroup(),
              ),
            ),
          ),
        )
      ],
    );
  }

  Widget formGroup() {
    return Container(
      padding: EdgeInsets.fromLTRB(15, 15, 15, 0),
      child: Form(
        key: formKeyLogin,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SizedBox(
              height: 10,
            ),
            TextFormField(
              autovalidateMode: AutovalidateMode.onUserInteraction,
              keyboardType: TextInputType.emailAddress,
              controller: emailTextController,
              decoration: new InputDecoration(
                  errorStyle: TextStyle(
                      color: Colors.red,
                      fontWeight: FontWeight.bold,
                      fontSize: 14,
                      shadows: [
                        Shadow(
                          // bottomLeft
                            offset: Offset(-1.5, -1.5),
                            color: Colors.black),
                        Shadow(
                          // bottomRight
                            offset: Offset(1.5, -1.5),
                            color: Colors.black),
                        Shadow(
                          // topRight
                            offset: Offset(1.5, 1.5),
                            color: Colors.black),
                        Shadow(
                          // topLeft
                            offset: Offset(-1.5, 1.5),
                            color: Colors.black),
                      ]),
                  prefixIcon: Icon(Icons.email),
                  enabledBorder: new OutlineInputBorder(
                    borderSide:
                    BorderSide(color: Colors.transparent, width: 0.0),
                    borderRadius: const BorderRadius.all(
                      const Radius.circular(12.0),
                    ),
                  ),
                  border: new OutlineInputBorder(
                    borderSide:
                    BorderSide(color: Colors.transparent, width: 0.0),
                    borderRadius: const BorderRadius.all(
                      const Radius.circular(12.0),
                    ),
                  ),
                  filled: true,
                  hintStyle: new TextStyle(
                      color: Colors.grey[600], fontWeight: FontWeight.bold),
                  hintText: "Email Address",
                  fillColor: Colors.white70),
            ),
            SizedBox(
              height: 10,
            ),
            TextFormField(
              obscureText: true,
              controller: passwordTextController,
              decoration: new InputDecoration(
                  prefixIcon: Icon(Icons.lock),
                  enabledBorder: new OutlineInputBorder(
                    borderSide:
                    BorderSide(color: Colors.transparent, width: 0.0),
                    borderRadius: const BorderRadius.all(
                      const Radius.circular(12.0),
                    ),
                  ),
                  border: new OutlineInputBorder(
                    borderSide:
                    BorderSide(color: Colors.transparent, width: 0.0),
                    borderRadius: const BorderRadius.all(
                      const Radius.circular(12.0),
                    ),
                  ),
                  filled: true,
                  hintStyle: new TextStyle(
                      color: Colors.grey[600], fontWeight: FontWeight.bold),
                  hintText: "Password",
                  fillColor: Colors.white70),
            ),
            SizedBox(
              height: 15,
            ),
            Container(
              width: MediaQuery.of(context).size.width * 0.5,
              height: MediaQuery.of(context).size.height * 0.06,
              child: RaisedButton(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20.0),
                    side: BorderSide(color: Colors.transparent)),
                color: colourconstants.loginButtonColor,
                child: Text(
                  "Sign In",
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                      fontSize: 14),
                ),
                onPressed: () async {


                  Navigator.pushReplacement(context,
                      MaterialPageRoute(builder: (context) => home()));




                },
              ),
            ),
            SizedBox(
              height: 20,
            ),

          ],
        ),
      ),
    );
  }
}
