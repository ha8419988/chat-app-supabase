// ignore_for_file: public_member_api_docs, sort_constructors_first
class UserData {
  final int? id;

  ///created_at
  final String? created;
  final String? username;
  final String? email;
  final String? uid;

  ///img_url
  final String? imageUrl;

  UserData(
      {this.id,
      this.created,
      this.username,
      this.email,
      this.uid,
      this.imageUrl});

  factory UserData.fromJson(Map<String, dynamic> json) => UserData(
      id: json['id'],
      created: json['created_at'],
      username: json['username'],
      email: json['email'],
      uid: json['uid'],
      imageUrl: json['img_url']);

  @override
  String toString() {
    return 'UserData(id: $id, created: $created, username: $username, email: $email, uid: $uid, imageUrl: $imageUrl)';
  }
}
