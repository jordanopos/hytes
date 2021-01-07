import 'package:cloud_firestore/cloud_firestore.dart';

class DataBaseService {
  final String uid;

  DataBaseService(this.uid);
  final firestore = FirebaseFirestore.instance;

  final CollectionReference productsRef =
      FirebaseFirestore.instance.collection('products');
  final CollectionReference usersRef =
      FirebaseFirestore.instance.collection('users');

  Future setUserData(
      {String phoneNumber,
      String billingAdress,
      String imgUrl,
      String userName,
      String email}) async {
    return await usersRef.doc(uid).set({
      'userName': userName,
      'billingAdress': billingAdress,
      'phoneNumber': phoneNumber,
      'imgUrl': imgUrl,
      'email': email
    });
  }

  Future updateUserData({String userName, String billingAdress, String phoneNumber, String imgUrl,})async{
     return await usersRef.doc(uid).update({
      'userName': userName,
      'billingAdress': billingAdress,
      'phoneNumber': phoneNumber,
      'imgUrl': imgUrl,
    });

  }

  //get sales data

  Future<QuerySnapshot> getProductsOnSale() async {
    return await productsRef.where('status', isEqualTo: 'sales').get();

  }
  //get recommended data


  Future<QuerySnapshot> getRecommended() async {
    return   await productsRef.where('status', isEqualTo: 'recommended').get();

  } 
}
