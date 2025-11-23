abstract class ApiRenderState {}

class Ideal extends ApiRenderState {}

class LoadingState extends ApiRenderState {}

class CompressionLoading extends ApiRenderState {}

class Refresh extends ApiRenderState {}

class OnChangeState<T> extends ApiRenderState {
  T? data;

  OnChangeState({this.data});
}

class ApiSuccess<T> extends ApiRenderState {
  T data;

  ApiSuccess(this.data);
}

class ApiFailure<T> extends ApiRenderState {
  String error;

  ApiFailure(this.error);
}

class SuccessToast<T> extends ApiRenderState {
  T data;

  SuccessToast(this.data);
}

class ErrorToast<T> extends ApiRenderState {
  T data;

  ErrorToast(this.data);
}
