import 'package:flutter/material.dart';


void main() {
  runApp(SignIn());
}
class SignIn extends StatefulWidget {
  @override
  _SignInState createState() => _SignInState();
}

class _SignInState extends State<SignIn> {

var _formKey = GlobalKey<FormState>();

TextEditingController email =TextEditingController();
// TextEditingController password =TextEditingController();

  Widget show = Icon(Icons.error,color:Colors. white,size: 8,);
  Widget pass = Icon(Icons.block_rounded,color: Colors. white,size: 8,);

    Color buttonColor = Colors.lightBlue;

  void display(int view) {
    if (_formKey.currentState.validate()){
      show = Icon(Icons.verified,color: Colors.blue,size: 12,);
          buttonColor = Colors.red;
    }
    else if (_formKey.currentState.validate() == false){
      show = Icon(Icons.error,color:Colors. red,size: 8,);
      buttonColor = Colors.blue;
    }
    else{
      return null;
    }
  }

  Color resetColor = Colors.orange;
  Color passColor = Colors.blue;


  void updateColor(int change) {
    if (change == 2) {
      if (resetColor == Colors.orange) {
        resetColor = Colors.pink;
        passColor = Colors.blue;

      }
      else {
        resetColor = Colors.orange;
      }
    }
    if (change == 1) {
      if (passColor == Colors.blue) {
        passColor = Colors.yellowAccent;
        resetColor = Colors.orange;
      }
    }
    else {
      passColor = Colors.blue;
    }

    }





  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor:Colors.black,
        body: Center(
          child: Form(
            key: _formKey,
            child: Container(
              width: 250,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('Sign In',style:TextStyle(fontWeight: FontWeight.bold, fontSize: 22,color: Colors.white),),
                  SizedBox(height:80),
                  Text('WELCOME BACK',style:TextStyle(fontWeight: FontWeight.w500, fontSize: 18,color: Colors.white70),),
                  SizedBox(height:40,),

                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal:10,),
                    child: Card(
                      color: Colors.white,
                      child: TextFormField(
                            controller: email,
                            validator: (String value){
                                if(value.isEmpty){
                                return 'Email is required';
                                }

                                if(!RegExp("^[a-zA-Z0-9.!#%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,253}[a-zA-Z0-9])?(?:\.[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,253}[a-zA-Z0-9])?)*").hasMatch(value)){
                                return 'Enter a valid email address';

                                }
                                return null;
                            },
                            textAlign: TextAlign.start,
                            keyboardType: TextInputType.emailAddress ,
                            decoration: InputDecoration(

                              border: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: Colors.blue,
                                  width: 1.0,
                                  style: BorderStyle.solid,
                                ),
                              ),
                              suffixIcon: show,
                              hintText: 'Email Address', hintStyle:TextStyle(color: Colors.black),
                            ),
                          ),
                    ),
                  ),
                  SizedBox(height:22,),

              Padding(
                padding: const EdgeInsets.symmetric(horizontal:10,),
                child: Card(
                  color: Colors.white,
                  child: TextFormField(
                    obscureText: true,
                    textAlign: TextAlign.start,
                    keyboardType: TextInputType.text,
                    // controller: password,
                    // validator:(String value) {
                    //   if(value.isEmpty) {
                    //     return 'Password is required';
                    //   }
                    //   return null;
                    // },
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Colors.blue,
                          width: 1.0,
                          style: BorderStyle.solid,
                        ),
                      ),
                      suffixIcon: pass,
                      hintText: 'Password', hintStyle:TextStyle(color: Colors.black),
                    ),

                  ),
                ),
              ),


                  SizedBox(height:12,),

                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal:10,),
                    child: GestureDetector(
                      child: Card(
                        color: buttonColor,
                        child: SizedBox(width: 200, height:45,
                          child: Center(
                            child: Text('Sign In', style:TextStyle(color:Colors.white,),
                            ),
                          ),
                        ),
                      ),
                      onTap: (){
                        setState(() {
                          if(_formKey.currentState.validate()){
                            display(1);
                          }
                          else{
                            return null;
                          }
                        });
                      },
                    ),
                  ),
                  SizedBox(
                    height: 28,
                  ),
                  GestureDetector(
                      child: Text('Forgot Password?',style: TextStyle( color: passColor),),
                      onTap: () {
                        setState(() {
                          updateColor(1);
                        });
                      }
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  GestureDetector(
                    child: Text('Reset Password',style: TextStyle( color: resetColor),),
                    onTap: () {
                      setState(() {
                          updateColor(2);
                      });
                    }
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

