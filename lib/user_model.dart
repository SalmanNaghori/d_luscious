// ignore_for_file: public_member_api_docs, sort_constructors_first
class UserModel {
  String? uid;
  String? email;
  String? firstName;
  String? secondName;
  String? image;
  String? deviceId;

  UserModel(
      {this.uid,
      this.email,
      this.firstName,
      this.secondName,
      this.image,
      this.deviceId});

  // receiving data from server
  factory UserModel.fromMap(Map<String, dynamic>? map) {
    return UserModel(
      uid: map?['uid'],
      email: map?['email'],
      firstName: map?['firstName'],
      secondName: map?['secondName'],
      image: map?['image'],
      deviceId: map?['deviceId'],
    );
  }

  // sending data to our server
  Map<String, dynamic> toMap() {
    return {
      'uid': uid,
      'email': email,
      'firstName': firstName,
      'secondName': secondName,
      'image': image,
      'deviceId': deviceId, // Remove the space before deviceId
    };
  }

  @override
  String toString() {
    return 'UserModel{uid: $uid, email: $email, firstName: $firstName, secondName: $secondName, image:$image ,deviceId: $deviceId}';
  }
}
