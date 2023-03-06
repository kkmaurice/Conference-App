// ignore_for_file: sized_box_for_whitespace

import 'package:conference/Screens/btm_bar.dart';
import 'package:conference/Services/auth_services.dart';
import 'package:conference/helpers/style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});
  static const routeName = '/login_screen';
  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _emailTextController = TextEditingController();
  final _passTextController = TextEditingController();
  final _passFocusNode = FocusNode();
  final _formKey = GlobalKey<FormState>();
  bool _obsecureText = true;

  bool _isLoading = false;

  @override
  void dispose() {
    _emailTextController.dispose();
    _passTextController.dispose();
    _passFocusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            body: SingleChildScrollView(
      child: Column(children: [
        SizedBox(height: MediaQuery.of(context).size.height * 0.04),
        const Text(
          'Welcome Back!',
          style: TextStyle(
            color: Colors.black,
            fontSize: 25,
            fontWeight: FontWeight.w400,
          ),
        ),
        const SizedBox(
          height: 20,
        ),
        // form
        Padding(
          padding: const EdgeInsets.only(top: 20, left: 20, right: 20),
          child: Form(
              key: _formKey,
              child: Column(
                children: [
                  TextFormField(
                    textInputAction: TextInputAction.next,
                    onEditingComplete: () =>
                        FocusScope.of(context).requestFocus(_passFocusNode),
                    controller: _emailTextController,
                    keyboardType: TextInputType.emailAddress,
                    validator: (value) {
                      if (value!.isEmpty ||
                          !value.contains('@') ||
                          !value.contains('.')) {
                        return 'Please enter a valid email address';
                      } else {
                        return null;
                      }
                    },
                    style: const TextStyle(color: Colors.black),
                    decoration: InputDecoration(
                      prefixIcon: const Icon(Icons.email),
                      prefixIconColor: Colors.black,
                      hintText: 'Email Address',
                      hintStyle: const TextStyle(color: Colors.grey),
                      enabledBorder: OutlineInputBorder(
                        borderSide:
                            const BorderSide(width: 1, color: Colors.grey),
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide:
                            const BorderSide(width: 1, color: Colors.grey),
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 17,
                  ),
                  // Password Form field
                  TextFormField(
                    textInputAction: TextInputAction.done,
                    onEditingComplete: () => {},
                    //_submitFormOnLogin(),
                    controller: _passTextController,
                    focusNode: _passFocusNode,
                    obscureText: _obsecureText,
                    keyboardType: TextInputType.visiblePassword,
                    validator: (value) {
                      if (value!.isEmpty || value.length < 6) {
                        return 'Please enter a valid password';
                      } else {
                        return null;
                      }
                    },
                    style: const TextStyle(color: Colors.black),

                    decoration: InputDecoration(
                      prefixIcon: const Icon(Icons.person),
                      prefixIconColor: Colors.black,
                      suffixIcon: GestureDetector(
                          onTap: () {
                            setState(() {
                              _obsecureText = !_obsecureText;
                            });
                          },
                          child: Icon(
                            _obsecureText
                                ? Icons.visibility_off_outlined
                                : Icons.visibility_outlined,
                            color: Colors.grey.shade700,
                            size: 30,
                          )),
                      hintText: 'Password',
                      hintStyle: const TextStyle(color: Colors.grey),
                      enabledBorder: OutlineInputBorder(
                        borderSide:
                            const BorderSide(width: 1, color: Colors.grey),
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide:
                            const BorderSide(width: 1, color: Colors.grey),
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Align(
                      alignment: Alignment.centerRight,
                      child: TextButton(
                        onPressed: () {
                          AuthServices().passwordReset(
                              context, _emailTextController.text);
                        },
                        child: const Text('Forgot Password?',
                            style: TextStyle(
                                color: Colors.red,
                                fontSize: 18,
                                fontStyle: FontStyle.italic,
                                fontWeight: FontWeight.w400)),
                      )),

                  const SizedBox(
                    height: 30,
                  ),
                  _isLoading
                      ? Center(
                          child: SpinKitFadingCircle(
                            itemBuilder: (BuildContext context, int index) {
                              return DecoratedBox(
                                decoration: BoxDecoration(
                                  color:
                                      index.isEven ? Colors.red : Colors.green,
                                ),
                              );
                            },
                          ),
                        )
                      : InkWell(
                          onTap: () async {
                            if (_formKey.currentState!.validate()) {
                              _formKey.currentState!.save();
                              setState(() {
                                _isLoading = true;
                              });
                              await AuthServices()
                                  .signInUser(
                                      context,
                                      _emailTextController.text,
                                      _passTextController.text)
                                  .then((value) {
                                setState(() {
                                  _emailTextController.clear();
                                  _passTextController.clear();
                                });
                                setState(() {
                                  _isLoading = false;
                                });
                              }).then((value) {
                                Navigator.pushReplacementNamed(
                                    context, BottomBarScreen.routeName);
                              });
                              // setState(() {
                              //   _isLoading = false;
                              // });
                            }
                          },
                          child: Container(
                            height: MediaQuery.of(context).size.height * 0.07,
                            width: MediaQuery.of(context).size.width * 0.94,
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                              color: cardColor,
                              borderRadius: BorderRadius.circular(25),
                            ),
                            child: const Text('Sign In',
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold)),
                          ),
                        ),
                  const SizedBox(
                    height: 30,
                  ),
                  Row(
                    children: const [
                      Expanded(
                          child: Divider(
                        color: Colors.black,
                      )),
                      Text('Or Sign In With'),
                      Expanded(
                          child: Divider(
                        height: 1,
                        color: Colors.black,
                      )),
                    ],
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  InkWell(
                    onTap: () {
                      // sign in with google
                    },
                    child: Card(
                      elevation: 7,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(25),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(
                                color: Colors.white,
                                child: Image.asset(
                                  'assets/images/google.png',
                                  width: 40,
                                )),
                            const SizedBox(
                              width: 8,
                            ),
                            const Text('Sign in with google',
                                style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold)),
                          ],
                        ),
                      ),
                    ),
                  )
                ],
              )),
        ),
      ]),
    )));
  }
}
