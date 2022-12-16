import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:usuarios/domain/posts/model/post.dart';
import 'package:usuarios/domain/posts/service/posts_service.dart';
import 'package:usuarios/infrestructure/posts/posts_repository.dart';
import 'package:usuarios/presentation/posts/view_model/posts_vm.dart';
import 'package:usuarios/presentation/shared/Styles/text_styles.dart';
import 'package:usuarios/presentation/shared/widget/HomeCustom.dart';

class PostsView extends StatelessWidget {
  PostsView({super.key});
  final PostsViewModel _postsViewModel =
      PostsViewModel(PostsService(PostsRepository()));

  @override
  Widget build(BuildContext context) {
    return HomeCustom(
      title: 'Prueba de ingreso',
      iconBack: true,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.max,
        children: [
          Container(
            width: Get.width,
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  _postsViewModel.user.getName,
                  style: TextStyles.titleStyle(color: Colors.green),
                ),
                Text(
                  _postsViewModel.user.getEmail,
                  style: TextStyles.headlineStyle(),
                ),
                Text(
                  _postsViewModel.user.getPhone,
                  style: TextStyles.headlineStyle(),
                )
              ],
            ),
          ),
          Obx(
            () => _postsViewModel.listPost.isEmpty
                ? const Center(child: CircularProgressIndicator())
                : Expanded(
                    child: ListView.builder(
                    itemCount: _postsViewModel.listPost.length,
                    itemBuilder: (context, index) {
                      Post post = _postsViewModel.listPost[index];
                      return Card(
                        margin: const EdgeInsets.symmetric(vertical: 8),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10)),
                        child: Container(
                          padding: const EdgeInsets.all(10),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                post.getTitle,
                                style: TextStyles.subHeadLineUnderLineStyle(
                                    color: Colors.green.shade900),
                              ),
                              const SizedBox(
                                height: 15,
                              ),
                              Text(
                                post.getBody,
                                style: TextStyles.captionStyle(),
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  )),
          )
        ],
      ),
    );
  }
}
