import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:smartykids/data/di/locator.dart';

import '../../../data/services/local/toast_service.dart';
import '../../../data/storage/storage.dart';
import '../../../routing/navigation_services.dart';
import '../themes/text_style.dart';
import 'api_render_state.dart';

class BaseCubit<T extends ApiRenderState> extends Cubit<T> with TextStyles {
  late Function(dynamic errorRes) onApiError;
  final storage = GetIt.I.get<StorageService>();
  final navigation = GetIt.I.get<NavigationService>();

  // final dateTimeService = GetIt.I.get<DateTimeService>();
  final _toast = GetIt.I.get<ToastService>();

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