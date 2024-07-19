import 'dart:ui';

import 'package:flutter_tts/flutter_tts.dart';
import 'package:just_audio/just_audio.dart';

class AppFunctions {
  String getDescription(String name) {
    switch (name) {
      case "Eye":
        return "Like window to see the world! They help you see colors, shapes, and all your friends.\nThe eye is an organ that reacts to light and allows vision.";
      case "Lips":
        return "Help you to talk and smile. They can taste sweet and sour things too.\nThe lips are a visible body part at the mouth.";
      case "Ankle":
        return "It helps you jump, hop, and run around!\nThe ankle is the joint between the foot and the leg.";
      case "Arm":
        return "Like long branches that help you hug, wave, and hold toys. They bend at the elbow like magic!\nArms help you lift and carry things.";
      case "Back":
        return "The big, strong wall at the back of your body. It helps you stand tall and straight, and holds everything inside safe.";
      case "Belly":
        return "Like a big balloon that holds your food until your body uses it for energy!\nYour belly helps you digest food.";
      case "Cheek":
        return "The soft, squishy parts on your face, perfect for smiling and cuddling with loved ones.\nCheeks help shape your face.";
      case "Chest":
        return "The front of your body, where your heart beats strong and keeps you going all day.\nYour chest helps you breathe.";
      case "Chin":
        return "The pointy bone below your lips, like a little shelf for your smile to rest on.\nYour chin is the bottom of your face.";
      case "Ear":
        return "Like two funnels on the sides of your head that help you hear music, voices, and laughter.";
      case "Elbow":
        return "The bendy joint in the middle of your arm, like a magic hinge that helps you reach and play.\nElbows help you bend your arms.";
      case "Foot":
        return "Like two strong platforms that help you walk, run, and jump! They have wiggly toes to grip the ground.";
      case "Fingers":
        return "Five little helpers at the end of your hands, perfect for grabbing, pointing, and tickling!\nFingers help you pick up and touch things.";
      case "Hair":
        return "Grows on your head and body like tiny grass, and can be straight, curly, or in between! You can style it in fun ways!";
      case "Hips":
        return "The bony part below your belly, that helps your legs move and hold your body up.";
      case "Knee":
        return "The bendy joint in the middle of your leg, that helps you walk, run, and kneel down.\nKnees help you bend your legs.";
      case "Leg":
        return "Two strong pillars that help you walk, run, jump, and dance! They bend at the knee and ankle.";
      case "Nail":
        return "The hard, white caps on your fingers and toes, like tiny shields that protect them.";
      case "Neck":
        return "Connects your head to your body and helps you move your head around to see and hear everything.";
      case "Nose":
        return "Sticks out from your face and helps you smell things and breathe.";
      case "Palm":
        return "The flat part of your hand, with lines that make your handprint unique! It helps you hold things.";
      case "Shoulder":
        return "Where your arm meets your body, like a special socket that helps you move your arm freely.\nShoulders help you lift and carry things.";
      case "Stomach":
        return "The part below your chest, where your food goes after you eat. It helps your body get the energy it needs.\nThe stomach helps digest food.";
      case "Teeth":
        return "Hard, white tools in your mouth that help you chew food and smile brightly!";
      case "Thigh":
        return "The thick part of your upper leg, like a strong pillar that helps you walk, run, and jump.";
      case "Thumb":
        return "The big, special finger on your hand, that helps you grip and hold things tightly and do cool pinches.";
      case "Toe":
        return "The five little wigglers on your foot, that help you balance and grip the ground when you walk and run.";
      case "Tongue":
        return "The fun, muscley friend in your mouth that helps you taste food, talk, and lick yummy treats!";
      case "Waist":
        return "The middle part of your body, between your chest and hips. It helps your body bend and move.";
      case "Wrist":
        return "The bendy joint between your hand and arm, like a hinge that helps you move your hand freely.";
      default:
        return "Sorry, we don't have information about that organ.";
    }
  }

  Color getCardColor(int index) {
    int red = (index * 25) % 256;
    int green = ((index * 45) + 100) % 256;
    int blue = ((index * 70) + 200) % 256;

    return Color.fromRGBO(red, green, blue, 1.0);
  }

  final AudioPlayer audioPlayer = AudioPlayer();
  final FlutterTts flutterTts = FlutterTts();

  Future<void> playSound(String soundAsset) async {
    await audioPlayer.setAsset(soundAsset);
    await audioPlayer.play();
  }

   Future<void> stopSound() async {
    await audioPlayer.stop();
  }

  Future<void> readName(String name) async {
    await flutterTts.setVolume(1.0);
    await flutterTts.setLanguage("EN-IN");
    await flutterTts.setPitch(1.0);
    await flutterTts.speak(name);
  }
}
