import 'package:cloud_firestore/cloud_firestore.dart';

class Product {
  String name;
  String id;
  String description;
  String url;
  String state;
  int price;
  String status;
  String type;

  Product(
      {this.description,
      this.id,
      this.name,
      this.url,
      this.state,
      this.price,
      this.status,
      this.type
      });

  factory Product.fromDocument(DocumentSnapshot doc) {
    var data = doc.data();

    return Product(
      id: data['id'],
      description: data['description'],
      name: data['name'],
      price: data['price'],
      state: data['state'],
      url: data['url'],
      status: data['status'],
      type : data['type']
    );
  }
}

List<Product> products = [
  Product(
      price: 200000,
      state: 'Used',
      name: 'Galaxy Buds',
      description: 'The Samsung Galaxy buds are hot',
      url: 'assets/images/galaxybuds.png'),
  Product(
      price: 3400000,
      state: 'New',
      name: 'Airpods Max',
      description: 'The Samsung Galaxy buds are hot',
      url: 'assets/images/airpodsMax.png'),
  Product(
      price: 2600000,
      state: 'Refurbished',
      name: 'iPhone 11',
      description: 'The Samsung Galaxy buds are hot',
      url: 'assets/images/iPhone11.png'),
  Product(
      price: 5300000,
      state: 'Used',
      name: 'iPhone 12 Pro',
      description: 'The Samsung Galaxy buds are hot',
      url: 'assets/images/12pro.png'),
  Product(
      price: 100000,
      state: 'New',
      name: 'Galaxy Buds',
      description: 'The Samsung Galaxy buds are hot',
      url: 'assets/images/galaxybuds.png'),
];
