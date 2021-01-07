import 'package:add_comma/add_comma.dart';
import 'package:flutter/material.dart';
import 'package:hytes_edition/src/models/product.dart';

class SmallProductsModel extends StatelessWidget {
  final Product product;

  SmallProductsModel(this.product);
  @override
  Widget build(BuildContext context) {
    final putComma = addCommas();
    return Container(
        decoration: BoxDecoration(
            color: Colors.white, borderRadius: BorderRadius.circular(10)),
        height: 150,
        margin: EdgeInsets.symmetric(vertical: 6, horizontal: 10),
        child: Row(children: [
          Expanded(
            child: Container(
              child: Image(
                image: AssetImage(product.url),
              ),
            ),
          ),
          Expanded(
              flex: 2,
              child: Container(
                  child: Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 20, horizontal: 10),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(product.name,
                          style: TextStyle(
                              fontSize: 18, fontWeight: FontWeight.bold)),
                      SizedBox(height: 4),
                      ClipRRect(
                        borderRadius: BorderRadius.circular(5),
                        child: Container(
                            width: 80,
                            color: Theme.of(context).scaffoldBackgroundColor,
                            padding: EdgeInsets.all(2),
                            height: 20,
                            child: Center(
                                child: Text(product.state == null
                                    ? 'N/A'
                                    : product.state))),
                      ),
                      Spacer(),
                      Row(
                        children: [
                          Text('UGX ${putComma(product.price)}',
                              style: TextStyle(
                                  color: Colors.green,
                                  fontSize: 19,
                                  fontWeight: FontWeight.bold)),
                          Spacer(),
                          Icon(
                            Icons.shopping_bag,
                            size : 25,
                            color: Colors.grey[500],
                          )
                        ],
                      ),
                    ]),
              )))
        ]));
  }
}
