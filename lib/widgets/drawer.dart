import 'package:flutter/material.dart';
import 'package:learn/utils/routes.dart';

class MyDrawer extends StatelessWidget {
  const MyDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Drawer(
      child: Container(
        color: theme.canvasColor,
        child: Column(
          children: [
            DrawerHeader(
              padding: EdgeInsets.all(0),
              decoration: BoxDecoration(color: theme.canvasColor),
              child: UserAccountsDrawerHeader(
                margin: EdgeInsets.all(0),
                decoration: BoxDecoration(color: theme.canvasColor),
                accountName: Text(
                  "Learning App for kids",
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: theme.textTheme.headline6
                          ?.color), // Use theme's text color
                ),
                accountEmail: Text("Made by sapatevaibhav",
                    style: TextStyle(
                        color: theme.textTheme.bodyText1
                            ?.color)), // Use theme's text color
                currentAccountPicture: CircleAvatar(
                  backgroundImage: AssetImage("assets/images/dp.png"),
                ),
              ),
            ),
            _buildListTile(
              icon: Icons.home,
              title: "Home",
              onTap: () {
                Navigator.pushReplacementNamed(context, AllRoutes.homeRoute);
              },
              context: context,
            ),
            _buildListTile(
              icon: Icons.text_fields,
              title: "A - Z",
              onTap: () {
                Navigator.pushNamed(context, AllRoutes.atozRoute);
              },
              context: context,
            ),
            _buildListTile(
              icon: Icons.pest_control_rodent_outlined,
              title: "Animals",
              onTap: () {
                Navigator.pushNamed(context, AllRoutes.animalRoute);
              },
              context: context,
            ),
            _buildListTile(
              icon: Icons.egg,
              title: "Birds",
              onTap: () {
                Navigator.pushReplacementNamed(context, AllRoutes.birdsRoute);
              },
              context: context,
            ),
            _buildListTile(
              icon: Icons.pentagon_outlined,
              title: "Shapes",
              onTap: () {
                Navigator.pushReplacementNamed(context, AllRoutes.shapesRoute);
              },
              context: context,
            ),
            _buildListTile(
              icon: Icons.back_hand_rounded,
              title: "Body parts",
              onTap: () {
                Navigator.pushNamed(context, AllRoutes.partsRoute);
              },
              context: context,
            ),
            _buildListTile(
              icon: Icons.sunny,
              title: "Solar System",
              onTap: () {
                Navigator.pushReplacementNamed(context, AllRoutes.solarRoute);
              },
              context: context,
            ),
            _buildListTile(
              icon: Icons.question_mark_outlined,
              title: "About us",
              onTap: () {
                Navigator.pushNamed(context, AllRoutes.aboutRoute);
              },
              context: context,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildListTile({
    required BuildContext context, // Receive the context here
    required IconData icon,
    required String title,
    required VoidCallback onTap,
  }) {
    return ListTile(
      leading: Icon(icon),
      title: Text(
        title,
        style: TextStyle(color: Theme.of(context).textTheme.bodyText1?.color),
      ),
      onTap: onTap,
    );
  }
}
