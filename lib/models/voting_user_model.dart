class VotingUserModel {
  String? name;
  String? email;
  String? phone;
  String? image;
  String? uId;
  bool? isVoted;
  VotingUserModel({
    this.name,
    this.email,
    this.phone,
    this.image,
    this.uId,
    this.isVoted,
  });
  VotingUserModel.fromJson(Map<String, dynamic>? json) {
    name = json!['name'];
    email = json['email'];
    phone = json['phone'];
    image = json['image'];
    uId = json['uId'];
    isVoted = json['isVoted'];
  }
  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'email': email,
      'phone': phone,
      'image': image,
      'uId': uId,
      'isVoted': isVoted,
    };
  }
}
