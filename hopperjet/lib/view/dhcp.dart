import 'dart:async';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:hopperjet/presenter/localsource/source.dart';
import 'package:hopperjet/view/widgets/navbar.dart';

import '../interacter/interactor.dart';

class DhcpSpoofDetection extends StatefulWidget {
  const DhcpSpoofDetection({Key? key}) : super(key: key);

  @override
  State<DhcpSpoofDetection> createState() => _DhcpSpoofDetectionState();
}

class _DhcpSpoofDetectionState extends State<DhcpSpoofDetection> {
  bool isfound = false;
  String interface = "";
  String Timeout = "";
  String Threshold = "";
  bool isstarted = false;
  late String outputstr;
  Future<void> checktimer() async {
    CustomInteractor().CheckErr().then((value) {
      setState(() {
        isfound = value;
      });
    });
  }

  @override
  void initState() {
    super.initState();
    setState(() {
      isstarted = false;
      outputstr = """Preparing ...""";
    });
    CustomInteractor().DeleteErr();
    CustomInteractor().DeleteInp();
    CustomInteractor().DeleteOut();
    CustomInteractor().CheckErr().then((value) {
      setState(() {
        isfound = value;
        log(isfound.toString());
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
      body: Center(
          child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          const CustomNavBar(
            Active: 3,
          ),
          Stack(
            children: [
              Image.asset(
                "image/h6.png",
                width: MediaQuery.of(context).size.width - 120,
                fit: BoxFit.cover,
              ),
              !isfound
                  ? Container(
                      height: MediaQuery.of(context).size.height,
                      width: MediaQuery.of(context).size.width - 120,
                      decoration: const BoxDecoration(
                          gradient: LinearGradient(
                              begin: Alignment.centerLeft,
                              end: Alignment.centerRight,
                              colors: [Colors.lightGreen, Colors.transparent])),
                    )
                  : Container(
                      height: MediaQuery.of(context).size.height,
                      width: MediaQuery.of(context).size.width - 120,
                      decoration: const BoxDecoration(
                          gradient: LinearGradient(
                              begin: Alignment.centerLeft,
                              end: Alignment.centerRight,
                              colors: [Colors.redAccent, Colors.transparent])),
                    ),
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    margin: EdgeInsets.only(
                        top: MediaQuery.of(context).size.height * 0.20,
                        left: MediaQuery.of(context).size.width * 0.05),
                    child: const Text(
                      Feature6,
                      style: TextStyle(color: Colors.white, fontSize: 40),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(
                      top: MediaQuery.of(context).size.height * 0.02,
                      left: MediaQuery.of(context).size.width * 0.05,
                      right: MediaQuery.of(context).size.width * 0.05,
                    ),
                    child: const Text(
                      F2theory,
                      style: TextStyle(color: Colors.white, fontSize: 14),
                      overflow: TextOverflow.ellipsis,
                      maxLines: 10,
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(
                      top: 15,
                      left: MediaQuery.of(context).size.width * 0.05,
                    ),
                    child: TextButton(
                      onPressed: () {
                        // redirect to the wiki page
                      },
                      child: const Text(
                        LearnMoreHint,
                        style: TextStyle(fontSize: 16, color: Colors.white),
                      ),
                      style: TextButton.styleFrom(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(5)),
                        backgroundColor: Color.fromARGB(500, 196, 196, 196),
                        padding: const EdgeInsets.only(
                            top: 10, bottom: 10, left: 15, right: 15),
                      ),
                    ),
                  ),
                  Row(
                    children: [
                      Container(
                        width: MediaQuery.of(context).size.width * 0.15,
                        margin: EdgeInsets.only(
                            top: 50,
                            left: MediaQuery.of(context).size.width * 0.05),
                        child: TextField(
                          decoration: const InputDecoration(
                            border: OutlineInputBorder(),
                            hintText: 'Enter the Interface',
                          ),
                          onChanged: (text) {
                            setState(() {
                              interface = text;
                            });
                          },
                        ),
                      ),
                      Container(
                        width: MediaQuery.of(context).size.width * 0.08,
                        margin: EdgeInsets.only(
                            top: 50,
                            left: MediaQuery.of(context).size.width * 0.05),
                        child: TextField(
                          decoration: const InputDecoration(
                            border: OutlineInputBorder(),
                            hintText: 'Timeout',
                          ),
                          onChanged: (text) {
                            setState(() {
                              Timeout = text;
                            });
                          },
                        ),
                      ),
                      Container(
                        width: MediaQuery.of(context).size.width * 0.08,
                        margin: EdgeInsets.only(
                            top: 50,
                            left: MediaQuery.of(context).size.width * 0.05),
                        child: TextField(
                          decoration: const InputDecoration(
                            border: OutlineInputBorder(),
                            hintText: 'Threshold',
                          ),
                          onChanged: (text) {
                            setState(() {
                              Threshold = text;
                            });
                          },
                        ),
                      ),
                      Container(
                        width: MediaQuery.of(context).size.width * 0.10,
                        margin: EdgeInsets.only(
                            top: 50,
                            left: MediaQuery.of(context).size.width * 0.05),
                        child: TextButton(
                          onPressed: () {
                            // redirect to the start func in python
                            String text = """
                                {
                                  "Method": "DHCP Starvation",
                                  "Interface":"$interface",
                                  "Timeout":"$Timeout",
                                  "Threshold":"$Threshold"
                                }
                                """;
                            CustomInteractor().DeleteOut();
                            CustomInteractor().DeleteInp();
                            CustomInteractor().write(text);
                            CustomInteractor().dhcp();

                            setState(() {
                              outputstr = "Loading ...";
                            });
                            var value = int.parse(Timeout) / 30;
                            for (var i = 0; i < value; i++) {
                              Timer(const Duration(seconds: 30), () {
                                checktimer();
                                CustomInteractor().CheckOutput().then((value) {
                                  setState(() {
                                    isstarted = !value;
                                    log(isstarted.toString());
                                    if (!isstarted) {
                                      CustomInteractor().Read().then((value) {
                                        setState(() {
                                          outputstr = value;
                                        });
                                      });
                                    }
                                  });
                                });
                              });
                            }
                          },
                          child: const Text(
                            "Start",
                            style: TextStyle(fontSize: 16, color: Colors.white),
                          ),
                          style: TextButton.styleFrom(
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(5)),
                            backgroundColor: Colors.lightGreen,
                            padding: const EdgeInsets.only(top: 25, bottom: 25),
                          ),
                        ),
                      ),
                    ],
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width - 120,
                    margin: EdgeInsets.only(
                        top: MediaQuery.of(context).size.height * 0.09),
                    child: Center(
                        child: Container(
                      width: MediaQuery.of(context).size.width * 0.8,
                      height: MediaQuery.of(context).size.height * 0.35,
                      color: Colors.black,
                      padding: const EdgeInsets.only(top: 5),
                      child: Container(
                        margin: EdgeInsets.only(top: 10, left: 10),
                        child: Text(
                          outputstr,
                          style: TextStyle(color: Colors.greenAccent),
                        ),
                      ),
                    )),
                  )
                ],
              ),
            ],
          )
        ],
      )),
    );
  }
}
