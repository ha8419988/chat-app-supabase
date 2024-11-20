import 'package:chat_app_supabase/widget/home_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../provider/chat/chat_provider.dart';
import 'user_create_chat_room.dart';

class CreateRoom extends StatelessWidget {
  const CreateRoom({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        /**
         * chat title page
         */
        const HomeAppBar(),
        /**
         * content chat
         */
        // const Text('data'),
        Expanded(
          flex: 7,
          child: Consumer<ChatProvider>(
            builder: (context, value, child) {
              return StreamBuilder(
                stream: value.userStream,
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.active) {
                    return ListView.builder(
                      itemCount: snapshot.data?.length ?? 0,
                      itemBuilder: (context, index) {
                        return UserCreateChatRoomChat(
                          navProvider: Provider.of(context, listen: false),
                          chatProvider: Provider.of(context, listen: false),
                          userData: snapshot.data?[index],
                        );
                      },
                    );
                  }
                  return const SizedBox.shrink();
                },
              );
            },
          ),
        )
      ],
    );
  }
}
