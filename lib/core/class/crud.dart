// ignore_for_file: depend_on_referenced_packages, avoid_print

import 'dart:convert';
import 'dart:io';
import 'package:rental_ease/core/class/statusrequest.dart';
import 'package:rental_ease/core/function/checkInternet.dart';
import 'package:dartz/dartz.dart';
import 'package:http/http.dart' as http;
import 'package:path/path.dart' as p;

class Crud {
  Future<Either<StatusRequest, Map>> postData(String url, Map data) async {
    try {
      if (await checkInternet()) {
        var response = await http.post(Uri.parse(url), body: data);
        if (response.statusCode == 200 || response.statusCode == 201) {
          Map responsebody = jsonDecode(response.body);
          return Right(responsebody);
        } else {
          return const Left(StatusRequest.serverfailure);
        }
      } else {
        return const Left(StatusRequest.offlinefailure);
      }
    } catch (_) {
      return const Left(StatusRequest.serverexp);
    }
  } /////

  Future<Either<StatusRequest, Map>> postRequestWithFiles(
      String url, Map<String, String> data, List<File> files) async {
    try {
      if (await checkInternet()) {
        var request = http.MultipartRequest("POST", Uri.parse(url));

        for (var i = 0; i < files.length; i++) {
          var file = files[i];
          var length = await file.length();
          var stream = http.ByteStream(file.openRead());
          var multiPartFile = http.MultipartFile("file$i", stream, length,
              filename: p.basename(file.path));
          request.files.add(multiPartFile);
        }

        data.forEach((key, value) {
          request.fields[key] = value;
        });

        var myRequest = await request.send();
        var response = await http.Response.fromStream(myRequest);

        if (myRequest.statusCode == 200) {
          Map responsebody = jsonDecode(response.body);
          return Right(responsebody);
        } else {
          return const Left(StatusRequest.serverfailure);
        }
      } else {
        return const Left(StatusRequest.offlinefailure);
      }
    } catch (_) {
      return const Left(StatusRequest.serverexp);
    }
  }

  ///
  ///
  ///
  Future<Either<StatusRequest, Map>> postRequsetWithFile(
      String url, Map data, File file) async {
    try {
      if (await checkInternet()) {
        var request = http.MultipartRequest("POST", Uri.parse(url));

        var length = await file.length();

        var stream = http.ByteStream(file.openRead());

        var multiPartFile = http.MultipartFile("file", stream, length,
            filename: p.basename(file.path));

        request.files.add(multiPartFile);

        data.forEach((key, value) {
          request.fields[key] = value;
        });

        var myrequest = await request.send();

        var response = await http.Response.fromStream(myrequest);

        if (myrequest.statusCode == 200) {
          Map responsebody = jsonDecode(response.body);
          return Right(responsebody);
        } else {
          return const Left(StatusRequest.serverfailure);
          //print("Error ${myrequest.statusCode}");
        }
      } else {
        return const Left(StatusRequest.offlinefailure);
      }
    } catch (_) {
      return const Left(StatusRequest.serverexp);
    }
  }
}

postRequsetWithFile(String url, Map data, File file) async {
  var request = http.MultipartRequest("POST", Uri.parse(url));

  var length = await file.length();

  var stream = http.ByteStream(file.openRead());

  var multiPartFile = http.MultipartFile("filea", stream, length,
      filename: p.basename(file.path));

  request.files.add(multiPartFile);

  data.forEach((key, value) {
    request.fields[key] = value;
  });

  var myrequest = await request.send();

  var response = await http.Response.fromStream(myrequest);

  if (myrequest.statusCode == 200) {
    return jsonDecode(response.body);
  } else {
    print("Error Post Req With File ${myrequest.statusCode}");
  }
}
//either بتضيف خاصية البرمجية الوظيفية يعني احدد شو بدو يرجعلي ولانهن نوعين


