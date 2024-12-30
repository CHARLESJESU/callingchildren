import 'package:flutter/material.dart';
import 'package:zego_uikit_prebuilt_call/zego_uikit_prebuilt_call.dart';


class Elderpeoplecallpage extends StatelessWidget {
  const Elderpeoplecallpage({Key? key, required this.callID, required this.userID, required this.username}) : super(key: key);
  final String callID;
  final String userID;
  final String username;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:
      // ZegoUIKitPrebuiltCall widget (background layer)

      ZegoUIKitPrebuiltCall(


        appID: 731148258, // Fill in your appID
        appSign: "603fc079278751f683b4bf90e207722bde78d36fd4dd7b59503eb92fcd976d48",  // Fill in your appSign.
        userID: userID,
        userName: username,
        callID: callID,
        config: ZegoUIKitPrebuiltCallConfig.oneOnOneVoiceCall(),
      ),


    );
  }
}