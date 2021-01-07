import 'package:flutter/material.dart';
import 'package:hytes_edition/src/models/product.dart';
import 'package:hytes_edition/src/ui/universalWidgets/appBar.dart';
import 'package:hytes_edition/src/ui/universalWidgets/small_products_model.dart';
import 'package:hytes_edition/src/ui/views/search/widgets/searchField.dart';
import 'package:stacked/stacked.dart';
import './search_viewmodel.dart';

class SearchView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<SearchViewModel>.reactive(
      builder: (context, model, child) => Scaffold(
        body: SingleChildScrollView(
          child: Column(
            children: [
              MyAppBar(
                title: 'Search',
                trailing: Text(''),
              ),
              SearchField(),
              ListView.builder(
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  itemCount: products.length,
                  itemBuilder: (context, index) {
                    return SmallProductsModel(products[index]);
                  })
            ],
          ),
        ),
      ),
      viewModelBuilder: () => SearchViewModel(),
    );
  }
}
