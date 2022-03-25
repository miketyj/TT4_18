import firebase_admin
from firebase_admin import credentials
from firebase_admin import firestore
import json

# Use a service account
cred = credentials.Certificate('C:/TT4_18/tt4-18-firebase-adminsdk-m9szg-9161768ff9.json')
firebase_admin.initialize_app(cred)

db = firestore.client()
file = open("")
data = json.load(file)

for x in data:
    customer_id = x['CustomerId']
    customer_name = x['customer_name']
    customer_phone = x['customer_phone']
    customer_address = x['customer_address']
    balance = x['balance']
    doc_ref = db.collection('users').document(customer_name)
    doc_ref.set({
        'customer_id' : customer_id,
        'customer_phone' : customer_phone,
        'customer_address': customer_address,
        'balance' : balance,
    })
    print("Added {name}".format(name=customer_name))
