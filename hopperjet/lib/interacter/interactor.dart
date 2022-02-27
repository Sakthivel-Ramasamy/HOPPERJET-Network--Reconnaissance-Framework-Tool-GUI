import 'dart:developer';
import 'dart:io';

import 'package:path_provider/path_provider.dart';
import 'package:process_run/shell_run.dart';

class CustomInteractor {
  var shell = Shell(throwOnError: false);
  Future<void> GitClone() async {
    var shell = Shell(throwOnError: false);
    await shell
        .run('git clone https://github.com/Sakthivel-Ramasamy/Test-Repo.git');
  }

  Future<bool> CheckDir() async {
    Directory appDocDir = Directory.current;
    String appDocPath = appDocDir.path;
    var path = "$appDocPath/Test-Repo";
    bool checkPathExistence = Directory(path).existsSync();
    return checkPathExistence;
  }

  Future<bool> CheckErr() async {
    Directory appDocDir = Directory.current;
    String appDocPath = appDocDir.path;
    var path = "$appDocPath/Test-Repo/GUI/error.hop";
    bool checkPathExistence = File(path).existsSync();
    log(checkPathExistence.toString());
    return checkPathExistence;
  }

  Future<bool> CheckOutput() async {
    Directory appDocDir = Directory.current;
    String appDocPath = appDocDir.path;
    var path = "$appDocPath/Test-Repo/GUI/output.hop";
    bool checkPathExistence = File(path).existsSync();
    log(checkPathExistence.toString());
    return checkPathExistence;
  }

  void DeleteErr() {
    Directory appDocDir = Directory.current;
    String appDocPath = appDocDir.path;
    var path = "$appDocPath/Test-Repo/GUI/error.hop";
    File(path).delete();
  }

  void DeleteInp() {
    Directory appDocDir = Directory.current;
    String appDocPath = appDocDir.path;
    var path = "$appDocPath/Test-Repo/GUI/input.hop";
    File(path).delete();
  }

  void DeleteOut() {
    Directory appDocDir = Directory.current;
    String appDocPath = appDocDir.path;
    var path = "$appDocPath/Test-Repo/GUI/output.hop";
    File(path).delete();
  }

  void write(String text) async {
    Directory appDocDir = Directory.current;
    String appDocPath = appDocDir.path;
    final File file = File('$appDocPath/Test-Repo/GUI/input.json');
    await file.writeAsString(text);
  }

  Future<String> Read() async {
    String text = "";
    try {
      Directory appDocDir = Directory.current;
      String appDocPath = appDocDir.path;
      final File file = File('$appDocPath/Test-Repo/GUI/output.hop');
      text = file.readAsStringSync();
    } catch (e) {
      print("Something went wrong");
    }
    return text;
  }

  Future<void> verifyCIDR() async {
    Directory appDocDir = Directory.current;
    String appDocPath = appDocDir.path;

    Platform.isWindows
        ? await shell.run(
            'python $appDocPath/Test-Repo/GUI/Validation/CIDR_IP_Validation.py')
        : await shell.run(
            'python3 $appDocPath/Test-Repo/GUI/Validation/CIDR_IP_Validation.py');
  }

  Future<void> verifyIP() async {
    Directory appDocDir = Directory.current;
    String appDocPath = appDocDir.path;

    Platform.isWindows
        ? await shell
            .run('python $appDocPath/Test-Repo/GUI/Validation/IP_Validation.py')
        : await shell.run(
            'python3 $appDocPath/Test-Repo/GUI/Validation/IP_Validation.py');
  }

  Future<void> Host() async {
    Directory appDocDir = Directory.current;
    String appDocPath = appDocDir.path;

    Platform.isWindows
        ? await shell.run(
            'python $appDocPath/Test-Repo/GUI/Host_Discovery/Host_Discovery.py',
          )
        : await shell.run(
            'python3 $appDocPath/Test-Repo/GUI/Host_Discovery/Host_Discovery.py',
          );
  }

  Future<void> Promiscous() async {
    Directory appDocDir = Directory.current;
    String appDocPath = appDocDir.path;

    Platform.isWindows
        ? await shell.run(
            'python $appDocPath/Test-Repo/GUI/Promiscuous_Mode_Detection/Promiscuous_Mode_Detection.py',
          )
        : await shell.run(
            'python3 $appDocPath/Test-Repo/GUI/Promiscuous_Mode_Detection/Promiscuous_Mode_Detection.py',
          );
  }

  Future<void> arp() async {
    Directory appDocDir = Directory.current;
    String appDocPath = appDocDir.path;

    Platform.isWindows
        ? await shell.run(
            'python $appDocPath/Test-Repo/GUI/ARP_Spoofing_Detection/ARP_Spoofing_Detection.py',
          )
        : await shell.run(
            'python3 $appDocPath/Test-Repo/GUI/ARP_Spoofing_Detection/ARP_Spoofing_Detection.py',
          );
  }

  void Kill() async {
    shell.kill();
  }

  Future<void> dhcp() async {
    Directory appDocDir = Directory.current;
    String appDocPath = appDocDir.path;

    Platform.isWindows
        ? await shell.run(
            'python $appDocPath/Test-Repo/GUI/DHCP_Starvation_Detection/DHCP_Starvation_Detection.py',
          )
        : await shell.run(
            'python3 $appDocPath/Test-Repo/GUI/DHCP_Starvation_Detection/DHCP_Starvation_Detection.py',
          );
  }

  Future<void> dns() async {
    Directory appDocDir = Directory.current;
    String appDocPath = appDocDir.path;

    Platform.isWindows
        ? await shell.run(
            'python $appDocPath/Test-Repo/GUI/DNS_Spoofing_Detection/DNS_Spoofing_Detection.py',
          )
        : await shell.run(
            'python3 $appDocPath/Test-Repo/GUI/DNS_Spoofing_Detection/DNS_Spoofing_Detection.py',
          );
  }

  Future<void> ip() async {
    Directory appDocDir = Directory.current;
    String appDocPath = appDocDir.path;

    Platform.isWindows
        ? await shell.run(
            'python $appDocPath/Test-Repo/GUI/IP_Spoofing_Detection/IP_Spoofing_Detection.py',
          )
        : await shell.run(
            'python3 $appDocPath/Test-Repo/GUI/IP_Spoofing_Detection/IP_Spoofing_Detection.py',
          );
  }

  Future<void> port() async {
    Directory appDocDir = Directory.current;
    String appDocPath = appDocDir.path;

    Platform.isWindows
        ? await shell.run(
            'python $appDocPath/Test-Repo/GUI/Port_Scanner/Port_Scanner.py',
          )
        : await shell.run(
            'python3 $appDocPath/Test-Repo/GUI/Port_Scanner/Port_Scanner.py',
          );
  }

  Future<void> os() async {
    Directory appDocDir = Directory.current;
    String appDocPath = appDocDir.path;

    Platform.isWindows
        ? await shell.run(
            'python $appDocPath/Test-Repo/GUI/OS_Detection/OS_Detection.py',
          )
        : await shell.run(
            'python3 $appDocPath/Test-Repo/GUI/OS_Detection/OS_Detection.py',
          );
  }

  Future<void> requirements() async {
    Directory appDocDir = Directory.current;
    String appDocPath = appDocDir.path;

    await shell.run(
        'pip install -r  $appDocPath/Test-Repo/GUI/Requirements/Requirement.txt');
  }
}
