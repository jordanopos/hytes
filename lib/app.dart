import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hytes_edition/colors/colors.dart';
import 'package:hytes_edition/src/models/user.dart';
import 'package:hytes_edition/src/services/auth.dart';
import 'package:hytes_edition/src/ui/views/auth/login/login_view.dart';
import 'package:hytes_edition/src/ui/views/home/home_view.dart';
import 'package:hytes_edition/wrapper.dart';
import 'package:provider/provider.dart';

class MyApp extends StatelessWidget {
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle(
        statusBarColor: Color(0xffEDEDED),
        statusBarIconBrightness : Brightness.dark
      ),
    );
    return StreamProvider<HytesUser>.value(
      value : AuthService().user,
          child: MaterialApp(
        theme:
            ThemeData(fontFamily: 'ProductSans', scaffoldBackgroundColor: grey),
        debugShowCheckedModeBanner: false,
        title: 'Hytes Edition',
        home: Wrapper(),
      ),
    );
  }
}
