import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter/services.dart';

class ApplyNewLoan extends StatefulWidget {
  const ApplyNewLoan({Key? key}) : super(key: key);

  @override
  _homeState createState() => _homeState();
}

class _homeState extends State<ApplyNewLoan> {
  TextEditingController _nameController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
          child: Column(children: [
        Row(mainAxisAlignment: MainAxisAlignment.start, children: [
          Text("Customer Name: ",
              style: TextStyle(fontSize: 20, color: Colors.black)),
          Text("customer_name"),
        ]),
        /*Row(mainAxisAlignment: MainAxisAlignment.start, children: [
          Text("Request Loan Amount:",
              style: TextStyle(fontSize: 20, color: Colors.black))
        ]),*/
        SizedBox(
          height: 16,
        ),
        TextField(
            controller: _nameController,
            decoration: InputDecoration(
                hintText: "Loan Amount",
                labelText: "Request Loan Amount:",
                errorText: "Maximum loan request is \$9999",
                labelStyle: TextStyle(fontSize: 24, color: Colors.black),
                errorStyle: TextStyle(fontSize: 14, color: Colors.black),
                fillColor: Colors.grey,
                filled: true,
                prefixText: "\$ "),
            keyboardType: TextInputType.number,
            inputFormatters: <TextInputFormatter>[
              FilteringTextInputFormatter.digitsOnly,
              LengthLimitingTextInputFormatter(4)
            ],
            style: TextStyle(fontSize: 30, color: Colors.black)),
        RaisedButton(
            onPressed: () {
              print(_nameController.text);
            },
            color: Colors.red,
            textColor: Colors.white,
            child: Row(
              children: <Widget>[Text('Confirm Amount')],
            ))
      ])),
    );
  }
}
