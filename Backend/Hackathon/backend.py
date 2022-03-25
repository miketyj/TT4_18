from flask import Flask
from flask_restful import Resource, Api
import requests
import json

app = Flask(__name__)
api = Api(app)



@app.route('/customer-loans/<customer_id>')

def get_customer_loans(customer_id):
    customer_loan = requests.get('https://firestore.googleapis.com/v1/projects/tt4-18/databases/(default)/documents/CustomerLoan/' + customer_id).content
    data = json.loads(customer_loan.decode('utf-8'))
    loan_id = data['fields']['loan_id']['stringValue']
    loan = requests.get('https://firestore.googleapis.com/v1/projects/tt4-18/databases/(default)/documents/Loan/' + loan_id).content
    data = json.loads(loan.decode('utf-8'))
    loan_amount = data['fields']['loan_amount']['stringValue']
    return loan_amount



if __name__ == '__main__':
    app.run(debug=True)
