// ignore_for_file: unnecessary_this, unnecessary_new, prefer_collection_literals

class WiddingModel {
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
  String? widdingId;
  String? widdingCity;
  String? widdingRegion;
  String? widdingLat;
  String? widdingLong;
  String? widdingDesc;
  String? widdingNumtable;
  String? widdingImage0;
  String? widdingImage1;
  String? widdingImage2;
  String? widdingImage3;
  String? widdingImage4;
  String? widdingImage5;
  String? widdingImage6;
  String? widdingImage7;
  String? widdingImage8;
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

  WiddingModel({
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
    this.widdingId,
    this.widdingCity,
    this.widdingRegion,
    this.widdingLat,
    this.widdingLong,
    this.widdingDesc,
    this.widdingNumtable,
    this.widdingImage0,
    this.widdingImage1,
    this.widdingImage2,
    this.widdingImage3,
    this.widdingImage4,
    this.widdingImage5,
    this.widdingImage6,
    this.widdingImage7,
    this.widdingImage8,
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

  WiddingModel.fromJson(Map<String, dynamic> json) {
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
    widdingId = json['widding_id'];
    widdingCity = json['widding_city'];
    widdingRegion = json['widding_region'];
    widdingLat = json['widding_lat'];
    widdingLong = json['widding_long'];
    widdingDesc = json['widding_desc'];
    widdingNumtable = json['widding_numtable'];
    widdingImage0 = json['widding_image0'];
    widdingImage1 = json['widding_image1'];
    widdingImage2 = json['widding_image2'];
    widdingImage3 = json['widding_image3'];
    widdingImage4 = json['widding_image4'];
    widdingImage5 = json['widding_image5'];
    widdingImage6 = json['widding_image6'];
    widdingImage7 = json['widding_image7'];
    widdingImage8 = json['widding_image8'];
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
    data['widding_id'] = this.widdingId;
    data['widding_city'] = this.widdingCity;
    data['widding_region'] = this.widdingRegion;
    data['widding_lat'] = this.widdingLat;
    data['widding_long'] = this.widdingLong;
    data['widding_desc'] = this.widdingDesc;
    data['widding_numtable'] = this.widdingNumtable;
    data['widding_image0'] = this.widdingImage0;
    data['widding_image1'] = this.widdingImage1;
    data['widding_image2'] = this.widdingImage2;
    data['widding_image3'] = this.widdingImage3;
    data['widding_image4'] = this.widdingImage4;
    data['widding_image5'] = this.widdingImage5;
    data['widding_image6'] = this.widdingImage6;
    data['widding_image7'] = this.widdingImage7;
    data['widding_image8'] = this.widdingImage8;
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
