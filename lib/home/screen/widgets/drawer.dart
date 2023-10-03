import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:microcoils/home/profile/profile_screen.dart';
import 'package:microcoils/home/profile/settings/aboutus_screen.dart';
import 'package:microcoils/home/screen/home_screen.dart';
import 'package:microcoils/utils/constants/image_constaants.dart';

class AppDrawer extends StatefulWidget {
  const AppDrawer({super.key});

  @override
  State<AppDrawer> createState() => _AppDrawerState();
}

class _AppDrawerState extends State<AppDrawer> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 36, horizontal: 16),
      child: Container(
        clipBehavior: Clip.hardEdge,
        decoration: BoxDecoration(borderRadius: BorderRadius.circular(16)),
        child: Drawer(
            width: MediaQuery.of(context).size.width * 0.7,
            // backgroundColor: Theme.of(context).primaryColor,
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 24.0),
              child: Column(
                children: [
                  ListTile(
                    title: Container(
                      width: 100,
                      height: 50,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage(ImageConstants.microCoolLogo),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  tile(
                      title: "Home",
                      icon: Icons.home,
                      onTap: () {
                        Navigator.pop(context);
                        Navigator.of(context).pushReplacement(CupertinoPageRoute(builder: (context) => HomeScreen()));
                      }),
                  tile(
                      title: "Profile",
                      icon: Icons.person,
                      onTap: () {
                        Navigator.pop(context);
                        Navigator.of(context).pushReplacement(CupertinoPageRoute(builder: (context) => ProfileScreen()));
                      }),
                  tile(
                      title: "About Us",
                      icon: Icons.photo_album_outlined,
                      onTap: () {
                        Navigator.pop(context);
                        Navigator.of(context).pushReplacement(CupertinoPageRoute(builder: (context) => AboutUsScreen()));
                      }),
                ],
              ),
            )),
      ),
    );
  }

  Widget tile({
    required String title,
    required IconData icon,
    required Function() onTap,
  }) {
    return ListTile(
      onTap: () {
        onTap();
      },
      leading: Icon(
        icon,
        color: Theme.of(context).primaryColor,
      ),
      title: Text(
        title,
        style: TextStyle(
          fontWeight: FontWeight.bold,
          color: Theme.of(context).primaryColor,
        ),
      ),
    );
  }
}
