class StatusData {
  StatusData({
    this.codPessoa,
    this.dataAceitacaoTermoBib,
    this.indicadorRenovaAutomaticoBib,
  });

  final String codPessoa;
  final DateTime dataAceitacaoTermoBib;
  final String indicadorRenovaAutomaticoBib;

  factory StatusData.fromJson(Map<String, dynamic> json) => StatusData(
        codPessoa: json["CodPessoa"],
        dataAceitacaoTermoBib: DateTime.parse(json["DataAceitacaoTermoBib"]),
        indicadorRenovaAutomaticoBib: json["IndicadorRenovaAutomaticoBib"],
      );

  Map<String, dynamic> toJson() => {
        "CodPessoa": codPessoa,
        "DataAceitacaoTermoBib": dataAceitacaoTermoBib.toIso8601String(),
        "IndicadorRenovaAutomaticoBib": indicadorRenovaAutomaticoBib,
      };

  bool isAutoRenewActivated() {
    return indicadorRenovaAutomaticoBib == 'S';
  }
}
