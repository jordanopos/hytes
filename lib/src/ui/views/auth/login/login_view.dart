import 'package:flutter/material.dart';
import 'package:hytes_edition/colors/colors.dart';
import 'package:hytes_edition/src/ui/views/auth/login/widgets/loginButton.dart';
import 'package:hytes_edition/src/ui/views/auth/login/widgets/textForm.dart';
import 'package:hytes_edition/src/ui/views/auth/login/widgets/title.dart';
import 'package:hytes_edition/src/ui/views/auth/login/widgets/registerForm.dart';
import 'package:stacked/stacked.dart';
import './login_viewmodel.dart';

class LoginView extends StatefulWidget {
  @override
  _LoginViewState createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  final GlobalKey<FormState> loginformKey = GlobalKey<FormState>();
  TextEditingController email = TextEditingController();
  TextEditingController phoneNumberController = TextEditingController();
  TextEditingController password = TextEditingController();
  final scaffoldKey = GlobalKey<ScaffoldState>();
  int selectedIndex = 0;
  static final GlobalKey<FormState> registerFormKey = GlobalKey<FormState>();
  TextEditingController registeremail = TextEditingController();
  TextEditingController registerpassword = TextEditingController();
  TextEditingController usernameController = TextEditingController();
  TextEditingController billingAdressController = TextEditingController();
  final registerkey = GlobalKey<ScaffoldState>();
  List<String> names = ['Login', 'Register'];
  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;

    return ViewModelBuilder<LoginViewModel>.reactive(
      builder: (context, model, child) => Scaffold(
          key: scaffoldKey,
          body: Container(
            child: Stack(
              children: <Widget>[
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 20),
                  child: SingleChildScrollView(
                    child: Form(
                      key: loginformKey,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          SizedBox(height: 60),
                          Container(
                            height: 40,
                            child: Center(
                              child: ListView.builder(
                                physics: NeverScrollableScrollPhysics(),
                                scrollDirection: Axis.horizontal,
                                itemCount: 2,
                                itemBuilder: (context, index) {
                                  return Center(
                                    child: InkWell(
                                      onTap: () {
                                        setState(() {
                                          selectedIndex = index;
                                        });
                                      },
                                      child: Container(
                                          margin: EdgeInsets.only(
                                              right: 10, left: 10),
                                          decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(8),
                                            gradient: selectedIndex == index
                                                ? redGrad
                                                : LinearGradient(
                                                    colors: [
                                                      Colors.grey[400],
                                                      Colors.grey[400]
                                                    ],
                                                  ),
                                          ),
                                          child: Center(
                                            child: Text(
                                              names[index],
                                              style: TextStyle(
                                                  color: selectedIndex == index
                                                      ? Colors.white
                                                      : Colors.black,
                                                  fontSize: 16.3,
                                                  fontWeight: FontWeight.bold),
                                            ),
                                          ),
                                          width: MediaQuery.of(context)
                                                  .size
                                                  .width /
                                              2.7),
                                    ),
                                  );
                                },
                              ),
                            ),
                          ),
                          SizedBox(height: 20),
                          Builder(
                            builder: (context) {
                              return selectedIndex == 0
                                  ? Column(
                                      children: [
                                        OposTitle(),
                                        SizedBox(height: 50),
                                        HytesTextForm(
                                            email: email, password: password),
                                        SizedBox(height: 20),
                                        LoginButton(
                                            email, password, loginformKey, () {
                                          scaffoldKey.currentState
                                              .showSnackBar(SnackBar(
                                            content: Text('An Error occured'),
                                          ));
                                        }, () {
                                          scaffoldKey.currentState.showSnackBar(
                                            SnackBar(
                                              content: Text(
                                                  'Signing you in. Please wait....'),
                                            ),
                                          );
                                        }),
                                        SizedBox(height: height * .015),
                                      ],
                                    )
                                  : Form(
                                      key: registerFormKey,
                                      child: RegisterForm(
                                        showLoading: () {
                                          scaffoldKey.currentState.showSnackBar(
                                              SnackBar(
                                                  content: Text(
                                                      'Registering. Please wait........')));
                                        },
                                        phoneNumberController:
                                            phoneNumberController,
                                        height: height,
                                        usernameController: usernameController,
                                        email: registeremail,
                                        password: registerpassword,
                                        billingAdressController:
                                            billingAdressController,
                                        formKey: registerFormKey,
                                        showBar: () {
                                          scaffoldKey.currentState.showSnackBar(
                                              SnackBar(
                                                  content: Text(
                                                      'An error occured')));
                                        },
                                      ),
                                    );
                            },
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                //   Positioned(top: 40, left: 0, child: BackButton()),
              ],
            ),
          )),
      viewModelBuilder: () => LoginViewModel(),
    );
  }
}
