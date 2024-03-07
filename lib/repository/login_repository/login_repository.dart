import 'package:getx_mvvm/data/network/network_api_sarvices.dart';
import 'package:getx_mvvm/res/app_url/app_url.dart';

class LoginRepository {
  final _apiService = NetworkApi();

  Future<dynamic> loginApi(var data) async {
    dynamic response = await _apiService.postApi(data, AppUrl.loginApi);
  }
}
