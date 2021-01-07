import 'package:flutter/material.dart';
import 'package:hytes_edition/src/models/product.dart';

class ShowCaseProductsModel extends StatelessWidget {
  final Product product;

  ShowCaseProductsModel(this.product);
  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(
            color: Colors.white, borderRadius: BorderRadius.circular(10)),
        margin: EdgeInsets.all(10),
    //    height: 300,
        width: MediaQuery.of(context).size.width / 1.3,
        child: Row(
          children: [
            Expanded(
                child: Image(
              image: AssetImage(product.url),
            )),
            Expanded(
              flex : 2,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(product.name,
                      style:
                          TextStyle(fontSize: 17, fontWeight: FontWeight.bold)),
                          SizedBox(height : 5),
                  GreenShopNowButton()
                ],
              ),
            )
          ],
        ));
  }
}

class GreenShopNowButton extends StatelessWidget {
  const GreenShopNowButton({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.green,
        borderRadius : BorderRadius.circular(5)
      ),
      height: 40,
      width: 100,
      child: Center(
        child: Text('SHOP NOW',
            style: TextStyle(
                color: Colors.white,
                fontSize: 15,
                fontWeight: FontWeight.bold)),
      ),
    );
  }
}
