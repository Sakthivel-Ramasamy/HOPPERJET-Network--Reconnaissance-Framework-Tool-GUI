import 'package:flutter/material.dart';
import 'package:hopperjet/presenter/localsource/source.dart';
import 'package:hopperjet/view/installing.dart';

class WelcomePage extends StatelessWidget {
  const WelcomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Todo: you have to check for the Installation completed file and pass it to the homepage if it is present
    // And if it is not present in there you have to go through the steps again
    Future.delayed(Duration(seconds: 5), () {
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (_) => Installation()));
    });

    return Scaffold(
      body: Container(
        color: Color.fromARGB(1000, 43, 45, 46),
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: Center(
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
              Container(
                child: Image.asset(
                  "image/logo.gif",
                  height: 400,
                  width: 400,
                ),
              ),
              Container(
                child: const Text(
                  Appname,
                  style: TextStyle(fontSize: 32, color: Colors.white),
                ),
              ),
              Container(
                margin: const EdgeInsets.only(top: 50),
                child: const Text(
                  AppFunction,
                  style: TextStyle(fontSize: 26, color: Colors.white),
                ),
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Container(
                    margin: const EdgeInsets.only(top: 50),
                    child: const Text(
                      Adv1,
                      style: TextStyle(fontSize: 20, color: Colors.white),
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.only(top: 50),
                    child: const Text(
                      Adv2,
                      style: TextStyle(fontSize: 20, color: Colors.white),
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.only(top: 50),
                    child: const Text(
                      Adv3,
                      style: TextStyle(fontSize: 20, color: Colors.white),
                    ),
                  ),
                ],
              )
            ])),
      ),
    );
  }
}
