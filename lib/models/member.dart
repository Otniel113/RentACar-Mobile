class Member {
  final int id;
  final String name;
  final String email;
  final String username;
  //final String password;
  final String created_at;
  final String updated_at;

  const Member({
    required this.id,
    required this.name,
    required this.email,
    required this.username,
    //required this.password,
    required this.created_at,
    required this.updated_at,
  });

  factory Member.fromJson(Map<String, dynamic> json) {
    return Member(
      id: json['id'],
      name: json['name'],
      email: json['email'],
      username: json['username'],
      //password: json['password'],
      created_at: json['created_at'],
      updated_at: json['updated_at'],
    );
  }
}