import 'package:conference/Auth/login_screen.dart';
import 'package:conference/Auth/register_screen.dart';
import 'package:conference/Screens/btm_bar.dart';
import 'package:conference/helpers/style.dart';
import 'package:flutter/material.dart';

import '../Screens/innerScreens/ask_us.dart';

class AuthScreen extends StatelessWidget {
  const AuthScreen({super.key});
  static const routeName = 'auth_screen';
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: 2,
        child: Scaffold(
          backgroundColor: primaryColor,
          appBar: AppBar(
            title: TextButton(
                onPressed: () {
                  Navigator.pushNamed(context, AskUs.routeName);
                },
                child: Padding(
                  padding: const EdgeInsets.only(left: 2.0),
                  child: Text(
                    'Ask Us',
                    style: TextStyle(color: Colors.white, fontSize: 16),
                  ),
                )),
            actions: [
              TextButton(
                  onPressed: () {
                    Navigator.pushReplacementNamed(
                        context, BottomBarScreen.routeName);
                  },
                  child: Padding(
                    padding: const EdgeInsets.only(right: 2.0),
                    child: Text(
                      'Skip>>',
                      style: TextStyle(color: Colors.white, fontSize: 16),
                    ),
                  )),
              SizedBox(
                width: 15,
              )
            ],
            backgroundColor: primaryColor,
            automaticallyImplyLeading: false,
            flexibleSpace: Container(
                height: 500,
                decoration: const BoxDecoration(
                  color: cardColor,
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(40),
                    bottomRight: Radius.circular(40),
                  ),
                )),
            //centerTitle: true,
            elevation: 0.0,
            bottom: const TabBar(
              indicatorColor: Colors.white,
              indicatorPadding: EdgeInsets.only(
                left: 50,
                right: 50,
              ),
              indicatorWeight: 7.0,
              tabs: [
                Tab(
                  icon: Icon(
                    Icons.lock,
                    size: 27,
                  ),
                  text: 'Sign In',
                ),
                Tab(
                  icon: Icon(Icons.person_add, size: 27),
                  text: 'Sign Up',
                ),
              ],
            ),
          ),
          body: const TabBarView(children: [
            LoginScreen(),
            RegisterScreen(),
          ]),
        ));
  }
}
