// ignore_for_file: unnecessary_brace_in_string_interps, sort_child_properties_last

import 'dart:ffi';

import 'package:flutter/material.dart';
import 'dart:async';

import 'package:flutter/services.dart';

import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:gauges/gauges.dart';

import 'package:konnect_speed_test/speed_test_lib.dart';
import 'package:speedtest/dialogue.dart';
import 'package:syncfusion_flutter_gauges/gauges.dart';

void main() {
  runApp(const SpeedTestApp());
}

class SpeedTestApp extends StatefulWidget {
  const SpeedTestApp({super.key});

  @override
  State<SpeedTestApp> createState() => _SpeedTestAppState();
}

class _SpeedTestAppState extends State<SpeedTestApp> with SpeedtestHandler {
  var upload = "-";
  var download = "-";
  var jitter = "-";
  var ping = "-";

  late SpeedTest speedTest;
  bool isStated = false;
  @override
  void initState() {
    speedTest = SpeedTest(speedtestHandler: this);
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: SafeArea(
          child: Column(
            children: [
              Container(
                //  color: Colors.red,
                margin: const EdgeInsets.all(5),
                width: double.infinity,
                child: Container(
                  height: 160,
                  color: Colors.red,
                  child: Column(
                    children: [
                      Container(
                        alignment: Alignment.center,
                        height: 130,
                        color: const Color(0xffffbd35),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Column(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                Neumorphic(
                                  style: NeumorphicStyle(
                                    shape: NeumorphicShape.concave,
                                    boxShape: NeumorphicBoxShape.roundRect(
                                        BorderRadius.circular(8)),
                                    depth: 4,
                                    lightSource: LightSource.topLeft,
                                    color: const Color(0xffffbd35),
                                  ),
                                  child: Container(
                                      width: 70,
                                      // height: 20,

                                      margin: const EdgeInsets.all(5),
                                      color: const Color(0xffffbd35),
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceEvenly,
                                        children: [
                                          const Text("Jitter",
                                              style: TextStyle(
                                                  color: Colors.black)),
                                          Text(" ${jitter}",
                                              style: TextStyle(
                                                  color: Colors.black)),
                                        ],
                                      )),
                                ),
                                Neumorphic(
                                  style: NeumorphicStyle(
                                    shape: NeumorphicShape.concave,
                                    boxShape: NeumorphicBoxShape.roundRect(
                                        BorderRadius.circular(8)),
                                    depth: 4,
                                    lightSource: LightSource.topLeft,
                                    color: const Color(0xffffbd35),
                                  ),
                                  child: Container(
                                    width: 70,
                                    // height: 20,
                                    margin: const EdgeInsets.all(5),
                                    color: const Color(0xffffbd35),
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceEvenly,
                                      children: [
                                        const Text("Ping",
                                            style:
                                                TextStyle(color: Colors.black)),
                                        Text(" ${ping}",
                                            style:
                                                TextStyle(color: Colors.black)),
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),

                            // SizedBox(
                            //   height: 10,
                            // ),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                isStated
                                    ? const Gauge()
                                    : Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceEvenly,
                                        children: [
                                          Container(
                                            alignment: Alignment.center,
                                            // padding: const EdgeInsets.all(2),
                                            margin: const EdgeInsets.only(
                                                bottom: 10),
                                            child: const Text(
                                              "Konnect Speed Test",
                                              style: TextStyle(
                                                  color: Colors.black,
                                                  fontSize: 10.0,
                                                  fontWeight: FontWeight.bold),
                                            ),
                                          ),
                                          Neumorphic(
                                            margin: EdgeInsets.only(bottom: 3),
                                            style: NeumorphicStyle(
                                              border: const NeumorphicBorder(
                                                  isEnabled: true,
                                                  color: Colors.white,
                                                  width: 0.8),
                                              shape: NeumorphicShape.concave,
                                              boxShape:
                                                  NeumorphicBoxShape.roundRect(
                                                      BorderRadius.circular(
                                                          50)),
                                              depth: 4,
                                              lightSource: LightSource.topLeft,
                                              color: const Color(0xffffbd35),
                                            ),
                                            child: Container(
                                              // margin: EdgeInsets.only(bottom: 3),
                                              // color: Colors.red,
                                              width: 100,
                                              height: 100,

                                              child: TextButton(
                                                  onPressed: () {
                                                    speedTest.start();
                                                    setState(() {
                                                      isStated = !isStated;
                                                    });
                                                  },
                                                  child: const Text(
                                                    "GO",
                                                    style: TextStyle(
                                                        fontSize: 30,
                                                        color: Colors.white),
                                                  )),
                                            ),
                                          ),
                                        ],
                                      )
                              ],
                            ),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                Neumorphic(
                                  style: NeumorphicStyle(
                                    shape: NeumorphicShape.concave,
                                    boxShape: NeumorphicBoxShape.roundRect(
                                        BorderRadius.circular(8)),
                                    depth: 4,
                                    lightSource: LightSource.topLeft,
                                    color: const Color(0xffffbd35),
                                  ),
                                  child: Container(
                                      //margin: const EdgeInsets.only(bottom: 10),

                                      width: 70,
                                      margin: const EdgeInsets.all(5),

                                      // margin: EdgeInsets.fromLTRB(10, 10, 10, 10),
                                      //color: const Color(0xffffbd35),
                                      //color: Colors.red,
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        children: [
                                          const Text("Upload ",
                                              style: TextStyle(
                                                  color: Colors.black)),
                                          Text(" $upload mbps",
                                              style: TextStyle(
                                                  color: Colors.black)),
                                        ],
                                      )),
                                ),
                                Neumorphic(
                                  style: NeumorphicStyle(
                                    shape: NeumorphicShape.concave,
                                    boxShape: NeumorphicBoxShape.roundRect(
                                        BorderRadius.circular(8)),
                                    depth: 4,
                                    lightSource: LightSource.topLeft,
                                    color: const Color(0xffffbd35),
                                  ),
                                  child: Container(
                                      width: 70,
                                      margin: const EdgeInsets.all(5),
                                      //  margin: EdgeInsets.fromLTRB(10, 10, 10, 10),
                                      // height: 20,

                                      // height: 20,

                                      //  margin: EdgeInsets.fromLTRB(left, top, right, bottom),
                                      color: const Color(0xffffbd35),
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceEvenly,
                                        children: [
                                          const Text(
                                            " Download",
                                            style:
                                                TextStyle(color: Colors.black),
                                          ),
                                          Text(" ${download} mbps",
                                              style: TextStyle(
                                                  color: Colors.black)),
                                        ],
                                      )),
                                ),
                              ],
                            )
                          ],
                        ),
                      ),
                      Container(
                        color: const Color(0xffffbd35),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            const Text(
                              "Server",
                              style: TextStyle(
                                //fontSize: 30,
                                color: Colors.black,
                                fontStyle: FontStyle.italic,
                              ),
                            ),
                            Text(" ${jitter}",
                                style: TextStyle(color: Colors.black)),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Container(
                height: 50,
                color: Colors.blue,
                child: Dialogue()
              )
            ],
          ),
        ),
      ),
    );
  }

  @override
  onCriticalFailure(criticalFailure) {
    // TODO: implement onCriticalFailure
    throw UnimplementedError();
  }

  @override
  onDownloadUpdate(downlodData) {
    if (downlodData is Map) {
      download = downlodData["download"];
      //{download: 3.4561273631840796, progress: 0.014066666666666667}
    }
    setState(() {});
    print(downlodData.runtimeType);
    // TODO: implement onDownloadUpdate
    //throw UnimplementedError();
  }

  @override
  onEnd() {
    this.isStated = !isStated;
    setState(() {});
    // TODO: implement onEnd
    //throw UnimplementedError();
  }

  @override
  onIPInfoUpdate(ipInfo) {
    // TODO: implement onIPInfoUpdate
    //throw UnimplementedError();
  }

  @override
  onPingJitterUpdate(pingJitterUpdate) {
    // TODO: implement onPingJitterUpdate
    //throw UnimplementedError();
  }

  @override
  onTestIDReceived(testIdReceived) {
    if (testIdReceived is Map) {
      download = testIdReceived["upload"];
      //{download: 3.4561273631840796, progress: 0.014066666666666667}
    }
  }

  @override
  onUploadUpdate(uploadData) {
    print('This is uploads ${uploadData}');
    if (uploadData is Map) {
      upload = uploadData["upload"];
      //{download: 3.4561273631840796, progress: 0.014066666666666667}
    }
    setState(() {});
    // TODO: implement onUploadUpdate
    //throw UnimplementedError();
  }
}

class Gauge extends StatelessWidget {
  const Gauge({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Neumorphic(
      style: NeumorphicStyle(
        shape: NeumorphicShape.concave,
        boxShape: NeumorphicBoxShape.roundRect(BorderRadius.circular(12)),
        depth: 8,
        lightSource: LightSource.topLeft,
        color: const Color(0xffffbd35),
      ),
      child: Container(
        margin: const EdgeInsets.all(5),
        //margin: EdgeInsets.fromLTRB(0, 13, 0, 0),
        height: 100,
        width: 100,
        color: const Color(0xffffbd35),
        child: SfRadialGauge(
            title: const GaugeTitle(
                text: 'Konnect SpeedTest',
                textStyle:
                    TextStyle(fontSize: 10.0, fontWeight: FontWeight.bold)),
            axes: <RadialAxis>[
              RadialAxis(minimum: 0, maximum: 10, ranges: <GaugeRange>[
                GaugeRange(
                    startValue: 0,
                    endValue: 3,
                    color: Colors.red,
                    startWidth: 10,
                    endWidth: 10),
                GaugeRange(
                    startValue: 3,
                    endValue: 6,
                    color: Colors.orange,
                    startWidth: 10,
                    endWidth: 10),
                GaugeRange(
                    startValue: 6,
                    endValue: 10,
                    color: Colors.green,
                    startWidth: 10,
                    endWidth: 10)
              ], pointers: <GaugePointer>[
                const NeedlePointer(
                  value: 9,
                  //  tailStyle: TailStyle(color: Colors.black),
                )
              ], annotations: <GaugeAnnotation>[
                GaugeAnnotation(
                    widget: Container(
                        child: const Text('9 mbs',
                            style: TextStyle(
                                fontSize: 10, fontWeight: FontWeight.bold))),
                    angle: 90,
                    positionFactor: 0.9)
              ])
            ]),
      ),
    );
  }
}
