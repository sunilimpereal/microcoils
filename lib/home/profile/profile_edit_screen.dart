import 'package:flutter/material.dart';
import 'package:microcoils/home/profile/widgets/app_bar.dart';
import 'package:microcoils/main.dart';

import '../../utils/screen.dart';

class ProfileEditScreen extends StatefulWidget {
  const ProfileEditScreen({super.key});

  @override
  State<ProfileEditScreen> createState() => _ProfileEditScreenState();
}

class _ProfileEditScreenState extends State<ProfileEditScreen> {
  TextEditingController nameController = TextEditingController();
  TextEditingController companyController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController addressController = TextEditingController();

  @override
  void initState() {
    nameController.text = sharedPref.name;
    companyController.text = sharedPref.company;
    phoneController.text = sharedPref.number;
    emailController.text = sharedPref.email;
    addressController.text = sharedPref.address;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Screen(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Column(
            children: [
              const CustomAppBar(title: "Edit Profile"),
              Column(
                children: [
                  fieldEditior(
                    textEditingController: nameController,
                    leagingIconData: Icons.person,
                    trailingIconData: Icons.edit,
                    subtitle: "Name",
                  ),
                  fieldEditior(
                    textEditingController: companyController,
                    leagingIconData: Icons.work,
                    trailingIconData: Icons.edit,
                    subtitle: "Company",
                  ),
                  fieldEditior(
                    textEditingController: phoneController,
                    leagingIconData: Icons.phone,
                    trailingIconData: Icons.edit,
                    subtitle: "Phone",
                  ),
                  fieldEditior(
                    textEditingController: emailController,
                    leagingIconData: Icons.email,
                    trailingIconData: Icons.edit,
                    subtitle: "Email",
                  ),
                  fieldEditior(
                    textEditingController: addressController,
                    leagingIconData: Icons.location_history_rounded,
                    trailingIconData: Icons.edit,
                    subtitle: "Address",
                  ),
                  Container(
                    padding: const EdgeInsets.all(8),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        ElevatedButton(
                            onPressed: () {
                              sharedPref.setUserDetails(
                                  id: sharedPref.id,
                                  email: emailController.text,
                                  name: nameController.text,
                                  company: companyController.text,
                                  number: phoneController.text,
                                  address: addressController.text,
                                  photoUrl: sharedPref.photoUrl);
                              Navigator.pop(context);
                            },
                            child: const Padding(
                              padding: EdgeInsets.all(16.0),
                              child: Text(
                                "Save",
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                            ))
                      ],
                    ),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget fieldEditior({
    required TextEditingController textEditingController,
    required IconData leagingIconData,
    required IconData trailingIconData,
    required String subtitle,
  }) {
    return ListTile(
      leading: Icon(leagingIconData),
      title: TextField(
        controller: textEditingController,
        decoration: const InputDecoration(isDense: true),
      ),
      subtitle: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Text(subtitle),
      ),
      trailing: Icon(
        trailingIconData,
        size: 16,
      ),
    );
  }
}
