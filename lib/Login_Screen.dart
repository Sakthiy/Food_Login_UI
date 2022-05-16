import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:oxyfood/Constants.dart';
import 'package:oxyfood/createAccount.dart';
import 'package:oxyfood/home_Screen.dart';
import 'package:firebase_auth/firebase_auth.dart';

class Login_Screen extends StatefulWidget {
  const Login_Screen({Key? key}) : super(key: key);

  @override
  State<Login_Screen> createState() => _Login_ScreenState();
}

class _Login_ScreenState extends State<Login_Screen> {
  GlobalKey<FormState> formkey = GlobalKey<FormState>();
  late String _email, _password;

  void singIn(BuildContext context) async {
    await FirebaseAuth.instance
        .signInWithEmailAndPassword(email: _email, password: _password)
        .catchError((onError) {
      print(onError);
    }).then((authUser) {
      if (authUser.user != null)
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => homeScreen(),
          ),
        );
    });
  }

  @override
  Widget build(BuildContext context) => Scaffold(
        backgroundColor: Colors.white,
        body: SafeArea(
          child: GestureDetector(
            onTap: () => FocusScope.of(context).unfocus(),
            child: SingleChildScrollView(
              child: Form(
                key: formkey,
                child: Column(
                  children: <Widget>[
                    Stack(
                      children: [
                        Image.asset(LoginBackgroundimage),
                        Container(
                          height: 280,
                          decoration: BoxDecoration(
                            gradient: LinearGradient(
                              begin: Alignment.topCenter,
                              end: Alignment.bottomCenter,
                              colors: [
                                Colors.transparent,
                                Colors.white,
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                    Text(
                      appName,
                      style: TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      slogan,
                      style: TextStyle(
                        color: Colors.black54,
                      ),
                    ),
                    SizedBox(height: 10),
                    Row(
                      children: [
                        Container(
                          padding: EdgeInsets.all(20),
                          child: Text(
                            LoginString,
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 18,
                            ),
                          ),
                          decoration: BoxDecoration(
                            gradient: LinearGradient(colors: [
                              Colors.green.withOpacity(0.3),
                              Colors.white.withOpacity(0.1),
                            ]),
                            border: Border(
                              left: BorderSide(
                                color: Colors.green,
                                width: 7,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 10),
                    Container(
                      padding: EdgeInsets.all(20),
                      child: TextFormField(
                        keyboardType: TextInputType.emailAddress,
                        onSaved: (value) {
                          _email = value!;
                        },
                        validator: (email) {
                          if (email!.isEmpty)
                            return "Please Enter Email ";
                          else if (!RegExp(
                                  r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                              .hasMatch(email)) return "Its Not a Valid Email";
                          return null;
                        },
                        cursorColor: Colors.green,
                        decoration: InputDecoration(
                          focusedBorder: UnderlineInputBorder(
                              borderSide: BorderSide(color: Colors.green)),
                          labelStyle: TextStyle(color: Colors.green),
                          labelText: 'Enter Mail Address',
                          prefixIcon: Icon(
                            Icons.mail_outline,
                            color: Colors.green,
                          ),
                        ),
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.all(20),
                      child: TextFormField(
                        cursorColor: Colors.green,
                        obscureText: true,
                        onSaved: (value) {
                          _password = value!;
                        },
                        validator: (password) {
                          if (password!.isEmpty)
                            return "Enter a valid password";
                          else if (password.length < 8 || password.length > 15)
                            return "Enter Incurract";
                        },
                        decoration: InputDecoration(
                          focusedBorder: UnderlineInputBorder(
                              borderSide: BorderSide(color: Colors.green)),
                          labelStyle: TextStyle(color: Colors.green),
                          labelText: 'Enter Password',
                          prefixIcon: Icon(
                            Icons.lock_outline,
                            color: Colors.green,
                          ),
                        ),
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(
                              vertical: 0, horizontal: 15),
                          child: TextButton(
                            onPressed: () {},
                            child: Text(
                              'Forget Password?',
                              style: TextStyle(
                                color: Colors.black,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.all(20),
                      child: SizedBox(
                        height: 50,
                        width: 400,
                        child: FlatButton(
                          color: Colors.green,
                          onPressed: () {
                            if (formkey.currentState!.validate()) {
                              formkey.currentState!.save();
                              singIn(context);
                              // if(_email == "asdf@gmail.com" &&
                              //     _password == '12345678') {
                              //   FocusScope.of(context).unfocus();
                              //   Navigator.push(context, MaterialPageRoute(
                              //       builder: (context)=>homeScreen(),
                              //   ),);
                              // }
                              //
                              // else {
                              //   print('Inviled Longin Detils');
                              //
                              // }
                            }
                          },
                          child: Text('Login to Account'),
                          textColor: Colors.white,
                          shape: RoundedRectangleBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(7))),
                        ),
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text('Don\'t have account?'),
                        TextButton(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => createAccount(),
                              ),
                            );
                          },
                          child: Text(
                            'Creat Account',
                            style: TextStyle(
                              color: Colors.green,
                            ),
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ),
          ),
        ),
      );
}
