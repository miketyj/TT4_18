def authentication(username, password)
    #firebase_username = Check if username exists
    #firebase_password = Get password for the username
    if firebase_username and firebase_password == password:
      #redirect to login page
      return True
    elif !firebase_username:
      return False
    elif (firebase_username and !firebase_password)
      return False
