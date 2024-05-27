// ignore_for_file: non_constant_identifier_names

import 'package:rental_ease/applink.dart';
import 'package:rental_ease/core/class/crud.dart';

class AddPrimium {
  Crud crud;
  AddPrimium(this.crud);

  addPrimium(
    String primium_newprice,
    String post_num,
  ) async {
    var response = await crud.postData(AppLink.addpri, {
      "primium_newprice": primium_newprice,
      "post_num": post_num,
    });
    return response.fold((l) => l, (r) => r);
  }
}
