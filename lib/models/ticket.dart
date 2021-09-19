class Tiquete {
  Tiquete({
    this.nrtiquete,
    this.nrrefeicoestotal,
    this.nrrefeicoesresta,
  });

  final String nrtiquete;
  final String nrrefeicoestotal;
  final String nrrefeicoesresta;

  double getProgress() {
    try {
      var total = int.parse(nrrefeicoestotal);
      var restante = int.parse(nrrefeicoesresta);
      return restante / total;
    } catch (e) {
      return 0;
    }
  }

  factory Tiquete.fromJson(Map<String, dynamic> json) => Tiquete(
        nrtiquete: json["nrtiquete"],
        nrrefeicoestotal: json["nrrefeicoestotal"],
        nrrefeicoesresta: json["nrrefeicoesresta"],
      );

  Map<String, dynamic> toJson() => {
        "nrtiquete": nrtiquete,
        "nrrefeicoestotal": nrrefeicoestotal,
        "nrrefeicoesresta": nrrefeicoesresta,
      };
}
