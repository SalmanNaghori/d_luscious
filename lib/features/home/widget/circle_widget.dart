import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:d_luscious/core/navigator/navigator.dart';
import 'package:d_luscious/features/d_luscious.dart';
import 'package:d_luscious/features/home/widget/commun_list_shimmer_widget.dart';
import 'package:d_luscious/features/home/widget/grid_view.dart';
import 'package:d_luscious/features/home/widget/listview_widget.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';

class CircleWidget extends StatefulWidget {
  const CircleWidget({super.key});

  @override
  State<CircleWidget> createState() => _CircleWidgetState();
}

class _CircleWidgetState extends State<CircleWidget> {
  ValueNotifier<int> selectedFoodIndex = ValueNotifier<int>(0);
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final db = FirebaseFirestore.instance;
  //TODO: DOCIDv
  List<String> docId = [];

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: getAllDocumentIds(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const CommunListShimmerWidget(
            fontSize: 18,
            height: 120,
            radius: 35,
            title: "",
          );
        } else if (snapshot.hasError) {
          return Center(child: Text('Error: ${snapshot.error}'));
        } else {
          return Column(
            children: [
              ListViewWidget(
                selectedFoodIndex: selectedFoodIndex,
                selectedFood: (value) {
                  MyApp.logger.d("out side $value");
                  selectedFoodIndex.value = value;
                },
                id: docId,
              ),
              Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8),
                  child: ValueListenableBuilder(
                    valueListenable: selectedFoodIndex,
                    builder: (context, selectedIndex, _) {
                      gridViewKey.currentState?.refresh(docId[selectedIndex]);

                      return GridViewWidget(
                        key: gridViewKey,
                        selectedId: docId[selectedIndex],
                      );
                    },
                  )),
            ],
          );
        }
      },
    );
  }

  //Todo:Get Data from Firebase
  Future getAllDocumentIds() async {
    QuerySnapshot querySnapshot = await db.collection("recipeTypes").get();

    for (var document in querySnapshot.docs) {
      // MyApp.logger.f("document.id========${document.id}");
      docId.add(document.id);
    }
  }
}
