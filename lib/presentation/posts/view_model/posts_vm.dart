import 'package:get/get.dart';
import 'package:usuarios/domain/home/model/User.dart';
import 'package:usuarios/domain/posts/service/posts_service.dart';

class PostsViewModel extends GetxController {
  final User user = Get.arguments;
  PostsService postsService;
  RxList listPost = RxList();

  PostsViewModel(this.postsService) {
    posts();
  }

  void posts() async {
    listPost.value = await postsService.listPostsUser(user);
  }
}
