class AppLink {
  static String LOGIN = '/api/doctor/login';
  static String SIGNUP = '/api/doctor/send-order';
  static String LOGOUT = '';
  static String CITY = '/api/get_cities';
  static String HOMEDOCTOR = '/api/doctor/home';
  static String AVAILABLE = '/api/doctor/appointment-status';
  static String DOCTORPOFILE = '/api/doctor-profile';
  static String UPDATEPROFILE = '/api/doctor-update-profile';
  static String GETINTERVIEW = '/api/doctor/appointment-get';
  static String GETINTERVIEWSALESMAN = '/api/doctor/my-interviews';
  static String GETDAYS = '/api/doctor/get-days';
  static String ADDINTERVIEW = '/api/doctor/appointment-create';
  static String GETMAXVISIT = '/api/doctor/get-num-visit';
  static String EDITMAXVISIT = '/api/doctor/num-visit-update';
  static String GETSALESMANBYCOMPANY(String company) => '/api/doctor/get-salesman?company=$company';
  static String EDITINTERVIEW(int id) => '/api/doctor/appointment-update/$id';
}
