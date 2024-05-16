import 'package:flutter/material.dart';

// Explore Page
// All the modules will be placed here like alphabets, animals, etc...
// TODO: Implement the Explore Page

class ExplorePage extends StatelessWidget {
  const ExplorePage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
          child: SingleChildScrollView(
            child: Column(
              children: [
                Text(
                  "Explore",
                  style: Theme.of(context)
                      .textTheme
                      .titleLarge!
                      .copyWith(fontWeight: FontWeight.bold, fontSize: 30.0),
                ),
                ListView.builder(
                  itemBuilder: (context, index) {
                    return ListTile(title: Text("Module $index"), onTap: () {});
                  },
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
