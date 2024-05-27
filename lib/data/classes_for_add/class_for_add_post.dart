// ignore_for_file: non_constant_identifier_names

import 'package:rental_ease/applink.dart';
import 'package:rental_ease/core/class/crud.dart';

class AddPost {
  Crud crud;
  AddPost(this.crud);

  addPost(
    String post_type,
    String post_num,
    String users_id,
  ) async {
    var response = await crud.postData(AppLink.addpost, {
      "post_type": post_type,
      "post_num": post_num,
      "users_id": users_id,
    });
    return response.fold((l) => l, (r) => r);
  }
}
