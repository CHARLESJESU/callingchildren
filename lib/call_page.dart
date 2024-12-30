import 'package:flutter/material.dart';
import 'package:flutterappkideld/screenshotbutton.dart';
import 'package:screenshot/screenshot.dart';
import 'package:zego_uikit_prebuilt_call/zego_uikit_prebuilt_call.dart';
import 'package:model_viewer_plus/model_viewer_plus.dart';

class CallPage extends StatefulWidget {
  const CallPage({
    Key? key,
    required this.callID,
    required this.userID,
    required this.username,
    required this.assetPath,
  }) : super(key: key);

  final String callID;
  final String userID;
  final String username;
  final String assetPath;

  @override
  _CallPageState createState() => _CallPageState();
}

class _CallPageState extends State<CallPage> {

  String _backgroundImage = "assets/images/back1.png";

  void _selectBackgroundImage(String imagePath) {
    setState(() {
      _backgroundImage = imagePath;

    });
  }

  @override
  Widget build(BuildContext context) {
    return Screenshot(
      controller: ActionButtons.screenshotController,

      child: Scaffold(


        body: Stack(
          children: [
            // ZegoUIKitPrebuiltCall widget (background layer)
            ZegoUIKitPrebuiltCall(
              appID: 731148258,
              appSign: "603fc079278751f683b4bf90e207722bde78d36fd4dd7b59503eb92fcd976d48",
              userID: widget.userID,
              userName: widget.username,
              callID: widget.callID,
              config: ZegoUIKitPrebuiltCallConfig.oneOnOneVoiceCall(),
            ),

            // Background image
            Positioned.fill(
              child: Image.asset(
                _backgroundImage,
                fit: BoxFit.cover,
              ),
            ),


            // ModelViewer widget
            Positioned.fill(
              child: ModelViewer(
                src: widget.assetPath,
                autoPlay: true,
                cameraControls: false,
                autoRotate: false,
                disableZoom: true,
                scale: '2 2 2',
                animationName: 'default',
                backgroundColor: Colors.transparent,
              ),
            ),

            // Warning Icon


            // Vertical buttons on the right side
            Positioned(
              top: 20,
              right: 20,
              child: Column(
                children: [


                  const SizedBox(height: 20),
                  GestureDetector(
                    onTap: () {
                      ActionButtons.takeScreenshot(context); // Add your screenshot logic here
                    },
                    child: Container(
                      padding: const EdgeInsets.all(10),
                      decoration: const BoxDecoration(
                        color: Colors.white,
                        shape: BoxShape.circle,
                      ),
                      child: const Icon(Icons.camera_alt, size: 30, color: Colors.blue),
                    ),
                  ),

                ],
              ),
            ),

            // Background image selection


            // End Call Button
            Positioned(
              bottom: 30,
              right: MediaQuery.of(context).size.width / 2 - 40, // Center the button horizontally
              child: GestureDetector(
                onTap: () {
                  ZegoUIKit().leaveRoom(); // End the call
                  Navigator.of(context).pop(); // Navigate back to the previous screen
                },
                child: Container(
                  padding: const EdgeInsets.all(15),
                  decoration: const BoxDecoration(
                    color: Colors.blue, // Button background color
                    shape: BoxShape.circle,
                  ),
                  child: const Icon(Icons.call_end, size: 40, color: Colors.white),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}