// ignore_for_file: non_constant_identifier_names

import 'package:rental_ease/applink.dart';
import 'package:rental_ease/core/class/crud.dart';

class AddRentOrSell {
  Crud crud;
  AddRentOrSell(this.crud);

  addRentOrSell(
    String rentorsell_sell,
    String rentorsell_rentday,
    String rentorsell_rentweek,
    String rentorsell_rentmonth,
    String rentorsell_rentyear,
    String rentorsell_pricesell,
    String rentorsell_pricerentday,
    String rentorsell_pricerentweek,
    String rentorsell_pricerentmonth,
    String rentorsell_pricerentyear,
    String rentorsell_ispri,
    String rentorsell_newprice,
    String post_num,
    String users_id,
  ) async {
    var response = await crud.postData(AppLink.addrentorsell, {
      "rentorsell_sell": rentorsell_sell,
      "rentorsell_rentday": rentorsell_rentday,
      "rentorsell_rentweek": rentorsell_rentweek,
      "rentorsell_rentmonth": rentorsell_rentmonth,
      "rentorsell_rentyear": rentorsell_rentyear,
      "rentorsell_pricesell": rentorsell_pricesell,
      "rentorsell_pricerentday": rentorsell_pricerentday,
      "rentorsell_pricerentweek": rentorsell_pricerentweek,
      "rentorsell_pricerentmonth": rentorsell_pricerentmonth,
      "rentorsell_pricerentyear": rentorsell_pricerentyear,
      "rentorsell_ispri": rentorsell_ispri,
      "rentorsell_newprice": rentorsell_newprice,
      "post_num": post_num,
      "users_id": users_id,
    });
    return response.fold((l) => l, (r) => r);
  }
}
