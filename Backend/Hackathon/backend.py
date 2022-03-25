from flask import Flask
from flask_restful import Resource, Api
import requests

app = Flask(__name__)
api = Api(app)



@app.route('/customer-loans/<customer_id>')

def get_customer_loans(customer_id):
    customer_loan = requests.get('https://firestore.googleapis.com/v1/projects/tt4-18/databases/(default)/documents/CustomerLoan/' + customer_id).content
    data = json.loads(customer_loan.decode('utf-8'))
    print(data['fields']['loan_id'])
    return customer_loan

# def get_data():
#     return requests.get('https://firestore.googleapis.com/v1/projects/tt4-18/databases/(default)/documents/Customer/').content


if __name__ == '__main__':
    app.run(debug=True)
