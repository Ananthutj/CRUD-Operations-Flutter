// ignore_for_file: prefer_const_constructors

import 'package:crossroads/model/usermodel.dart';
import 'package:crossroads/remote_data_source/firestore_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class EditPage extends StatefulWidget {
  final UserModel user;
  const EditPage({super.key,required this.user});

  @override
  State<EditPage> createState() => _EditPageState();
}

class _EditPageState extends State<EditPage> {

  TextEditingController? _usernameController;
  TextEditingController? _ageController;

  @override
  void initState() {
    // TODO: implement initState
    _usernameController=TextEditingController(text: widget.user.username);
    _ageController=TextEditingController(text: widget.user.age);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Edit Page"),
        backgroundColor: Colors.blue,
      ),
      body: Padding(
        padding: EdgeInsets.all(20),
        child: Column(
          
          children: [
            TextFormField(
              controller: _usernameController,
              decoration: InputDecoration(
                  border: OutlineInputBorder(), hintText: 'Username...'),
            ),
            SizedBox(height: 20,),
            TextFormField(
              controller: _ageController,
              decoration: InputDecoration(
                  border: OutlineInputBorder(), hintText: 'Age...'),
            ),
            ElevatedButton.icon(
                onPressed: () {
                  FirestoreHelper.update(UserModel(username: _usernameController!.text,age: _ageController!.text,id: widget.user.id)).then((value) => {
                    Navigator.pop(context)
                  });
                  // FirestoreHelper.create(UserModel(
                  //     username: _usernameController.text,
                  //     age: _ageController.text));
                },
                icon: Icon(Icons.add),
                label: Text("Update"),
                style: ElevatedButton.styleFrom(backgroundColor: Color.fromARGB(255, 56, 107, 57)),
              ),
          ],
        ),
      ),
    );
  }
}