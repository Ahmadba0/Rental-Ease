// ignore_for_file: non_constant_identifier_names

import 'package:rental_ease/applink.dart';
import 'package:rental_ease/core/class/crud.dart';

class FavoriteDate {
  Crud crud;
  FavoriteDate(this.crud);

  addToFav(String users_id, String post_num) async {
    var response = await crud.postData(AppLink.addFav, {
      "users_id": users_id,
      "post_num": post_num,
    });
    return response.fold((l) => l, (r) => r);
  }

  removeFromFav(String users_id, String post_num) async {
    var response = await crud.postData(AppLink.removeFav, {
      "users_id": users_id,
      "post_num": post_num,
    });
    return response.fold((l) => l, (r) => r);
  }

  viewFav(String users_id) async {
    var response = await crud.postData(AppLink.viewFav, {
      "users_id": users_id,
    });
    return response.fold((l) => l, (r) => r);
  }

  viewAllFav(String users_id) async {
    var response = await crud.postData(AppLink.viewAllFav, {
      "users_id": users_id,
    });
    return response.fold((l) => l, (r) => r);
  }
}
