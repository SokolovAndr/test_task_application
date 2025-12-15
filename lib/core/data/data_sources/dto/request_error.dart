class RequestError implements Exception {
  const RequestError(this.description);

  final String description;
}
