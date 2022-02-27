import 'dart:async';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:hopperjet/interacter/interactor.dart';
import 'package:hopperjet/presenter/localsource/source.dart';
import 'package:hopperjet/view/homepage.dart';

class Loading extends StatefulWidget {
  const Loading({Key? key}) : super(key: key);

  @override
  State<Loading> createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {
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
    //Here you have to write the logic to look for the directory

    for (var i = 0; i < 10; i++) {
      ispresent
          ? Future.delayed(const Duration(seconds: 5), () {
              CustomInteractor().requirements();
              Navigator.pushReplacement(context,
                  MaterialPageRoute(builder: (_) => const MyHomePage()));
            })
          : Timer(const Duration(seconds: 1), () {
              CustomInteractor().CheckDir().then((value) {
                setState(() {
                  ispresent = value;
                  log(ispresent.toString());
                });
              });
            });
    }

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
            child: Image.asset(
              "image/loading.gif",
              height: 400,
              width: 400,
            ),
          ),
        ));
  }
}
