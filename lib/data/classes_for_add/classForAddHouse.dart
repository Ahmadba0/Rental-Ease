// ignore_for_file: non_constant_identifier_names, file_names

import 'dart:io';

import 'package:rental_ease/applink.dart';
import 'package:rental_ease/core/class/crud.dart';

class AddHouseData {
  Crud crud;
  AddHouseData(this.crud);

  addHouseData(
    String realestate_type,
    String realestate_city,
    String realestate_region,
    String realestate_lat,
    String realestate_long,
    String realestate_distance,
    String realestate_desc,
    String realestate_numsettingroom,
    String realestate_numbedroom,
    String realestate_numbathroom,
    String realestate_numkitchen,
    String realestate_numbalcon,
    String realestate_numflat,
    String post_num,
    File file0,
    File file1,
    File file2,
    File file3,
    File? file4,
    File? file5,
    File? file6,
    File? file7,
    File? file8,
    File? file9,
  ) async {
    var response = await crud.postRequestWithFiles(
        file4 == null
            ? AppLink.addhouse3
            : file5 == null
                ? AppLink.addhouse4
                : file6 == null
                    ? AppLink.addhouse5
                    : file7 == null
                        ? AppLink.addhouse6
                        : file8 == null
                            ? AppLink.addhouse7
                            : file9 == null
                                ? AppLink.addhouse8
                                : AppLink.addhouse9,
        {
          "realestate_type": realestate_type,
          "realestate_city": realestate_city,
          "realestate_region": realestate_region,
          "realestate_lat": realestate_lat,
          "realestate_long": realestate_long,
          "realestate_distance": realestate_distance,
          "realestate_desc": realestate_desc,
          "realestate_numsettingroom": realestate_numsettingroom,
          "realestate_numbedroom": realestate_numbedroom,
          "realestate_numbathroom": realestate_numbathroom,
          "realestate_numkitchen": realestate_numkitchen,
          "realestate_numbalcon": realestate_numbalcon,
          "realestate_numflat": realestate_numflat,
          "post_num": post_num,
        },
        file4 == null
            ? [
                file0,
                file1,
                file2,
                file3,
              ]
            : file5 == null
                ? [
                    file0,
                    file1,
                    file2,
                    file3,
                    file4,
                  ]
                : file6 == null
                    ? [
                        file0,
                        file1,
                        file2,
                        file3,
                        file4,
                        file5,
                      ]
                    : file7 == null
                        ? [
                            file0,
                            file1,
                            file2,
                            file3,
                            file4,
                            file5,
                            file6,
                          ]
                        : file8 == null
                            ? [
                                file0,
                                file1,
                                file2,
                                file3,
                                file4,
                                file5,
                                file6,
                                file7,
                              ]
                            : file9 == null
                                ? [
                                    file0,
                                    file1,
                                    file2,
                                    file3,
                                    file4,
                                    file5,
                                    file6,
                                    file7,
                                    file8,
                                  ]
                                : [
                                    file0,
                                    file1,
                                    file2,
                                    file3,
                                    file4,
                                    file5,
                                    file6,
                                    file7,
                                    file8,
                                    file9,
                                  ]);
    return response.fold((l) => l, (r) => r);
  }
}

// class AddHouseData9 {
//   Crud crud;
//   AddHouseData9(this.crud);

//   addHouseData9(
//     String realestate_type,
//     String realestate_city,
//     String realestate_region,
//     String realestate_lat,
//     String realestate_long,
//     String realestate_desc,
//     String realestate_numsettingroom,
//     String realestate_numbedroom,
//     String realestate_numbathroom,
//     String realestate_numkitchen,
//     String realestate_numbalcon,
//     String realestate_numflat,
//     String post_num,
//     File file0,
//     File file1,
//     File file2,
//     File file3,
//     File file4,
//     File file5,
//     File file6,
//     File file7,
//     File file8,
//     File file9,
//   ) async {
//     var response = await crud.postRequestWithFiles(AppLink.addhouse9, {
//       "realestate_type": realestate_type,
//       "realestate_city": realestate_city,
//       "realestate_region": realestate_region,
//       "realestate_lat": realestate_lat,
//       "realestate_long": realestate_long,
//       "realestate_desc": realestate_desc,
//       "realestate_numsettingroom": realestate_numsettingroom,
//       "realestate_numbedroom": realestate_numbedroom,
//       "realestate_numbathroom": realestate_numbathroom,
//       "realestate_numkitchen": realestate_numkitchen,
//       "realestate_numbalcon": realestate_numbalcon,
//       "realestate_numflat": realestate_numflat,
//       "post_num": post_num,
//     }, [
//       file0,
//       file1,
//       file2,
//       file3,
//       file4,
//       file5,
//       file6,
//       file7,
//       file8,
//       file9,
//     ]);
//     return response.fold((l) => l, (r) => r);
//   }
// }

// class AddHouseData8 {
//   Crud crud;
//   AddHouseData8(this.crud);

//   addHouseData8(
//     String realestate_type,
//     String realestate_city,
//     String realestate_region,
//     String realestate_lat,
//     String realestate_long,
//     String realestate_desc,
//     String realestate_numsettingroom,
//     String realestate_numbedroom,
//     String realestate_numbathroom,
//     String realestate_numkitchen,
//     String realestate_numbalcon,
//     String realestate_numflat,
//     String post_num,
//     File file0,
//     File file1,
//     File file2,
//     File file3,
//     File file4,
//     File file5,
//     File file6,
//     File file7,
//     File file8,
//   ) async {
//     var response = await crud.postRequestWithFiles(AppLink.addhouse8, {
//       "realestate_type": realestate_type,
//       "realestate_city": realestate_city,
//       "realestate_region": realestate_region,
//       "realestate_lat": realestate_lat,
//       "realestate_long": realestate_long,
//       "realestate_desc": realestate_desc,
//       "realestate_numsettingroom": realestate_numsettingroom,
//       "realestate_numbedroom": realestate_numbedroom,
//       "realestate_numbathroom": realestate_numbathroom,
//       "realestate_numkitchen": realestate_numkitchen,
//       "realestate_numbalcon": realestate_numbalcon,
//       "realestate_numflat": realestate_numflat,
//       "post_num": post_num,
//     }, [
//       file0,
//       file1,
//       file2,
//       file3,
//       file4,
//       file5,
//       file6,
//       file7,
//       file8,
//     ]);
//     return response.fold((l) => l, (r) => r);
//   }
// }

// class AddHouseData7 {
//   Crud crud;
//   AddHouseData7(this.crud);

//   addHouseData7(
//     String realestate_type,
//     String realestate_city,
//     String realestate_region,
//     String realestate_lat,
//     String realestate_long,
//     String realestate_desc,
//     String realestate_numsettingroom,
//     String realestate_numbedroom,
//     String realestate_numbathroom,
//     String realestate_numkitchen,
//     String realestate_numbalcon,
//     String realestate_numflat,
//     String post_num,
//     File file0,
//     File file1,
//     File file2,
//     File file3,
//     File file4,
//     File file5,
//     File file6,
//     File file7,
//   ) async {
//     var response = await crud.postRequestWithFiles(AppLink.addhouse7, {
//       "realestate_type": realestate_type,
//       "realestate_city": realestate_city,
//       "realestate_region": realestate_region,
//       "realestate_lat": realestate_lat,
//       "realestate_long": realestate_long,
//       "realestate_desc": realestate_desc,
//       "realestate_numsettingroom": realestate_numsettingroom,
//       "realestate_numbedroom": realestate_numbedroom,
//       "realestate_numbathroom": realestate_numbathroom,
//       "realestate_numkitchen": realestate_numkitchen,
//       "realestate_numbalcon": realestate_numbalcon,
//       "realestate_numflat": realestate_numflat,
//       "post_num": post_num,
//     }, [
//       file0,
//       file1,
//       file2,
//       file3,
//       file4,
//       file5,
//       file6,
//       file7,
//     ]);
//     return response.fold((l) => l, (r) => r);
//   }
// }

// class AddHouseData6 {
//   Crud crud;
//   AddHouseData6(this.crud);

//   addHouseData6(
//     String realestate_type,
//     String realestate_city,
//     String realestate_region,
//     String realestate_lat,
//     String realestate_long,
//     String realestate_desc,
//     String realestate_numsettingroom,
//     String realestate_numbedroom,
//     String realestate_numbathroom,
//     String realestate_numkitchen,
//     String realestate_numbalcon,
//     String realestate_numflat,
//     String post_num,
//     File file0,
//     File file1,
//     File file2,
//     File file3,
//     File file4,
//     File file5,
//     File file6,
//   ) async {
//     var response = await crud.postRequestWithFiles(AppLink.addhouse6, {
//       "realestate_type": realestate_type,
//       "realestate_city": realestate_city,
//       "realestate_region": realestate_region,
//       "realestate_lat": realestate_lat,
//       "realestate_long": realestate_long,
//       "realestate_desc": realestate_desc,
//       "realestate_numsettingroom": realestate_numsettingroom,
//       "realestate_numbedroom": realestate_numbedroom,
//       "realestate_numbathroom": realestate_numbathroom,
//       "realestate_numkitchen": realestate_numkitchen,
//       "realestate_numbalcon": realestate_numbalcon,
//       "realestate_numflat": realestate_numflat,
//       "post_num": post_num,
//     }, [
//       file0,
//       file1,
//       file2,
//       file3,
//       file4,
//       file5,
//       file6,
//     ]);
//     return response.fold((l) => l, (r) => r);
//   }
// }

// class AddHouseData5 {
//   Crud crud;
//   AddHouseData5(this.crud);

//   addHouseData5(
//     String realestate_type,
//     String realestate_city,
//     String realestate_region,
//     String realestate_lat,
//     String realestate_long,
//     String realestate_desc,
//     String realestate_numsettingroom,
//     String realestate_numbedroom,
//     String realestate_numbathroom,
//     String realestate_numkitchen,
//     String realestate_numbalcon,
//     String realestate_numflat,
//     String post_num,
//     File file0,
//     File file1,
//     File file2,
//     File file3,
//     File file4,
//     File file5,
//   ) async {
//     var response = await crud.postRequestWithFiles(AppLink.addhouse5, {
//       "realestate_type": realestate_type,
//       "realestate_city": realestate_city,
//       "realestate_region": realestate_region,
//       "realestate_lat": realestate_lat,
//       "realestate_long": realestate_long,
//       "realestate_desc": realestate_desc,
//       "realestate_numsettingroom": realestate_numsettingroom,
//       "realestate_numbedroom": realestate_numbedroom,
//       "realestate_numbathroom": realestate_numbathroom,
//       "realestate_numkitchen": realestate_numkitchen,
//       "realestate_numbalcon": realestate_numbalcon,
//       "realestate_numflat": realestate_numflat,
//       "post_num": post_num,
//     }, [
//       file0,
//       file1,
//       file2,
//       file3,
//       file4,
//       file5,
//     ]);
//     return response.fold((l) => l, (r) => r);
//   }
// }

// class AddHouseData4 {
//   Crud crud;
//   AddHouseData4(this.crud);

//   addHouseData4(
//     String realestate_type,
//     String realestate_city,
//     String realestate_region,
//     String realestate_lat,
//     String realestate_long,
//     String realestate_desc,
//     String realestate_numsettingroom,
//     String realestate_numbedroom,
//     String realestate_numbathroom,
//     String realestate_numkitchen,
//     String realestate_numbalcon,
//     String realestate_numflat,
//     String post_num,
//     File file0,
//     File file1,
//     File file2,
//     File file3,
//     File file4,
//   ) async {
//     var response = await crud.postRequestWithFiles(AppLink.addhouse4, {
//       "realestate_type": realestate_type,
//       "realestate_city": realestate_city,
//       "realestate_region": realestate_region,
//       "realestate_lat": realestate_lat,
//       "realestate_long": realestate_long,
//       "realestate_desc": realestate_desc,
//       "realestate_numsettingroom": realestate_numsettingroom,
//       "realestate_numbedroom": realestate_numbedroom,
//       "realestate_numbathroom": realestate_numbathroom,
//       "realestate_numkitchen": realestate_numkitchen,
//       "realestate_numbalcon": realestate_numbalcon,
//       "realestate_numflat": realestate_numflat,
//       "post_num": post_num,
//     }, [
//       file0,
//       file1,
//       file2,
//       file3,
//       file4,
//     ]);
//     return response.fold((l) => l, (r) => r);
//   }
// }

// class AddHouseData3 {
//   Crud crud;
//   AddHouseData3(this.crud);

//   addHouseData3(
//     String realestate_type,
//     String realestate_city,
//     String realestate_region,
//     String realestate_lat,
//     String realestate_long,
//     String realestate_desc,
//     String realestate_numsettingroom,
//     String realestate_numbedroom,
//     String realestate_numbathroom,
//     String realestate_numkitchen,
//     String realestate_numbalcon,
//     String realestate_numflat,
//     String post_num,
//     File file0,
//     File file1,
//     File file2,
//     File file3,
//   ) async {
//     var response = await crud.postRequestWithFiles(AppLink.addhouse3, {
//       "realestate_type": realestate_type,
//       "realestate_city": realestate_city,
//       "realestate_region": realestate_region,
//       "realestate_lat": realestate_lat,
//       "realestate_long": realestate_long,
//       "realestate_desc": realestate_desc,
//       "realestate_numsettingroom": realestate_numsettingroom,
//       "realestate_numbedroom": realestate_numbedroom,
//       "realestate_numbathroom": realestate_numbathroom,
//       "realestate_numkitchen": realestate_numkitchen,
//       "realestate_numbalcon": realestate_numbalcon,
//       "realestate_numflat": realestate_numflat,
//       "post_num": post_num,
//     }, [
//       file0,
//       file1,
//       file2,
//       file3,
//     ]);
//     return response.fold((l) => l, (r) => r);
//   }
// }
