import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';

class AuthProvider extends ChangeNotifier {
  bool _connected=false; // Not accesible outside class

  Future<bool> handleSignInEmail(String email, String password) async {
    await Firebase.initializeApp();
    try {
      UserCredential result =
      await FirebaseAuth.instance.signInWithEmailAndPassword(email: email, password: password);
      _connected=true;
      notifyListeners();
    }catch(err) {
      print("#### "+err.toString());
      return false;
    }
    return true;
  }

  bool get isConnected => _connected;
}