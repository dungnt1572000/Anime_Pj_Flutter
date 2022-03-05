import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:net_working/controller/schedule_page_controller.dart';
import 'package:net_working/model/schedule.dart';

class Schedule_Page extends StatefulWidget {
  @override
  State<Schedule_Page> createState() => _Schedule_PageState();
}

class _Schedule_PageState extends State<Schedule_Page> {
  final schedule_controller = Get.put(Schedule_Page_Controller());
  List<String> days = [
    'monday',
    'tuesday',
    'wednesday',
    'thursday',
    'friday',
    'saturday',
    'sunday',
    'other'
  ];
  String selectedValue = 'monday';
  DateTime cur = DateTime.now();
@override
  void initState() {
    // TODO: implement initState
    super.initState();
    selectedValue = DateFormat('EEEE').format(cur).toLowerCase();
    schedule_controller.getDays(selectedValue);
    schedule_controller.refreshfetch();
    print(selectedValue);
  }
  @override
  void dispose() {

    var format = DateFormat('EEEE').format(cur);
    schedule_controller.getDays(format.toLowerCase());
    schedule_controller.refreshfetch();
    print("Dispose roi ne");
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('welcome'.tr + 'Schedule'.tr +'page'),
      ),
      body: SafeArea(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
        children: [
            DropdownButton(
              value: selectedValue,
              elevation: 6,
              onChanged: (String? value) {
                setState(() {
                  selectedValue = value!;
                  schedule_controller.days(selectedValue);
                  schedule_controller.refreshfetch();
                });
              },
              items: days.map<DropdownMenuItem<String>>((e) {
                return DropdownMenuItem<String>(
                  child: Text(e.tr),
                  value: e,
                );
              }).toList(),
            ),
            Obx(() {
              if (schedule_controller.isLoading.value) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              } else {
                return ListView.builder(
                    shrinkWrap: true,
                    primary: false,
                    scrollDirection: Axis.vertical,
                    itemCount: schedule_controller.schedule.value.days.length,
                    itemBuilder: (context, index) {
                      Sche_Item item =
                          schedule_controller.schedule.value.days[index];
                      DateTime c = DateTime.parse(item.airingStart);
                      return ListTile(
                        title: Text(item.title),
                        subtitle: Text('Start at'.tr +': ${c.hour}UTC'),
                        leading: CircleAvatar(
                          radius: 20,
                          backgroundImage: NetworkImage(item.imageUrl),
                        ),
                      );
                    });
              }
            })
        ],
      ),
          )),
    );
  }
}
