import 'package:flutter_sms/flutter_sms.dart';
import 'package:geolocator/geolocator.dart';

class SmsService {
  static Future<void> sendSmsWithLocation(
      String phoneNumber, String messageBody) async {
    try {
      // Check if location service is enabled
      if (!await Geolocator.isLocationServiceEnabled()) {
        throw 'Location service disabled';
      }

      // Request location permission
      LocationPermission permission = await Geolocator.checkPermission();
      if (permission == LocationPermission.denied ||
          permission == LocationPermission.deniedForever) {
        permission = await Geolocator.requestPermission();
        if (permission == LocationPermission.denied ||
            permission == LocationPermission.deniedForever) {
          throw 'Location permission denied';
        }
      }

      // Get current location
      Position position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high,
      );

      double latitude = position.latitude;
      double longitude = position.longitude;

      // Construct Google Maps link

      String googleMapsLink =
          'https://www.google.com/maps?q=$latitude,$longitude';

      // Construct SMS message with location
      String message = 'Need help! Please track me here: $googleMapsLink';

      // Send the SMS
      String result =
          await sendSMS(message: message, recipients: [phoneNumber]);

      // Check if the SMS was sent successfully
      if (result == "SMS Sent Successfully") {
        print("SMS sent successfully");
      } else {
        print("Error sending SMS: $result");
      }
    } catch (error) {
      print("Error sending SMS: $error");
    }
  }
}
