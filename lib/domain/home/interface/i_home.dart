import 'dart:ffi';

import 'package:usuarios/domain/home/model/User.dart';

abstract class IHomeRepository {
  void postsUser(User user);
  Future<bool> validateInfo();
  Future<List<User>> listUsers();
  Future<List<User>> listSearchUsers(String search);
}
