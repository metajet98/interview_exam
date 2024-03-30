import 'package:interview_exam/models/user_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LocalStorageRepository {
  late final SharedPreferences _sharedPreferences;

  Future<bool> setSignedInUserModel({
    required UserModel userModel,
  }) {
    return _sharedPreferences.setString('user', userModel.toJsonString());
  }

  Future<bool> deletedSignedInUserModel() {
    return _sharedPreferences.remove('user');
  }

  UserModel? getCurrentUserModel() {
    final jsonString = _sharedPreferences.getString('user');
    if (jsonString == null) return null;
    return UserModel.fromJsonString(jsonString);
  }

  Future<void> initialize() async {
    _sharedPreferences = await SharedPreferences.getInstance();
  }
}
