// ignore_for_file: deprecated_member_use

import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:laborlink/users/craftsman/craftsman_home_page.dart';
import 'package:laborlink/users/model/craftsman.dart';
import 'package:laborlink/users/utils/craftsman_preferences.dart';
import 'package:laborlink/widgets/profile_widget.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart';
import '../../widgets/responsive_button.dart';
import '../../widgets/textfield_widget.dart';

class CraftsmanProfileEditing extends StatefulWidget {
  const CraftsmanProfileEditing({super.key});

  @override
  State<CraftsmanProfileEditing> createState() =>
      _CraftsmanProfileEditingState();
}

class _CraftsmanProfileEditingState extends State<CraftsmanProfileEditing> {
  late Craftsman craftsman;

  @override
  void initState(){
    super.initState();

    craftsman = CraftsmanPreferences.getCraftsman();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(50),
        child: Container(
          padding: const EdgeInsets.only(left: 7, right: 7, top: 0),
          decoration: const BoxDecoration(
            border: Border(
              bottom: BorderSide(color: Colors.white),
            ),
          ),
          child: AppBar(
            elevation: 0,
            backgroundColor: Colors.white,
            leading: IconButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const CraftsmanHomePage(),
                      ));
                },
                icon: Icon(
                  Icons.arrow_back,
                  color: Colors.black,
                )),
            actions: [
              IconButton(
                  onPressed: () {},
                  icon: const Icon(
                    CupertinoIcons.moon_stars,
                    color: Colors.black,
                  ))
            ],
          ),
        ),
      ),
      body: ListView(
        padding: EdgeInsets.symmetric(horizontal: 32),
        physics: BouncingScrollPhysics(),
        children: [
          ProfileWidget(
            imagePath: craftsman.imagePath,
            isEdit: true,
            onClicked: () async {
              
                    final pickedImage = await ImagePicker()
                        .getImage(source: ImageSource.gallery);

                    if (pickedImage == null) return;

                    final directory = await getApplicationDocumentsDirectory();
                    final name = basename(pickedImage.path);
                    final imageFile = File('${directory.path}/$name');
                    final newImage =
                        await File(pickedImage.path).copy(imageFile.path);

                    setState(() { craftsman = craftsman.copy(imagePath: newImage.path);
                    });
            },
          ),
          const SizedBox(height: 24),
          TextFieldWidget(
            label: 'Full Name',
            text: craftsman.fullName,
            onChanged: (fullName) => craftsman = craftsman.copy(fullName: fullName),
          ),
          const SizedBox(height: 24),
          TextFieldWidget(
            label: 'Job',
            text: craftsman.about,
            onChanged: (about) => craftsman = craftsman.copy(about: about),
          ),
          const SizedBox(height: 24),
          TextFieldWidget(
            label: 'About',
            text: craftsman.bio,
            maxLines: 5,
            onChanged: (bio) => craftsman = craftsman.copy(bio: bio),
          ),
          const SizedBox(height: 24),
          GestureDetector(
            onTap: () {
              CraftsmanPreferences.setCraftsman(craftsman);
              
                  Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const CraftsmanHomePage(),
                      ));
            },
            child: ResponsiveButton(
              text: "Save",
              width: 220,
            ),
          ),
        ],
      ),
    );
  }
}
