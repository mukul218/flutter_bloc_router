import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:package_info_plus/package_info_plus.dart';

import '../auth_repo.dart';

class AuthFun {
  static AuthRepo authRepo = AuthRepo();

  static Future<bool> checkinterNect() async {
    final List<ConnectivityResult> connectivityResult =
        await (Connectivity().checkConnectivity());
    if (connectivityResult.contains(ConnectivityResult.none)) {
      return false;
    } else {
      return true;
    }
  }

  static Future<Map<String, dynamic>> checkAppUpdate() async {
    var appVersionResult = await authRepo.apiGetLatestVersionApp();
    var latestBuild = appVersionResult.data[0].buildNo;
    if (appVersionResult.status) {
      try {
        // Await the PackageInfo result
        PackageInfo packageInfo = await PackageInfo.fromPlatform();
        var buildNumber = packageInfo.buildNumber;

        print('Latest Version is : $latestBuild');
        print('Current Version is : $buildNumber');

        if (int.parse(latestBuild) > int.parse(buildNumber)) {
          print('Update Version');
          return {
            'status': true,
            'app_update': true,
            'message': 'App Update version available',
          };
          // Check emit.isDone to ensure the event hasn't completed
        } else {
          // Emit a state for the next step, if needed
          print('Latest Version - Go to next step');
          return {
            'status': true,
            'app_update': false,
            'message': 'App Update version not-available',
          };
        }
      } catch (e) {
        // Handle the error properly
        print('Error while checking version: $e');
        return {
          'status': false,
          'message': 'Error while checking  version',
        };
      }
    } else {
      // emit(errorState);
      print('Error Wile Fetching Data ${appVersionResult}');
      return {
        'status': false,
        'message': 'Error while Running API',
      };
    }
  }
}
