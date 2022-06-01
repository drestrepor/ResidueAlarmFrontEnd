import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:residue_alarm/Screens/History/model/history_model.dart';
import 'package:residue_alarm/constants.dart';

class HistoryScreen extends StatefulWidget {
  const HistoryScreen({Key? key}) : super(key: key);

  @override
  State<HistoryScreen> createState() => _HistoryScreenState();
}

class _HistoryScreenState extends State<HistoryScreen> {
  final List<HistoryModel> historyData = [
    HistoryModel(
        id: "21",
        source: "Medellin's downtown",
        time: "Today: 08:35 am",
        priority: "high"),
    HistoryModel(
        id: "17",
        source: "El Tesoro CC",
        time: "Yesterday: 11:45 am",
        priority: "medium"),
    HistoryModel(
        id: "15",
        source: "Universidad EAFIT",
        time: "Yesterday: 07:10 am",
        priority: "low"),
  ];
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      child: ListView.builder(
        itemBuilder: (_, index) {
          return Padding(
            padding: const EdgeInsets.only(bottom: 8.0),
            child: Card(
              elevation: 10,
              child: Container(
                padding: const EdgeInsets.all(8),
                child: Row(
                  children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Icon(Icons.my_location),
                      ],
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    Expanded(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Text(historyData[index].source),
                        ],
                      ),
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Text(historyData[index].time),
                        SizedBox(height: 30),
                        ElevatedButton(
                            onPressed: () {
                              print(historyData[index].id);
                            },
                            style: ElevatedButton.styleFrom(
                              primary: kPrimaryLightColor,
                            ),
                            child: Container(
                              width: 60,
                              child: Padding(
                                padding: const EdgeInsets.all(10),
                                child: Center(
                                  child: Text("View"),
                                ),
                              ),
                            )),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          );
        },
        itemCount: historyData.length,
      ),
    );
  }
}
