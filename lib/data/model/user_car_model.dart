// ignore_for_file: unnecessary_this, unnecessary_new, prefer_collection_literals

class UserCarModel {
  String? usersId;
  String? usersName;
  String? usersEmail;
  String? usersPhone;
  String? usersPassword;
  String? postId;
  String? postType;
  String? postDate;
  String? postNum;
  String? postCode;
  String? postStatus;
  String? postCase0;
  String? rentorsellId;
  String? rentorsellSell;
  String? rentorsellRentday;
  String? rentorsellRentweek;
  String? rentorsellRentmonth;
  String? rentorsellRentyear;
  String? rentorsellPricesell;
  String? rentorsellPricerentday;
  String? rentorsellPricerentweek;
  String? rentorsellPricerentmonth;
  String? rentorsellPricerentyear;
  String? rentorsellIspri;
  String? rentorsellNewprice;
  String? carsId;
  String? carsCompany;
  String? carsYear;
  String? carsLocationcity;
  String? carsLocationregion;
  String? carsNomra;
  String? carsDistance;
  String? carsDescription;
  String? carsImage1;
  String? carsImage2;
  String? carsImage3;

  UserCarModel(
      {this.usersId,
      this.usersName,
      this.usersEmail,
      this.usersPhone,
      this.usersPassword,
      this.postId,
      this.postType,
      this.postDate,
      this.postNum,
      this.postCode,
      this.postStatus,
      this.postCase0,
      this.rentorsellId,
      this.rentorsellSell,
      this.rentorsellRentday,
      this.rentorsellRentweek,
      this.rentorsellRentmonth,
      this.rentorsellRentyear,
      this.rentorsellPricesell,
      this.rentorsellPricerentday,
      this.rentorsellPricerentweek,
      this.rentorsellPricerentmonth,
      this.rentorsellPricerentyear,
      this.rentorsellIspri,
      this.rentorsellNewprice,
      this.carsId,
      this.carsCompany,
      this.carsYear,
      this.carsLocationcity,
      this.carsLocationregion,
      this.carsNomra,
      this.carsDistance,
      this.carsDescription,
      this.carsImage1,
      this.carsImage2,
      this.carsImage3});

  UserCarModel.fromJson(Map<String, dynamic> json) {
    usersId = json['users_id'];
    usersName = json['users_name'];
    usersEmail = json['users_email'];
    usersPhone = json['users_phone'];
    usersPassword = json['users_password'];
    postId = json['post_id'];
    postType = json['post_type'];
    postDate = json['post_date'];
    postNum = json['post_num'];
    postCode = json['post_code'];
    postStatus = json['post_status'];
    postCase0 = json['post_case0'];
    rentorsellId = json['rentorsell_id'];
    rentorsellSell = json['rentorsell_sell'];
    rentorsellRentday = json['rentorsell_rentday'];
    rentorsellRentweek = json['rentorsell_rentweek'];
    rentorsellRentmonth = json['rentorsell_rentmonth'];
    rentorsellRentyear = json['rentorsell_rentyear'];
    rentorsellPricesell = json['rentorsell_pricesell'];
    rentorsellPricerentday = json['rentorsell_pricerentday'];
    rentorsellPricerentweek = json['rentorsell_pricerentweek'];
    rentorsellPricerentmonth = json['rentorsell_pricerentmonth'];
    rentorsellPricerentyear = json['rentorsell_pricerentyear'];
    rentorsellIspri = json['rentorsell_ispri'];
    rentorsellNewprice = json['rentorsell_newprice'];
    carsId = json['cars_id'];
    carsCompany = json['cars_company'];
    carsYear = json['cars_year'];
    carsLocationcity = json['cars_locationcity'];
    carsLocationregion = json['cars_locationregion'];
    carsNomra = json['cars_nomra'];
    carsDistance = json['cars_distance'];
    carsDescription = json['cars_description'];
    carsImage1 = json['cars_image1'];
    carsImage2 = json['cars_image2'];
    carsImage3 = json['cars_image3'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['users_id'] = this.usersId;
    data['users_name'] = this.usersName;
    data['users_email'] = this.usersEmail;
    data['users_phone'] = this.usersPhone;
    data['users_password'] = this.usersPassword;
    data['post_id'] = this.postId;
    data['post_type'] = this.postType;
    data['post_date'] = this.postDate;
    data['post_num'] = this.postNum;
    data['post_code'] = this.postCode;
    data['post_status'] = this.postStatus;
    data['post_case0'] = this.postCase0;
    data['rentorsell_id'] = this.rentorsellId;
    data['rentorsell_sell'] = this.rentorsellSell;
    data['rentorsell_rentday'] = this.rentorsellRentday;
    data['rentorsell_rentweek'] = this.rentorsellRentweek;
    data['rentorsell_rentmonth'] = this.rentorsellRentmonth;
    data['rentorsell_rentyear'] = this.rentorsellRentyear;
    data['rentorsell_pricesell'] = this.rentorsellPricesell;
    data['rentorsell_pricerentday'] = this.rentorsellPricerentday;
    data['rentorsell_pricerentweek'] = this.rentorsellPricerentweek;
    data['rentorsell_pricerentmonth'] = this.rentorsellPricerentmonth;
    data['rentorsell_pricerentyear'] = this.rentorsellPricerentyear;
    data['rentorsell_ispri'] = this.rentorsellIspri;
    data['rentorsell_newprice'] = this.rentorsellNewprice;
    data['cars_id'] = this.carsId;
    data['cars_company'] = this.carsCompany;
    data['cars_year'] = this.carsYear;
    data['cars_locationcity'] = this.carsLocationcity;
    data['cars_locationregion'] = this.carsLocationregion;
    data['cars_nomra'] = this.carsNomra;
    data['cars_distance'] = this.carsDistance;
    data['cars_description'] = this.carsDescription;
    data['cars_image1'] = this.carsImage1;
    data['cars_image2'] = this.carsImage2;
    data['cars_image3'] = this.carsImage3;
    return data;
  }
}
