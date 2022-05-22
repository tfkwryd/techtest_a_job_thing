import 'package:flutter_dotenv/flutter_dotenv.dart';

class ServiceConstants {
  static String hostname = dotenv.get('HOSTNAME');
  static String candidatesEndPoint = '$hostname/candidates';
  static String candidatesStatusEndPoint = '$hostname/experiences';
  static String blogsEndPoint = '$hostname/blogs';
  static String addressEndPoint = '$hostname/address';
  static String emailsEndPoint = '$hostname/emails';
}
