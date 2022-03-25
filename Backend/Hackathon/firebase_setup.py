import firebase_admin
from firebase_admin import credentials
from firebase_admin import firestore
import json

# Use a service account
cred = credentials.Certificate('/home/kali/Desktop/TT4_18/Backend/Hackathon/firebase.json')
firebase_admin.initialize_app(cred)
print("app init")
db = firestore.client()

file = open("/home/kali/Desktop/TT4_18/Customer.json")
data = json.load(file)

for x in data:
    customer_id = str(x['CustomerId'])
    customer_name = str(x['customer_name'])
    customer_phone = str(x['customer_phone'])
    customer_address = str(x['customer_address'])
    balance = str(x['balance'])
    doc_ref = db.collection('Customer').document(customer_name)
    doc_ref.set({
        'customer_name' : customer_name,
        'customer_id' : customer_id,
        'customer_phone' : customer_phone,
        'customer_address': customer_address,
        'balance' : balance,
    })
    print("Added {name}".format(name=customer_name))

file = open("/home/kali/Desktop/TT4_18/CustomerLoan.json")
data = json.load(file)

for x in data:
    customer_loan_id = str(x['CustomerLoanId'])
    customer_id = str(x['CustomerId'])
    loan_id = str(x['LoanId'])
    doc_ref = db.collection('CustomerLoan').document(customer_id)
    doc_ref.set({
        'customer_loan_id': customer_loan_id,
        'customer_id': customer_id,
        'loan_id': loan_id
    })
    print("CustomerLoan {id} added".format(id=customer_id))

file = open("/home/kali/Desktop/TT4_18/Payment.json")
data = json.load(file)

for x in data:
    loan_id = str(x['LoanId'])
    payment_id = str(x['PaymentId'])
    payment_date = str(x['payment_date'])
    payment_amount = str(x['payment_amount'])
    doc_ref = db.collection('Payment').document(loan_id)
    doc_ref.set({
        'payment_id' : payment_id,
        'payment_data' : payment_date,
        'loan_id': loan_id,
        'payment_amount' : payment_amount
    })
    print("Payment {id} added".format(id=loan_id))

file = open("/home/kali/Desktop/TT4_18/Loan.json")
data = json.load(file)

for x in data:
    loan_id = str(x['LoanId'])
    loan_amount = str(x['loan_amount'])
    doc_ref = db.collection('Loan').document(loan_id)
    doc_ref.set({
        'loan_id': loan_id,
        'loan_amount': loan_amount
    })
    print("Loan {id} added".format(id=loan_id))
