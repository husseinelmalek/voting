class CandidatesModel {
  String? name;
  String? imageCandidate;
  String? bio;
  String? uIdCan;
  int? votes;
  CandidatesModel({
    this.name,
    this.imageCandidate,
    this.bio,
    this.uIdCan,
    this.votes,
  });

  CandidatesModel.fromJson(Map<String, dynamic>? json) {
    name = json!['name'];
    imageCandidate = json['imageCandidate'];
    bio = json['bio'];
    uIdCan = json['uIdCan'];
    votes = json['votes'];
  }
  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'imageCandidate': imageCandidate,
      'bio': bio,
      'uIdCan': uIdCan,
      'votes': votes,
    };
  }
}
