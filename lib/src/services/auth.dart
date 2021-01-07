import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:hytes_edition/src/models/user.dart';
import 'package:hytes_edition/src/services/database.dart';

FirebaseAuth auth = FirebaseAuth.instance;

String userId;

class AuthService {
  FirebaseAuth _auth = FirebaseAuth.instance;

//crate a user based on the firebase user
  HytesUser _userFromFirebase(User user) {
    return user != null ? HytesUser.fromFireBase(user) : null;
  }

  //auth state user stream
  Stream<HytesUser> get user {
    return _auth.authStateChanges().map((user) => _userFromFirebase(user));
  }

  //signout

  Future signout() async {
    try {
      return await _auth.signOut();
    } catch (e) {
      print(e.toString());
      return null;
    }
  }

  //signInUser

  Future signIn(String email, String password) async {
    try {
      var result = await _auth.signInWithEmailAndPassword(
          email: email, password: password);
      User user = result.user;
      userId = user.uid;
    } catch (e) {
      print(e);
    }
  }

  //register user

  Future register(String email, String password) async {
    try {
      var result = await _auth.createUserWithEmailAndPassword(
          email: email, password: password);
      User user = result.user;
      userId = user.uid;
      await DataBaseService(user.uid).setUserData(email: user.email);
      return _userFromFirebase(user);
    } catch (e) {
      print(e);
      // return null;
    }
  }
}
