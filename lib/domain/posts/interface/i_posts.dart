import 'package:usuarios/domain/home/model/User.dart';
import 'package:usuarios/domain/posts/model/post.dart';

abstract class IPostsRepository {
  Future<List<Post>> listPostsUser(User user);
}
