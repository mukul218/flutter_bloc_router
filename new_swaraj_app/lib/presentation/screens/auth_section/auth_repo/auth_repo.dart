import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:new_swaraj_app/core/constants/url_constarnt.dart';
import 'package:new_swaraj_app/core/utils/apiServer.dart';

import '../../../../data/models/auth_models/check_app_version_model.dart';

class AuthRepo {
  static ApiService apiService = ApiService();

  apiGetLatestVersionApp() async {
    // Create API POST Data
    Map<String, dynamic> data = {
      'key': 'mySwarajSecret',
      'platform': (Platform.isIOS) ? 'ios' : 'android',
    };
    // Call the API with Data Model used for Response
    final result = await apiService.postData<CheckAppVersionModel>(
      url: UrlConstant.checkAppVersion,
      body: data,
      fromJson: (json) => CheckAppVersionModel.fromJson(json),
    );
    if (result is CheckAppVersionModel) {
      return result;
    } else {
      return {
        'status': false,
        'error_code':result
      };
    }
  }


}