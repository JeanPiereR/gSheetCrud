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



    ///Funcion Copy para generar ID
    EquiposJson copy ({
      int? id,
      String? codigoEquipo,
      String? zona,
    }) => EquiposJson(
        id: id ?? this.id,
        codigoEquipo: codigoEquipo?? this.codigoEquipo,
        zona: zona?? this.zona,
      );





  Map<String, dynamic> toJson() => {
    SheetEquipos.id: id,
    SheetEquipos.codigoEquipo: codigoEquipo,
    SheetEquipos.zona: zona,
  };

}
