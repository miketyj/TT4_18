import 'package:flutter/material.dart';
import 'ColorConstants.dart' as colourconstants;
import 'home.dart';
class payLoan extends StatefulWidget {
  String LoanId;
  String LoanAmount;
  String CustomerName;
  String CustomerBalance;
  payLoan({required this.LoanId, required this.LoanAmount, required this.CustomerName, required this.CustomerBalance});

  @override
  _payLoanState createState() => _payLoanState();
}

class _payLoanState extends State<payLoan> {
  final RepayTextController = TextEditingController();
  static final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  TextStyle errorStyle = TextStyle(
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
  ]);
  @override
  Widget build(BuildContext context) {
    return Scaffold(body: SingleChildScrollView(child: Column(
        children: [
          Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text("Welcome "+widget.CustomerName.toString()+",",style: TextStyle(fontSize: 20, color: Colors.black))
              ]
          ),
          SizedBox(
            height: 20.0,
          ),
          Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                    "Current Account Balance: \$" + widget.CustomerBalance,style: TextStyle(fontSize: 20, color: Colors.black)

                )

              ]
          ),
          SizedBox(
            height: 20.0,
          ),
          Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text("Current Remaining Loan Amount: \$"+widget.LoanAmount.toString(),style: TextStyle(fontSize: 20, color: Colors.black))
              ]

          ),
          SizedBox(
            height: 20.0,
          ),
          Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
           
                
                Expanded(
                  child: TextFormField(
                    key:formKey,
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    validator: (value){

                      if(double.tryParse(value!)! > double.parse(widget.CustomerBalance))
                        {
                            return "Your account balance is lower than repayment amount";
                        }
                      else
                        {
                          return null;
                        }

                    },
                    controller: RepayTextController,
                    decoration: new InputDecoration(
                        errorStyle: errorStyle,
                        prefixIcon: Icon(Icons.attach_money),
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
                        hintText: "Repay Amount",
                        fillColor: Colors.white70),
                  ),
                ),
              ]
          ),
          SizedBox(
            height: 20.0,
          ),
          Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Expanded(
                  child: RaisedButton(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20.0),
                        side: BorderSide(color: Colors.transparent)),
                    color: colourconstants.topBarColorCustomer,
                    child: Text(
                      "Cancel",
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                          fontSize: 14),
                    ),
                    onPressed: () async {
                      Navigator.pushReplacement(context,
                          MaterialPageRoute(builder: (context) => home()));
                    },
                    //handleSignInButtonPressed(authBlock);
                  ),
                ),
                Expanded(
                  child: RaisedButton(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20.0),
                        side: BorderSide(color: Colors.transparent)),
                    color: colourconstants.customerPayColor,
                    child: Text(
                      "Repay",
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                          fontSize: 14),
                    ),
                    onPressed: () async {

                    },
                    //handleSignInButtonPressed(authBlock);
                  ),
                ),

              ]

          )

          ]
    )
    )
    );
  }

}

