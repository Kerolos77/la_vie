import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:la_vie/business_logic/cubit/regidtration_cubit/registration_states.dart';
import 'package:la_vie/constants/api_constants.dart';
import 'package:la_vie/data/models/registration/RegistrationModel.dart';

import '../../../data/local/cache_helper.dart';
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

  signUp({
    required buildContext,
    required firstName,
    required lastName,
    required email,
    required password,
  }) async {
    emit(SignUpLoadingRegistrationState());

    await DioHelper.postData(
      url: signUpUrl,
      body: {
        "firstName": firstName,
        "lastName": lastName,
        "email": email,
        "password": password,
      },
    ).then((value) {
      debugPrint('request Processed!');

      debugPrint('status code: ${value.statusCode.toString()}');
      debugPrint('status message: ${value.statusMessage.toString()}');
      debugPrint('response type: ${value.data['type'].toString()}');
      debugPrint('response message: ${value.data['message'].toString()}');

      debugPrint('----------------------');
      registrationModel = RegistrationModel.fromJson(value.data);
      emit(SignUpSuccessRegistrationState(registrationModel));
      ScaffoldMessenger.of(buildContext)
          .showSnackBar(SnackBar(content: Text(registrationModel.message)));
      changeRegistration(true);
    }).catchError((error) {
      if (error is DioError) {
        emit(SignUpErrorRegistrationState());
        if (error.message == 'Http status error [409]') {
          ScaffoldMessenger.of(buildContext).showSnackBar(
              const SnackBar(content: Text('account already registered')));
        } else {
          debugPrint('error Processed!');

          debugPrint('status code: ${error.response?.statusCode.toString()}');
          debugPrint(
              'status message: ${error.response?.statusMessage.toString()}');
          debugPrint(
              'response type: ${error.response?.data['type'].toString()}');
          debugPrint(
              'response message: ${error.response?.data['message']
                  .toString()}');

          debugPrint('----------------------');
          registrationModel = RegistrationModel.fromJson(error.response?.data);
          ScaffoldMessenger.of(buildContext).showSnackBar(
              SnackBar(content: Text(error.response?.data['message'][0])));
        }
      }
    });
  }

  signUpWithGoogle() {

  }

  login({
    required buildContext,
    required email,
    required password,
  }) async {
    emit(SignUpLoadingRegistrationState());
    await DioHelper.postData(
      url: loginUrl,
      body: {
        "email": email,
        "password": password,
      },
    ).then((value) {
      debugPrint('request Processed!');

      debugPrint('status code: ${value.statusCode.toString()}');
      debugPrint('status message: ${value.statusMessage.toString()}');
      debugPrint('response type: ${value.data['type'].toString()}');
      debugPrint('response message: ${value.data['message'].toString()}');
      debugPrint('----------------------');
      registrationModel = RegistrationModel.fromJson(value.data);
      CacheHelper.putData(
          key: 'accessToken',
          value: "${registrationModel.toMap()['data']['accessToken']}");
      emit(SignUpSuccessRegistrationState(registrationModel));
    }).catchError((error) {
      if (error is DioError) {
        emit(SignUpErrorRegistrationState());
        if (error.message == 'Http status error [409]') {
          ScaffoldMessenger.of(buildContext).showSnackBar(
              const SnackBar(content: Text('account already registered')));
        } else {
          debugPrint('error Processed!');

          debugPrint('status code: ${error.response?.statusCode.toString()}');
          debugPrint(
              'status message: ${error.response?.statusMessage.toString()}');
          debugPrint(
              'response type: ${error.response?.data['type'].toString()}');
          debugPrint(
              'response message: ${error.response?.data['message']
                  .toString()}');
          debugPrint('----------------------');
          registrationModel = RegistrationModel.fromJson(error.response?.data);
          ScaffoldMessenger.of(buildContext).showSnackBar(
              SnackBar(content: Text(error.response?.data['message'][0])));
        }
      }
    });
  }
}
