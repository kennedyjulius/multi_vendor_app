import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:multi_vendor_app/controllers/phone_verification_controller.dart';

class VerificationServices {
  final controller = Get.put(PhoneVerificationController());
  final FirebaseAuth _auth = FirebaseAuth.instance;

  // Function to verify phone number
  Future<void> verifyPhoneNumber(
    String phoneNumber, {
    required Function(String verificationId, int? resendToken) codeSentCallback, required Null Function(String verificationId, int? resendToken) codeSent,
  }) async {
    try {
      await _auth.verifyPhoneNumber(
        phoneNumber: phoneNumber,
        verificationCompleted: (PhoneAuthCredential credentials) async {
          // Automatically signs in if verification succeeds
          await _auth.signInWithCredential(credentials).then((user) {
            controller.verifyPhone(); // Call a method in the controller after success
          });
        },
        verificationFailed: (FirebaseAuthException error) {
          Get.snackbar("Verification Failed", error.message ?? "Unknown error");
        },
        codeSent: (String verificationId, int? resendToken) {
          codeSentCallback(verificationId, resendToken); // Trigger the callback when the code is sent
        },
        codeAutoRetrievalTimeout: (String verificationId) {
          Get.snackbar("Timeout", "Code retrieval timed out. Please try again.");
        },
      );
    } catch (e) {
      Get.snackbar("Error", "Failed to verify phone number: ${e.toString()}");
    }
  }

  // Function to verify SMS code
  Future<void> verifySmsCode(String verificationId, String smsCode) async {
    try {
      PhoneAuthCredential credential = PhoneAuthProvider.credential(
        verificationId: verificationId,
        smsCode: smsCode,
      );
      await _auth.signInWithCredential(credential).then((user) {
        controller.verifyPhone(); // Call a method in the controller after success
      });
    } catch (e) {
      Get.snackbar("Error", "Invalid SMS code. Please try again.");
    }
  }
}
