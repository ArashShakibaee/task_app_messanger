class DiacoException implements Exception {
  String msg;
  DiacoException([this.msg = "Something went wrong"]) {
    msg = 'Diaco Exception $msg';
  }

  @override
  String toString() => 'DiacoException(msg: $msg)';
}
