// ignore_for_file: unnecessary_this, unnecessary_new, prefer_collection_literals

class SwimModel {
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
  String? swimId;
  String? swimCity;
  String? swimRegion;
  String? swimLat;
  String? swimLong;
  String? swimDesc;
  String? swimNumsettingroom;
  String? swimNumbathroom;
  String? swimNumkitchen;
  String? swimImage0;
  String? swimImage1;
  String? swimImage2;
  String? swimImage3;
  String? swimImage4;
  String? swimImage5;
  String? swimImage6;
  String? swimImage7;
  String? swimImage8;
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

  SwimModel({
    this.usersId,
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
    this.swimId,
    this.swimCity,
    this.swimRegion,
    this.swimLat,
    this.swimLong,
    this.swimDesc,
    this.swimNumsettingroom,
    this.swimNumbathroom,
    this.swimNumkitchen,
    this.swimImage0,
    this.swimImage1,
    this.swimImage2,
    this.swimImage3,
    this.swimImage4,
    this.swimImage5,
    this.swimImage6,
    this.swimImage7,
    this.swimImage8,
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
  });

  SwimModel.fromJson(Map<String, dynamic> json) {
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
    swimId = json['swim_id'];
    swimCity = json['swim_city'];
    swimRegion = json['swim_region'];
    swimLat = json['swim_lat'];
    swimLong = json['swim_long'];
    swimDesc = json['swim_desc'];
    swimNumsettingroom = json['swim_numsettingroom'];
    swimNumbathroom = json['swim_numbathroom'];
    swimNumkitchen = json['swim_numkitchen'];
    swimImage0 = json['swim_image0'];
    swimImage1 = json['swim_image1'];
    swimImage2 = json['swim_image2'];
    swimImage3 = json['swim_image3'];
    swimImage4 = json['swim_image4'];
    swimImage5 = json['swim_image5'];
    swimImage6 = json['swim_image6'];
    swimImage7 = json['swim_image7'];
    swimImage8 = json['swim_image8'];
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
    data['swim_id'] = this.swimId;
    data['swim_city'] = this.swimCity;
    data['swim_region'] = this.swimRegion;
    data['swim_lat'] = this.swimLat;
    data['swim_long'] = this.swimLong;
    data['swim_desc'] = this.swimDesc;
    data['swim_numsettingroom'] = this.swimNumsettingroom;
    data['swim_numbathroom'] = this.swimNumbathroom;
    data['swim_numkitchen'] = this.swimNumkitchen;
    data['swim_image0'] = this.swimImage0;
    data['swim_image1'] = this.swimImage1;
    data['swim_image2'] = this.swimImage2;
    data['swim_image3'] = this.swimImage3;
    data['swim_image4'] = this.swimImage4;
    data['swim_image5'] = this.swimImage5;
    data['swim_image6'] = this.swimImage6;
    data['swim_image7'] = this.swimImage7;
    data['swim_image8'] = this.swimImage8;
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
    return data;
  }
}
