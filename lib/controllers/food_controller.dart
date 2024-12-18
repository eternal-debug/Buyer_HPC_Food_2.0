import 'package:get/get.dart';
import 'package:hpc_food/models/addictive_obs.dart';
import 'package:hpc_food/models/foods_model.dart';

class FoodController extends GetxController {
  RxInt currrentPage = 0.obs;
  bool initialCheckValue = false;
  var additivesList = <AdditiveObs>[].obs;

  void changePage(int index) {
    currrentPage.value = index;
  }

  RxInt count = 1.obs;

  void increment() {
    count.value++;
  }

  void decrement() {
    if (count.value > 1) {
      count.value--;
    }
  }

  void loadAdditives(List<Additive> additives) {
    additivesList.clear();

    for (var additiveInfo in additives) {
      var additive = AdditiveObs(
        id: additiveInfo.id,
        title: additiveInfo.title,
        price: additiveInfo.price,
        checked: initialCheckValue,
      );
      if (additives.length == additivesList.length) {
      } else {
        additivesList.add(additive);
      }
    }
  }

  List<String> getCartAdditive() {
    List<String> additives = [];

    for (var additive in additivesList) {
      if (additive.isChecked.value && !additives.contains(additive.title)) {
        additives.add(additive.title);
      } else if (!additive.isChecked.value &&
          additives.contains(additive.title)) {
        additives.remove(additive.title);
      }
    }
    return additives;
  }

  final RxInt _totalPrice = 0.obs;

  int get additivePrice => _totalPrice.value;

  set setTotalPrice(int newPrice) {
    _totalPrice.value = newPrice;
  }

  int getTotalPrice() {
    int totalPrice = 0;

    for (var additive in additivesList) {
      if (additive.isChecked.value) {
        totalPrice += additive.price;
      }
    }

    setTotalPrice = totalPrice;
    return totalPrice;
  }
}
