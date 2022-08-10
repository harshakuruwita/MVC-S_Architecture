import 'package:owwn_coding_challenge/common/network/api_base.dart';

enum APIPath {
  auth,
  userList,
}

class APIPathHelper {
  static String getValue(APIPath path) {
    switch (path) {
      case APIPath.auth:
        return APIBase.baseURL + 'auth';
      case APIPath.userList:
        return APIBase.baseURL + 'users';
      default:
        return '';
    }
  }
}
