import 'package:get/get.dart';
import 'package:meetx/constants/image.dart';

class ChatController extends GetxController {
  var imageListForChat = <ChatImageList>[].obs;
  var messageList = <ChatImageList>[].obs;

  ChatController() {
    imageListForChat.addAll([
      ChatImageList(
          image: ImageConst.girl3,
          name: "Emelie",
          subtitle: "Sticker 😍",
          time: "23 min"),
      ChatImageList(
          image: ImageConst.girl4,
          name: "Abigail",
          subtitle: "Typing..",
          time: "27 min"),
      ChatImageList(
          image: ImageConst.gril2without,
          name: "Elizabeth",
          subtitle: "Ok, see you then.",
          time: "33 min"),
    ]);

    messageList.addAll([
      ChatImageList(
          message: "Salut 👋", time: "2:55 PM", isEnable: true),
      ChatImageList(
          message: "Ce faci?", time: "2:56 PM", isEnable: false),
    ]);
  }
}

class ChatImageList {
  String? image;
  String? name;
  String? subtitle;
  String? time;
  String? message;
  bool? isEnable;

  ChatImageList(
      {this.image,
      this.name,
      this.subtitle,
      this.time,
      this.message,
      this.isEnable});
}
