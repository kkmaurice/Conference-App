// ignore_for_file: use_build_context_synchronously

import 'package:conference/Auth/auth_screen.dart';
import 'package:conference/Services/auth_services.dart';
import 'package:conference/helpers/style.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class MoreScreen extends StatelessWidget {
  const MoreScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            body: Column(children: [
      Container(
          height: MediaQuery.of(context).size.height * 0.28,
          width: MediaQuery.of(context).size.width,
          padding: const EdgeInsets.only(top: 15, left: 20, right: 20),
          decoration: const BoxDecoration(
            color: cardColor,
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(20),
              bottomRight: Radius.circular(20),
            ),
          ),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    'Account Profile',
                    style: TextStyle(
                        fontSize: 20,
                        color: Colors.white,
                        fontWeight: FontWeight.bold),
                  ),
                  InkWell(
                    onTap: () async {
                      showDialog(
                          context: context,
                          builder: (context) => AlertDialog(
                                title: const Text(
                                    'Are you sure you want to log out?'),
                                actions: [
                                  TextButton(
                                      onPressed: () async {
                                        await AuthServices()
                                            .signUserOut(context);
                                        Navigator.of(context)
                                            .pushNamed(AuthScreen.routeName);
                                      },
                                      child: const Text('Yes')),
                                  TextButton(
                                      onPressed: () {
                                        Navigator.of(context).pop();
                                      },
                                      child: const Text('No')),
                                ],
                              ));
                    },
                    child: const Chip(
                      padding: EdgeInsets.all(10),
                      label: Text(
                        'Log Out',
                        style: TextStyle(fontSize: 16, color: Colors.redAccent),
                      ),
                      backgroundColor: Colors.white,
                    ),
                  )
                ],
              ),
              //SizedBox(height: 7,),
              const Divider(
                color: Colors.white,
                indent: 7,
                endIndent: 7,
              ),
              const SizedBox(
                height: 7,
              ),
              Row(
                children: [
                  const CircleAvatar(
                    radius: 50,
                    backgroundColor: Colors.white,
                    child: CircleAvatar(
                      radius: 42,
                      backgroundImage: AssetImage('assets/images/event1.jpg'),
                    ),
                  ),
                  const SizedBox(
                    width: 20,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        '${FirebaseAuth.instance.currentUser!.email}',
                        style: TextStyle(
                            fontSize: 16,
                            color: Colors.white,
                            fontWeight: FontWeight.bold),
                      ),
                      SizedBox(height: 10,),
                      Text(
                        '${FirebaseAuth.instance.currentUser!.displayName}',
                        style: TextStyle(
                            fontSize: 16,
                            color: Colors.white,
                            fontWeight: FontWeight.bold),
                      ),
                      // Text(
                      //   'Phone',
                      //   style: TextStyle(
                      //       fontSize: 16,
                      //       color: Colors.white,
                      //       fontWeight: FontWeight.bold),
                      // ),
                    ],
                  ),
                ],
              ),
              const SizedBox(
                height: 7,
              ),
              const Divider(
                color: Colors.white,
                indent: 7,
                endIndent: 7,
              ),
            ],
          )),
          //Text('${FirebaseAuth.instance.currentUser!}')
    ]
    )));
  }
}
