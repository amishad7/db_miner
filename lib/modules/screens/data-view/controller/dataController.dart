import 'package:db_miner/modules/screens/data-view/model/dataModel.dart';
import 'package:get/get.dart';

class DataController extends GetxController {
  DataModel dataModel = DataModel(show: false.obs);

  editVisibility() {
    dataModel.show.value = !dataModel.show.value;
  }
}
