import 'dart:io';

import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:social_media_recorder/audio_encoder_type.dart';
import 'package:social_media_recorder/screen/social_media_recorder.dart';

class MixView extends StatefulWidget {
  const MixView({super.key});

  @override
  State<MixView> createState() => _MixViewState();
}

class _MixViewState extends State<MixView> {
  List<XFile> files = [];
  final player = AudioPlayer();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          Wrap(
            direction: Axis.horizontal,
            children: List.generate(
                files.length,
                (index) => Image.file(
                      File(files[index].path),
                      height: 100,
                      width: 100,
                      fit: BoxFit.scaleDown,
                    )),
          ),
          ElevatedButton(
              onPressed: () async {
                var myfiles =
                    await ImagePicker.platform.getMultiImageWithOptions();
                if (myfiles.isNotEmpty) {
                  files.addAll(myfiles);
                  setState(() {});
                }
              },
              child: Text("Show")),
          ElevatedButton(onPressed: (){
            showDialog(context: context, builder: (context) => AlertDialog(
              title: Text("HELLO"),
              actions: [
                OutlinedButton(onPressed: (){}, child: Text("go")),
                FilledButton(onPressed: (){}, child: Text("Click")),
              ],
            ),);
          }, child: Text("Click")),
      SocialMediaRecorder(

        sendRequestFunction: (soundFile, time) => player.play(DeviceFileSource(soundFile.path)),


        encode: AudioEncoderType.AAC,


      )
        ],
      ),
    );
  }
}
