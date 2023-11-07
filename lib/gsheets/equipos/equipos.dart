class SheetEquipos{
  static final String id = "id";
  static final String codigoEquipo = "codigoEquipo";
  static final String zona = "zona";

  static List<String> getFields() => [id, codigoEquipo, zona];
}

class EquiposJson {
  final int? id;
  final String codigoEquipo;
  final String zona;

  const EquiposJson({
    this.id,
    required this.codigoEquipo,
    required this.zona,
    });

  Map<String, dynamic> toJson() => {
    SheetEquipos.id: id,
    SheetEquipos.codigoEquipo: codigoEquipo,
    SheetEquipos.zona: zona,
  };

}
