class API {
  static const Object DEFAULT_HEADERS = {
    'Accept': 'application/json',
  };
  static const String GET_RANDOM_USER_LIST_URL =
      "https://randomuser.me/api"; //https://randomuser.me/api
  static const String GET_RESERVATION_LIST_URL =
      "https://rentifyupc.azurewebsites.net/api/reservations"; //http://localhost:5000/api/reservations - https://localhost:5001/api/reservations
  static const String GET_OFFICE_URL =
      "https://rentifyupc.azurewebsites.net/api/offices/";
  static const String GET_OFFICES_URL =
      "https://rentifyupc.azurewebsites.net/api/offices";
  static const String USER_URL =
      "https://rentifyupc.azurewebsites.net/api/account/1";
  static const String GET_MY_OFFICES_URL =
      "http://10.0.2.2:5001/api/account/100/offices";
}
