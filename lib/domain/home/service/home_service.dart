import 'dart:ffi';

import 'package:usuarios/domain/home/interface/i_home.dart';
import 'package:usuarios/domain/home/model/User.dart';

class HomeService {
  final IHomeRepository iHomeRepository;

  HomeService(this.iHomeRepository);

  Future<bool> validateInfo() async {
    return await iHomeRepository.validateInfo();
  }

  Future<List<User>> listUsers() async {
    return await iHomeRepository.listUsers();
  }

  Future<List<User>> listSearchUsers(String search) async {
    return await iHomeRepository.listSearchUsers(search);
  }
}
