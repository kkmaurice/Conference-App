import 'package:conference/Screens/home_screen.dart';
import 'package:conference/Services/auth_services.dart';
import 'package:conference/helpers/style.dart';
import 'package:conference/models/user_info_model.dart' as user;
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:intl_phone_field/intl_phone_field.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});
  static const routeName = '/register_screen';

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final _firstNameTextController = TextEditingController();
  final _lastNameNameController = TextEditingController();
  final _genderController = TextEditingController();
  final _emailTextController = TextEditingController();
  final _passwordTextController = TextEditingController();
  final _confirmPasswordTextController = TextEditingController();
  final _phoneNumberTextController = TextEditingController();

  final _lastNameFocusNode = FocusNode();
  final _passwordFocusNode = FocusNode();
  final _emailFocusNode = FocusNode();
  final _phoneNumberFocusNode = FocusNode();
  final _formKey = GlobalKey<FormState>();
  var _phone = '';
  String _selectedGender = '';
  bool _obsecureText = true;

  bool _isLoading = false;

  @override
  void dispose() {
    _firstNameTextController.dispose();
    _lastNameNameController.dispose();
    _genderController.dispose();
    _emailTextController.dispose();
    _passwordTextController.dispose();
    _phoneNumberTextController.dispose();
    _confirmPasswordTextController.dispose();
    _lastNameFocusNode.dispose();
    _phoneNumberFocusNode.dispose();
    _passwordFocusNode.dispose();
    super.dispose();
  }

  List<String> gender = ['Male', 'Female', 'Other'];
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.only(left: 20, right: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(
              height: 20,
            ),
            const Text(
              'Create An Account',
              style: TextStyle(
                color: Colors.black,
                fontSize: 25,
                fontWeight: FontWeight.w400,
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Form(
              key: _formKey,
              child: Column(
                children: [
                  Row(
                    children: [
                      Expanded(
                        child: TextFormField(
                          textInputAction: TextInputAction.next,
                          onEditingComplete: () => FocusScope.of(context)
                              .requestFocus(_lastNameFocusNode),
                          controller: _firstNameTextController,
                          keyboardType: TextInputType.text,
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'Please enter your first name';
                            } else {
                              return null;
                            }
                          },
                          style: const TextStyle(color: Colors.black),
                          decoration: InputDecoration(
                            prefixIcon: const Icon(Icons.person),
                            prefixIconColor: Colors.black,
                            hintText: 'First name',
                            hintStyle: const TextStyle(color: Colors.grey),
                            enabledBorder: OutlineInputBorder(
                              borderSide: const BorderSide(color: Colors.grey),
                              borderRadius: BorderRadius.circular(10.0),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide: const BorderSide(color: Colors.grey),
                              borderRadius: BorderRadius.circular(10.0),
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(
                        width: 20,
                      ),
                      Expanded(
                        child: TextFormField(
                          textInputAction: TextInputAction.next,
                          onEditingComplete: () => FocusScope.of(context)
                              .requestFocus(_emailFocusNode),
                          controller: _lastNameNameController,
                          keyboardType: TextInputType.text,
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'Please enter your last name';
                            } else {
                              return null;
                            }
                          },
                          style: const TextStyle(color: Colors.black),
                          decoration: InputDecoration(
                            prefixIcon: const Icon(Icons.person),
                            prefixIconColor: Colors.black,
                            hintText: 'Last name',
                            hintStyle: const TextStyle(color: Colors.grey),
                            enabledBorder: OutlineInputBorder(
                              borderSide: const BorderSide(color: Colors.grey),
                              borderRadius: BorderRadius.circular(10.0),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide: const BorderSide(color: Colors.grey),
                              borderRadius: BorderRadius.circular(10.0),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  TextFormField(
                    textInputAction: TextInputAction.next,
                    onEditingComplete: () => FocusScope.of(context)
                        .requestFocus(_phoneNumberFocusNode),
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
                      prefixIcon: const Icon(Icons.mail),
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
                    height: 20,
                  ),
                  IntlPhoneField(
                    decoration: InputDecoration(
                      labelText: 'Phone Number',
                      border: OutlineInputBorder(
                        borderSide:
                            const BorderSide(width: 1, color: Colors.grey),
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                    ),
                    initialCountryCode: 'UG',
                    onChanged: (phone) {
                      //print(phone.completeNumber);
                      setState(() {
                        _phone = phone.completeNumber;
                      });
                    },
                  ),
                  const SizedBox(
                    height: 0,
                  ),
                  TextFormField(
                    textInputAction: TextInputAction.done,
                    onEditingComplete: () => {},
                    //_submitFormOnLogin(),
                    controller: _passwordTextController,
                    //focusNode: _passFocusNode,
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
                      prefixIcon: const Icon(Icons.lock),
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
                    height: 20,
                  ),
                  TextFormField(
                    textInputAction: TextInputAction.done,
                    onEditingComplete: () => {},
                    //_submitFormOnLogin(),
                    controller: _confirmPasswordTextController,
                    //focusNode: _passFocusNode,
                    obscureText: _obsecureText,
                    keyboardType: TextInputType.visiblePassword,
                    validator: (value) {
                      if (value!.isEmpty || value.length < 6) {
                        return 'Please enter a valid password';
                      } else if (_passwordTextController.text !=
                          _confirmPasswordTextController.text) {
                        return 'Passwords do not match';
                      } else {
                        return null;
                      }
                    },
                    style: const TextStyle(color: Colors.black),
                    decoration: InputDecoration(
                      prefixIcon: const Icon(Icons.lock),
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
                      hintText: 'Confirm Password',
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
                    height: 15,
                  ),
                  const Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        'A minimum of 6 characters is required',
                        style: TextStyle(color: Colors.grey),
                      )),
                  const SizedBox(
                    height: 35,
                  ),
                 _isLoading
                        ? const Center(child: CircularProgressIndicator())
                        : InkWell(
                    onTap: () async{
                      if (_formKey.currentState!.validate()) {
                        _formKey.currentState!.save();
                        setState(() {
                          _isLoading = true;
                        });
                       await AuthServices().createNewUser(
                            _emailTextController.text,
                            _passwordTextController.text,
                            user.UserInfo(
                                firstName: _firstNameTextController.text,
                                lastName: _lastNameNameController.text,
                                email: _emailTextController.text,
                                phoneNumber: _phone,
                                password: _passwordTextController.text,
                                userId: FirebaseAuth.instance.currentUser!.uid),
                            context).then((value) {
                              _firstNameTextController.clear();
                              _lastNameNameController.clear();
                              _emailTextController.clear();
                              _phone = '';
                              _passwordTextController.clear();
                              _confirmPasswordTextController.clear();
                            }).then((value) {
                              Navigator.pushReplacementNamed(context, HomeScreen.routName);
                            } );
                        
                        setState(() {
                          _isLoading = false;
                        });
                        //_formKey.currentState!.reset();
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
                            child: const Text('Sign Up',
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold)),
                          ),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            //const BottomRichText(),
          ],
        ),
      ),
    );
  }
}
