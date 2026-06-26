import 'package:app_fixed/data/model/user.dart';
import 'package:app_fixed/data/services/api_services.dart';

class UsersRebository {
  WebServieces loginServices;

  UsersRebository({required this.loginServices});

  Future<User> login(Map<String, dynamic> loginbody) async {
    var response = await loginServices.login(loginbody);
    return response;
  }
}
