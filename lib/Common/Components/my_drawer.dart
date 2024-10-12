import 'package:bootstrap_icons/bootstrap_icons.dart';
import 'package:flutter/material.dart';

import '../../Screens/Bottom Navigation/bottom_navigation.dart';
import '../Utils/app_colors.dart';

class MyDrawer extends StatefulWidget {
  const MyDrawer({super.key});

  @override
  State<MyDrawer> createState() => _MyDrawerState();
}

class _MyDrawerState extends State<MyDrawer> {
  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    return SizedBox(
      width: width * 0.65,
      child: Drawer(
        child: Scaffold(
          backgroundColor: AppColor.bgColor,
          appBar: AppBar(
            title: const Text(
              'My App',
              style: TextStyle(
                color: AppColor.bgColor,
                fontWeight: FontWeight.bold
              ),
            ),
            actions: [
              IconButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                icon: const Icon(BootstrapIcons.x,color: AppColor.bgColor,),
              )
            ],
          ),
          body: ListView(
            children: [
              InkWell(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (builder) => const BottomNavigation()));
                },
                child: const ListTile(
                  leading: Icon(BootstrapIcons.house,),
                  title: Text('Home'),
                  trailing: Icon(Icons.arrow_forward_ios),
                ),
              ),
               InkWell(
                 onTap: () {},
                 child: const ListTile(
                  leading:Icon(BootstrapIcons.list_check,),
                  title: Text('Categories'),
                  trailing: Icon(Icons.arrow_forward_ios),
                               ),
               ),
               InkWell(
                 onTap: () {},
                 child: const ListTile(
                  leading: Icon(BootstrapIcons.gear_fill,),
                  title: Text('Settings'),
                  trailing: Icon(Icons.arrow_forward_ios),
                               ),
               ),
            ],
          ),
        ),
      ),
    );
  }
}
