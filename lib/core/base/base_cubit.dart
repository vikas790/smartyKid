import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import '../services/toast_service.dart';
import '../services/storage_service.dart';
import '../../routes/routes.dart';
import '../themes/text_style.dart';
import 'api_render_state.dart';

class BaseCubit<T extends ApiRenderState> extends Cubit<T> with TextStyles {
  late Function(dynamic errorRes) onApiError;
  final storage = GetIt.I.get<StorageService>();
  final navigation = GetIt.I.get<NavigationService>();

  final _toast = GetIt.I.get<ToastService>();

  BuildContext? get appContext => navigation.appContext;

  BaseCubit([T? initialState]) : super(initialState ?? (Ideal() as T)) {
    onApiError = (error) {
      var message = '';
      try {
        message = error;
      } catch (e) {
        message = error.toString();
      }
      emit(ApiFailure(message) as T);
    };
  }

  showError(String message) {
    if (message.isNotEmpty) _toast.errorToast(appContext, message);
  }

  showSuccess(String message) {
    if (message.isNotEmpty) _toast.successToast(appContext, message);
  }
}
