import 'package:flutter/material.dart';
import 'package:hytes_edition/src/models/user.dart';
import 'package:hytes_edition/src/ui/views/auth/login/login_view.dart';
import 'package:hytes_edition/src/ui/views/home/home_view.dart';
import 'package:provider/provider.dart';

class Wrapper extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final user = Provider.of<HytesUser>(context);
    user!=null ? print(user.uid) : print('Not yet initialised');
    return user != null ? HomeView() : LoginView();
  }
}
