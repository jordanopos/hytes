import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:hytes_edition/src/models/product.dart';
import 'package:hytes_edition/src/ui/universalWidgets/small_products_model.dart';
import 'package:hytes_edition/src/ui/views/home/widgets/showCaseProductModel.dart';

class ShowCase extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 14, left: 8),
          child: Text('Today\'s Offers',
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 23,
                  fontWeight: FontWeight.bold)),
        ),
        Container(
          height: 150,
          child: Swiper(
            autoplayDelay: 6000,
            autoplay: true,
            itemWidth: MediaQuery.of(context).size.width / 1.1,
            layout: SwiperLayout.STACK,
            //  pagination: SwiperPagination(),
            itemCount: products.length,
            itemBuilder: (context, index) {
              return SmallProductsModel(products[index]);
            },
          ),
        ),
      ],
    );
  }
}
