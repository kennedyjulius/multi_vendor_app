import 'package:get/get.dart';
import 'package:multi_vendor_app/models/food.dart';
import 'package:multi_vendor_app/food/additive_obs.dart';

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
}

