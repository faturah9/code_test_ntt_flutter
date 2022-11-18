class PersonModel {
  final int id;
  final double popularity;
  final String name;
  final String profileImg;
  final String known;

  PersonModel(this.id, this.popularity, this.name, this.profileImg, this.known);

  PersonModel.fromJson(Map<String, dynamic> json)
      : id = json["id"]??0,
        popularity = json["popularity"]??0.0,
        name = json["name"]??'',
        profileImg = json["profile_path"]??'',
        known = json["known_for_department"]??'';
}
