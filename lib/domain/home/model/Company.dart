class Company {
  Company({
    this.name,
    this.catchPhrase,
    this.bs,
  });

  get getName => name ?? '';
  get getCatchPhrase => catchPhrase ?? '';
  get getBs => bs ?? '';

  String? name;
  String? catchPhrase;
  String? bs;

  factory Company.fromJson(Map<String, dynamic> json) => Company(
        name: json["name"],
        catchPhrase: json["catchPhrase"],
        bs: json["bs"],
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "catchPhrase": catchPhrase,
        "bs": bs,
      };
}
