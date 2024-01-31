import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class FirestoreExample extends StatefulWidget {
  @override
  _FirestoreExampleState createState() => _FirestoreExampleState();
}

class _FirestoreExampleState extends State<FirestoreExample> {
  final FirebaseFirestore firestore = FirebaseFirestore.instance;

  // Example: Retrieve data from a specific subcollection document using document ID
  Future<void> getDataFromSubCollection(
      String mainCollection, String documentId, String subCollection) async {
    try {
      DocumentSnapshot documentSnapshot = await firestore
          .collection(mainCollection)
          .doc(documentId)
          .collection(subCollection)
          .doc(documentId)
          .get();

      if (documentSnapshot.exists) {
        Map<String, dynamic> data =
            documentSnapshot.data() as Map<String, dynamic>;
        log("Data from subcollection: $data");
      } else {
        log("Document not found in the subcollection.");
      }
    } catch (e) {
      log("Error fetching data from subcollection: $e");
    }
  }

  // Example: Retrieve all documents from a collection
  void getAllDocumentsFromCollection(String collection) {
    firestore.collection(collection).get().then((QuerySnapshot querySnapshot) {
      for (QueryDocumentSnapshot document in querySnapshot.docs) {
        Map<String, dynamic> data = document.data() as Map<String, dynamic>;
        log("Data from collection: $data");
      }
    }).catchError((error) {
      log("Error fetching data from collection: $error");
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Firestore Example'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () async {
                // Example usage: Retrieve data from a specific subcollection document using document ID
                await getDataFromSubCollection(
                    'mainCollection', 'document1', 'subCollection');
              },
              child: const Text('Get Data from Subcollection'),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                // Example usage: Retrieve all documents from a collection
                getAllDocumentsFromCollection("RecipeType");
              },
              child: const Text('Get All Documents from Collection'),
            ),
          ],
        ),
      ),
    );
  }
}
