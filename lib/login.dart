// ignore_for_file: prefer_const_constructors, avoid_unnecessary_containers

import 'package:crossroads/functions/authfunctions.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
    final _formkey=GlobalKey<FormState>();
    bool isLogin=false;
    String email='';
    String password='';
    String username='';

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(5),
      child: Form(
        key: _formkey,
        child:Column(
          mainAxisAlignment: MainAxisAlignment.center,
          
          children: [
            SizedBox(height: 20,),
            !isLogin? TextFormField(
              validator: (value) {
                if(value.toString().length<6){
                  return 'Username is too small';
                }
                else
                {
                  return null;
                }
              },
              onSaved: (value){
                setState(() {
                  username=value!;
                });
              },
              key: ValueKey('username'),
              decoration: InputDecoration(
                hintText: 'Username',
                suffixIcon: Icon(Icons.person),
                border: OutlineInputBorder(),
              ),
            ) :Container(),
            SizedBox(height: 20,),
            TextFormField(
              validator:(value) {
                if(!(value.toString().contains('@'))){
                    return 'Invalid email';
                }
                else
                {
                  return null;
                }
              },
              onSaved: (value) {
                setState(() {
                  email=value!;
                });
                
              },
              key: ValueKey('email'),
              decoration: InputDecoration(
                hintText: 'Email',
                suffixIcon: Icon(Icons.email),
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 20,),
            TextFormField(
              obscureText: true,
              validator: (value) {
                if(value.toString().length<6){
                  return 'Password is too small';
                }
                else
                {
                  return null;
                }
              },
              onSaved: (value) {
                setState(() {
                   password=value!;
                });
               
              },
              key: ValueKey('password'),
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                hintText: 'Password',
                suffixIcon: Icon(Icons.password),
              ),              
            ),
            SizedBox(height: 10,),
            Container(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: (){
                  if(_formkey.currentState!.validate())
                  {
                     _formkey.currentState!.save();
                     
                     isLogin? signin(email,password)
                     : signup(email,password);
                  }
                  
              }, 
              child: isLogin? Text("LogIn") :Text("SignUp")),
            ),
            TextButton(
              onPressed: (){
                setState(() {
                  isLogin=!isLogin;
                });  
            }, 
            child:
              isLogin?
                Text("Don't have Account? Sign Up")
               :Text("Already Signed Up? Login")
             
            )
          ],
        ) ,
      ),
    );
  }
}