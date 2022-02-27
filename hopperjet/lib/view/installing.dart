import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:hopperjet/interacter/interactor.dart';
import 'package:hopperjet/presenter/localsource/source.dart';
import 'package:hopperjet/view/homepage.dart';
import 'package:hopperjet/view/loading.dart';

class Installation extends StatefulWidget {
  const Installation({Key? key}) : super(key: key);

  @override
  State<Installation> createState() => _InstallationState();
}

class _InstallationState extends State<Installation> {
  late bool ispresent;
  @override
  void initState() {
    super.initState();

    CustomInteractor().CheckDir().then((value) {
      setState(() {
        ispresent = value;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          Appname,
          style: TextStyle(fontSize: 25, color: Colors.white),
        ),
        automaticallyImplyLeading: false,
        actions: [
          Container(
            margin: const EdgeInsets.fromLTRB(0, 10, 80, 0),
            child: Column(
              children: [
                const Icon(Icons.support_outlined),
                Container(
                  margin: const EdgeInsets.only(top: 2),
                  child: const Text(
                    support,
                    style: TextStyle(fontSize: 14),
                  ),
                )
              ],
            ),
          ),
        ],
      ),
      body: Container(
        color: const Color.fromARGB(1000, 43, 45, 46),
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: Center(
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                    "image/git.png",
                    height: 250,
                    width: 250,
                  ),
                  const Text(
                    "- - - - - - - -",
                    style: TextStyle(fontSize: 35),
                  ),
                  Image.asset(
                    "image/python.png",
                    height: 250,
                    width: 250,
                  ),
                ],
              ),
              Container(
                margin: const EdgeInsets.only(top: 50),
                child: const Text(
                  Requirements,
                  style: TextStyle(fontSize: 18),
                  textAlign: TextAlign.center,
                ),
              ),
              Container(
                margin: const EdgeInsets.only(top: 50),
                child: TextButton(
                  onPressed: () {
                    if (!ispresent) {
                      CustomInteractor().GitClone();
                    }

                    !ispresent
                        ? Navigator.of(context).pushReplacement(
                            MaterialPageRoute(
                                builder: (context) => const Loading()))
                        : Navigator.of(context).pushReplacement(
                            MaterialPageRoute(
                                builder: (context) => const MyHomePage()));
                  },
                  child: const Text(
                    Proceed,
                    style: TextStyle(fontSize: 20, color: Colors.white),
                  ),
                  style: TextButton.styleFrom(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12)),
                      backgroundColor: const Color.fromARGB(1000, 118, 202, 78),
                      padding: const EdgeInsets.all(25)),
                ),
              )
            ])),
      ),
    );
  }
}
