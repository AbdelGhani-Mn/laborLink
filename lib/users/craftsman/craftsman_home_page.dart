// ignore_for_file: unused_import, prefer_const_declarations

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:laborlink/users/craftsman/notifications_tab.dart';
import 'package:laborlink/users/craftsman/posts_tab.dart';
import 'package:laborlink/users/craftsman/profile_header.dart';
import 'package:laborlink/users/utils/craftsman_preferences.dart';
import 'package:laborlink/widgets/app_large_text.dart';
import 'package:laborlink/widgets/app_text.dart';
import 'package:laborlink/widgets/numbers_widget.dart';
import 'package:laborlink/widgets/responsive_button.dart';

import '../../misc/colors.dart';
import '../../pages/Signin_page.dart';
import '../../widgets/profile_widget.dart';
import '../model/craftsman.dart';

class CraftsmanHomePage extends StatefulWidget {
  const CraftsmanHomePage({super.key});

  @override
  State<CraftsmanHomePage> createState() => _CraftsmanHomePageState();
}

class _CraftsmanHomePageState extends State<CraftsmanHomePage> {

    final GlobalKey<ScaffoldState> _globalKey = GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _globalKey,
        appBar: PreferredSize(
          preferredSize: const Size.fromHeight(50),
          child: Container(
            padding: const EdgeInsets.only(left: 7, right: 7,top: 0),
            decoration: const BoxDecoration(
              border: Border(
                bottom: BorderSide(color: Colors.white),
              ),
            ),
            child: AppBar(
              elevation: 0,
              backgroundColor: Colors.white,
              leading:
               IconButton(
                  onPressed: () {
                     _globalKey.currentState?.openDrawer();
                  },
                  icon: SvgPicture.asset(
                    'assets/icons/menu.svg',
                    height: 24,
                    width: 24,
                  )),
              actions: [
                IconButton(onPressed: (){}, icon: const Icon(Icons.add_box_outlined, color: Colors.black87,)),
                IconButton(onPressed: (){}, icon: const Icon(CupertinoIcons.moon_stars, color: Colors.black,))
              ],
            ),
          ),
        ),
        drawer: Drawer(
          child: ListView(
            padding: EdgeInsets.zero,
            children: [
              const UserAccountsDrawerHeader(
                accountName: Text(''),
                accountEmail: Text(''),
                /* currentAccountPicture: CircleAvatar(
                child: ClipOval(
                  child: Image.asset(
                    'assets/images/houseOwner2.png',
                    width: 90,
                    height: 90,
                    fit: BoxFit.cover,
                  ),
                ),
              ),*/
                decoration: BoxDecoration(
                  color: AppColors.backgroundColor,
                  image: DecorationImage(
                      image: AssetImage(
                        'assets/images/laborLink.JPG',
                      ),
                      fit: BoxFit.fill),
                ),
              ),
              ListTile(
                leading: const Icon(Icons.workspace_premium_rounded),
                title: const Text('My Badges'),
                onTap: () {},
              ),
              ListTile(
                leading: const Icon(Icons.share_rounded),
                title: const Text('Share'),
                onTap: () {},
              ),
              ListTile(
                leading: const Icon(Icons.notifications),
                title: const Text('Requests'),
                onTap: () {},
                trailing: ClipOval(
                  child: Container(
                    color: Colors.red,
                    width: 20,
                    height: 20,
                    child: const Center(
                      child: Text(
                        '2',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 12,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              const Divider(),
              ListTile(
                leading: const Icon(Icons.attach_money_rounded),
                title: const Text('Premium'),
                onTap: () {},
              ),
              ListTile(
                leading: const Icon(Icons.settings),
                title: const Text('Settings'),
                onTap: () {},
              ),
              ListTile(
                leading: const Icon(Icons.description_rounded),
                title: const Text('Policies'),
                onTap: () {},
              ),
              const Divider(),
              ListTile(
                leading: const Icon(Icons.logout_rounded),
                title: const Text('Log out'),
                onTap: () {
                  FirebaseAuth.instance.signOut().then((value) {
                    // ignore: avoid_print
                    print("signed out");
                    Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const SignInPage()));
                  });
                },
              ),
            ],
          ),
        ),
        backgroundColor: Colors.white,
        body: DefaultTabController(
            length: 2,
            child: NestedScrollView(
                headerSliverBuilder: (context, innerBoxIsScrolled) {
                  return [
                    SliverList(
                        delegate:
                            SliverChildListDelegate([ProfileHeader(context)]))
                  ];
                },
                body: Column(
                  children: [
                    Material(
                      color: Colors.white,
                      child: TabBar(
                        labelColor: Colors.black,
                        unselectedLabelColor: Colors.grey[400],
                        indicatorWeight: 1,
                        indicatorColor: Colors.black,
                        tabs: const [
                          Tab(
                            icon: Icon(
                              Icons.grid_view_rounded,
                            ),
                          ),
                          Tab(
                              icon: Icon(
                            Icons.notifications_rounded,
                          ))
                        ],
                      ),
                    ),
                    const Expanded(child: TabBarView(children: [
                      PostsTab(),
                      NotificationsTab(),
                    ],))
                  ],
                ))));
  }
}
