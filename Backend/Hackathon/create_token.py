import firebase_admin
from firebase_admin import credentials
from firebase_admin import firestore
from firebase_admin import  auth
import json
import os

os.environ["GOOGLE_APPLICATION_CREDENTIALS"]="C:/TT4_18/backend/hackathon/tt4-18-firebase-adminsdk-m9szg-9161768ff9.json"

# Use a service account
cred = credentials.Certificate('C:/TT4_18/backend/hackathon/tt4-18-firebase-adminsdk-m9szg-9161768ff9.json')

options = {
    'serviceAccountId': '111636748131095662701@tt4-18.iam.gserviceaccount.com',
}

default_app  = firebase_admin.initialize_app(options=options)

uid = 'something-uid'

custom_token = auth.create_custom_token(uid)


print("Custom Token: " + custom_token.decode("utf-8"))