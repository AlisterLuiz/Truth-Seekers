class Sources {
  dynamic logo;
  dynamic name;

  Sources({this.logo, this.name});

  factory Sources.fromJson(Map<dynamic, dynamic> json) {
    return Sources(
      logo: json['logo'] ?? '',
      name: json['name'] ?? 'NEWS'
    );
  }
}
