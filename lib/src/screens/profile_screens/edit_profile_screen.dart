/*
*  Filename    :   edit_profile_screen.dart
*  Purpose     :	
*  Created     :   2019-07-24 09:57 by Detective Conan
*	 Updated			:   12/12/2019 10:56 AM PM by Detective Conan
*	 Changes			:   Added snackbar on failure and successfully saved changes
*/

import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:image_picker/image_picker.dart';
import 'package:mt_carmel_app/src/constants/api_constants.dart';
import 'package:mt_carmel_app/src/constants/app_constants.dart';
import 'package:mt_carmel_app/src/core/services/authentication_service.dart';
import 'package:mt_carmel_app/src/core/services/branch_service.dart';
import 'package:mt_carmel_app/src/core/services/crud_service.dart';
import 'package:mt_carmel_app/src/core/services/service_locator.dart';
import 'package:mt_carmel_app/src/core/services/profiles_api/user_profile_service.dart';
import 'package:mt_carmel_app/src/models/city.dart';
import 'package:mt_carmel_app/src/models/country.dart';
import 'package:mt_carmel_app/src/models/province.dart';
import 'package:mt_carmel_app/src/utils/image_upload_form.dart';
import 'package:mt_carmel_app/src/widgets/country_and_other_form_field.dart';
import 'package:mt_carmel_app/src/widgets/left_arrow_back_button.dart';
import 'package:flutter/cupertino.dart';
import 'package:mt_carmel_app/src/models/user_profile.dart';
import 'package:mt_carmel_app/src/widgets/loading_indicator.dart';
import 'package:mt_carmel_app/src/widgets/patterned_form_field.dart';

class EditProfileScreen extends StatefulWidget {
  @override
  _EditProfileScreenState createState() => _EditProfileScreenState();
}

class _EditProfileScreenState extends State<EditProfileScreen> {
  UserProfile _userProfile;
  String _userId;
  bool _isPhotoChanged = false;
  bool _isLoading = true;

  static final GlobalKey<FormBuilderState> _fbKey =
      GlobalKey<FormBuilderState>();

  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    final branchName = locator<BranchService>().branch.name;
    return Material(
      child: Scaffold(
        key: _scaffoldKey,
        body: Container(
          margin: const EdgeInsets.fromLTRB(20.0, 30.0, 20.0, 30.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Container(
                padding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 30.0),
                child: Text(
                  "$branchName",
                  style: Theme.of(context)
                      .primaryTextTheme
                      .title
                      .copyWith(fontWeight: FontWeight.bold),
                  textAlign: TextAlign.center,
                ),
              ),
              Divider(),
              Container(
                padding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 30.0),
                child: Text(
                  "Edit Profile",
                  style: Theme.of(context)
                      .primaryTextTheme
                      .title
                      .copyWith(fontWeight: FontWeight.bold),
                  textAlign: TextAlign.center,
                ),
              ),
              SizedBox(
                height: 10.0,
              ),
              _isLoading
                  ? Expanded(
                      child: LoadingIndicator(),
                    )
                  : Expanded(
                      child: SingleChildScrollView(
                        child: Column(
                          children: <Widget>[
                            Container(
                                height: MediaQuery.of(context).size.width / 3,
                                width: MediaQuery.of(context).size.width / 3,
                                //TODO implement retrieved changed photo
                                child: ImageUploadForm()),
                            FormBuilder(
                              key: _fbKey,
                              child: Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 20.0),
                                child: Column(
                                  children: <Widget>[
                                    SizedBox(
                                      height: 30.0,
                                    ),
                                    Text(
                                      "First name",
                                      style: Theme.of(context)
                                          .primaryTextTheme
                                          .title
                                          .copyWith(
                                              fontWeight: FontWeight.bold),
                                      textAlign: TextAlign.center,
                                    ),
                                    FormBuilderTextField(
                                      attribute: "first_name",
                                      initialValue:
                                          "${_userProfile?.firstName ?? ""}",
                                      keyboardType: TextInputType.text,
                                      validators: [
                                        FormBuilderValidators.required(),
                                      ],
                                      style: Theme.of(context)
                                          .primaryTextTheme
                                          .title,
                                      textAlign: TextAlign.center,
                                      cursorColor: Colors.brown,
                                    ),
//                                    SizedBox(
//                                      height: 12.0,
//                                    ),
//                                    Text(
//                                      "Middle name",
//                                      style: Theme.of(context)
//                                          .primaryTextTheme
//                                          .title
//                                          .copyWith(
//                                              fontWeight: FontWeight.bold),
//                                      textAlign: TextAlign.center,
//                                    ),
//                                    FormBuilderTextField(
//                                      attribute: "middle_name",
//                                      initialValue:
//                                          "${_userProfile?.middleName ?? ""}",
//                                      keyboardType: TextInputType.text,
//                                      validators: [
////                                        FormBuilderValidators.required(),
//                                      ],
//                                      style: Theme.of(context)
//                                          .primaryTextTheme
//                                          .title,
//                                      textAlign: TextAlign.center,
//                                      cursorColor: Colors.brown,
//                                    ),
                                    SizedBox(
                                      height: 12.0,
                                    ),
                                    Text(
                                      "Last name",
                                      style: Theme.of(context)
                                          .primaryTextTheme
                                          .title
                                          .copyWith(
                                              fontWeight: FontWeight.bold),
                                      textAlign: TextAlign.center,
                                    ),
                                    FormBuilderTextField(
                                      attribute: "last_name",
                                      initialValue:
                                          "${_userProfile.lastName ?? ""}",
                                      keyboardType: TextInputType.text,
                                      validators: [
                                        FormBuilderValidators.required(),
                                      ],
                                      style: Theme.of(context)
                                          .primaryTextTheme
                                          .title,
                                      textAlign: TextAlign.center,
                                      cursorColor: Colors.brown,
                                    ),
//                                    SizedBox(
//                                      height: 12.0,
//                                    ),
//                                    Text(
//                                      "Username",
//                                      style: Theme.of(context)
//                                          .primaryTextTheme
//                                          .title
//                                          .copyWith(
//                                              fontWeight: FontWeight.bold),
//                                      textAlign: TextAlign.center,
//                                    ),
//                                    FormBuilderTextField(
//                                      attribute: "username",
//                                      initialValue:
//                                          "${_userProfile.username ?? ""}",
//                                      keyboardType: TextInputType.text,
//                                      validators: [
//                                        FormBuilderValidators.required(),
//                                      ],
//                                      style: Theme.of(context)
//                                          .primaryTextTheme
//                                          .title,
//                                      textAlign: TextAlign.center,
//                                      cursorColor: Colors.brown,
//                                    ),
//                                    SizedBox(
//                                      height: 12.0,
//                                    ),
//                                    Text(
//                                      "Email",
//                                      style: Theme.of(context)
//                                          .primaryTextTheme
//                                          .title
//                                          .copyWith(
//                                              fontWeight: FontWeight.bold),
//                                      textAlign: TextAlign.center,
//                                    ),
//                                    FormBuilderTextField(
//                                      attribute: "email",
//                                      initialValue:
//                                          "${_userProfile.email ?? ""}",
//                                      keyboardType: TextInputType.text,
//                                      validators: [
//                                        FormBuilderValidators.required(),
//                                      ],
//                                      style: Theme.of(context)
//                                          .primaryTextTheme
//                                          .title,
//                                      textAlign: TextAlign.center,
//                                      cursorColor: Colors.brown,
//                                    ),
                                    SizedBox(
                                      height: 12.0,
                                    ),
                                    Text(
                                      "Address 1",
                                      style: Theme.of(context)
                                          .primaryTextTheme
                                          .title
                                          .copyWith(
                                              fontWeight: FontWeight.bold),
                                      textAlign: TextAlign.center,
                                    ),
                                    FormBuilderTextField(
                                      attribute: "address_1",
                                      initialValue:
                                          "${_userProfile.address1 ?? ""}",
                                      keyboardType: TextInputType.text,
                                      validators: [
                                        FormBuilderValidators.required(),
                                      ],
                                      style: Theme.of(context)
                                          .primaryTextTheme
                                          .title,
                                      textAlign: TextAlign.center,
                                      cursorColor: Colors.brown,
                                    ),
                                    SizedBox(
                                      height: 12.0,
                                    ),
                                    Text(
                                      "Address 2",
                                      style: Theme.of(context)
                                          .primaryTextTheme
                                          .subtitle
                                          .copyWith(
                                              fontWeight: FontWeight.bold),
                                      textAlign: TextAlign.center,
                                    ),
                                    FormBuilderTextField(
                                      attribute: "address_2",
                                      initialValue:
                                          "${_userProfile.address2 ?? ""}",
                                      keyboardType: TextInputType.text,
                                      validators: [
//                                        FormBuilderValidators.required(),
                                      ],
                                      style: Theme.of(context)
                                          .primaryTextTheme
                                          .title,
                                      textAlign: TextAlign.center,
                                      cursorColor: Colors.brown,
                                    ),
                                    CountryAndOtherFormFields(
                                      initialCountryCode:
                                          _userProfile.countryCode,
//                                          "01",
                                      initialProvinceCode:
                                          _userProfile.provinceCode,
//                                          "0722",
                                      initialCityCode: _userProfile.cityCode,
//                                          "072206",
                                    ),
                                    PatternedFormField(
                                      attribute: "mobile",
                                      mask: "(00000)-0000000",
                                      hintText: "Mobile",
                                      label: "Mobile",
                                    ),
                                    PatternedFormField(
                                      attribute: "landline",
                                      mask: "(000)-00000000",
                                      hintText: "Landline",
                                      label: "Landline",
                                      validators: [
                                        FormBuilderValidators.required()
                                      ],
                                    )
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
              _isLoading
                  ? Container()
                  : RaisedButton(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20.0)),
                      color: Colors.brown,
                      child: Text(
                        "Save",
                        style: TextStyle(color: Colors.white),
                      ),
                      onPressed: () async {
                        _fbKey.currentState.save();
                        print(_fbKey.currentState.value);
                        if (_fbKey.currentState.validate()) {
                          try {
                            final result = await _save(context);
                            if (result) {
                              _scaffoldKey.currentState.removeCurrentSnackBar();
                              _scaffoldKey.currentState.showSnackBar(
                                SnackBar(
                                  content: Text(
                                    'Successfully saved the changes.',
                                    textAlign: TextAlign.center,
                                  ),
                                  duration: Duration(seconds: 3),
                                  backgroundColor: Colors.green,
                                ),
                              );
                            } else {
                              _scaffoldKey.currentState.removeCurrentSnackBar();
                              _scaffoldKey.currentState.showSnackBar(
                                SnackBar(
                                  content: Text(
                                    'Did not saved. Please fill-up required fields',
                                    textAlign: TextAlign.center,
                                  ),
                                  duration: Duration(seconds: 3),
                                  backgroundColor: Colors.red,
                                ),
                              );
                            }
                          } catch (e) {
                            print(e);
                            _scaffoldKey.currentState.removeCurrentSnackBar();
                            _scaffoldKey.currentState.showSnackBar(
                              SnackBar(
                                content: Text(
                                  'Did not saved. Something went wrong',
                                  textAlign: TextAlign.center,
                                ),
                                duration: Duration(seconds: 3),
                                backgroundColor: Colors.red,
                              ),
                            );
                          }
                        } else {
                          _scaffoldKey.currentState.removeCurrentSnackBar();
                          _scaffoldKey.currentState.showSnackBar(
                            SnackBar(
                              content: Text(
                                'Did not saved. Please fill-up the required fields.',
                                textAlign: TextAlign.center,
                              ),
                              duration: Duration(seconds: 3),
                              backgroundColor: Colors.red,
                            ),
                          );
                        }
                      },
                    ),
              leftArrowBackButton(context: context),
            ],
          ),
        ),
      ),
    );
  }

  Future<void> retrieveLostData() async {
    final LostDataResponse response = await ImagePicker.retrieveLostData();
    if (response == null) {
      return;
    }
    if (response.file != null) {
      setState(() {
        if (response.type == RetrieveType.video) {
          //TODO implementation
//          _handleVideo(response.file);
        } else {
          //TODO implementation
//          _handleImage(response.file);
        }
      });
    } else {
      //TODO  implementation
//      _handleError(response.exception);
    }
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  initState() {
    _getUserProfile().catchError(
      (error) {
        debugPrint("EditProfileScreen.initState(): $error.");
      },
    );
    super.initState();
  }

  Future _getUserProfile() async {
    await locator<AuthenticationService>().getUserId().then(
      (id) async {
        _userId = id;
        await locator<UserProfileService>().getUserProfile(id).then(
          (user) {
            setState(() {
              _userProfile = user;
              _isLoading = false;
            });
          },
        );
      },
    );
  }

  Future<bool> _save(BuildContext context) async {
    if (_userId == null || _userId == "") {
      print("Retrieving user id error.");
      return false;
    }

    var success = false;
    var fieldsValue = _fbKey.currentState.value;

    fieldsValue.putIfAbsent("user_id", () => _userId);
    Map<String, String> casted = fieldsValue.cast();
    final url = "${AppConstants.API_BASE_URL}users/update/id/$_userId";

    final headers = APIConstants.HEADERS;
    print("$casted");
    print(url);
    await locator<CrudService>().put(url, body: casted, headers: headers).then(
      ((value) {
        debugPrint("$value");
        success = value;
      }),
    ).catchError(
      (e) {
        debugPrint("_save(): $e");
        throw e;
      },
    );
    return success;
  }
}
