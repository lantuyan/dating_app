class ChatUsers {
  ChatUsers({
    required this.image,
    required this.about,
    required this.name,
    required this.createdAt,
    required this.lastActive,
    required this.isOnline,
    required this.id,
    required this.pushToken,
    required this.email,
    required this.age,
    required this.isVerified,
  });
  late  String image;
  late  String about;
  late  String name;
  late  String createdAt;
  late  String lastActive;
  late  bool isOnline;
  late  String id;
  late  String pushToken;
  late  String email;
  late  String age;
  late  bool isVerified;

  ChatUsers.fromJson(Map<String, dynamic> json){
    image = json['image']  as String;
    about = json['about'] as String;
    name = json['name']  as String;
    createdAt = json['created_at'] as String;
    lastActive = json['last_active'] as String;
    isOnline = json['is_online'] as bool;
    id = json['id'] as String;
    pushToken = json['push_token'] as String;
    email = json['email'] as String;
    age = json['age'] as String;
    isVerified = json['isVerified'] as bool;
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['image'] = image;
    data['about'] = about;
    data['name'] = name;
    data['created_at'] = createdAt;
    data['last_active'] = lastActive;
    data['is_online'] = isOnline;
    data['id'] = id;
    data['push_token'] = pushToken;
    data['email'] = email;
    data['age'] = age;
    data['isVerified'] = isVerified;
    return data;
  }
}