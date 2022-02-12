import 'package:auro_sports_app/common/custom_color.dart';
import 'package:auro_sports_app/common/field_decorations.dart';
import 'package:auro_sports_app/common/field_validation.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'model/city_model.dart';
import 'model/country_model.dart';
import 'model/state_model.dart';
import 'profile_screen_controller.dart';

editProfileDialogModule(BuildContext context) {
  final profileScreenController = Get.find<ProfileScreenController>();

  return showDialog(
      context: context,
      builder: (BuildContext context) {
        return StatefulBuilder(
          builder: (context, setState2) {
            return Obx(
                  () => profileScreenController.isLoading.value
                  ? Center(child: CircularProgressIndicator())
                  : AlertDialog(
                content: Form(
                  key: profileScreenController.formKey,
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      EditProfileTextModule(),
                      SizedBox(height: 5),
                      FullNameTextField(),
                      SizedBox(height: 8),
                      CountryDropDownModule(),
                      SizedBox(height: 8),
                      StateDropDownModule(),
                      SizedBox(height: 8),
                      CityDropDownModule(),
                      SizedBox(height: 8),
                      UpdateButton(),
                    ],
                  ),
                ),
              ),
            );
          },
        );
      });
}

class FullNameTextField extends StatelessWidget {
  final profileScreenController = Get.find<ProfileScreenController>();

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      cursorColor: CustomColor.kOrangeColor,
      controller: profileScreenController.fullNameController,
      validator: (value) => FieldValidator().validateFullName(value!),
      decoration: textFieldDecoration(hintText: 'UserName'),
    );
  }
}

class CountryDropDownModule extends StatelessWidget {
  final profileScreenController = Get.find<ProfileScreenController>();

  @override
  Widget build(BuildContext context) {
    return Obx(
          () => Container(
        padding: EdgeInsets.only(left: 10, right: 10),
        width: Get.width,
        height: 43,
        decoration: BoxDecoration(
          // borderRadius: BorderRadius.circular(35),
          border: Border.all(color: Colors.grey),
        ),
        child: DropdownButton<Datum>(
          value: profileScreenController.countryDropDownValue,
          icon: Icon(Icons.keyboard_arrow_down_rounded, color: Colors.grey),
          style: TextStyle(color: Colors.grey),
          isExpanded: true,
          underline: Container(
            height: 1,
            color: Colors.white,
          ),
          onChanged: (newValue) {
            profileScreenController.countryDropDownValue!.name = newValue!.name;
            profileScreenController.countryDropDownValue!.id = newValue.id;
            print(
                "countryDropDownValue : ${profileScreenController.countryDropDownValue!.name}");
            print("countryDropDownValue ID : ${newValue.id}");
            profileScreenController.getStateData(newValue.id);
          },
          items: profileScreenController.countryLists
              .map<DropdownMenuItem<Datum>>((Datum value) {
            return DropdownMenuItem<Datum>(
              value: value,
              child: Text(value.name),
            );
          }).toList(),
        ),
      ),
    );
  }
}

class StateDropDownModule extends StatelessWidget {
  final profileScreenController = Get.find<ProfileScreenController>();

  @override
  Widget build(BuildContext context) {
    return Obx(
          () => Container(
        padding: EdgeInsets.only(left: 10, right: 10),
        width: Get.width,
        height: 43,
        decoration: BoxDecoration(
          // borderRadius: BorderRadius.circular(35),
          border: Border.all(color: Colors.grey),
        ),
        child: DropdownButton<DatumState>(
          value: profileScreenController.stateDropDownValue,
          icon:
          const Icon(Icons.keyboard_arrow_down_rounded, color: Colors.grey),
          style: const TextStyle(color: Colors.grey),
          isExpanded: true,
          underline: Container(
            height: 1,
            color: Colors.white,
          ),
          onChanged: (newValue) {
            profileScreenController.stateDropDownValue!.name = newValue!.name;
            profileScreenController.stateDropDownValue!.id = newValue.id;
            print(
                "stateDropDownValue : ${profileScreenController.stateDropDownValue}");
            print('newValue.name : ${newValue.name}');
            profileScreenController.getCityData(newValue.id);
            profileScreenController.loading();
          },
          items: profileScreenController.stateLists
              .map<DropdownMenuItem<DatumState>>((DatumState value) {
            return DropdownMenuItem<DatumState>(
              value: value,
              child: Text(value.name),
            );
          }).toList(),
        ),
      ),
    );
  }
}

class CityDropDownModule extends StatelessWidget {
  final profileScreenController = Get.find<ProfileScreenController>();

  @override
  Widget build(BuildContext context) {
    return Obx(
          () => Container(
        padding: EdgeInsets.only(left: 10, right: 10),
        width: Get.width,
        height: 43,
        decoration: BoxDecoration(
          // borderRadius: BorderRadius.circular(35),
          border: Border.all(color: Colors.grey),
        ),
        child: DropdownButton<DatumCity>(
          value: profileScreenController.cityDropDownValue,
          icon: Icon(Icons.keyboard_arrow_down_rounded, color: Colors.grey),
          style: TextStyle(color: Colors.grey),
          isExpanded: true,
          underline: Container(
            height: 1,
            color: Colors.white,
          ),
          onChanged: (newValue) {
            profileScreenController.cityDropDownValue!.name = newValue!.name;
            profileScreenController.cityDropDownValue!.id = newValue.id;
            print(
                "cityDropDownValue : ${profileScreenController.cityDropDownValue}");
            print('newValue.name : ${newValue.name}');
            profileScreenController.loading();
          },
          items: profileScreenController.cityLists
              .map<DropdownMenuItem<DatumCity>>((DatumCity value) {
            return DropdownMenuItem<DatumCity>(
              value: value,
              child: Text(value.name),
            );
          }).toList(),
        ),
      ),
    );
  }
}

// Constant Module
class EditProfileTextModule extends StatelessWidget {
  const EditProfileTextModule({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Edit Profile',
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 15,
          ),
        ),
        Divider(color: CustomColor.kLightOrangeColor, thickness: 1),
      ],
    );
  }
}

class UpdateButton extends StatelessWidget {
  UpdateButton({Key? key}) : super(key: key);
  final profileScreenController = Get.find<ProfileScreenController>();

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        if (profileScreenController.formKey.currentState!.validate()) {
          if (profileScreenController.countryDropDownValue!.id == 0) {
            Fluttertoast.showToast(
                msg: 'Please Select Country', toastLength: Toast.LENGTH_LONG);
          } else if (profileScreenController.stateDropDownValue!.id == 0) {
            Fluttertoast.showToast(
                msg: 'Please Select State', toastLength: Toast.LENGTH_LONG);
          } else if (profileScreenController.cityDropDownValue!.id == 0) {
            Fluttertoast.showToast(
                msg: 'Please Select City', toastLength: Toast.LENGTH_LONG);
          } else {
            profileScreenController.updateProfileData(
              "${profileScreenController.fullNameController.text.trim()}",
            );
          }
        }
      },
      child: Container(
        width: Get.width,
        decoration: BoxDecoration(
            color: CustomColor.kOrangeColor,
            borderRadius: BorderRadius.circular(25)),
        child: Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 15),
            child: Text(
              'Update',
              style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 15),
            ),
          ),
        ),
      ),
    );
  }
}
