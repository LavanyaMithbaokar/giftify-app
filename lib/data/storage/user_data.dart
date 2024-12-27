import 'package:giftify/data/model/auth.dart';
import 'package:shared_preferences/shared_preferences.dart';

class UserStore {
  late final Future<SharedPreferences> _prefsFuture;
  UserStore() {
    _prefsFuture = SharedPreferences.getInstance();
  }

  Future<UserModel> loadData() async {
    final _prefs = await _prefsFuture;

    return UserModel(
      name: _prefs.getString('name') ?? "",
      email: _prefs.getString('email') ?? "",
      phone: _prefs.getString('phone') ?? "",
      id: _prefs.getString('id') ?? "",
      image: _prefs.getString('image') ?? "",
    );
  }

  Future<void> updateData(UserModel userModel) async {
    final _prefs = await _prefsFuture;

    await _prefs.setString('name', userModel.name ?? "");
    await _prefs.setString('email', userModel.email ?? "");
    await _prefs.setString('phone', userModel.phone ?? "");
    await _prefs.setString('id', userModel.id ?? "");
    await _prefs.setString('image', userModel.image ?? "");
  }

  Future<void> deleteData() async {
    final _prefs = await _prefsFuture;

    await _prefs.clear();
  }
}
