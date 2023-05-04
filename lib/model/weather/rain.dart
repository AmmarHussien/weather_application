class Rain {
  double? oneHoue;

  Rain({this.oneHoue});

  factory Rain.fromJson(Map<String, dynamic> json) => Rain(
        oneHoue: (json["oneHoue"] as num?)?.toDouble(),
      );

  Map<String, dynamic> toJson() => {
        'oneHoue': oneHoue,
      };
}
