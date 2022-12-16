import 'package:either_dart/either.dart';
import 'package:sqflite/sqlite_api.dart';
import 'package:usuarios/domain/home/model/User.dart';
import 'package:usuarios/domain/posts/interface/i_posts.dart';
import 'package:usuarios/domain/posts/model/post.dart';
import 'package:usuarios/infrestructure/data/remote/error/network_error.dart';
import 'package:usuarios/infrestructure/data/remote/network/base_api_service.dart';
import 'package:usuarios/infrestructure/data/remote/network/network_api_service.dart';
import 'package:usuarios/infrestructure/local/sqlite/base_sqlite_service.dart';
import 'package:usuarios/infrestructure/local/sqlite/sqlite_service.dart';
import 'package:usuarios/infrestructure/shared/Api.dart';

class PostsRepository extends IPostsRepository {
  /*
  Obtenemos todos las publicaciones del usuario, se valida inicialmente la BD
  si no se obtiene informacion se consulta la api 
  */
  @override
  Future<List<Post>> listPostsUser(User user) async {
    List<Post> posts = [];
    Database db;
    BaseSqliteService sqliteService = SqliteService();

    db = await sqliteService.openDB();
    String statement = ''' select * FROM Posts where userId=${user.getId} ''';

    List<Map> list = await db.rawQuery(statement);

    if (list.isNotEmpty) {
      posts = List<Post>.from(list.map((x) => Post.fromJson(x)));
    } else {
      BaseApiService apiService = NetworkApiService();
      Either<NetworkException, dynamic> response =
          await apiService.getResponse(Apis.postsUser + user.getId.toString());

      posts = postFromJson(response.right);

      db = await sqliteService.openDB();
      posts.toList().forEach((element) async {
        await db.insert('Posts', element.toJson());
      });
    }

    return posts;
  }
}
