import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:usuarios/domain/home/model/User.dart';
import 'package:usuarios/presentation/home/view_model/home_vm.dart';
import 'package:usuarios/presentation/shared/Styles/text_styles.dart';

/*
Lista de usuarios
se captura el estado de model para compartir variables 
*/
class ListCardUser extends StatelessWidget {
  ListCardUser({super.key});

  final HomeViewModel _homeViewModel = Get.find();

  @override
  Widget build(BuildContext context) {
    return Obx(() => _homeViewModel.listUsers.isEmpty
        ? Center(
            child: _homeViewModel.searchProgress.value
                ? const Text('List is empty')
                : const CircularProgressIndicator())
        : ListView.builder(
            itemCount: _homeViewModel.listUsers.length,
            itemBuilder: (context, index) {
              User user = _homeViewModel.listUsers[index];
              return Card(
                margin: const EdgeInsets.symmetric(vertical: 8),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10)),
                child: Container(
                  padding: const EdgeInsets.all(10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      SizedBox(
                        width: Get.width,
                        child: Text(
                          user.getName,
                          style: TextStyles.titleStyle(color: Colors.green),
                          textAlign: TextAlign.start,
                        ),
                      ),
                      Row(
                        children: [
                          Icon(Icons.call, size: Get.textScaleFactor * 18),
                          const SizedBox(
                            width: 10,
                          ),
                          Text(
                            user.getPhone,
                            style: TextStyles.subTitleStyle(),
                          )
                        ],
                      ),
                      Row(
                        children: [
                          Icon(Icons.email, size: Get.textScaleFactor * 18),
                          const SizedBox(
                            width: 10,
                          ),
                          Text(
                            user.getEmail,
                            style: TextStyles.subTitleStyle(),
                          )
                        ],
                      ),
                      InkWell(
                        child: Text(
                          'VER PUBLICACIONES',
                          style: TextStyles.title2Style(color: Colors.green),
                          textAlign: TextAlign.end,
                        ),
                        onTap: () => _homeViewModel.homeService.postsUser(user),
                      )
                    ],
                  ),
                ),
              );
            },
          ));
  }
}
