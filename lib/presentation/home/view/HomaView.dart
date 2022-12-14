import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:usuarios/domain/home/model/User.dart';
import 'package:usuarios/domain/home/service/home_service.dart';
import 'package:usuarios/infrestructure/home/home_repository.dart';
import 'package:usuarios/presentation/home/view_model/home_vm.dart';
import 'package:usuarios/presentation/shared/Styles/text_styles.dart';
import 'package:usuarios/presentation/widget/listCardUser.dart';

class HomeView extends StatelessWidget {
  HomeView({super.key});

  final HomeViewModel _homeViewModel =
      Get.put(HomeViewModel(HomeService(HomeRepository())));

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
          child: Column(
            children: [
              TextField(
                onSubmitted: (value) => _homeViewModel.search(value),
                textInputAction: TextInputAction.search,
                controller: _homeViewModel.controllerSearch,
                onChanged: (value) {},
                cursorColor: Colors.black,
                style: const TextStyle(
                  color: Colors.black,
                ),
                keyboardType: TextInputType.name,
                decoration: const InputDecoration(
                  hintText: 'Buscar usuario',
                  focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.grey),
                      borderRadius: BorderRadius.all(Radius.circular(10))),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10))),
                ),
              ),
              SizedBox(
                height: Get.height * 0.02,
              ),
              Expanded(
                child: ListCardUser(),
              )
            ],
          ),
        ),
      ),
    );
  }
}
