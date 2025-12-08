import '../../../core/base/base_cubit.dart';
import '../../../core/base/api_render_state.dart';
import 'science_state.dart';

class ScienceCubit extends BaseCubit<ApiRenderState> {
  ScienceCubit() : super(ScienceInitial());
}
