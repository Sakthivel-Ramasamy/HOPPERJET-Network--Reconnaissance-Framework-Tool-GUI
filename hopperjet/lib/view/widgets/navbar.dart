import 'package:flutter/material.dart';
import 'package:hopperjet/interacter/interactor.dart';
import 'package:hopperjet/presenter/localsource/source.dart';
import 'package:hopperjet/view/arp.dart';
import 'package:hopperjet/view/dhcp.dart';
import 'package:hopperjet/view/dns.dart';
import 'package:hopperjet/view/homepage.dart';
import 'package:hopperjet/view/host.dart';
import 'package:hopperjet/view/ip.dart';
import 'package:hopperjet/view/os.dart';
import 'package:hopperjet/view/port.dart';
import 'package:hopperjet/view/promiscuous.dart';

class CustomNavBar extends StatefulWidget {
  final int Active;
  const CustomNavBar({Key? key, required this.Active}) : super(key: key);

  @override
  State<CustomNavBar> createState() => _CustomNavBarState();
}

class _CustomNavBarState extends State<CustomNavBar> {
  bool isHome() {
    bool res;
    widget.Active == 1 ? res = true : res = false;
    return res;
  }

  bool isDetect() {
    bool res;
    widget.Active == 2 ? res = true : res = false;
    return res;
  }

  bool isSpoof() {
    bool res;
    widget.Active == 3 ? res = true : res = false;
    return res;
  }

  bool isScan() {
    bool res;
    widget.Active == 4 ? res = true : res = false;
    return res;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.black45,
      width: 120,
      height: MediaQuery.of(context).size.height,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          isHome()
              ? const CustomImageButton(
                  ImagePath: "image/home.png",
                  ImageText: "",
                  isactive: true,
                )
              : const CustomImageButton(
                  ImagePath: "image/home.png",
                  ImageText: "",
                  isactive: false,
                ),
          TextButton(
            onPressed: () {
              CustomInteractor().Kill();
              Navigator.of(context).pushReplacement(
                  MaterialPageRoute(builder: (context) => const MyHomePage()));
            },
            child: const Text(
              "Home",
              style: TextStyle(fontSize: 10, color: Colors.white),
            ),
            style: TextButton.styleFrom(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12)),
                padding: const EdgeInsets.all(2)),
          ),
          isDetect()
              ? const CustomImageButton(
                  ImagePath: "image/vulnerability.png",
                  ImageText: "Detection Tools",
                  isactive: true,
                )
              : const CustomImageButton(
                  ImagePath: "image/vulnerability.png",
                  ImageText: "Detection Tools",
                  isactive: false,
                ),
          TextButton(
            onPressed: () {
              CustomInteractor().Kill();
              Navigator.of(context).pushReplacement(MaterialPageRoute(
                  builder: (context) => const HostDetection()));
            },
            child: const Text(
              Feature1,
              style: TextStyle(fontSize: 10, color: Colors.white),
            ),
            style: TextButton.styleFrom(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12)),
                padding: const EdgeInsets.all(2)),
          ),
          TextButton(
            onPressed: () {
              CustomInteractor().Kill();
              Navigator.of(context).pushReplacement(MaterialPageRoute(
                  builder: (context) => const PromiscuousDetection()));
            },
            child: const Text(
              Feature2,
              style: TextStyle(fontSize: 10, color: Colors.white),
            ),
            style: TextButton.styleFrom(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12)),
                padding: const EdgeInsets.all(2)),
          ),
          isSpoof()
              ? const CustomImageButton(
                  ImagePath: "image/spoofing.png",
                  ImageText: "Spoofing Detection",
                  isactive: true,
                )
              : const CustomImageButton(
                  ImagePath: "image/spoofing.png",
                  ImageText: "Spoofing Detection",
                  isactive: false,
                ),
          TextButton(
            onPressed: () {
              CustomInteractor().Kill();
              Navigator.of(context).pushReplacement(MaterialPageRoute(
                  builder: (context) => const ArpSpoofDetection()));
            },
            child: const Text(
              Feature3,
              style: TextStyle(fontSize: 10, color: Colors.white),
            ),
            style: TextButton.styleFrom(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12)),
                padding: const EdgeInsets.all(2)),
          ),
          TextButton(
            onPressed: () {
              CustomInteractor().Kill();
              Navigator.of(context).pushReplacement(MaterialPageRoute(
                  builder: (context) => const IpSpoofDetection()));
            },
            child: const Text(
              Feature4,
              style: TextStyle(fontSize: 10, color: Colors.white),
            ),
            style: TextButton.styleFrom(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12)),
                padding: const EdgeInsets.all(2)),
          ),
          TextButton(
            onPressed: () {
              CustomInteractor().Kill();
              Navigator.of(context).pushReplacement(MaterialPageRoute(
                  builder: (context) => const DnsSpoofDetection()));
            },
            child: const Text(
              Feature5,
              style: TextStyle(fontSize: 10, color: Colors.white),
            ),
            style: TextButton.styleFrom(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12)),
                padding: const EdgeInsets.all(2)),
          ),
          TextButton(
            onPressed: () {
              CustomInteractor().Kill();
              Navigator.of(context).pushReplacement(MaterialPageRoute(
                  builder: (context) => const DhcpSpoofDetection()));
            },
            child: const Text(
              Feature6,
              style: TextStyle(fontSize: 10, color: Colors.white),
            ),
            style: TextButton.styleFrom(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12)),
                padding: const EdgeInsets.all(2)),
          ),
          isScan()
              ? const CustomImageButton(
                  ImagePath: "image/body-scanner.png",
                  ImageText: "Scanning Tools",
                  isactive: true,
                )
              : const CustomImageButton(
                  ImagePath: "image/body-scanner.png",
                  ImageText: "Scanning Tools",
                  isactive: false,
                ),
          TextButton(
            onPressed: () {
              CustomInteractor().Kill();
              Navigator.of(context).pushReplacement(
                  MaterialPageRoute(builder: (context) => const PortScanner()));
            },
            child: const Text(
              Feature7,
              style: TextStyle(fontSize: 10, color: Colors.white),
            ),
            style: TextButton.styleFrom(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12)),
                padding: const EdgeInsets.all(2)),
          ),
          TextButton(
            onPressed: () {
              CustomInteractor().Kill();
              Navigator.of(context).pushReplacement(
                  MaterialPageRoute(builder: (context) => const OsDetection()));
            },
            child: const Text(
              Feature8,
              style: TextStyle(fontSize: 10, color: Colors.white),
            ),
            style: TextButton.styleFrom(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12)),
                padding: const EdgeInsets.all(2)),
          ),
          const CustomImageButton(
            ImagePath: "image/about.png",
            ImageText: "About Us",
            isactive: false,
          ),
        ],
      ),
    );
  }
}

class CustomImageButton extends StatelessWidget {
  final String ImagePath, ImageText;
  final bool isactive;
  const CustomImageButton({
    Key? key,
    required this.ImagePath,
    required this.ImageText,
    required this.isactive,
  }) : super(
          key: key,
        );

  @override
  Widget build(BuildContext context) {
    return !isactive
        ? Container(
            margin: const EdgeInsets.only(top: 20, bottom: 10),
            width: 120,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                DecoratedBox(
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(width: 5.0, color: Colors.white),
                  ),
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Image.asset(
                      ImagePath,
                      height: 50,
                      width: 50,
                    ),
                    Container(
                      margin: const EdgeInsets.only(top: 5),
                      child: Text(
                        ImageText,
                        style: const TextStyle(fontSize: 10),
                      ),
                    )
                  ],
                ),
              ],
            ),
          )
        : Container(
            margin: const EdgeInsets.only(top: 20, bottom: 10),
            width: 120,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  width: 120,
                  child: DecoratedBox(
                    decoration: const BoxDecoration(
                        shape: BoxShape.rectangle,
                        border: Border(
                            left: BorderSide(width: 3, color: Colors.white))),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Image.asset(
                          ImagePath,
                          height: 50,
                          width: 50,
                        ),
                        Container(
                          margin: const EdgeInsets.only(top: 5),
                          child: Text(
                            ImageText,
                            style: const TextStyle(fontSize: 10),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ],
            ),
          );
  }
}
