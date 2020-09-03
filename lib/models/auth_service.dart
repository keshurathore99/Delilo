
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';





class AuthService {

  // handleAuth() {
  //   return StreamBuilder(
  //     stream: FirebaseAuth.instance.onAuthStateChanged,
  //     builder: (BuildContext context, snapshot){
  //       if(snapshot.hasData)

  //         return HomeScreen();
  //       else

  //         return LoginPage();
  //     }, 
  //   );
  // }


  // signIn
  signIn(AuthCredential credential) {
    FirebaseAuth.instance.signInWithCredential(credential);
  }

  // signOut
  signOut() {
    FirebaseAuth.instance.signOut();
  }

  signWithOTP(smsCode, verificationId) {
    try{
      AuthCredential authCredential = PhoneAuthProvider.getCredential(verificationId: verificationId, smsCode: smsCode);
      signIn(authCredential);
    }catch(error) {
      print(error.toString() + " ___________________________");
    }
  }
}