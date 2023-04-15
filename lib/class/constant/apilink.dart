class AppLink {
  static String LOGIN = '/Mandoob/public/api/doctor/login';
  static String SIGNUP = '/Mandoob/public/api/doctor/send-order';
  static String LOGOUT = '';
  static String CITY = '/Mandoob/public/api/get_cities';
  static String HOMEDOCTOR = '/Mandoob/public/api/doctor/home';
  static String AVAILABLE = '/Mandoob/public/api/doctor/appointment-status';
  static String DOCTORPOFILE = '/Mandoob/public/api/doctor-profile';
  static String UPDATEPROFILE = '/Mandoob/public/api/doctor-update-profile';
  static String GETINTERVIEW = '/Mandoob/public/api/doctor/appointment-get';
  static String GETINTERVIEWSALESMAN = '/Mandoob/public/api/doctor/my-interviews';
  static String GETDAYS = '/Mandoob/public/api/doctor/get-days';
  static String ADDINTERVIEW = '/Mandoob/public/api/doctor/appointment-create';
  //static String EDITINTERVIEW = '/Mandoob/public/api/doctor/appointment-update';


  static String GETSALESMANBYCOMPANY(String company) => '/Mandoob/public/api/doctor/get-salesman?company=$company';
  static String EDITINTERVIEW(int id) => '/Mandoob/public/api/doctor/appointment-update/$id';
}
