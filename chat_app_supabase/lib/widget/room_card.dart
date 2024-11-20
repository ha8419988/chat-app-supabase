import 'package:chat_app_supabase/chat/room_screen.dart';
import 'package:chat_app_supabase/data/models/chat/room/room_data.dart';
import 'package:flutter/material.dart';

import '../config/constants/divider.dart';

class RoomCard extends StatelessWidget {
  const RoomCard({
    super.key,
    required this.room,
  });

  final RoomData? room;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        if (room == null) {
          return;
        }

        Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => RoomScreen(
                roomData: room!,
              ),
            ));
      },
      child: ListTile(
        leading: ClipRRect(
          borderRadius: BorderRadius.circular(kCircle),
          child: Image.network(
            room?.receiverImgUrl ??
                'https://img.freepik.com/free-photo/close-up-portrait-smiling-young-woman-looking-camera_171337-17994.jpg',
            fit: BoxFit.cover,
            width: kCircle,
            height: kCircle,
          ),
        ),
        title: Text(room?.receiverName ?? "user name"),
        subtitle: Text(room?.lastMessage ?? "subtitle"),
        trailing: Column(
          children: [
            Text(room?.sendTime?.split(" ")[1].split('.')[0].substring(0, 5) ??
                "19:30"),
            Container(
              width: kDefault / 2,
              height: kDefault / 2,
              decoration: const BoxDecoration(
                  shape: BoxShape.circle, color: Colors.blueAccent),
            )
          ],
        ),
      ),
    );
  }
}
