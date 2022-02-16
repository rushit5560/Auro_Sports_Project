import 'dart:convert';

import 'package:auro_sports_app/common/api_url.dart';
import 'package:auro_sports_app/models/profile_screen_model/country_model.dart';
import 'package:auro_sports_app/models/profile_screen_model/state_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;
import '../../models/profile_screen_model/city_model.dart';
import '../../models/profile_screen_model/update_profile_model.dart';

class ProfileScreenController extends GetxController {
  var userId;
  RxBool isLoading = false.obs;
  RxBool isStatus = false.obs;
  GlobalKey<FormState> formKey = GlobalKey();
  TextEditingController fullNameController = TextEditingController();
  Datum? countryDropDownValue;
  DatumState? stateDropDownValue;
  DatumCity? cityDropDownValue;


  RxList<Datum> countryLists = [Datum(id: 0, name: 'Select Country', sortname: '')].obs;
  RxList<DatumState> stateLists = [DatumState(id: 0, name: 'Select State', countryId: 0)].obs;
  RxList<DatumCity> cityLists = [DatumCity(id: 0, name: 'Select City', stateId: 0)].obs;


  getAllCountryData() async {
    isLoading(true);
    String url = ApiUrl.CountryApi;
    print('Url : $url');

    try{
      http.Response response = await http.get(Uri.parse(url));

      AllCountryData countryList = AllCountryData.fromJson(json.decode(response.body));
      isStatus = countryList.success.obs;

      if(isStatus.value){
        countryLists.clear();
        countryLists.add(Datum(id: 0, name: 'Select Country', sortname: ''));
        countryLists.addAll(countryList.data);
        countryDropDownValue = countryLists[0];
        print('countryLists : ${countryLists.length}');
      } else {
        print('Country False False');
      }
    } catch(e) {
      print('Country Error : $e');
    } finally {
      isLoading(false);
    }
  }

  getStateData(int countryId) async {
    // isLoading(true);
    String url = ApiUrl.StateApi;
    print('Url : $url');

    try{
      Map data = {
        "id": "$countryId"
      };
      print('data : $data');

      http.Response response = await http.post(Uri.parse(url), body: data);
      StateData stateData = StateData.fromJson(json.decode(response.body));
      isStatus = stateData.success.obs;
      if(isStatus.value){
        stateLists.clear();
        stateLists.add(DatumState(id: 0, name: 'Select State', countryId: 0));
        stateLists.addAll(stateData.data);
        stateDropDownValue = stateLists[0];
        print('stateLists : ${stateLists.length}');
      } else {
        print('State False False');
      }
    } catch(e) {
      print('State Error : $e');
    } finally {
      // isLoading(false);
      loading();
    }
  }

  getCityData(int stateId) async {
    isLoading(true);
    String url = ApiUrl.CityApi;
    print('Url : $url');

    try{
      Map data = {
        "id": "$stateId"
      };

      http.Response response = await http.post(Uri.parse(url), body: data);
      CityData cityData = CityData.fromJson(json.decode(response.body));
      isStatus = cityData.success.obs;

      if(isStatus.value){
        cityLists.clear();
        cityLists.add(DatumCity(id: 0, name: 'Select City', stateId: 0));
        cityLists.addAll(cityData.data);
        cityDropDownValue = cityLists[0];
        print('cityLists : ${cityLists.length}');
      } else {
        print('City False False');
      }
    } catch(e){
      print('City Error : $e');
    } finally {
      isLoading(false);
    }
  }

  updateProfileData(String userName) async {
    isLoading(true);
    String url = ApiUrl.UpdateUserProfileApi;
    print('Url : $url');

    try{
      Map data = {
        "userid": "$userId",
        "name": "$userName",
        "country": "${countryDropDownValue!.id}",
        "state": "${stateDropDownValue!.id}",
        "city": "${cityDropDownValue!.id}"
      };
      print('data : $data');

      http.Response response = await http.post(Uri.parse(url), body: data);
      UpdateProfileData updateProfileData = UpdateProfileData.fromJson(json.decode(response.body));
      isStatus = updateProfileData.success.obs;

      if(isStatus.value){
        Get.back();
        Get.snackbar('Success', '${updateProfileData.message}');
      } else {
        Get.snackbar('Failed', '${updateProfileData.message}');
      }
    } catch(e){
      print('Update Profile Error : $e');
    } finally {
      isLoading(false);
    }
  }

  @override
  void onInit() {
    getAllCountryData();
    getUserDetailsFromPrefs();
    countryDropDownValue = countryLists[0];
    stateDropDownValue = stateLists[0];
    cityDropDownValue = cityLists[0];
    super.onInit();
  }

  getUserDetailsFromPrefs() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    userId = prefs.getInt('id');
    print('UserId : $userId');
  }

  loading(){
    isLoading(true);
    isLoading(false);
  }

}