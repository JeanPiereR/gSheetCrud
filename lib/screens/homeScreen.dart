import 'package:api_proyect/gsheets/equipos/gsheetsEquipos.dart';
import 'package:api_proyect/widgets/user_form.dart';
import 'package:flutter/material.dart';


class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) => Scaffold(
    appBar: AppBar(
      title: const Text("My App"),
      centerTitle: true,
    ),

    body: Container(
      alignment:  Alignment.center,
      padding: const EdgeInsets.all(32),
      child: UserFormWidget(
        onSaveEquipos: (EquiposJson) async {

        await UserSheetsApi.insert([EquiposJson.toJson()]);
      },
      )
    )
  );
}