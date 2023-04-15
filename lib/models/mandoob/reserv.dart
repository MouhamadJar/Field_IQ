class Reservation {
  late final String doctorName;
  late final String reservationDay;
  late final String reservationTime;
  late final String phone;
  late final String cvv;
  late final String fees;
  late final String receivingMethod;
  late final String specialization;

  Reservation({
    required this.doctorName,
    required this.reservationDay,
    required this.reservationTime,
    required this.phone,
    required this.cvv,
    required this.fees,
    required this.receivingMethod,
    required this.specialization,
  });
}
/*
*   {
        "interview_id": 6,
        "doctor_name": "doctor two updated",
        "phone": "0938955551",
        "specialization": "test",
        "cvv": "202020",
        "payment_method": "payment one",
        "time": "11:00",
        "duration": "00:15:00",
        "price": 1000,
        "kind_of_visite": "online",
        "day": "sunday"
    }
* */