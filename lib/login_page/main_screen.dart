import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cosbe_domo/home_page/home_page.dart';
import 'package:fluttertoast/fluttertoast.dart';

class LoginSignupScreen extends StatefulWidget {
  const LoginSignupScreen({Key? key}) : super(key: key);

  @override
  State<LoginSignupScreen> createState() => _LoginSignupScreenState();
}

class _LoginSignupScreenState extends State<LoginSignupScreen> {
  bool isSignupScreen = true;
  final _formKey = GlobalKey<FormState>();
  String userName = '';
  String userEmail = '';
  String userPassword = '';

  final _authentication = FirebaseAuth.instance;

  void _tryValidation() {
    final isValid = _formKey.currentState!.validate();
    if (isValid) {
      _formKey.currentState!.save();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Positioned(
            top: 0,
            right: 0,
            left: 0,
            child: Container(
              padding: EdgeInsets.only(top: 90, left: 20),
              height: 300,
              child: Container(
                  child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  RichText(
                    text: TextSpan(
                      text: 'Welcome',
                      style: TextStyle(
                        letterSpacing: 1.0,
                        fontSize: 25,
                        color: Colors.black,
                      ),
                    ),
                  )
                ],
              )),
            ),
          ),
          Positioned(
            top: 180,
            child: Container(
              height: 280.0,
              width: MediaQuery.of(context).size.width - 40,
              margin: EdgeInsets.symmetric(horizontal: 20.0),
              decoration:
                  BoxDecoration(borderRadius: BorderRadius.circular(15.0)),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      GestureDetector(
                        onTap: () {
                          setState(() {
                            isSignupScreen = false;
                          });
                        },
                        child: Column(
                          children: [
                            Text(
                              'LOGIN',
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                                color: !isSignupScreen
                                    ? Colors.black
                                    : Colors.black54,
                              ),
                            ),
                            if (!isSignupScreen)
                              Container(
                                margin: EdgeInsets.only(top: 3),
                                height: 2,
                                width: 55,
                                color: Colors.white,
                              ),
                          ],
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          setState(() {
                            isSignupScreen = true;
                          });
                        },
                        child: Column(
                          children: [
                            Text(
                              'SIGN UP',
                              style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                  color: isSignupScreen
                                      ? Colors.black
                                      : Colors.black54),
                            ),
                            if (isSignupScreen)
                              Container(
                                margin: EdgeInsets.only(top: 3),
                                height: 2,
                                width: 55,
                                color: Colors.white,
                              ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  if (isSignupScreen)
                    Container(
                      child: Form(
                        key: _formKey,
                        child: Column(
                          children: [
                            TextFormField(
                              key: ValueKey(1),
                              validator: (value) {
                                if (value!.isEmpty || value.length < 4) {
                                  return 'Please enter at least 4 characters';
                                }
                                return null;
                              },
                              onSaved: (value) {
                                userName = value!;
                              },
                              onChanged: (value) {
                                userName = value;
                              },
                              decoration: InputDecoration(
                                prefixIcon: Icon(
                                  Icons.account_circle,
                                ),
                              ),
                            ),
                            TextFormField(
                              key: ValueKey(2),
                              validator: (value) {
                                if (value!.isEmpty || !value.contains('@')) {
                                  return 'Please enter a valid email address';
                                }
                                return null;
                              },
                              onSaved: (value) {
                                userEmail = value!;
                              },
                              onChanged: (value) {
                                userEmail = value;
                              },
                              decoration: InputDecoration(
                                prefixIcon: Icon(
                                  Icons.email,
                                ),
                              ),
                            ),
                            TextFormField(
                              key: ValueKey(3),
                              validator: (value) {
                                if (value!.isEmpty || value.length < 6) {
                                  return 'Please enter at least 6 characters';
                                }
                                return null;
                              },
                              onSaved: (value) {
                                userPassword = value!;
                              },
                              onChanged: (value) {
                                userPassword = value;
                              },
                              decoration: InputDecoration(
                                prefixIcon: Icon(
                                  Icons.password,
                                ),
                              ),
                              obscureText: true,
                            ),
                          ],
                        ),
                      ),
                    ),
                  if (!isSignupScreen)
                    Container(
                      child: Form(
                        key: _formKey,
                        child: Column(
                          children: [
                            TextFormField(
                              key: ValueKey(4),
                              validator: (value) {
                                if (value!.isEmpty || value.length < 4) {
                                  return 'Please enter at least 4 characters';
                                }
                                return null;
                              },
                              onSaved: (value) {
                                userEmail = value!;
                              },
                              onChanged: (value) {
                                userEmail = value;
                              },
                              decoration: InputDecoration(
                                prefixIcon: Icon(
                                  Icons.email,
                                ),
                              ),
                            ),
                            TextFormField(
                              key: ValueKey(5),
                              validator: (value) {
                                if (value!.isEmpty || value.length < 6) {
                                  return 'Please enter at least 6 characters';
                                }
                                return null;
                              },
                              onSaved: (value) {
                                userPassword = value!;
                              },
                              onChanged: (value) {
                                userPassword = value;
                              },
                              decoration: InputDecoration(
                                prefixIcon: Icon(
                                  Icons.password,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                ],
              ),
            ),
          ),
          Positioned(
            top: 430,
            right: 0,
            left: 0,
            child: Center(
              child: GestureDetector(
                child: Container(
                  padding: EdgeInsets.all(15),
                  height: 30,
                  width: 90,
                  decoration: BoxDecoration(
                    color: Colors.blue,
                  ),
                ),
                onTap: () async {
                  if (isSignupScreen) {
                    _tryValidation();

                    try {
                      final newUser =
                          await _authentication.createUserWithEmailAndPassword(
                              email: userEmail, password: userPassword);

                      if (newUser.user != null) {
                        Fluttertoast.showToast(msg: '가입 완료했습니다');
                      }
                    } catch (e) {
                      print(e);
                      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                          content: Text('Please check your email and password'),
                          backgroundColor: Colors.blue));
                    }
                  } else {
                    _tryValidation();

                    try {
                      final newUser =
                          await _authentication.signInWithEmailAndPassword(
                              email: userEmail, password: userPassword);

                      if (newUser.user != null) {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) {
                            return home_page();
                          }),
                        );
                      }
                    } catch (e) {
                      print(e);
                    }
                  }
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
