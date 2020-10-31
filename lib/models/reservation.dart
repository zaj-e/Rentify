class Reservation {
  final DateTime initialDate;
  final DateTime endDate;
  bool status = true;
  final int accountId;
  final int officeId;

  Reservation({this.initialDate, this.endDate, this.officeId, this.accountId});
}
