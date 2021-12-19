class User {
  final String fullname, avatar, email;
  User({required this.id, required this.fullname, required this.avatar, required this.email});
  final int id;

  User.fromJson(Map<String, dynamic> json)
      : fullname = json['last_name'] + ', ' + json['first_name'],
        id = json['id'],
        avatar = json['avatar'],
        email = json['email'];
}