class User {
  final String uid;
  final String name;
  final String email;
  final String phone;
  final bool isAnonymous;
  final bool isEmailVerified;
  String apiKey;

  User({this.uid, this.name, this.email, this.phone, this.isAnonymous, this.isEmailVerified, this.apiKey});

  Map<String, dynamic> toMap() {
    return {
      'uid': uid,
      'name': name,
      'email': email,
      'phone': phone,
      'isAnonymous': isAnonymous,
      'isEmailVerified': isEmailVerified,
      'apiKey': apiKey,
    };
  }

  factory User.fromMap(Map<String, dynamic> map) {
    if (map == null) return null;

    return User(
      uid: map['uid'],
      name: map['name'],
      email: map['email'],
      phone: map['phone'],
      isAnonymous: map['isAnonymous'],
      isEmailVerified: map['isEmailVerified'],
      apiKey: map['apiKey'],
    );
  }
  setKey(String key) {
    this.apiKey = key;
  }

  @override
  String toString() {
    return 'User(uid: $uid, name: $name, email: $email, phone: $phone, isAnonymous: $isAnonymous, isEmailVerified: $isEmailVerified)';
  }
}
