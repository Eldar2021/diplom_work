class User {
  const User({
    required this.uid,
    this.phoneNumber,
    this.displayName,
    this.photoUrl,
    this.email,
  });

  factory User.fromJson(Map<String, dynamic> map) {
    return User(
      uid: map['uid'] as String,
      phoneNumber: map['phoneNumber'] as String?,
      displayName: map['displayName'] as String?,
      photoUrl: map['photoUrl'] as String?,
      email: map['email'] as String?,
    );
  }

  final String uid;
  final String? phoneNumber;
  final String? displayName;
  final String? photoUrl;
  final String? email;

  Map<String, dynamic> toJson() {
    return <String, dynamic>{
      'uid': uid,
      'phoneNumber': phoneNumber,
      'displayName': displayName,
      'photoUrl': photoUrl,
      'email': email,
    };
  }
}
