import 'package:get/get.dart';

class AdditivesObs extends GetxController{
  final int id;
  final String title;
  final String price;
  RxBool isChecked = false.obs;

  AdditivesObs({
    required this.id,
    required this.title,
    required this.price,
    bool isChecked = false, required checked
  }){
    this.isChecked.value = isChecked;
  }

  void toggleChecked(){
    isChecked.value = !isChecked.value;
  }


}
