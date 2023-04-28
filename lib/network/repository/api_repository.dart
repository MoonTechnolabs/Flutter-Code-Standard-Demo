import 'package:moon_flutter_getx_architecture/app/app_strings.dart';
import 'package:moon_flutter_getx_architecture/network/api_helpers/network_connectivity.dart';
import 'package:moon_flutter_getx_architecture/network/api_helpers/network_constants.dart';
import 'package:moon_flutter_getx_architecture/network/api_provider/api_provider.dart';
import 'package:moon_flutter_getx_architecture/network/models/add_user_model.dart';
import 'package:moon_flutter_getx_architecture/network/models/get_user_list_model.dart';

// global initialization of API Repo to use anywhere among the project
ApiRepository apiRepository = ApiRepository();

class ApiRepository {
  final ApiProvider _provider = ApiProvider();
  Future<bool> isNetworkAvailable = NetworkConnectivity().checkInternet();

  // get user list API call
  Future<GetUserList> userList() async {
    if (await isNetworkAvailable) {
      var response = await _provider.get(
        apiUrl: NetworkConstants.usersUrl,
        headers: {},
      );

      return GetUserList.fromJson(response);
    } else {
      throw AppStrings.noInternetConnection;
    }
  }

  // add user API call
  Future<AddUserModel> addUser({required String name, required String job}) async {
    if (await isNetworkAvailable) {
      var response = await _provider.post(
        apiUrl: NetworkConstants.usersUrl,
        params: {
          NetworkConstants.name: name,
          NetworkConstants.job: job,
        },
      );

      return AddUserModel.fromJson(response);
    } else {
      throw AppStrings.noInternetConnection;
    }
  }
}
