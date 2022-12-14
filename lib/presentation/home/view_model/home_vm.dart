import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:usuarios/domain/home/model/User.dart';
import 'package:usuarios/domain/home/service/home_service.dart';

class HomeViewModel extends GetxController {
  HomeService homeService;
  RxList<User> listUsers = RxList();
  RxBool searchProgress = false.obs;
  final TextEditingController controllerSearch = TextEditingController();

  @override
  void dispose() {
    controllerSearch.dispose();
    super.dispose();
  }

  HomeViewModel(this.homeService) {
    users();
    controllerSearch.addListener(() {
      search(controllerSearch.text);
    });
  }

  void users() async {
    listUsers.value = await homeService.listUsers();
  }

  void search(String search) async {
    searchProgress.value = search.isNotEmpty;
    listUsers.value = await homeService.listSearchUsers(search);
  }
}
