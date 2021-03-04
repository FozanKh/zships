class User {
  final String uid;
  final String name;
  final String gender;
  final String email;
  final String phone;
  final bool isAnonymous;
  final bool isEmailVerified;

  User({this.uid, this.name, this.gender, this.email, this.phone, this.isAnonymous, this.isEmailVerified});

  User copyWith({String uid, String name, String gender, String email, String phone, bool isAnonymous, bool isEmailVerified}) {
    return User(
      uid: uid ?? this.uid,
      name: name ?? this.name,
      gender: gender ?? this.gender,
      email: email ?? this.email,
      phone: phone ?? this.phone,
      isAnonymous: isAnonymous ?? this.isAnonymous,
      isEmailVerified: isEmailVerified ?? this.isEmailVerified,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'uid': uid,
      'name': name,
      'gender': gender,
      'email': email,
      'phone': phone,
      'isAnonymous': isAnonymous,
      'isEmailVerified': isEmailVerified,
    };
  }

  factory User.fromMap(Map<String, dynamic> map) {
    if (map == null) return null;

    return User(
      uid: map['uid'],
      name: map['name'],
      gender: map['gender'],
      email: map['email'],
      phone: map['phone'],
      isAnonymous: map['isAnonymous'],
      isEmailVerified: map['isEmailVerified'],
    );
  }

  @override
  String toString() {
    return 'User(uid: $uid, name: $name, gender: $gender, email: $email, phone: $phone, isAnonymous: $isAnonymous, isEmailVerified: $isEmailVerified)';
  }
}
