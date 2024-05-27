// ignore_for_file: constant_identifier_names

class AppLink {
  static const String server = "https://ab036652.000webhostapp.com/renatl_ease";

  //static const String server = "http://192.168.1.104/renatl_ease";

  static const String test = "$server/test.php";

  static const String image = "$server/upload";

  //auth
  static const String signup = "$server/auth/signup.php";
  static const String getverifycodesignup =
      "$server/auth/getverifycodesignup.php";
  static const String verifycodesignup = "$server/auth/verifycodesignup.php";
  static const String login = "$server/auth/login.php";
  static const String checkemail = "$server/auth/checkemail.php";
  static const String verifycodeforget = "$server/auth/verifycodeforget.php";
  static const String resetpassword = "$server/auth/resetpassword.php";
  static const String resend = "$server/auth/resend.php";

  //car
  static const String addcar = "$server/car/addcar.php";
  static const String getimagescarfordeletepost =
      "$server/car/getimagescar.php";

  //house
  static const String addhouse9 = "$server/realestate/addrealhouse9.php";
  static const String addhouse8 = "$server/realestate/addrealhouse8.php";
  static const String addhouse7 = "$server/realestate/addrealhouse7.php";
  static const String addhouse6 = "$server/realestate/addrealhouse6.php";
  static const String addhouse5 = "$server/realestate/addrealhouse5.php";
  static const String addhouse4 = "$server/realestate/addrealhouse4.php";
  static const String addhouse3 = "$server/realestate/addrealhouse3.php";
  static const String addhouse = "$server/realestate/addhouse.php";

  //post
  static const String addpost = "$server/post/addpost.php";
  static const String updatepost = "$server/post/updatepost.php";
  static const String deletepostcar = "$server/post/deletepostcar.php";
  static const String passPost = "$server/post/passPost.php";

  //rent or sell
  static const String addrentorsell = "$server/rentorsell/addrentorsell.php";
  //pri
  static const String addpri = "$server/primium/addprimium.php";
  //swim
  static const String addswim2 = "$server/swim/addswim2.php";
  static const String addswim3 = "$server/swim/addswim3.php";
  static const String addswim4 = "$server/swim/addswim4.php";
  static const String addswim5 = "$server/swim/addswim5.php";
  static const String addswim6 = "$server/swim/addswim6.php";
  static const String addswim7 = "$server/swim/addswim7.php";
  static const String addswim8 = "$server/swim/addswim8.php";

  //sub admin
  static const String getallcarByAdmin = "$server/subadmin/getallcar.php";
  // static const String deleteCarPost =
  //     "$server/subadmin/deletepostbysubadmin.php";
  static const String updatepostbysubadmin =
      "$server/subadmin/updatepostbysubadmin.php";
  static const String addtoblacklist = "$server/subadmin/addblacklist.php";
  static const String updatePostTocancel =
      "$server/subadmin/update_post_to_cancel.php";
  static const String addPrivatePost = "$server/subadmin/addPrivatePost.php";
  static const String addPrivatePost0 = "$server/subadmin/addPrivatePost0.php";
  static const String addPrivatePost1 = "$server/subadmin/addPrivatePost1.php";
  static const String addPrivatePost2 = "$server/subadmin/addPrivatePost2.php";
  static const String getRealestate = "$server/subadmin/getrealestate.php";
  // static const String deletePostRealEstateBySubAdmin =
  //     "$server/subadmin/deletePostRealEstateBySubAdmin.php";
  static const String getAllSwimBySubAdmin =
      "$server/subadmin/getAllSwimBySubAdmin.php";
  static const String getAllWiddingBySubAdmin =
      "$server/subadmin/getAllWiidingBySubAdmin.php";
  static const String getReportPost = "$server/subadmin/get_report_post.php";
  static const String get_users_in_blaklist =
      "$server/subadmin/get_users_in_blaklist.php";
  static const String update_user_type_to_active =
      "$server/subadmin/update_user_type_to_active.php";
  static const String declair_the_case_of_cancel_post =
      "$server/subadmin/declair_the_case_of_cancel_post.php";
  static const String get_report_user = "$server/subadmin/get_report_user.php";
  // static const String deletePostSwimBySubAdmin =
  //     "$server/subadmin/deletePostSwimBySubAdmin.php";
  // static const String deletePostWiddingBySubAdmin =
  //     "$server/subadmin/deletePostWiddingBySubAdmin.php";

  //widding
  static const String addwidding2 = "$server/widding_hall/addwidding2.php";
  static const String addwidding3 = "$server/widding_hall/addwidding3.php";
  static const String addwidding4 = "$server/widding_hall/addwidding4.php";
  static const String addwidding5 = "$server/widding_hall/addwidding5.php";
  static const String addwidding6 = "$server/widding_hall/addwidding6.php";
  static const String addwidding7 = "$server/widding_hall/addwidding7.php";
  static const String addwidding8 = "$server/widding_hall/addwidding8.php";

  //Admin
  static const String addSubAdmin = "$server/admin/addsubadmin.php";
  static const String login_control_panel_admnin =
      "$server/admin/login_control_panel_admin.php";
  static const String search_to_do_admin =
      "$server/admin/search_to_do_admin.php";
  static const String add_subadmin_found =
      "$server/admin/add_subadmin_found.php";
  static const String add_subadmin_not_found =
      "$server/admin/add_subadmin_not_found.php";
  static const String get_all_admin = "$server/admin/get_all_admin.php";
  static const String update_admin_to_user =
      "$server/admin/update_admin_to_user.php";
  static const String remove_post_option =
      "$server/admin/remove_post_option.php";
  static const String remove_review_option =
      "$server/admin/remove_review_option.php";
  static const String get_my_type_to_login =
      "$server/admin/get_my_type_to_login.php";
  static const String get_my_options = "$server/admin/get_my_options.php";

  //user
  static const String getCarLocationsell =
      "$server/user/get_cars_location_sell.php";
  static const String getCarLocationrent =
      "$server/user/get_cars_location_rent.php";
  static const String getSwimLocation = "$server/user/get_swim_location.php";
  static const String getWiddingLocation =
      "$server/user/get_widding_location.php";
  static const String getRealEstateLocationsell =
      "$server/user/get_realestate_location_sell.php";
  static const String getRealEstateLocationrent =
      "$server/user/get_realestate_location_rent.php";
  static const String getInfoByUsers = "$server/user/getInfo.php";
  static const String getMyPostByUsers = "$server/user/get_my_post.php";
  static const String getCarPrimium = "$server/user/get_car_primium.php";
  static const String getRealPrimium = "$server/user/get_real_primium.php";
  static const String postForOneUser =
      "$server/user/get_all_post-for_any_user.php";

  //
  static const String getAllCarByUser = "$server/user/getAllCarByUser.php";
  static const String getAllRealEstateByUser =
      "$server/user/getAllRealEstateByUser.php";

  //users profile
  static const String updateCodePost =
      "$server/usersProfile/update_code_post.php";
  static const String changeToActice =
      "$server/usersProfile/change_to_active.php";
  static const String changeToEnded =
      "$server/usersProfile/change_to_ended.php";

  static const String deletePostCarByUser =
      "$server/usersProfile/delete_post_car.php";

  static const String deletePostRealByUser =
      "$server/usersProfile/delete_post_real.php";

  static const String deletePostSwimByUser =
      "$server/usersProfile/delete_post_swim.php";

  static const String deletePostWiddingByUser =
      "$server/usersProfile/delete_post_widding.php";

  static const String addReportByUser = "$server/usersProfile/add_report.php";
  static const String addReportByUserBecBLACK =
      "$server/usersProfile/add_report_BLACK.php";
  static const String update_profiile_info =
      "$server/usersProfile/update_profiile_info.php";

  //codeQR
  static const String getCoedQR = "$server/codeQR/get_code_QR.php";

  //favorite
  static const String addFav = "$server/favorite/add_fav.php";
  static const String removeFav = "$server/favorite/remove_fav.php";
  static const String viewFav = "$server/favorite/view_fav.php";
  static const String viewAllFav = "$server/favorite/view_all_fav.php";

  //notification
  static const String getNotificationForUser =
      "$server/notification/get_noti_for_user.php";
  static const String getNotificationForSubAdmin =
      "$server/notification/get_noti_for_subadmin.php";
  static const String delete_notification =
      "$server/notification/delete_notification.php";

  //image code
  static const String get_data_image = "$server/imagecode/get_data_image.php";
  static const String addImageCode = "$server/imagecode/addImage.php";
  static const String updateImageCode = "$server/imagecode/updateImage.php";

  //sub admin review
  static const String get_users_and_num_post_by_status0 =
      "$server/sub_admin_review/get_users_and_num_post_by_status0.php";
  static const String get_users_and_num_post_by_status1 =
      "$server/sub_admin_review/get_users_and_num_post_by_status1.php";
  static const String get_users_and_num_post_by_status2 =
      "$server/sub_admin_review/get_users_and_num_post_by_status2.php";
  static const String get_users_and_num_post_by_statusAll =
      "$server/sub_admin_review/get_users_and_num_post_by_status_all.php";
  static const String get_post_by_subadmin_review =
      "$server/sub_admin_review/get_all_all.php";
  static const String get_post_by_dat =
      "$server/sub_admin_review/get_post_by_dat.php";
  static const String sendNotification =
      "$server/sub_admin_review/sendNotification.php";
  static const String update_post_to_status0_and_code_to0 =
      "$server/sub_admin_review/update_post_to_status0_and_code_to0.php";

  //level
  static const String get_num_post_to_user =
      "$server/level/get_num_post_to_user.php";
  static const String update_to_level = "$server/level/update_to_level.php";
  static const String get_the_level = "$server/level/get_the_level.php";
  static const String level200 = "$server/level/level200.php";
  static const String update_to_level200 =
      "$server/level/update_to_level200.php";
  static const String update_to_level3 = "$server/level/update_to_level3.php";

  //aldata
  static const String get_in_all_city = "$server/allhome/get_in_all_city.php";
  static const String get_in_all_region =
      "$server/allhome/get_in_all_region.php";

  //search
  static const String searchCar = "$server/search/searchCar.php";
  static const String searchManzel = "$server/search/searchManzel.php";
}
