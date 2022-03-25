import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:hackathon/applyNewLoan.dart';
import 'package:hackathon/payLoan.dart';
import 'ColorConstants.dart' as colourconstants;
import 'loginPage.dart';
import 'package:http/http.dart';

class home extends StatefulWidget {
  const home({Key? key}) : super(key: key);

  @override
  _homeState createState() => _homeState();
}

class _homeState extends State<home> {
  @override
  Widget build(BuildContext context) {
    var customer = [
      {
        'CustomerId': "1",
        'customer_name': "Farrah Dobbie",
        'customer_phone': "3688961901",
        'customer_address': "49862 Kingsford Junction",
        'balance': "69687.54"
      }
    ];
    var customerLoan = [
      {'CustomerLoanId': "7", 'CustomerId': "1", 'LoanId': "1"}
    ];
    var paymentLeft = [
      {
        'PaymentId': "1",
        'LoanId': "1",
        'payment_date': "2022-02-20",
        'payment_amount': "35532.99"
      }
    ];
    var loansHistory = [
      {'LoanId': "1", "loan_amount": "135532.99"},
      {'LoanId': "2", "loan_amount": "34367.53"}
    ];
    final Map<String, dynamic> response = {
      'CustomerId': "1",
      'customer_name': "Farrah Dobbie",
      'customer_phone': "3688961901",
      'customer_address': "49862 Kingsford Junction",
      'balance': "69687.54"
    };

    final rows = <TableRow>[];

    return Scaffold(
      body: SingleChildScrollView(
          child: Column(children: [
        Row(
          children: [
            Expanded(
              child: RaisedButton(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20.0),
                    side: BorderSide(color: Colors.transparent)),
                color: colourconstants.customerPayColor,
                child: Text(
                  "Apply New Loan",
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                      fontSize: 14),
                ),
                onPressed: () {
                  Navigator.pushReplacement(context,
                      MaterialPageRoute(builder: (context) => ApplyNewLoan()));
                },
                //handleSignInButtonPressed(authBlock);
              ),
            ),
          ],
        ),
        Row(mainAxisAlignment: MainAxisAlignment.start, children: [
          Text("Welcome " + response['customer_name'].toString() + ",",
              style: TextStyle(fontSize: 20, color: Colors.black))
        ]),
        Row(mainAxisAlignment: MainAxisAlignment.start, children: [
          Text("Current Account Balance: \$" + response['balance'],
              style: TextStyle(fontSize: 20, color: Colors.black))
        ]),
        SizedBox(
          height: 20.0,
        ),
        Row(mainAxisAlignment: MainAxisAlignment.start, children: [
          Text("Current Loans ",
              style: TextStyle(fontSize: 20, color: Colors.black))
        ]),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Table(border: TableBorder.all(color: Colors.black), columnWidths: {
              0: FixedColumnWidth(100.0),
              1: FixedColumnWidth(100.0)
            }, children: [
              TableRow(children: [
                Text('Loan ID',
                    textAlign: TextAlign.center,
                    style: TextStyle(fontWeight: FontWeight.bold)),
                Text('Remaining Loan Amount \$',
                    textAlign: TextAlign.center,
                    style: TextStyle(fontWeight: FontWeight.bold)),
              ]),
              for (var item in paymentLeft)
                TableRow(children: [
                  RichText(
                    textAlign: TextAlign.center,
                    text: TextSpan(children: <TextSpan>[
                      TextSpan(
                          text: item['LoanId'].toString(),
                          style: TextStyle(
                            fontSize: 16,
                            color: Colors.blue,
                            decoration: TextDecoration.underline,
                          ),
                          recognizer: TapGestureRecognizer()
                            ..onTap = () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => payLoan(
                                          LoanId: item['LoanId'].toString(),
                                          LoanAmount:
                                              item['payment_amount'].toString(),
                                          CustomerName:
                                              response['customer_name']
                                                  .toString(),
                                          CustomerBalance:
                                              response['balance'].toString())));
                            }),
                    ]),
                  ),
                  RichText(
                    textAlign: TextAlign.center,
                    text: TextSpan(children: <TextSpan>[
                      TextSpan(
                        text: " \$" + item['payment_amount'].toString(),
                        style: TextStyle(
                          fontSize: 16,
                          color: Colors.black,
                        ),
                      ),
                    ]),
                  ),
                ])
            ]),
          ],
        ),
        Row(children: [
          Text("Loan History",
              style: TextStyle(fontSize: 20, color: Colors.black))
        ]),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Table(border: TableBorder.all(color: Colors.black), columnWidths: {
              0: FixedColumnWidth(100.0),
              1: FixedColumnWidth(100.0)
            }, children: [
              TableRow(children: [
                Text('Loan ID',
                    textAlign: TextAlign.center,
                    style: TextStyle(fontWeight: FontWeight.bold)),
                Text('Loan Amount \$',
                    textAlign: TextAlign.center,
                    style: TextStyle(fontWeight: FontWeight.bold)),
              ]),
              for (var item in loansHistory)
                TableRow(children: [
                  RichText(
                    textAlign: TextAlign.center,
                    text: TextSpan(children: <TextSpan>[
                      TextSpan(
                          text: item['LoanId'].toString(),
                          style: TextStyle(
                            fontSize: 16,
                            color: Colors.blue,
                            decoration: TextDecoration.underline,
                          ),
                          recognizer: TapGestureRecognizer()
                            ..onTap = () {
                              Navigator.pushReplacement(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => loginPage()));
                            }),
                    ]),
                  ),
                  RichText(
                    textAlign: TextAlign.center,
                    text: TextSpan(children: <TextSpan>[
                      TextSpan(
                        text: " \$" + item['loan_amount'].toString(),
                        style: TextStyle(
                          fontSize: 16,
                          color: Colors.black,
                        ),
                      ),
                    ]),
                  ),
                ])
            ]),
          ],
        )
      ])),
    );
  }
}
