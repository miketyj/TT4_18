import firebase_admin
from firebase_admin import credentials
from firebase_admin import firestore
import json

def setupFirebase():
    # Use a service account
    cred = credentials.Certificate('/home/kali/Desktop/TT4_18/Backend/Hackathon/firebase.json')
    firebase_admin.initialize_app(cred)
    print("app init")
    db = firestore.client()
    return db
    
def auth(db):
    doc = db.collection('Customer').document('Farrah Dobbie').get()
    print(doc.to_dict())
    
if __name__ == '__main__':
    db = setupFirebase()
    auth(db)
