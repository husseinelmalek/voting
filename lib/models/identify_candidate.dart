class IdentityModel {
  String? age;
  String? id;
  String? uId;
  IdentityModel({
    required this.age,
    required this.id,
    required this.uId,
  });
  IdentityModel.fromJson(Map<String, dynamic> json) {
    age = json['age'];
    id = json['id'];
    uId = json['uId'];
  }
  Map<String, dynamic> toJson() {
    return {
      'age': age,
      'id': id,
      'uId': uId,
    };
  }
}
