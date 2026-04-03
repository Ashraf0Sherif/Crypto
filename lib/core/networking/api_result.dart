sealed class Result<T> {}

class Success<T> extends Result<T> {
  final T data;
  final bool isOffline;
  Success(this.data, {this.isOffline = false});
}

class Failure<T> extends Result<T> {
  final String error;
  Failure(this.error);
}
