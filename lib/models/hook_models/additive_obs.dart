import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';

class AdditiveObs extends GetxController{
  final int id;
  final String title;
  final String price;
  RxBool isChecked = false.obs;

  AdditiveObs({
    required this.id,
    required this.title,
    required this.price,
    bool isChecked = false
  });


}
