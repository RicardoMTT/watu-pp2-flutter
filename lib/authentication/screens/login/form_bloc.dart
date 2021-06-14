import 'package:flutter_form_bloc/flutter_form_bloc.dart';
import 'package:get/get.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:probardispositivofisico/app_routing/routing.dart';
import 'package:probardispositivofisico/app_widgets/loading_dialog.dart';
import 'package:probardispositivofisico/authentication/mutation/login_mutation.dart';
import 'package:probardispositivofisico/jwt.dart';

class LoginFormBloc extends FormBloc<String, String> {
  final email = TextFieldBloc(
    name: 'email',
  );

  final password = TextFieldBloc(
    name: 'password',
  );
  @override
  void onSubmitting() {
    LoadingDialog.show();

    final _client = Get.find<GraphQLClient>();
    _client.mutate(
      MutationOptions(
        document: loginMutationDoc,
        variables: {'identifier': email.value, 'password': password.value},
        onError: (error) {
          LoadingDialog.hide();
          print('error');
          print(error);
        },
        update: (cache, result) {
          if (!result.hasException || result.data != null) {
            LoadingDialog.hide();
            final _jwt = result.data['login']['jwt'];
            Jwt.token = _jwt;
            Get.offAllNamed(AppRoutes.tabs);
            return;
          }
        },
      ),
    );
  }

  LoginFormBloc() {
    addFieldBlocs(fieldBlocs: [
      email,
      password,
    ]);
  }

  void dispose() {
    email.close();
    password.close();
  }
}
