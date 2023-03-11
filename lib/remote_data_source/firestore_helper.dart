// ignore_for_file: unused_catch_clause, non_constant_identifier_names, avoid_types_as_parameter_names

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:crossroads/model/usermodel.dart';
import 'package:firebase_auth/firebase_auth.dart';

class FirestoreHelper {
  static Stream<List<UserModel>> read() {
    final userCollection = FirebaseFirestore.instance.collection("user");
    return userCollection.snapshots().map((QuerySnapshot) =>
        QuerySnapshot.docs.map((e) => UserModel.fromSnapShot(e)).toList());
  }

  static Future create(UserModel user) async {
    final usercollection = FirebaseFirestore.instance.collection("user");
    final uid = usercollection.doc().id;
    final docRef = usercollection.doc(uid);
    final newUser = UserModel(
      username: user.username,
      age: user.age,
      id: uid,
    ).toJson();

    try {
      await docRef.set(newUser);
    } on Exception catch (e) {
      // TODO
    }

    // ignore: empty_catches
  }

  static Future update(UserModel user) async {
    final usercollection = FirebaseFirestore.instance.collection("user");
   
    final docRef = usercollection.doc(user.id);
    final newUser = UserModel(
      username: user.username,
      age: user.age,
      id: user.id,
    ).toJson();

    try {
      await docRef.update(newUser);
    } on Exception catch (e) {
      // TODO
    }

    // ignore: empty_catches
  }

  static Future delete(UserModel user)async{
    final userCollection=FirebaseFirestore.instance.collection("user");
    final docRef=userCollection.doc(user.id).delete();
  }
}
