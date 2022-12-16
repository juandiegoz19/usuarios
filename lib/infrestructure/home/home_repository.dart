import 'package:either_dart/either.dart';
import 'package:get/get.dart';
import 'package:sqflite/sqlite_api.dart';
import 'package:usuarios/domain/home/interface/i_home.dart';
import 'package:usuarios/domain/home/model/User.dart';
import 'package:usuarios/domain/posts/model/post.dart';
import 'package:usuarios/infrestructure/data/remote/error/network_error.dart';
import 'package:usuarios/infrestructure/data/remote/network/base_api_service.dart';
import 'package:usuarios/infrestructure/data/remote/network/network_api_service.dart';
import 'package:usuarios/infrestructure/local/sqlite/base_sqlite_service.dart';
import 'package:usuarios/infrestructure/local/sqlite/sqlite_service.dart';
import 'package:usuarios/infrestructure/shared/Api.dart';
import 'package:usuarios/presentation/posts/view/PostsView.dart';

class HomeRepository extends IHomeRepository {
  /*
  Se obtiene la lista de Usuarios
  realizando validacion para comprobar si existe informacion localmente para mostrarla
  adicional se consultas las publicaciones para registrarlas 
  */
  @override
  Future<List<User>> listUsers() async {
    List<User> users = [];
    Database db;
    BaseSqliteService sqliteService = SqliteService();

    if (await validateInfo()) {
      db = await sqliteService.openDB();
      String statement = ''' select comp.name nameCompany ,* FROM User us
          left join Address addr on addr.userId = us.id 
          left join Company comp on comp.userId = us.id ''';

      List<Map> list = await db.rawQuery(statement);
      users = List<User>.from(list.map((x) => User.fromJson(x, true)));
    } else {
      await sqliteService.createDB();

      BaseApiService apiService = NetworkApiService();
      Either<NetworkException, dynamic> response =
          await apiService.getResponse(Apis.users);

      users = userFromJson(response.right);

      db = await sqliteService.openDB();
      users.toList().forEach((element) async {
        await db.insert('User', element.toJsonInsert());
        await db.insert('Address', element.toJsonAddressInsert());
        await db.insert('Company', element.toJsonCompanyInsert());
      });

      response = await apiService.getResponse(Apis.posts);
      List<Post> posts = postFromJson(response.right);
      db = await sqliteService.openDB();
      posts.toList().forEach((element) async {
        await db.insert('Posts', element.toJson());
      });
    }

    return users;
  }

  /*
  Validador de archivo BD
  */
  @override
  Future<bool> validateInfo() async {
    BaseSqliteService sqliteService = SqliteService();
    bool status = await sqliteService.isDatabase();
    return status;
  }

  /*
  Buscandor de informacion
  Se utiliza el metodo ya existente listUsers para obtener los usuarios
  */
  @override
  Future<List<User>> listSearchUsers(String search) async {
    List<User> users = await listUsers();
    return users
        .where((element) => element.getName
            .toString()
            .toLowerCase()
            .contains(search.toLowerCase()))
        .toList();
  }

  /*
  Se redirecciona al usuario a la pantalla de Posts User
  */
  @override
  void postsUser(User user) {
    Get.to(() => PostsView(), arguments: user);
  }
}
