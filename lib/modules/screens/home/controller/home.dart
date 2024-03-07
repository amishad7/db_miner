import 'package:db_miner/modules/screens/home/model/Json-model.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  ChangeView c1 = ChangeView(show: false.obs);

  changeView() {
    c1.show.value = !c1.show.value;
  }
}
