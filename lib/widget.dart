import 'package:flutter/material.dart';

class Myquare extends StatelessWidget {
  const Myquare({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        height: 200,
        child: ListView(
          scrollDirection: Axis.horizontal,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: InkWell(
                onTap: () {},
                child: Container(
                    width: 350,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: Colors.grey),
                    child: const Center(
                      child: Text(
                        "ListView 1",
                        style: TextStyle(fontSize: 32, color: Colors.white),
                      ),
                    )),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
