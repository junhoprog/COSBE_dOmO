import 'package:cosbe_domo/map_page/map_function.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cosbe_domo/home_page/home_page.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
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
  String userInfo = '';
  bool isChecked = false;

  final _authentication = FirebaseAuth.instance;
  static final storage = new FlutterSecureStorage();

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _asyncMethod();
    });
  }

  _asyncMethod() async {
    userInfo = (await storage.read(key: "login"))!;
    print(userInfo);

    if (userInfo != null) {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) {
          return home_page();
        }),
      );
    }
  }

  void _tryValidation() {
    final isValid = _formKey.currentState!.validate();
    if (isValid) {
      _formKey.currentState!.save();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: ListView(children: [
      Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(
            height: MediaQuery.of(context).size.height / 20,
          ),
          Center(
              child: Image.asset(
            "assets/logo/domo_logo.png",
            height: MediaQuery.of(context).size.height / 4,
          )),
          Container(
            margin:
                EdgeInsets.only(top: MediaQuery.of(context).size.height / 20),
            height: MediaQuery.of(context).size.height / 2,
            width: MediaQuery.of(context).size.width / 10 * 7,
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
                                hintText: "username"),
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
                                hintText: "email"),
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
                                hintText: "password"),
                            obscureText: !isChecked,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Checkbox(
                                value: isChecked,
                                onChanged: (value) {
                                  setState(() {
                                    if (isChecked == true) {
                                      isChecked = false;
                                    } else {
                                      isChecked = true;
                                    }
                                  });
                                },
                              ),
                              Text("비밀번호 표시")
                            ],
                          )
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
                                hintText: "email"),
                          ),
                          TextFormField(
                            obscureText: !isChecked,
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
                                hintText: "password"),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Checkbox(
                                value: isChecked,
                                onChanged: (value) {
                                  setState(() {
                                    if (isChecked == true) {
                                      isChecked = false;
                                    } else {
                                      isChecked = true;
                                    }
                                  });
                                },
                              ),
                              Text("비밀번호 표시")
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
              ],
            ),
          ),
          Center(
            child: GestureDetector(
              child: Container(
                height: MediaQuery.of(context).size.height / 15,
                width: MediaQuery.of(context).size.width / 10 * 7,
                decoration: BoxDecoration(
                    color: Color(0xff656CFF),
                    borderRadius: BorderRadius.circular(30)),
                child: Center(
                  child: Text(
                    isSignupScreen ? "가입하기" : "로그인",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 15,
                    ),
                  ),
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
                      await storage.write(
                          key: "login",
                          value: "id $userEmail password $userPassword");

                      Navigator.pushReplacement(
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
        ],
      ),
    ]));
  }
}
