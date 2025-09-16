import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:meetx/constants/color.dart';
import 'package:meetx/constants/textstyle.dart';
import 'package:meetx/screens/bottomScreen/chat/controller/chat_controller.dart';
import 'package:meetx/screens/bottomScreen/chat/controller/chat_controller.dart';

class ChatDetailScreen extends StatelessWidget {
  final String userName;
  final String userImage; // 🔥 poza userului
  final ChatController chatController = Get.put(ChatController());

  ChatDetailScreen({
    super.key,
    required this.userName,
    required this.userImage,
  });

  final TextEditingController messageController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorConst.white,
      appBar: AppBar(
        backgroundColor: ColorConst.white,
        elevation: 0,
        title: Row(
          children: [
            CircleAvatar(
              backgroundImage: AssetImage(userImage),
            ),
            const SizedBox(width: 10),
            Text(
              userName,
              style: TextStyleClass.interBold(
                size: 18.0,
                color: ColorConst.appColorFF,
              ),
            ),
          ],
        ),
      ),
      body: Column(
        children: [
          // Lista de mesaje
          Expanded(
            child: Obx(
              () => ListView.builder(
                padding: const EdgeInsets.all(12),
                itemCount: chatController.messageList.length,
                itemBuilder: (context, index) {
                  final msg = chatController.messageList[index];
                  final isMe = msg.isEnable == true;

                  return Row(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    mainAxisAlignment:
                        isMe ? MainAxisAlignment.end : MainAxisAlignment.start,
                    children: [
                      // Avatar doar pentru mesajele userului
                      if (!isMe) ...[
                        CircleAvatar(
                          radius: 16,
                          backgroundImage: AssetImage(userImage),
                        ),
                        const SizedBox(width: 8),
                      ],

                      // Mesajul
                      Flexible(
                        child: Container(
                          margin: const EdgeInsets.symmetric(vertical: 4),
                          padding: const EdgeInsets.all(12),
                          decoration: BoxDecoration(
                            color: isMe
                                ? ColorConst.appColorFF.withOpacity(0.9)
                                : ColorConst.greyF4,
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: Text(
                            msg.message ?? "",
                            style: TextStyleClass.interRegular(
                              size: 14.0,
                              color:
                                  isMe ? ColorConst.white : ColorConst.black,
                            ),
                          ),
                        ),
                      ),
                    ],
                  );
                },
              ),
            ),
          ),

          // Input bar
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
            decoration: BoxDecoration(
              color: ColorConst.greyF4,
              borderRadius: BorderRadius.circular(30),
            ),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: messageController,
                    decoration: const InputDecoration(
                      hintText: "Type a message...",
                      border: InputBorder.none,
                    ),
                  ),
                ),
                IconButton(
                  icon: const Icon(Icons.send, color: Colors.pink),
                  onPressed: () {
                    if (messageController.text.trim().isNotEmpty) {
                      chatController.messageList.add(
                        ChatImageList(
                          message: messageController.text.trim(),
                          isEnable: true,
                          time: "Now",
                        ),
                      );
                      messageController.clear();
                    }
                  },
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
