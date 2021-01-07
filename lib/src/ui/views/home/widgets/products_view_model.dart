import 'package:add_comma/add_comma.dart';
import 'package:flutter/material.dart';
import 'package:hytes_edition/colors/colors.dart';
import 'package:hytes_edition/src/models/product.dart';

class ProductsViewModel extends StatelessWidget {
  final Product product;

  ProductsViewModel(this.product);
  @override
  Widget build(BuildContext context) {
    final putCommas = addCommas();
    return Padding(
      padding: const EdgeInsets.only(right: 20, top: 10, left: 10),
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 15),
        decoration: BoxDecoration(
            color: Colors.white, borderRadius: BorderRadius.circular(10)),
        width: 170,
        height: 240,
        child: Column(
          children: [
            Expanded(
              flex: 2,
              child: Image(image: AssetImage(product.url))),
            Expanded(
              child: Column(
                children: [
                  Spacer(),
                  Container(
                      child: Column(
                    children: [
                      Text(product.name,
                          style: TextStyle(
                              fontSize: 18, fontWeight: FontWeight.bold)),
                      SizedBox(height: 4),
                      Text(
                        'UGX ${putCommas(product.price)}',
                        style: TextStyle(
                            fontSize: 19, fontWeight: FontWeight.bold,
                            color : Colors.green
                            ),
                      )
                    ],
                  )),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

class ShopNowButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(right: 15, left: 15),
      height: 40,
      child: Center(
        child: Text('SHOP NOW',
            style: TextStyle(
                color: Colors.white,
                fontSize: 16,
                fontWeight: FontWeight.bold)),
      ),
      decoration:
          BoxDecoration(color: red, borderRadius: BorderRadius.circular(10)),
    );
  }
}
