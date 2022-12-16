class Apis {
  static const String _sync = 'https://jsonplaceholder.typicode.com';

  static String users = '$_sync/users';
  static String posts = '$_sync/posts';
  static String postsUser = '$_sync/posts?userId=';
}
