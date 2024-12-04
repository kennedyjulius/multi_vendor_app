import 'package:get/get.dart';
import 'package:multi_vendor_app/models/food.dart';
import 'package:multi_vendor_app/models/hook_models/additive_obs.dart';

class FoodController extends GetxController {
  RxInt currentPage = 0.obs;
  bool initialCheckValue = false;
  var additivesList = <AdditivesObs>[].obs;

  void changePage(int index){
    currentPage.value = index;
  }

  RxInt count = 1.obs;

  void increment(){
    count.value++;
  }

  void decrement(){
    count.value--;
  }


  void loadAdditives(List<Additive> additives){
  additivesList.clear();

  for (var additiveInfo in additives){
    var initialCheckValue = false.obs;
    var additive = AdditivesObs(
      id: additiveInfo.id,
      title: additiveInfo.title, 
      price: additiveInfo.price,
      checked: initialCheckValue,
    );
    if (additives.length == additivesList.length) {
    
    }else{
      additivesList.add(additive);
    }
  }
}


List<String> getList(){
  List<String> ads = [];


  for (var additive in additivesList) {
    if (additive.isChecked.value && !ads.contains(additive.title)) {
    ads.add(additive.title);
    }else if (!additive.isChecked.value && ads.contains(additive.title)) {
    ads.remove(additive.title);
    }
  }
  return ads;
}

RxDouble _totalPrice = 0.0.obs;

double get additivePrice => _totalPrice.value;

set setTotalPrice(double newPrice) {
  _totalPrice.value = newPrice;
}

double getTotalPrice(){
  double totalPrice =  0.0;

  for (var additive in additivesList) {
    if (additive.isChecked.value) {
    totalPrice += double.tryParse(additive.price) ?? 0.0;
    }
  }
  return totalPrice;
}
}


