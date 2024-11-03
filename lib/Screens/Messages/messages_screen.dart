import '../../Export/export_dev.dart';
import 'package:flutter/material.dart';



class MessagesScreen extends StatefulWidget {
  const MessagesScreen({super.key});

  @override
  State<MessagesScreen> createState() => _MessagesScreenState();
}

class _MessagesScreenState extends State<MessagesScreen> {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        title:  const Text(
          'Messages',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: AppColor.bgColor
          ),
        ),
        centerTitle: true,
        actions: [
          IconButton(
            icon: const Icon(BootstrapIcons.cart3),
            onPressed: () {
              Navigator.push(context, MaterialPageRoute(builder: (builder) => AddToCartScreen()));

            },
          ),
        ],
        iconTheme: const IconThemeData(
            color: AppColor.bgColor), // Change drawer icon color here
      ),
      drawer: const MyDrawer(),
      body: const Center(child: Text('MessagesScreen')),
    );
  }
}
