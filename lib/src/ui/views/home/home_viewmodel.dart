import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:hytes_edition/src/ui/views/cart/cart_view.dart';
import 'package:hytes_edition/src/ui/views/home/widgets/categorySwitcher.dart';
import 'package:hytes_edition/src/ui/views/home/widgets/photo.dart';
import 'package:hytes_edition/src/ui/views/home/widgets/recommended.dart';
import 'package:hytes_edition/src/ui/views/home/widgets/showCase.dart';
import 'package:hytes_edition/src/ui/views/profile/profile_view.dart';
import 'package:hytes_edition/src/ui/views/search/search_view.dart';
import 'package:stacked/stacked.dart';
import 'package:hytes_edition/src/services/auth.dart';

class HomeViewModel extends IndexTrackingViewModel {
  getViewForIndex(int index) {
    print(userId);
    List<DisplayPhoto> images = [
      DisplayPhoto('assets/images/1.png'),
      DisplayPhoto('assets/images/2.jpeg'),
      DisplayPhoto('assets/images/3.jpeg'),
    ];
    switch (index) {
      case 0:
        return CustomScrollView(physics: BouncingScrollPhysics(), slivers: [
          SliverAppBar(
            stretch: true,
            collapsedHeight: 100,
            backgroundColor: Colors.transparent,
            expandedHeight: 250,
            flexibleSpace: FlexibleSpaceBar(
              collapseMode: CollapseMode.none,
              stretchModes: [StretchMode.zoomBackground],
              background: Swiper(
                autoplay: true,
                pagination: SwiperPagination(),
                itemCount: images.length,
                itemBuilder: (context, index) {
                  return images[index];
                },
              ),
            ),
          ),
          SliverList(
              delegate: SliverChildListDelegate([
            Column(
              children: [ShowCase(), Recommended(), CategorySwitcher()],
            ),
          ]))
        ]);
      case 1:
        return SearchView();
      case 2:
        return CartView();
      case 3:
        return ProfileView();
        break;
      default:
        ProfileView();
    }
  }
}
