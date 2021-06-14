import 'package:flutter_form_bloc/flutter_form_bloc.dart';

class ProfileFormBloc extends FormBloc<String, String> {
  final names = TextFieldBloc(
    name: 'names',
  );

  final password = TextFieldBloc(
    name: 'password',
  );
  final avatar =
      InputFieldBloc<String, dynamic>(name: 'avatar', initialValue: null);

  @override
  void onSubmitting() {}

  ProfileFormBloc() {
    addFieldBlocs(fieldBlocs: [names, password, avatar]);
  }

  void dispose() {
    names.close();
    password.close();
    avatar.close();
  }
}
