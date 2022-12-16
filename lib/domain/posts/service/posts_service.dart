import 'package:usuarios/domain/home/model/User.dart';
import 'package:usuarios/domain/posts/interface/i_posts.dart';
import 'package:usuarios/domain/posts/model/post.dart';

class PostsService {
  final IPostsRepository iPostsRepository;

  PostsService(this.iPostsRepository);

  Future<List<Post>> listPostsUser(User user) async {
    return await iPostsRepository.listPostsUser(user);
  }
}
