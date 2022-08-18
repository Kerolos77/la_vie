import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:la_vie/business_logic/cubit/regidtration_cubit/registration_states.dart';
import 'package:la_vie/constants/api_constants.dart';
import 'package:la_vie/data/models/registration/RegistrationModel.dart';

import '../../../data/web_services/dio_hellper.dart';

class RegistrationCubit extends Cubit<RegistrationState> {
  RegistrationCubit() : super(RegistrationInitial());

  static RegistrationCubit get(context) => BlocProvider.of(context);

  bool registrationFlag = true;

  late RegistrationModel registrationModel;

  void changeRegistration(bool registrationFlag) {
    this.registrationFlag = registrationFlag;
    emit(ChangeRegistration());
  }

  void signUp({
    required String email,
    required String password,
    required String firstName,
    required String lastName,
  }) {
    emit(SignUpLoadingRegistrationState());
    print(firstName);
    print(lastName);
    print(email);
    print(password);
    DioHelper.postData(url: signUpUrl, body: {
      'email': email,
      'password': password,
      'firstName': firstName,
      'lastName': lastName,
    }).then((response) {
      print("***************");

      print(response);
      registrationModel = RegistrationModel.fromJson(response.data);
      emit(SignUpSuccessRegistrationState(registrationModel));
    }).catchError((error) {
      print("////////////////");
      print(error);
      print("////////////////");
      emit(SignUpErrorRegistrationState(
        error: error.toString(),
      ));
    });
  }
}
