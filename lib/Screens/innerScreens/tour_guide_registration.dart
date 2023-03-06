// ignore_for_file: use_build_context_synchronously

import 'dart:io';

import 'package:conference/Screens/innerScreens/chat_main_page.dart';
import 'package:conference/Screens/innerScreens/tour_details_screen.dart';
import 'package:conference/Services/tour_guide_service.dart';
import 'package:conference/helpers/style.dart';
import 'package:conference/models/tour_guide.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:uuid/uuid.dart';

class TourGuideRegistration extends StatefulWidget {
  const TourGuideRegistration({super.key});
  static const routeName = '/register_screen';

  @override
  State<TourGuideRegistration> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<TourGuideRegistration> {
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

  String downloadUrl = "";
  XFile? imageFile;

  final ImagePicker _picker = ImagePicker();
  void getImageFromGallery(ImageSource source) async {
    final image = await _picker.pickImage(source: source);
    if (image == null) return;
    setState(() {
      imageFile = image;
      downloadUrl = image.path;
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        //backgroundColor: cardColor,
        appBar: AppBar(
          title: const Text('Register as a Tour Guide'),
          backgroundColor: cardColor,
          elevation: 0,
          centerTitle: true,
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.only(left: 20, right: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const SizedBox(
                  height: 12,
                ),
                const SizedBox(
                  height: 12,
                ),
                GestureDetector(
                  onTap: () {
                    // show the dialog
                    showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return AlertDialog(
                          title: const Text('Select Image Source'),
                          content: SingleChildScrollView(
                            child: ListBody(
                              children: const <Widget>[
                                Text('Choose from:'),
                                Text('Gallery'),
                                Text('Camera'),
                              ],
                            ),
                          ),
                          actions: <Widget>[
                            TextButton(
                              child: const Text('Gallery'),
                              onPressed: () {
                                getImageFromGallery(ImageSource.gallery);
                                Navigator.of(context).pop();
                              },
                            ),
                            TextButton(
                              child: const Text('Camera'),
                              onPressed: () {
                                getImageFromGallery(ImageSource.camera);
                                Navigator.of(context).pop();
                              },
                            ),
                          ],
                        );
                      },
                    );
                  },
                  child: CircleAvatar(
                    radius: MediaQuery.of(context).size.width * 0.15,
                    backgroundColor: Colors.white,
                    backgroundImage: imageFile == null
                        ? null
                        : FileImage(File(imageFile!.path)),
                    child: imageFile == null
                        ? Icon(
                            Icons.add_photo_alternate,
                            color: Colors.grey,
                            size: MediaQuery.of(context).size.width * 0.2,
                          )
                        : null,
                  ),
                ),
                const SizedBox(
                  height: 12,
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
                                  borderSide:
                                      const BorderSide(color: Colors.grey),
                                  borderRadius: BorderRadius.circular(10.0),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderSide:
                                      const BorderSide(color: Colors.grey),
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
                                  borderSide:
                                      const BorderSide(color: Colors.grey),
                                  borderRadius: BorderRadius.circular(10.0),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderSide:
                                      const BorderSide(color: Colors.grey),
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
                              onTap: () async {
                                if (_formKey.currentState!.validate()) {
                                  _formKey.currentState!.save();
                                  setState(() {
                                    _isLoading = true;
                                  });

                                  await TourGuideService.addTourGuide(TourGuide(
                                          id: const Uuid().v4(),
                                          firstName:
                                              _firstNameTextController.text,
                                          lastName:
                                              _lastNameNameController.text,
                                          email: _emailTextController.text,
                                          phoneNumber: _phone,
                                          password:
                                              _passwordTextController.text,
                                          photoUrl: downloadUrl,
                                          location: _phone.startsWith('+256')
                                              ? 'Uganda'
                                              : _phone.startsWith('+1')
                                                  ? 'Canada'
                                                  : 'Other'))
                                      .then((value) => EasyLoading.showSuccess(
                                          'Tour Guide Added Successfully',
                                          duration: const Duration(seconds: 2)))
                                      .then((value) {
                                    _firstNameTextController.clear();
                                    _lastNameNameController.clear();
                                    _emailTextController.clear();
                                    _phone = '';
                                    _passwordTextController.clear();
                                    _confirmPasswordTextController.clear();
                                    // downloadUrl = '';
                                  }).then((value) {
                                    Navigator.pushReplacementNamed(
                                        context, ChatMainPage.routeName);
                                  });

                                  setState(() {
                                    _isLoading = false;
                                  });
                                  //_formKey.currentState!.reset();
                                }
                              },
                              child: Container(
                                height:
                                    MediaQuery.of(context).size.height * 0.07,
                                width: MediaQuery.of(context).size.width * 0.94,
                                alignment: Alignment.center,
                                decoration: BoxDecoration(
                                  color: cardColor,
                                  borderRadius: BorderRadius.circular(25),
                                ),
                                child: const Text('Register',
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
        ),
      ),
    );
  }
}
