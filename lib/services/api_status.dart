enum ApiStatus {
  initial,
  loading,
  success,
  error,
  userFoundError,
  paginationLoading;

  bool get isInitial => this == ApiStatus.initial;

  bool get isLoading => this == ApiStatus.loading;

  bool get isSuccess => this == ApiStatus.success;

  bool get isError => this == ApiStatus.error;

  bool get isUserFoundError => this == ApiStatus.userFoundError;

  bool get isPaginationLoading => this == ApiStatus.paginationLoading;
}
