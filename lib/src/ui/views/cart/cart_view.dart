import 'package:flutter/material.dart';
import 'package:hytes_edition/src/ui/universalWidgets/appBar.dart';
import 'package:stacked/stacked.dart';
import './cart_viewmodel.dart';

class CartView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<CartViewModel>.reactive(
      builder: (context, model, child) => Scaffold(
          body: SingleChildScrollView(
              child: Column(children: [
        MyAppBar(
          title: 'My Cart',
          trailing: Text(''),
        )
      ]))),
      viewModelBuilder: () => CartViewModel(),
    );
  }
}
