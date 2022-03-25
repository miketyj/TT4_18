import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class home extends StatefulWidget {
  const home({Key? key}) : super(key: key);

  @override
  _homeState createState() => _homeState();
}

class _homeState extends State<home> {
  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      body: SingleChildScrollView(
          child: Column(
            children:[
              Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                        "Current Account Balance: ",style: TextStyle(fontSize: 20, color: Colors.black)

                    ),
                    Text("Input Account Balance"),

                  ]
              ),
              Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                        "Current Loans ",style: TextStyle(fontSize: 20, color: Colors.black)

                    )
                  ]

              ),
              Row(
                  children: [
                    RichText(
                      text: TextSpan(children: <TextSpan>[
                        TextSpan(
                            text: "Loan ID",
                            style: TextStyle(
                                fontSize: 16,
                                color: Colors.blue,
                                decoration: TextDecoration.underline,
                                ),
                            recognizer: TapGestureRecognizer()
                              ..onTap = () {

                              }),

                        TextSpan(
                          text: " \$ Payment Left",
                          style: TextStyle(

                              fontSize: 16,
                              color: Colors.black,
                              ),
                        ),

                      ]),
                    ),
                  ]
              ),
              Row(
                  children: [
                    Text(
                        "Loan History",style: TextStyle(fontSize: 20, color: Colors.black)

                    )
                  ]
              ),
              Row(
                  children: [
                    RichText(
                      text: TextSpan(children: <TextSpan>[
                        TextSpan(
                            text: "Loan ID",
                            style: TextStyle(
                              fontSize: 16,
                              color: Colors.blue,
                              decoration: TextDecoration.underline,
                            ),
                            recognizer: TapGestureRecognizer()
                              ..onTap = () {

                              }),

                        TextSpan(
                          text: " \$ Loan Amount",
                          style: TextStyle(

                            fontSize: 16,
                            color: Colors.black,
                          ),
                        ),

                      ]),
                    ),
                  ]
              ),


            ]
          )
      ),
    );
  }
}
