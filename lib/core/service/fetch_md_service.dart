import 'package:shared_preferences/shared_preferences.dart';

import 'package:learn_world/constants/constants.dart';
import 'package:learn_world/core/core.dart';

class FetchMdService {
  const FetchMdService(this.preferences, this.apiService);

  final SharedPreferences preferences;
  final ApiService apiService;

  Future<(String? md, String status)> getMDFile(String id) async {
    final chahedData = preferences.getString(id);
    if (chahedData != null) return (chahedData, '200');
    final data = await apiService.getMDFile('${ApiConst.rocketBase}/$id');
    if (data.$1 != null) await preferences.setString(id, data.$1!);
    return data;
  }
}
