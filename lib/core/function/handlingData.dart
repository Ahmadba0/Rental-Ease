// ignore_for_file: file_names

import 'package:rental_ease/core/class/statusrequest.dart';

handlingdata(response) {
  if (response is StatusRequest) {
    // the response is status request
    return response;
  } else {
    //the response is not status => success
    return StatusRequest.success;
  }
}
