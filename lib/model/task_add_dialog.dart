import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:timetable/data/helper.dart';
import 'package:timetable/data/task.dart';
import 'package:timetable/model/styledtext.dart';

Future<dynamic> showTaskAddDialog(BuildContext context) async {
  final TextEditingController txtDescription = TextEditingController();
  final SpHelper helper = SpHelper();

  return showDialog(
    context: context,
    builder: (BuildContext context) {
      String startTime = "Select Time";
      String endTime = "Select Time";

      Future saveTask() async {
        Task newTask = Task(startTime, endTime, txtDescription.text);
        helper.writePerformance(newTask);
        print(newTask);
        Navigator.pop(context);
      }

      return StatefulBuilder(
        builder: (context, setState) {
          void showTimePickerPop() {
            Future<TimeOfDay?> selectedTime = showTimePicker(
              context: context,
              initialTime: TimeOfDay.now(),
            );
            selectedTime.then((timeOfDay) {
              setState(() {
                if (startTime == "Select Time"){
                  startTime = '${timeOfDay?.hour}:${timeOfDay?.minute}';
                }
                if (endTime == "Select Time"){
                  endTime = '${timeOfDay?.hour}:${timeOfDay?.minute}';
                }
              });
            });
          }
          return AlertDialog(
            title: StyledText(
              text: "Add Task", size: 30, color: true, oblique: true),
            content: SingleChildScrollView(
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        StyledText(text: "From", size: 22, color: true, oblique: false),
                        OutlinedButton(
                            onPressed: () {
                              showTimePickerPop();
                            },
                            child: StyledText(text: startTime,
                                size: 20,
                                color: true,
                                oblique: false)
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        StyledText(text: "To", size: 22, color: true, oblique: false),
                        OutlinedButton(
                            onPressed: () {
                              showTimePickerPop();
                            },
                            child: StyledText(text: endTime,
                                size: 20,
                                color: true,
                                oblique: false)
                        ),
                      ],
                    ),
                    TextField(
                      controller: txtDescription,
                      decoration: InputDecoration(hintText: "일정 설명")
                    )
                  ],
                )
            ),
            actions: [
              ElevatedButton(
                onPressed: (){Navigator.pop(context);},
                child: StyledText(text:"Cancel", size: 20, color: true, oblique: false,),
                style: ElevatedButton.styleFrom(
                  primary: const Color(0xffffffff)
                ),
              ),
              ElevatedButton(
                onPressed: saveTask,
                child: StyledText(text:"Add", size: 20, color: false, oblique: false,),
                style: ElevatedButton.styleFrom(
                  primary: const Color(0xff00968c)
                )
              )
            ],
          );
        }
      );
    }
  );
}