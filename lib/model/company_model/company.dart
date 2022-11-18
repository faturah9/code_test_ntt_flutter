class CompanyModel {
  final int id;
  final String logo;
  final String name;
  final String country;

  CompanyModel(this.id, this.logo, this.name, this.country);

  CompanyModel.fromJson(Map<String, dynamic> json)
      : id = json["id"] ?? 0,
        logo = json["logo_path"] ?? "",
        name = json["name"] ?? "",
        country = json["origin_country"] ?? "";
}
