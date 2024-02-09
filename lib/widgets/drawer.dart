import 'package:flutter/material.dart';
import 'package:learn/utils/routes.dart';

class MyDrawer extends StatelessWidget {
  const MyDrawer({Key? key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Container(
        color: Colors.white,
        child: Column(
          children: [
            const DrawerHeader(
              padding: EdgeInsets.all(0),
              decoration:
                  BoxDecoration(color: Color.fromARGB(255, 255, 255, 255)),
              child: UserAccountsDrawerHeader(
                margin: EdgeInsets.all(0),
                decoration:
                    BoxDecoration(color: Color.fromARGB(255, 255, 255, 255)),
                accountName: Text(
                  "Learning App for kids",
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                accountEmail: Text("Made by sapatevaibhav"),
                // currentAccountPicture: CircleAvatar(
                //   backgroundImage: AssetImage("assets/images/vaibhav.png"),
                // ),
              ),
            ),
            _buildListTile(
              icon: Icons.home,
              title: "Home",
              onTap: () {
                Navigator.pushReplacementNamed(context, AllRoutes.homeRoute);
              },
            ),
            _buildListTile(
              icon: Icons.text_fields,
              title: "A - Z",
              onTap: () {
                Navigator.pushNamed(context, AllRoutes.atozRoute);
              },
            ),
            _buildListTile(
              icon: Icons.pest_control_rodent_outlined,
              title: "Animals",
              onTap: () {
                Navigator.pushReplacementNamed(context, AllRoutes.animalRoute);
              },
            ),
            _buildListTile(
              icon: Icons.egg,
              title: "Birds",
              onTap: () {
                Navigator.pushReplacementNamed(context, AllRoutes.skillsRoute);
              },
            ),
            _buildListTile(
              icon: Icons.pentagon_outlined,
              title: "Shapes",
              onTap: () {
                Navigator.pushReplacementNamed(
                    context, AllRoutes.educationRoute);
              },
            ),
            _buildListTile(
              icon: Icons.back_hand_rounded,
              title: "Body parts",
              onTap: () {
                Navigator.pushReplacementNamed(
                    context, AllRoutes.projectsRoute);
              },
            ),
            _buildListTile(
              icon: Icons.sunny,
              title: "Solar System",
              onTap: () {
                Navigator.pushReplacementNamed(
                    context, AllRoutes.experienceRoute);
              },
            ),
            _buildListTile(
              icon: Icons.question_mark_outlined,
              title: "About us",
              onTap: () {
                Navigator.pushReplacementNamed(context, AllRoutes.contactRoute);
              },
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildListTile({
    required IconData icon,
    required String title,
    required VoidCallback onTap,
  }) {
    return ListTile(
      leading: Icon(icon),
      title: Text(title),
      onTap: onTap,
    );
  }
}
