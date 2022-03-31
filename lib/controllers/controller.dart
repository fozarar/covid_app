import 'package:covid_app/models/response_model.dart';
import 'package:covid_app/services/http_services.dart';
import 'package:get/get.dart';

class CovidDataController extends GetxController {
  var globalData = <Global>[].obs;
  var countryData = <Countries>[].obs;

  getGlobalCovidDataNum() {
    HttpServices().getGlobalData().then((value) => globalData.add(value!));
  }

  getCountryCovidDataNum() {
    HttpServices().getCountryData().then((value) => countryData.value = value!);
  }
}
