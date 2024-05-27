// ignore_for_file: unnecessary_this, unnecessary_new, prefer_collection_literals

class RealEstateModel {
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
  String? realestateId;
  String? realestateType;
  String? realestateCity;
  String? realestateRegion;
  String? realestateLat;
  String? realestateLong;
  String? realestateDistance;
  String? realestateDesc;
  String? realestateImage0;
  String? realestateImage1;
  String? realestateImage2;
  String? realestateImage3;
  String? realestateImage4;
  String? realestateImage5;
  String? realestateImage6;
  String? realestateImage7;
  String? realestateImage8;
  String? realestateImage9;
  String? realestateNumsettingroom;
  String? realestateNumbedroom;
  String? realestateNumbathroom;
  String? realestateNumkitchen;
  String? realestateNumbalcon;
  String? realestateNumflat;
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

  RealEstateModel({
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
    this.realestateId,
    this.realestateType,
    this.realestateCity,
    this.realestateRegion,
    this.realestateLat,
    this.realestateLong,
    this.realestateDistance,
    this.realestateDesc,
    this.realestateImage0,
    this.realestateImage1,
    this.realestateImage2,
    this.realestateImage3,
    this.realestateImage4,
    this.realestateImage5,
    this.realestateImage6,
    this.realestateImage7,
    this.realestateImage8,
    this.realestateImage9,
    this.realestateNumsettingroom,
    this.realestateNumbedroom,
    this.realestateNumbathroom,
    this.realestateNumkitchen,
    this.realestateNumbalcon,
    this.realestateNumflat,
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

  RealEstateModel.fromJson(Map<String, dynamic> json) {
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
    realestateId = json['realestate_id'];
    realestateType = json['realestate_type'];
    realestateCity = json['realestate_city'];
    realestateRegion = json['realestate_region'];
    realestateLat = json['realestate_lat'];
    realestateLong = json['realestate_long'];
    realestateDistance = json['realestate_distance'];
    realestateDesc = json['realestate_desc'];
    realestateImage0 = json['realestate_image0'];
    realestateImage1 = json['realestate_image1'];
    realestateImage2 = json['realestate_image2'];
    realestateImage3 = json['realestate_image3'];
    realestateImage4 = json['realestate_image4'];
    realestateImage5 = json['realestate_image5'];
    realestateImage6 = json['realestate_image6'];
    realestateImage7 = json['realestate_image7'];
    realestateImage8 = json['realestate_image8'];
    realestateImage9 = json['realestate_image9'];
    realestateNumsettingroom = json['realestate_numsettingroom'];
    realestateNumbedroom = json['realestate_numbedroom'];
    realestateNumbathroom = json['realestate_numbathroom'];
    realestateNumkitchen = json['realestate_numkitchen'];
    realestateNumbalcon = json['realestate_numbalcon'];
    realestateNumflat = json['realestate_numflat'];
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
    data['realestate_id'] = this.realestateId;
    data['realestate_type'] = this.realestateType;
    data['realestate_city'] = this.realestateCity;
    data['realestate_region'] = this.realestateRegion;
    data['realestate_lat'] = this.realestateLat;
    data['realestate_long'] = this.realestateLong;
    data['realestate_distance'] = this.realestateDistance;
    data['realestate_desc'] = this.realestateDesc;
    data['realestate_image0'] = this.realestateImage0;
    data['realestate_image1'] = this.realestateImage1;
    data['realestate_image2'] = this.realestateImage2;
    data['realestate_image3'] = this.realestateImage3;
    data['realestate_image4'] = this.realestateImage4;
    data['realestate_image5'] = this.realestateImage5;
    data['realestate_image6'] = this.realestateImage6;
    data['realestate_image7'] = this.realestateImage7;
    data['realestate_image8'] = this.realestateImage8;
    data['realestate_image9'] = this.realestateImage9;
    data['realestate_numsettingroom'] = this.realestateNumsettingroom;
    data['realestate_numbedroom'] = this.realestateNumbedroom;
    data['realestate_numbathroom'] = this.realestateNumbathroom;
    data['realestate_numkitchen'] = this.realestateNumkitchen;
    data['realestate_numbalcon'] = this.realestateNumbalcon;
    data['realestate_numflat'] = this.realestateNumflat;
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
