import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:microcoils/home/profile/profile_edit_screen.dart';
import 'package:microcoils/home/profile/settings/settings_screen.dart';
import 'package:microcoils/home/screen/widgets/drawer.dart';
import 'package:microcoils/utils/constants/color_constants.dart';
import 'package:microcoils/utils/shared_preferences.dart';

import '../../authentication/screens/login.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  void initState() {
    super.initState();
  }

  final _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.sort),
          onPressed: () {
            _scaffoldKey.currentState?.openDrawer();
          },
        ),
        title: Text("Profile"),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.of(context)
                  .push(
                CupertinoPageRoute(
                  builder: (context) => const ProfileEditScreen(),
                ),
              )
                  .then((value) {
                setState(() {});
              });
            },
            icon: const Icon(
              Icons.edit_note,
            ),
          ),
        ],
      ),
      drawer: AppDrawer(),
      body: Column(
        children: [
          // Container(
          //   padding: const EdgeInsets.symmetric(vertical: 24, horizontal: 16),
          //   child: Row(
          //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
          //     children: [
          //       const Text(
          //         "Profile",
          //         style: TextStyle(
          //           fontSize: 20,
          //           fontStyle: FontStyle.italic,
          //           fontWeight: FontWeight.bold,
          //         ),
          //       ),
          //     ],
          //   ),
          // ),
          nameSection(),
          detailSection(),
          buttons()
        ],
      ),
    );
  }

  Widget nameSection() {
    Size size = MediaQuery.of(context).size;
    return SizedBox(
      width: size.width,
      height: size.height * 0.2,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          // profile image
          Stack(
            children: [
              Container(
                width: size.width * 0.3,
                height: size.width * 0.3,
                decoration: BoxDecoration(
                  color: ColorConstants.primary.shade200,
                  borderRadius: BorderRadius.circular(100),
                  image: sharedPrefs.photoUrl != ""
                      ? DecorationImage(
                          image: NetworkImage(sharedPrefs.photoUrl),
                          fit: BoxFit.cover,
                        )
                      : const DecorationImage(
                          image: AssetImage("assets/images/user_placeholder.png"),
                          fit: BoxFit.cover,
                        ),
                ),
              ),
              Positioned(
                bottom: 0,
                right: 0,
                child: IconButton(
                  onPressed: () {},
                  icon: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(80),
                      color: ColorConstants.primary,
                    ),
                    child: const Center(
                      child: Icon(
                        Icons.add,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
          // name card
          SizedBox(
            width: size.width * 0.6,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                //name
                Container(
                  padding: const EdgeInsets.all(4),
                  child: Text(
                    sharedPrefs.name,
                    style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                  ),
                ),
                //comapny name
                Container(
                  padding: const EdgeInsets.all(4),
                  child: const Text(
                    "Blue Cold",
                    style: TextStyle(),
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget detailSection() {
    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.4,
      child: ListView(
        children: [
          detailTile(name: "Phone", detail: sharedPrefs.number, icon: CupertinoIcons.phone_fill),
          detailTile(name: "Email", detail: sharedPrefs.email, icon: CupertinoIcons.mail_solid),
          detailTile(name: "Address", detail: sharedPrefs.address, icon: CupertinoIcons.location_solid)
        ],
      ),
    );
  }

  Widget detailTile({required String name, required String detail, required IconData icon}) {
    return ListTile(
      leading: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(icon),
        ],
      ),
      title: detail != ""
          ? Text(detail)
          : GestureDetector(
              onTap: () {
                Navigator.of(context)
                    .push(
                  CupertinoPageRoute(
                    builder: (context) => const ProfileEditScreen(),
                  ),
                )
                    .then((value) {
                  setState(() {});
                });
              },
              child: Text(
                "Add $name",
                style: TextStyle(color: ColorConstants.primary),
              ),
            ),
      subtitle: Text(name),
    );
  }

  Widget buttons() {
    return Column(
      children: [
        ListTile(
          onTap: () {
            Navigator.of(context).push(
              CupertinoPageRoute(
                builder: (context) => const SettingsScreen(),
              ),
            );
          },
          leading: const Icon(Icons.settings),
          title: const Text(
            "Settings",
            style: TextStyle(
              color: Colors.black,
            ),
          ),
        ),
        ListTile(
          onTap: () {
            sharedPrefs.setLoggedOut();
            Navigator.of(context).pushReplacement(
              CupertinoPageRoute(
                builder: (context) => const LoginScreen(),
              ),
            );
          },
          leading: Icon(
            Icons.logout,
            color: Colors.red.shade900,
          ),
          title: Text(
            "Logout",
            style: TextStyle(
              color: Colors.red.shade900,
            ),
          ),
        )
      ],
    );
  }
}
