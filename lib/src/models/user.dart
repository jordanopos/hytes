import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class HytesUser {
  String userName;
  String email;
  String imgUrl;
  String billingAdress;
  String uid;
  String phoneNumber;

  HytesUser(
      {this.billingAdress,
      this.email,
      this.imgUrl,
      this.userName,
      this.phoneNumber,
      this.uid});

  factory HytesUser.fromFireBase(User user) {
    return HytesUser(
      email: user.email,
      uid: user.uid,
    );
  }

  factory HytesUser.fromDocument(DocumentSnapshot doc) {
    var data = doc.data();

    return HytesUser(
     // uid: data['uid'],
      billingAdress: data['billingAdress'],
      email: data['email'],
      imgUrl: data['imgUrl'],
      phoneNumber: data['phoneNumber'],
      userName: data['userName']
    );
  }


  
}
