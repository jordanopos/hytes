import 'package:flutter/material.dart';
import 'package:hytes_edition/src/models/product.dart';
import 'package:hytes_edition/src/ui/views/home/widgets/products_view_model.dart';

class Recommended extends StatelessWidget {
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(left : 10, top : 15),
          child: Text('Recommended', style : TextStyle(fontSize : 24, fontWeight : FontWeight.bold )),
        ),
        Container(
            height: 240,
            child: ListView.builder(
                shrinkWrap: true,
                itemCount: products.length,
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  return ProductsViewModel(products[index]);
                })),
      ],
    );
  }
}
