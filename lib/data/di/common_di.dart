import 'package:get_it/get_it.dart';
import 'package:smartykids/data/services/local/toast_service.dart';
import 'package:smartykids/data/storage/storage.dart';
import 'package:smartykids/routing/navigation_services.dart';

mixin CommonDi {
  final navigation = GetIt.I.get<NavigationService>();
  final storage = GetIt.I<StorageService>();
  final _toast = GetIt.I<ToastService>();

  void showError(String message) {
    if (message.isEmpty) {
      return;
    } else {
      // _toast.errorToast(appContext, message);
    }
  }

  void showSuccess(String message) {
    if (message.isEmpty) {
      return;
    } else {
      // _toast.successToast(appContext, message);
    }
  }
}
