// ignore_for_file: file_names

import 'dart:io';

checkInternet() async {
  try {
    var result = await InternetAddress.lookup("google.com");
    if (result.isNotEmpty) {
      return true;
    }
  } on SocketException catch (_) {
    return false;
  }
}

//to start this method:
/*var res;
start() async {
  res = checkInternet();
  print(res);
}

@override
void initState() {
  super.initState();
  start();
}*/
