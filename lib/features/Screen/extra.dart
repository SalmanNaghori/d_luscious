import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:d_luscious/core/constant/colors_const.dart';
import 'package:d_luscious/features/d_luscious.dart';
import 'package:d_luscious/features/model/recipe_model.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../../core/widgets/network_image.dart';

class DemoScreen extends StatefulWidget {
  const DemoScreen({Key? key}) : super(key: key);

  @override
  State<DemoScreen> createState() => _DemoScreenState();
}

class _DemoScreenState extends State<DemoScreen> {
  List<Map<String, dynamic>> dataMapList = [];
  final FirebaseAuth _auth = FirebaseAuth.instance;

  final db = FirebaseFirestore.instance;

  @override
  void initState() {
    // getAllDocumentIds();

    super.initState();
  }

  Future<void> getAllDocumentIds() async {
    DateTime startTime = DateTime.now();
    log("Fetching document IDs started at: $startTime");

    QuerySnapshot<Map<String, dynamic>> querySnapshot =
        await db.collection("recipeTypes").get();

    DateTime fetchDataStartTime = DateTime.now();
    log("Fetching data started at: $fetchDataStartTime");

    List<Future<void>> fetchTasks = [];

    for (var doc in querySnapshot.docs) {
      String documentId = doc.id;
      if (!documentIdAlreadyFetched(documentId)) {
        fetchTasks.add(getAllDataFromCollection(documentId));
      }
    }

    await Future.wait(fetchTasks);

    DateTime fetchDataEndTime = DateTime.now();
    log("Fetching data ended at: $fetchDataEndTime");
    log("Time taken to fetch data: ${fetchDataEndTime.difference(fetchDataStartTime)}");

    DateTime endTime = DateTime.now();
    log("Fetching document IDs ended at: $endTime");
    log("Total time taken: ${endTime.difference(startTime)}");
  }

  bool documentIdAlreadyFetched(String documentId) {
    return dataMapList.any((dataMap) => dataMap['documentId'] == documentId);
  }

  Future<void> getAllDataFromCollection(String documentId) async {
    log("Fetching data for documentId: $documentId");

    await db.collection("recipeTypes").doc(documentId).get().then(
      (docSnapshot) async {
        if (docSnapshot.exists) {
          // log("Found document: ${docSnapshot.data()}");
          var recipeTypeData = docSnapshot.data();

          RecipeType recipeType = RecipeType.fromJson(recipeTypeData);
          // log("${docSnapshot.id} => ${docSnapshot.data()}");

          // Now fetching the recipes subcollection
          await db
              .collection("recipeTypes")
              .doc(documentId)
              .collection("recipes")
              .get()
              .then(
            (value) {
              // List to store recipes data
              List<Map<String, dynamic>> recipesList = [];
              for (var recipeSnapShot in value.docs) {
                // log("${recipeSnapShot.id} => ${recipeSnapShot.data()}");
                recipesList.add(recipeSnapShot.data());
              }

              // Adding recipeType and its recipes to the map list
              dataMapList.add({
                "documentId": documentId,
                "recipeType": recipeType,
                "recipes": recipesList,
              });
            },
            onError: (error) => log("Error fetching recipes: $error"),
          );
        } else {
          log("Document does not exist");
        }
      },
      onError: (error) => log("Error fetching recipeType document: $error"),
    );
    MyApp.logger.e("Data Map: $dataMapList");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ConstColor.whiteColor,
      appBar: AppBar(
        title: const Text(
          'Recipes',
          style: TextStyle(color: Colors.amber),
        ),
      ),
      body: FutureBuilder(
        future: getAllDocumentIds(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else {
            return _buildDataDisplay();
          }
        },
      ),
    );
  }

  // Inside _DemoScreenState

  Widget _buildDataDisplay() {
    return ListView.builder(
      itemCount: dataMapList.length,
      itemBuilder: (context, index) {
        Map<String, dynamic> recipeTypeInfo = dataMapList[index];
        RecipeType recipeType = recipeTypeInfo['recipeType'];
        List<dynamic> recipes = recipeTypeInfo['recipes'] ?? [];

        return ExpansionTile(
          title: Text(recipeType.typeName),
          children: <Widget>[
            // Use ListView.builder for the list of recipes
            ListView.builder(
              shrinkWrap: true,
              physics: const ClampingScrollPhysics(),
              itemCount: recipes.length,
              itemBuilder: (context, index) {
                Recipe recipeData = Recipe.fromJson(recipes[index]);

                return ListTile(
                  title: Text(recipeData.name),
                  subtitle: Text('Type: ${recipeType.typeName}'),
                  leading: CachedImage(
                    redius: 10,
                    height: 100,
                    width: 100,
                    image: recipeData.image,
                  ),
                );
              },
            ),
          ],
        );
      },
    );
  }
}
