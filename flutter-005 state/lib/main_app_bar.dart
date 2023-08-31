import 'package:flutter/material.dart';

AppBar mainAppBar(BuildContext context) => AppBar(
      title: const Text(
        "안녕",
        // style: TextStyle(color: Colors.green),
      ),
      // backgroundColor: Colors.white,
      centerTitle: true,
      elevation: 8.0,
      actions: [
        IconButton(
          onPressed: () {
            var snackBar = const SnackBar(content: Text("안녕안녕"));
            ScaffoldMessenger.of(context).showSnackBar(snackBar);
          },
          icon: const Icon(Icons.person),
        ),
      ],
    );
