import 'package:get/get.dart';
import 'package:net_working/controller/call_api_serice.dart';
import 'package:net_working/model/schedule.dart';

class Schedule_Page_Controller extends GetxController {
  RxString days = 'monday'.obs;
  RxBool isLoading = true.obs;
  var schedule = Schedule('', true, 1, true, '', '', []).obs;

  fetchtogetSchedule() async {
    isLoading(true);
    try {
      var myschedule = await fetchSchedule(days.value);
      print("Curr day: ${days.value}");
      schedule.value = myschedule;
      print(schedule.toString());
    } finally {
      isLoading(false);
    }
  }

  void getDays(String str) {
    days(str);
  }

  @override
  void onInit() {
    // TODO: implement onInit
    fetchtogetSchedule();
    super.onInit();
  }

  void refreshfetch() {
    fetchtogetSchedule();
  }
}
