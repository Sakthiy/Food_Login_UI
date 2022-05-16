import 'package:flutter/material.dart';
import 'package:oxyfood/Constants.dart';
import 'package:oxyfood/Login_Screen.dart';

class createAccount extends StatefulWidget {
  const createAccount({Key? key}) : super(key: key);

  @override
  _createAccountState createState() => _createAccountState();
}

class _createAccountState extends State<createAccount> {
  void _showDialog(){
    showDialog(context: context, builder: (context){
      return AlertDialog(
        title: Text('Do You Go Back Sure'),
        actions: [
          MaterialButton(onPressed: (){
            Navigator.push(context, MaterialPageRoute(builder: (context)=>Login_Screen(),
            ),
            );
          },
          child: Text('Yes'),
          ),
          MaterialButton(onPressed: (){
            Navigator.pop(context);
          },
            child: Text('No'),
          ),
        ],
      );
    });
  }
  @override
  Widget build(BuildContext context) => Scaffold(
        backgroundColor: Colors.white,
        body: SafeArea(
            child: SingleChildScrollView(
                child: Column(
                  children: [
                    Stack(
                      children: [
                        Image.asset('images/Food.jpg'),
                        Container(
                          height: 280,
                          decoration: BoxDecoration(
                              color: Colors.red,
                              gradient: LinearGradient(
                                  begin: Alignment.topCenter,
                                  end: Alignment.bottomCenter,
                                  colors: [
                                    Colors.transparent,
                                    Colors.white,
                                  ]
                              )
                          ),
                        ),
                      ],
                    ),
                    Text(appName,
                    style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                    ),
                    ),
                    Text(slogan1),
                    SizedBox(height: 10),
                    Row(
                      children: [
                        Container(
                          padding: EdgeInsets.all(20),
                          decoration: BoxDecoration(
                            gradient: LinearGradient(
                              colors: [
                                Colors.green.withOpacity(0.1),
                                Colors.white.withOpacity(0.3),
                              ]
                            ),
                            border: Border(
                              left: BorderSide(width: 5,color: Colors.green)
                            ),
                          ),
                          child: Text(createAccountName,
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 18,
                            ),
                          ),
                        ),
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.all(20),
                      child: TextFormField(
                        cursorColor: Colors.green,
                        decoration: InputDecoration(
                          focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(
                              color: Colors.green,
                            ),
                          ),
                          labelText: 'Name',
                          labelStyle: TextStyle(color: Colors.green),
                          prefixIcon: Icon(Icons.person_outlined,
                          color: Colors.green,
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(20),
                      child: TextFormField(
                        cursorColor: Colors.green,
                        decoration: InputDecoration(
                          focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(
                              color: Colors.green,
                            ),
                          ),
                          labelText: 'Email Address',
                          labelStyle: TextStyle(color: Colors.green),
                          prefixIcon: Icon(Icons.mail_outline,
                            color: Colors.green,
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(20),
                      child: TextFormField(
                        cursorColor: Colors.green,
                        obscureText: true,
                        decoration: InputDecoration(
                          focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(
                              color: Colors.green,
                            ),
                          ),
                          labelText: 'Create New Password',
                          labelStyle: TextStyle(color: Colors.green),
                          prefixIcon: Icon(Icons.lock_outline,
                            color: Colors.green,
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(20),
                      child: SizedBox(
                        height: 40,
                        width: 400,
                        child: FlatButton(onPressed: (){},
                          color: Colors.green,
                            child: Text('Submit'),
                          textColor: Colors.white,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.all(Radius.circular(8),
                            ),
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8),
                      child: FlatButton(
                        onPressed: _showDialog,
                        child: Text('Go Back',
                        style: TextStyle(
                          color: Colors.green,
                        ),
                        ),
                      ),
                    ),
                  ],
                ),
            ),
        ),
      );
}
