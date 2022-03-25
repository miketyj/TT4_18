import firebase_admin
from firebase_admin import credentials
from firebase_admin import firestore

# Use a service account
cred = credentials.Certificate('C:/TT4_18/tt4-18-firebase-adminsdk-m9szg-9161768ff9.json')
firebase_admin.initialize_app(cred)

db = firestore.client()
