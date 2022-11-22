import 'package:flutter/cupertino.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';

class Dialogue extends StatelessWidget {
  const Dialogue({super.key});

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () => showDialog(
          context: context,
          //  barrierColor: Colors.transparent,
          builder: (BuildContext context) {
            return CupertinoAlertDialog(
              title: Text("Ways to Boost Your Wi-Fi Speed"),
              content: Container(
               
               // height: 200,
                width: double.infinity,
               // decoration: BoxDecoration(color: Colors.white),
                // ignore: prefer_const_constructors
                child:Column(
                  children: [
                   Neumorphic(
                     padding: EdgeInsets.fromLTRB(10, 10, 10, 10),
                        margin: EdgeInsets.all(10),
                  
                       style: NeumorphicStyle(
                          shape: NeumorphicShape.concave,
                          boxShape: NeumorphicBoxShape.roundRect(
                              BorderRadius.circular(0)),
                          depth: 8,
                          lightSource: LightSource.topLeft,
                          //color: const Color(0xffffbd35),
                        ),
                     child: Container(
                           
                           //  color: const Color(0xffffbd35),
                            child: const Text('Check your distance from the router')),
                   ),
                      Neumorphic(
                         padding: EdgeInsets.fromLTRB(10, 10, 10, 10),
                        margin: EdgeInsets.all(10),
                          style: NeumorphicStyle(
                          shape: NeumorphicShape.concave,
                          boxShape: NeumorphicBoxShape.roundRect(
                              BorderRadius.circular(0)),
                          depth: 8,
                          lightSource: LightSource.topLeft,
                          //color: const Color(0xffffbd35),
                        ),
                        child: Container(
                           
                              //color: const Color(0xffffbd35),
                            child: const Text(
                                'Forget then reconnect to the network before retesting')),
                      ),
                      Neumorphic(
                         padding: EdgeInsets.fromLTRB(10, 10, 10, 10),
                        margin: EdgeInsets.all(10),
                          style: NeumorphicStyle(
                          shape: NeumorphicShape.concave,
                          boxShape: NeumorphicBoxShape.roundRect(
                              BorderRadius.circular(0)),
                          depth: 8,
                          lightSource: LightSource.topLeft,
                          //color: const Color(0xffffbd35),
                        ),
                        child: Container(
                       
                             //color: const Color(0xffffbd35),
                            child: const Text(
                                'Reboot your device incase of a long uptime')),
                      ),
                      Neumorphic(
                         padding: EdgeInsets.fromLTRB(10, 10, 10, 10),
                        margin: EdgeInsets.all(10),
                          style: NeumorphicStyle(
                          shape: NeumorphicShape.concave,
                          boxShape: NeumorphicBoxShape.roundRect(
                              BorderRadius.circular(0)),
                          depth: 8,
                          lightSource: LightSource.topLeft,
                          //color: const Color(0xffffbd35),
                        ),
                        child: Container(
                     
                           // color: const Color(0xffffbd35),
                            child:
                                const Text('Restart the App before retesting')),
                      ),
                      Neumorphic(
                         padding: EdgeInsets.fromLTRB(10, 10, 10, 10),
                        margin: EdgeInsets.all(10),
                          style: NeumorphicStyle(
                          shape: NeumorphicShape.concave,
                          boxShape: NeumorphicBoxShape.roundRect(
                              BorderRadius.circular(0)),
                          depth: 8,
                          lightSource: LightSource.topLeft,
                         // color: const Color(0xffffbd35),
                        ),
                        child: Container(
                          
                            // color: const Color(0xffffbd35),
                            child: const Text(
                                'Incase all the above fails share the issue with our support team')),
                      ),
              
                ],)
              ),
            );
  
          }),
      child: const Text('Show Dialog'),
    );
  }
}
