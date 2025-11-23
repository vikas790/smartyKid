import 'package:get_it/get_it.dart';
import '../../routes/routes.dart';
import '../services/storage_service.dart';
import '../services/toast_service.dart';

mixin CommonDi {
  final storage = GetIt.I.get<StorageService>();
  final navigation = GetIt.I.get<NavigationService>();
  final toast = GetIt.I.get<ToastService>();
}
