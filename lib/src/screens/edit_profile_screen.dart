/*
*  Filename    :   edit_profile_screen.dart
*  Purpose     :	
*  Created     :   2019-07-24 09:57 by Detective Conan
*  Updated     :   2019-07-24 09:57 by Detective Conan 
*  Changes     :
*/

import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:image_picker/image_picker.dart';
import 'package:mt_carmel_app/src/core/services/authentication_service.dart';
import 'package:mt_carmel_app/src/core/services/service_locator.dart';
import 'package:mt_carmel_app/src/core/services/profiles_api/user_profile_service.dart';
import 'package:mt_carmel_app/src/utils/image_upload_form.dart';
import 'package:mt_carmel_app/src/widgets/left_arrow_back_button.dart';
import 'package:mt_carmel_app/src/widgets/line.dart';
import 'package:flutter/cupertino.dart';
import 'package:mt_carmel_app/src/models/user_profile.dart';

class EditProfileScreen extends StatefulWidget {
  static final GlobalKey<FormBuilderState> _fbKey =
      GlobalKey<FormBuilderState>();

  @override
  _EditProfileScreenState createState() => _EditProfileScreenState();
}

class _EditProfileScreenState extends State<EditProfileScreen> {
  UserProfile _userProfile;
  bool _isPhotoChanged = false;

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Scaffold(
        body: Container(
          margin: const EdgeInsets.fromLTRB(20.0, 30.0, 20.0, 30.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Container(
                padding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 30.0),
                child: Text(
                  "Edit Profile",
                  style: Theme.of(context)
                      .primaryTextTheme
                      .headline
                      .copyWith(fontWeight: FontWeight.bold),
                  textAlign: TextAlign.center,
                ),
              ),
              lineWidget(),
              SizedBox(
                height: 10.0,
              ),
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    children: <Widget>[
                      Container(
                          height: 200,
                          width: 200,
                          //TODO implement retrieved changed photo
                          child: ImageUploadForm()),
                      FormBuilder(
                        key: EditProfileScreen._fbKey,
                        autovalidate: true,
                        child: Column(
                          children: <Widget>[
                            FormBuilderTextField(
                              attribute: "first_name",
                              decoration: InputDecoration(
                                  labelText: "First name",
                                  helperStyle: Theme.of(context)
                                      .primaryTextTheme
                                      .subtitle),
                              keyboardType: TextInputType.multiline,
                              validators: [
                                FormBuilderValidators.required(),
                              ],
                              style: Theme.of(context).primaryTextTheme.title,
                              textAlign: TextAlign.center,
                              cursorColor: Colors.brown,
                            ),
                            FormBuilderTextField(
                              attribute: "middle_name",
                              decoration: InputDecoration(
                                  labelText: "Middle name",
                                  helperStyle: Theme.of(context)
                                      .primaryTextTheme
                                      .subtitle),
                              keyboardType: TextInputType.multiline,
                              validators: [
                                FormBuilderValidators.required(),
                              ],
                              style: Theme.of(context).primaryTextTheme.title,
                              textAlign: TextAlign.center,
                              cursorColor: Colors.brown,
                            ),
                            FormBuilderTextField(
                              attribute: "last_name",
                              decoration: InputDecoration(
                                  labelText: "Last name",
                                  helperStyle: Theme.of(context)
                                      .primaryTextTheme
                                      .subtitle),
                              keyboardType: TextInputType.multiline,
                              validators: [
                                FormBuilderValidators.required(),
                              ],
                              style: Theme.of(context).primaryTextTheme.title,
                              textAlign: TextAlign.center,
                              cursorColor: Colors.brown,
                            ),
                            FormBuilderTextField(
                              attribute: "roleName",
                              decoration: InputDecoration(
                                  labelText: "Role Name",
                                  helperStyle: Theme.of(context)
                                      .primaryTextTheme
                                      .subtitle),
                              keyboardType: TextInputType.multiline,
                              validators: [
                                FormBuilderValidators.required(),
                              ],
                              style: Theme.of(context).primaryTextTheme.title,
                              textAlign: TextAlign.center,
                              cursorColor: Colors.brown,
                            ),
                            FormBuilderTextField(
                              attribute: "username",
                              decoration: InputDecoration(
                                  labelText: "Username",
                                  helperStyle: Theme.of(context)
                                      .primaryTextTheme
                                      .subtitle),
                              keyboardType: TextInputType.multiline,
                              validators: [
                                FormBuilderValidators.required(),
                              ],
                              style: Theme.of(context).primaryTextTheme.title,
                              textAlign: TextAlign.center,
                              cursorColor: Colors.brown,
                            ),
                            FormBuilderTextField(
                              attribute: "birthday",
                              decoration: InputDecoration(
                                labelText: "Birthday",
                                helperStyle:
                                    Theme.of(context).primaryTextTheme.subtitle,
                              ),
                              keyboardType: TextInputType.multiline,
                              validators: [
                                FormBuilderValidators.required(),
                              ],
                              style: Theme.of(context).primaryTextTheme.title,
                              textAlign: TextAlign.center,
                              cursorColor: Colors.brown,
                            ),
                            FormBuilderTextField(
                              attribute: "email",
                              decoration: InputDecoration(
                                  labelText: "Email",
                                  helperStyle: Theme.of(context)
                                      .primaryTextTheme
                                      .subtitle),
                              keyboardType: TextInputType.multiline,
                              validators: [
                                FormBuilderValidators.required(),
                              ],
                              style: Theme.of(context).primaryTextTheme.title,
                              textAlign: TextAlign.center,
                              cursorColor: Colors.brown,
                            ),
                            FormBuilderTextField(
                              attribute: "address_1",
                              decoration: InputDecoration(
                                  labelText: "Address 1",
                                  helperStyle: Theme.of(context)
                                      .primaryTextTheme
                                      .subtitle),
                              keyboardType: TextInputType.multiline,
                              validators: [
                                FormBuilderValidators.required(),
                              ],
                              style: Theme.of(context).primaryTextTheme.title,
                              textAlign: TextAlign.center,
                              cursorColor: Colors.brown,
                            ),
                            FormBuilderTextField(
                              attribute: "address_2",
                              decoration: InputDecoration(
                                  labelText: "Address 2",
                                  helperStyle: Theme.of(context)
                                      .primaryTextTheme
                                      .subtitle),
                              keyboardType: TextInputType.multiline,
                              validators: [
                                FormBuilderValidators.required(),
                              ],
                              style: Theme.of(context).primaryTextTheme.title,
                              textAlign: TextAlign.center,
                              cursorColor: Colors.brown,
                            ),
                            FormBuilderTextField(
                              attribute: "city",
                              decoration: InputDecoration(
                                  labelText: "City",
                                  helperStyle: Theme.of(context)
                                      .primaryTextTheme
                                      .subtitle),
                              keyboardType: TextInputType.multiline,
                              validators: [
                                FormBuilderValidators.required(),
                              ],
                              style: Theme.of(context).primaryTextTheme.title,
                              textAlign: TextAlign.center,
                              cursorColor: Colors.brown,
                            ),
                            FormBuilderTextField(
                              attribute: "province",
                              decoration: InputDecoration(
                                  labelText: "Province",
                                  helperStyle: Theme.of(context)
                                      .primaryTextTheme
                                      .subtitle),
                              keyboardType: TextInputType.multiline,
                              validators: [
                                FormBuilderValidators.required(),
                              ],
                              style: Theme.of(context).primaryTextTheme.title,
                              textAlign: TextAlign.center,
                              cursorColor: Colors.brown,
                            ),
                            FormBuilderTextField(
                              attribute: "country",
                              decoration: InputDecoration(
                                  labelText: "Country",
                                  helperStyle: Theme.of(context)
                                      .primaryTextTheme
                                      .subtitle),
                              keyboardType: TextInputType.multiline,
                              validators: [
                                FormBuilderValidators.required(),
                              ],
                              style: Theme.of(context).primaryTextTheme.title,
                              textAlign: TextAlign.center,
                              cursorColor: Colors.brown,
                            ),
                            FormBuilderTextField(
                              attribute: "mobile",
                              decoration: InputDecoration(
                                  labelText: "Mobile",
                                  helperStyle: Theme.of(context)
                                      .primaryTextTheme
                                      .subtitle),
                              keyboardType: TextInputType.multiline,
                              validators: [
                                FormBuilderValidators.required(),
                              ],
                              style: Theme.of(context).primaryTextTheme.title,
                              textAlign: TextAlign.center,
                              cursorColor: Colors.brown,
                            ),
                            FormBuilderTextField(
                              attribute: "landline",
                              decoration: InputDecoration(
                                  labelText: "Landline",
                                  helperStyle: Theme.of(context)
                                      .primaryTextTheme
                                      .subtitle),
                              keyboardType: TextInputType.multiline,
                              validators: [
                                FormBuilderValidators.required(),
                              ],
                              style: Theme.of(context).primaryTextTheme.title,
                              textAlign: TextAlign.center,
                              cursorColor: Colors.brown,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              RaisedButton(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20.0)),
                color: Colors.brown,
                child: Text(
                  "Save",
                  style: TextStyle(color: Colors.white),
                ),
                //TODO implement saving profile
                onPressed: null,
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
        debugPrint("EditProfileScree.initState(): $error.");
      },
    );
    super.initState();
  }

  Future _getUserProfile() async {
    await locator<AuthenticationService>().getUserId().then(
      (id) async {
        await locator<UserProfileService>().getUserProfile(id).then(
          (user) {
            _userProfile = user;
          },
        );
      },
    );
  }
}
