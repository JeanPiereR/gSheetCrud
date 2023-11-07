import 'package:api_proyect/gsheets/equipos/equipos.dart';
import 'package:api_proyect/widgets/buton.dart';
import 'package:flutter/material.dart';


class UserFormWidget extends StatefulWidget {
  final ValueChanged<EquiposJson> onSaveEquipos;

  const UserFormWidget({
    Key? key,
    required this.onSaveEquipos,
  }) : super (key: key);


  @override
  // ignore: library_private_types_in_public_api
  _UserFormWidgetState createState() => _UserFormWidgetState();
}

class _UserFormWidgetState extends State<UserFormWidget> {

  ///Iniciar parte de los controladores del sheet
  final formKey = GlobalKey<FormState>(); ///Constante independiente de las variables
  late TextEditingController controllercodigoEquipo;
  late TextEditingController controllerzona;

  @override
  void initState() {
    super.initState();

    initEquiposJson();
  }

  void initEquiposJson() {
    controllercodigoEquipo = TextEditingController();
    controllerzona = TextEditingController();
  }
  ///Termino



  ///
  @override
  Widget build(BuildContext context) => Form(
    key: formKey, ///Constante administrada en los controladores
    child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          buildCodigoEquipo(), ///Se crea un build+variable
          const SizedBox(height: 16),
          buildZona(),
          const SizedBox(height: 16),
          buildSubmit(),
        ],
    ),
  );


  Widget buildCodigoEquipo() => TextFormField( ///Se referencia el Buil creado
    controller: controllercodigoEquipo, ///Se configura el controlador
    decoration: const InputDecoration(
      labelText: "Equipo",
      border: OutlineInputBorder(),
    ),
    ///Validar de los datos ingresados
    validator: (value) =>
      value != null && value.isEmpty ? "Ingrese codigo equipo" : null,
  );


  Widget buildZona() => TextFormField(
    controller: controllerzona,
    decoration: const InputDecoration(
      labelText: "Zona",
      border: OutlineInputBorder(),
    ),
    validator: (value) =>
      value != null && value.isEmpty ? "Ingrese la zona del equipo" : null,
  );


  Widget buildSubmit() => ButtonWidget(
    text: "Guardar",
    onClicked: () {
      final form = formKey.currentState!;
      final isValid = form.validate();

      if (isValid) {
        final equipos = EquiposJson(
          codigoEquipo: controllercodigoEquipo.text,
          zona: controllerzona.text,
          );
          widget.onSaveEquipos(equipos);
      }
    },);


}