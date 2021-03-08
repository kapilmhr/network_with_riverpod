import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter_clean_architecture/utils/Exception.dart';

import 'ApiUrl.dart';
import 'model/Flower.dart';

class ApiServices {
  Future<List<Flower>> getFlowers() async {
    var dio = Dio();

    try {
      var response = await dio.get(ApiUrl.baseUrl + ApiUrl.flowers);
      return FlowerList.fromJson(response.data).flowerLists;
    } on DioError catch (e) {
      print(getDioException(e));
      throw Exception(getDioException(e));
    }
  }
}
