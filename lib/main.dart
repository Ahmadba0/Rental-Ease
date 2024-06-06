// ignore_for_file: prefer_const_constructors, constant_identifier_names

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:get/get.dart';
import 'package:rental_ease/core/binding/initial_binding.dart';
import 'package:rental_ease/core/function/local_notifications.dart';
import 'package:rental_ease/core/localization/changeLocal.dart';
import 'package:rental_ease/core/localization/translation.dart';
import 'package:rental_ease/core/middleware/mymidleware.dart';
import 'package:rental_ease/view/screen/admin/add_sub_admin_post.dart';
import 'package:rental_ease/view/screen/admin/add_sub_admin_review.dart';
import 'package:rental_ease/view/screen/admin/control_panel_admin.dart';
import 'package:rental_ease/view/screen/admin/show_Option_admin.dart';
import 'package:rental_ease/view/screen/admin/show_admin.dart';
import 'package:rental_ease/view/screen/another_page.dart';
import 'package:rental_ease/view/screen/details_after_profile.dart';
import 'package:rental_ease/view/screen/details_after_view_more.dart';
import 'package:rental_ease/view/screen/favoritePage.dart';
import 'package:rental_ease/view/screen/imagecode/add_image_code%20.dart';
import 'package:rental_ease/view/screen/imagecode/edit_image_code.dart';
import 'package:rental_ease/view/screen/imagecode/show_image_code.dart';
import 'package:rental_ease/view/screen/map_all_page.dart';
import 'package:rental_ease/view/screen/notification_page.dart';
import 'package:rental_ease/view/screen/pageAfterSquare.dart';
import 'package:rental_ease/view/screen/post_for_one_user.dart';
import 'package:rental_ease/view/screen/profile.dart';
import 'package:rental_ease/view/screen/searchPage.dart';
import 'package:rental_ease/view/screen/sub_admin_review/get_post_by_day_page.dart';
import 'package:rental_ease/view/screen/sub_admin_review/get_posts.dart';
import 'package:rental_ease/view/screen/sub_admin_review/get_users_and_num_post.dart';
import 'package:rental_ease/view/screen/subadmin/get_user_in_blacklist.dart';
import 'package:rental_ease/view/screen/subadmin/report_option.dart';
import 'package:rental_ease/view/screen/subadmin/report_post_page.dart';
import 'package:rental_ease/view/screen/subadmin/report_user_page.dart';
import 'package:rental_ease/view/screen/viewMoreAfterHome.dart';
import 'package:rental_ease/view/screen/codePage.dart';
import 'package:rental_ease/view/screen/subadmin/details_car.dart';
import 'package:rental_ease/view/screen/subadmin/details_realestate_manzel.dart';
import 'package:rental_ease/view/screen/subadmin/details_swim.dart';
import 'package:rental_ease/view/screen/subadmin/details_widding.dart';
import 'package:rental_ease/view/screen/subadmin/privatePostPage.dart';
import 'package:rental_ease/view/screen/subadmin/realestate_post_waiting_maktab.dart';
import 'package:rental_ease/view/screen/subadmin/realestate_post_waiting_manzel.dart';
import 'package:rental_ease/view/screen/subadmin/realestate_post_waiting_tabeq.dart';
import 'package:rental_ease/view/screen/subadmin/subadminscreen.dart';
import 'package:rental_ease/view/screen/subadmin/car_post_waiting.dart';
import 'package:rental_ease/view/screen/auth/checknumber.dart';
import 'package:rental_ease/view/screen/auth/login.dart';
import 'package:rental_ease/view/screen/auth/reset_password.dart';
import 'package:rental_ease/view/screen/auth/signup.dart';
import 'package:rental_ease/view/screen/auth/verfiy_code_signup.dart';
import 'package:rental_ease/view/screen/auth/verify_code_forget.dart';
import 'package:rental_ease/view/screen/users_add/carPage.dart';
import 'package:rental_ease/view/screen/home.dart';
import 'package:rental_ease/view/screen/homeScreen.dart';
import 'package:rental_ease/view/screen/users_add/housePage.dart';
import 'package:rental_ease/view/screen/onBoard_lang/language.dart';
import 'package:rental_ease/view/screen/onBoard_lang/onBoarding.dart';
import 'package:rental_ease/view/screen/subadmin/swim_post_waiting.dart';
import 'package:rental_ease/view/screen/subadmin/widding_post_waiting.dart';
import 'package:rental_ease/view/screen/users_add/swimPage.dart';
import 'package:rental_ease/view/screen/users_add/weddingHall.dart';
import 'core/services/services.dart';

final navigatorKey = GlobalKey<NavigatorState>();
FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
    FlutterLocalNotificationsPlugin();

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
      options: FirebaseOptions(
    apiKey: 'key',
    appId: 'id',
    messagingSenderId: 'sendid',
    projectId: 'myapp',
    storageBucket: 'myapp-b9yt18.appspot.com',
  ));
  await initialServices();
  await LocalNotifications.init();
  anotherPage();
  runApp(const MyApp());
}

anotherPage() async {
  //  handle in terminated state
  var initialNotification =
      await flutterLocalNotificationsPlugin.getNotificationAppLaunchDetails();
  if (initialNotification?.didNotificationLaunchApp == true) {
    // LocalNotifications.onClickNotification.stream.listen((event) {
    Future.delayed(Duration(seconds: 1), () {
      // print(event);
      navigatorKey.currentState!.pushNamed('/another',
          arguments: initialNotification?.notificationResponse?.payload);
    });
  }
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    LocaleController controller = Get.put(LocaleController());
    return GetMaterialApp(
      translations: MyTranslation(),
      locale: controller.language,
      debugShowCheckedModeBanner: false,
      initialBinding: InitialBinding(),
      theme: controller.appTheme,
      // home: const Language(),
      getPages: routes,
      //routes: routes,
    );
  }
}

class AppRoutes {
  static const String login = "/login";
  static const String onBoarding = "/onBoarding";
  static const String signUp = "/signUp";
  static const String verifyCodeSignup = "/verifyCodeSignup";
  static const String verifyCodeForget = "/verifyCodeForget";
  static const String resetPassword = "/resetPassword";
  static const String checkNumber = "/checkNumber";
  static const String home = "/home";
  static const String homeScreen = "/homeScreen";
  static const String carPage = "/carPage";
  static const String housePage = "/housePage";
  static const String swimPage = "/swimPage";
  static const String subAdminScreen = "/subAdminScreen";
  static const String carPostWaiting = "/carPostWaiting";
  static const String widdingHall = "/widdingHall";
  static const String detailsCar = "/detailsCar";
  static const String codePage = "/codePage";
  static const String adminPage = "/adminPage";
  static const String addSubAdmin = "/addSubAdmin";
  static const String another = "/another";
  static const String privatePostPage = "/privatePostPage";
  static const String realestatePostWaiting_manzel =
      "/realestatePostWaiting_manzel";
  static const String realestatePostWaiting_tabeq =
      "/realestatePostWaiting_tabeq";
  static const String realestatePostWaiting_maktab =
      "/realestatePostWaiting_maktab";
  static const String detailsRealestateManzel = "/detailsRealestateManzel";
  static const String swimPostWaiting = "/swimPostWaiting";
  static const String widdingPostWaiting = "/widdingPostWaiting";
  static const String detailsSwimSubAdimn = "/detailsSwimSubAdimn";
  static const String detailsWiddingSubAdimn = "/detailsWiddingSubAdimn";
  //static const String carSellView = "/carSellView";
  //static const String carSellDetails = "/carSellDetails";
  //static const String swimView = "/swimView"; //DetailsTRealestateManzel
  //static const String swimDetails = "/swimDetails";
  //static const String carSellView = "/carSellView";
  // static const String carSellDetails = "/carSellDetails";
  // static const String carRentView = "/carRentView";
  // static const String carRentDetails = "/carRentDetails";
  // static const String widdingView = "/widdingView";
  // static const String widdingDetails = "/widdingDetails";
  // static const String manzelView = "/manzelView";
  // static const String manzelDetails = "/manzelDetails";
  // static const String maktabView = "/maktabView";
  // static const String maktabDetails = "/maktabDetails";
  // static const String tabeqView = "/tabeqView";
  // static const String tabeqDetails = "/tabeqDetails";
  static const String viewMore = "/viewMore";
  static const String detailsAfterViewMore = "/detailsAfterViewMore";
  static const String profile = "/profile";
  static const String detailsAfterProfile = "/detailsAfterProfile";
  static const String favoritePage = "/favoritePage";
  static const String mapAllPage = "/mapAllPage";
  static const String notificationPage = "/notificationPage";
  static const String reportPostPage = "/reportPostPage";
  static const String controlPanelAdmin = "/controlPanelAdmin";
  static const String showOptionAdmin = "/showOptionAdmin";
  static const String addSubAdminPost = "/addSubAdminPost";
  static const String addSubAdminReview = "/addSubAdminReview";
  static const String showAdmin = "/showAdmin";
  static const String showImageCode = "/showImageCode";
  static const String addImageCode = "/addImageCode";
  static const String editImageCode = "/editImageCode";
  static const String getUserInBlackList = "/getUserInBlackList";
  static const String reportOption = "/reportOption";
  static const String reportUserPage = "/reportUserPage";
  static const String getUsersAndNumPost = "/getUsersAndNumPost";
  static const String getPost = "/getPost";
  static const String pageAfterSquare = "/pageAfterSquare";
  static const String searchPage = "/searchPage";
  static const String postForOneUser = "/postForOneUser";
  static const String getPostBydaypage = "/getPostBydaypage";
}

List<GetPage<dynamic>>? routes = [
  GetPage(
    name: "/",
    page: () => const Language(),
    middlewares: [MyMidleware()],
  ),
  GetPage(name: AppRoutes.onBoarding, page: () => const OnBoarding()),
  GetPage(name: AppRoutes.login, page: () => const Login()),
  GetPage(name: AppRoutes.signUp, page: () => const SignUp()),
  GetPage(
      name: AppRoutes.verifyCodeSignup, page: () => const VerifyCodeSignup()),
  GetPage(
      name: AppRoutes.verifyCodeForget, page: () => const VerifyCodeForget()),
  GetPage(name: AppRoutes.resetPassword, page: () => const ResetPassword()),
  GetPage(name: AppRoutes.checkNumber, page: () => const CheckNumber()),
  GetPage(name: AppRoutes.home, page: () => const Home()),
  GetPage(name: AppRoutes.homeScreen, page: () => const HomeScreen()),
  GetPage(name: AppRoutes.carPage, page: () => const CarPage()),
  GetPage(name: AppRoutes.housePage, page: () => const HousePage()),
  GetPage(name: AppRoutes.swimPage, page: () => const SwimPage()),
  GetPage(name: AppRoutes.subAdminScreen, page: () => const SubAdminScreen()),
  GetPage(name: AppRoutes.carPostWaiting, page: () => const CarPostWaiting()),
  GetPage(name: AppRoutes.widdingHall, page: () => const WiddingHall()),
  GetPage(name: AppRoutes.detailsCar, page: () => const DetailsCar()),
  GetPage(name: AppRoutes.codePage, page: () => const CodePage()),
  GetPage(name: AppRoutes.another, page: () => const AnotherPage()),
  GetPage(name: AppRoutes.privatePostPage, page: () => const PrivatePostPage()),
  GetPage(
      name: AppRoutes.realestatePostWaiting_manzel,
      page: () => const RealEstatePOstWaitingManzel()),
  GetPage(
      name: AppRoutes.detailsRealestateManzel,
      page: () => const DetailsRealestateManzel()),
  GetPage(
      name: AppRoutes.realestatePostWaiting_tabeq,
      page: () => const RealEstatePOstWaitingTabeq()),
  GetPage(
      name: AppRoutes.realestatePostWaiting_maktab,
      page: () => const RealEstatePOstWaitingMaktab()),
  GetPage(name: AppRoutes.swimPostWaiting, page: () => const SwimPostWaiting()),
  GetPage(
      name: AppRoutes.widdingPostWaiting,
      page: () => const WiddingPostWaiting()),
  GetPage(
      name: AppRoutes.detailsSwimSubAdimn,
      page: () => const DetailsSwimSubAdmin()),
  GetPage(
      name: AppRoutes.detailsWiddingSubAdimn,
      page: () => const DetailsWiddingSubAdmin()),
  //GetPage(name: AppRoutes.carSellView, page: () => const CarSellView()),
  //GetPage(name: AppRoutes.carSellDetails, page: () => const CarSellDetails()),
  //GetPage(name: AppRoutes.swimView, page: () => const SwimView()),
  //GetPage(name: AppRoutes.swimDetails, page: () => const SwimDetails()),
  //GetPage(name: AppRoutes.carSellView, page: () => const CarSellView()),
  // GetPage(name: AppRoutes.carSellDetails, page: () => const CarSellDetails()),
  // GetPage(name: AppRoutes.carRentView, page: () => const CarRentView()),
  // GetPage(name: AppRoutes.carRentDetails, page: () => const CarRentDetails()),
  // GetPage(name: AppRoutes.widdingView, page: () => const WiddingView()),
  // GetPage(name: AppRoutes.widdingDetails, page: () => const WiddingDetails()),
  // GetPage(name: AppRoutes.manzelView, page: () => const ManzelView()),
  // GetPage(name: AppRoutes.manzelDetails, page: () => const ManzelDetails()),
  // GetPage(name: AppRoutes.maktabView, page: () => const MaktabView()),
  // GetPage(name: AppRoutes.maktabDetails, page: () => const MaktabDetails()),
  // GetPage(name: AppRoutes.tabeqView, page: () => const TabeqView()),
  // GetPage(name: AppRoutes.tabeqDetails, page: () => const TabeqDetails()),
  GetPage(name: AppRoutes.viewMore, page: () => const ViewMoreAfterHomePage()),
  GetPage(
      name: AppRoutes.detailsAfterViewMore,
      page: () => const DetailsAfterViewMore()),
  GetPage(name: AppRoutes.profile, page: () => const Profile()),
  GetPage(
      name: AppRoutes.detailsAfterProfile,
      page: () => const DetailsAfterProfile()),
  GetPage(name: AppRoutes.favoritePage, page: () => const FavoritePage()),
  GetPage(name: AppRoutes.mapAllPage, page: () => const MapAllPage()),
  GetPage(
      name: AppRoutes.notificationPage, page: () => const NotificationPage()),
  GetPage(name: AppRoutes.reportPostPage, page: () => const ReportPostPage()),
  GetPage(
      name: AppRoutes.controlPanelAdmin, page: () => const ControlPanelAdmin()),
  GetPage(name: AppRoutes.showOptionAdmin, page: () => const ShowOptionAdmin()),
  GetPage(name: AppRoutes.addSubAdminPost, page: () => const AddSubAdminPost()),
  GetPage(
      name: AppRoutes.addSubAdminReview, page: () => const AddSubAdminReview()),
  GetPage(name: AppRoutes.showAdmin, page: () => const ShowAdmin()),
  GetPage(name: AppRoutes.showImageCode, page: () => const ShowImageCode()),
  GetPage(name: AppRoutes.addImageCode, page: () => const AddImageCode()),
  GetPage(name: AppRoutes.editImageCode, page: () => const EditImageCode()),
  GetPage(
      name: AppRoutes.getUserInBlackList,
      page: () => const GetUserInBlackList()),
  GetPage(name: AppRoutes.reportOption, page: () => const ReportOption()),
  GetPage(name: AppRoutes.reportUserPage, page: () => const ReportUserPage()),
  GetPage(
      name: AppRoutes.getUsersAndNumPost,
      page: () => const GetUsersAndPostNum()),
  GetPage(name: AppRoutes.getPost, page: () => const GetPost()),
  GetPage(name: AppRoutes.pageAfterSquare, page: () => const PageAftersquare()),
  GetPage(name: AppRoutes.searchPage, page: () => const SearchPage()),
  GetPage(name: AppRoutes.postForOneUser, page: () => const PostForOneUser()),
  GetPage(
      name: AppRoutes.getPostBydaypage, page: () => const GetpostByDayPage()),
];

//ctrl k ctrl c
//ctrl k ctrl u

    //  shape: RoundedRectangleBorder(side: BorderSide(color: AppColor.blue)),

    //  ,style: TextStyle(color: AppColor.orange),

    // decoration: BoxDecoration(
    //                 border: Border(bottom: BorderSide(color: AppColor.blue))),


              //   AnimationConfiguration.staggeredList(
              // position: 1,
              // child: SlideAnimation(
              //   duration: Duration(milliseconds: 1000),
              //   curve: Curves.easeInOut,
              //   verticalOffset: 400,
              //   child: FadeInAnimation(


        //          appBar: AppBar(
        // title: Text(
        //   "الصور",
        //   style: TextStyle(color: AppColor.orange),
        // ),
        // backgroundColor: AppColor.blue,
        // centerTitle: true,