import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:hytes_edition/src/models/user.dart';
import 'package:hytes_edition/src/services/auth.dart';
import 'package:hytes_edition/src/services/shared_preferences.dart';
import 'package:hytes_edition/src/ui/universalWidgets/appBar.dart';
import 'package:hytes_edition/src/ui/views/profile/widgets/list_tile.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:stacked/stacked.dart';
import './profile_viewmodel.dart';

class ProfileView extends StatefulWidget {
  @override
  _ProfileViewState createState() => _ProfileViewState();
}

class _ProfileViewState extends State<ProfileView> {
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<ProfileViewModel>.reactive(
      builder: (context, model, child) => Scaffold(
        body: StreamBuilder<Object>(
            stream: FirebaseFirestore.instance
                .collection('users')
                .doc(sharedPrefs.uid)
                .snapshots(),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                HytesUser hytesUser = HytesUser.fromDocument(snapshot.data);
                return SingleChildScrollView(
                  physics: BouncingScrollPhysics(),
                  child: Column(children: [
                    MyAppBar(
                      title: 'Profile',
                      trailing: Text(''),
                    ),
                    CircleAvatar(
                        radius: 60,
                        backgroundColor: Colors.grey[900],
                        child: Center(
                            child: Text(
                          hytesUser.userName[0],
                          style: TextStyle(
                              fontSize: 40, fontWeight: FontWeight.bold),
                        ))),
                    SizedBox(height: 10),
                    Text(hytesUser.email,
                        style: TextStyle(fontWeight: FontWeight.w500)),
                    Text(hytesUser.userName,
                        style: TextStyle(
                            fontSize: 19, fontWeight: FontWeight.bold)),
                    SizedBox(height: 10),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Padding(
                        padding: const EdgeInsets.only(left: 13, top: 30),
                        child: Text('My Acount',
                            style: TextStyle(
                                fontSize: 19, fontWeight: FontWeight.bold)),
                      ),
                    ),
                    MyTile('Billing Adress', Icons.place, null),
                    MyTile('About Us', Icons.info, null),
                    MyTile('FaQ', Icons.chat, null),
                    MyTile('Share App', Icons.share, null),
                    MyTile('Start Chat', Icons.chat_bubble, null),
                    MyTile('Logout', Icons.fullscreen_exit, () async {
                      final AuthService _auth = AuthService();
                      _auth.signout();

                      sharedPrefs.deleteUid();
                    }),
                    Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                      Icon(MdiIcons.instagram),
                      Icon(MdiIcons.whatsapp),
                      Icon(MdiIcons.facebook)
                    ])
                  ]),
                );
              }

              return Center(child: CircularProgressIndicator());
            }),
      ),
      viewModelBuilder: () => ProfileViewModel(),
    );
  }
}
