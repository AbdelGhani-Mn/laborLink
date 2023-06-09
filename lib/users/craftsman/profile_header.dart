// ignore_for_file: no_leading_underscores_for_local_identifiers, prefer_const_declarations, library_private_types_in_public_api

import 'package:flutter/material.dart';
import 'package:laborlink/users/craftsman/craftsman_editing_page.dart';
import 'package:laborlink/users/craftsman/pro_upgrade_page.dart';
import 'package:laborlink/users/model/craftsman.dart';
import 'package:laborlink/widgets/responsive_button.dart';

import '../../widgets/app_large_text.dart';
import '../../widgets/app_text.dart';
import '../../widgets/numbers_widget.dart';
import '../../widgets/profile_widget.dart';
import '../utils/craftsman_preferences.dart';

class ProfileHeader extends StatefulWidget {
  const ProfileHeader(BuildContext context, {super.key});

  @override
  _ProfileHeaderState createState() => _ProfileHeaderState();
}

class _ProfileHeaderState extends State<ProfileHeader> {
  final craftsman = CraftsmanPreferences.getCraftsman();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.center,
         
      children: [
              SizedBox(
                height: 15,
                child: const Padding(
                  padding: EdgeInsets.only(right: 10, left: 10),
                ),
              ),
              ProfileWidget(
                imagePath: craftsman.imagePath,
                onClicked: () async{
                  await Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) => CraftsmanProfileEditing())
                  );
                  setState(() { });
                },
              ),
              const SizedBox(height: 10),
              buildName(craftsman),
              const SizedBox(height: 10),
              GestureDetector(
              onTap: (){
                
                Navigator.push(
                  context,
                   MaterialPageRoute(builder: (context) => const UpgradeToPro(),)
                   );
              },
              child: ResponsiveButton(
                text: "Upgrade to pro",
                width: 220,
              ),
            ),
              //Social Icons

              /*Row(    
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  buildSocialIcon(FontAwesomeIcons.facebook),
                  SizedBox(width: 8),
                  buildSocialIcon(FontAwesomeIcons.twitter),
                  SizedBox(width: 8),
                  buildSocialIcon(FontAwesomeIcons.linkedin),
                  SizedBox(width: 8),
                  buildSocialIcon(FontAwesomeIcons.instagram),
                
                  ],
              ),*/
              SizedBox(
                height: 6,
              ), // + padding 4
              NumbersWidget(),
              SizedBox(
                height: 20,
              ),
              buildAbout(craftsman),
              SizedBox(height: 20,),
      ],
  
    ),
  );
}

    Widget buildAbout(Craftsman craftsman) {
    return Container(
      padding: EdgeInsets.only(left: 40, right: 40),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          AppLargeText(
            text: 'About',
            size: 22,
          ),
          SizedBox(
            height: 4,
          ),
          AppText(
            text: craftsman.bio,
            color: Colors.black,
          )
        ],
      ),
    );
  }
  Widget buildName(Craftsman craftsman) => Column(
        children: [
          Text(
            craftsman.fullName,
            style: TextStyle(fontWeight: FontWeight.w600, fontSize: 22),
          ),
          SizedBox(
            height: 4,
          ),
          AppText(
            text: craftsman.about,
            size: 16,
          )
        ],
      );
/*    Widget buildSocialIcon(IconData icon) {
    return CircleAvatar(
      radius: 25,
      child: Material(
        shape: CircleBorder(),
        clipBehavior: Clip.hardEdge,
        color: AppColors.mainColor,
        child: InkWell(
          onTap: () {},
          child: Center(
              child: Icon(
            icon,
            size: 32,
            color: Colors.white,
          )),
        ),
      ),
    );
  }*/

}