import 'package:flutter/material.dart';
import 'package:flutter_form_bloc/flutter_form_bloc.dart';
import 'package:probardispositivofisico/app_widgets/common_textfield.dart';
import 'package:probardispositivofisico/constants.dart';
import 'package:probardispositivofisico/profile/screens/form_bloc.dart';

class ProfileFormScreen extends StatelessWidget {
  const ProfileFormScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider<ProfileFormBloc>(
      create: (_) => ProfileFormBloc(),
      child: Builder(
        builder: (context) {
          final _formBloc = BlocProvider.of<ProfileFormBloc>(context);
          return SingleChildScrollView(
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 15.0),
              child: Column(
                children: [
                  CommonTextField(
                    keyBoardType: TextInputType.text,
                    placeholder: 'Nombres',
                    textFieldBloc: _formBloc.names,
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  CommonTextField(
                    keyBoardType: TextInputType.text,
                    placeholder: 'Apellidos',
                    textFieldBloc: _formBloc.names,
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  CommonTextField(
                    keyBoardType: TextInputType.text,
                    placeholder: 'DNI',
                    textFieldBloc: _formBloc.names,
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  CommonTextField(
                    keyBoardType: TextInputType.text,
                    placeholder: 'Contraseña',
                    textFieldBloc: _formBloc.names,
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  RaisedButton(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0)),
                    padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                    onPressed: () {
                      print("PROCESAR CAMBIOS");
                    },
                    color: kPrimaryColor,
                    child: Text(
                      'Guardar Cambios',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  )
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
