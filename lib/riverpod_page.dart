import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_state_management_ex/users.dart';
import 'package:riverpod_state_management_ex/users_repository.dart';


class RiverpodPage extends ConsumerStatefulWidget {
  const RiverpodPage({Key? key}) : super(key: key);

  @override
  _RiverpodPageState createState() => _RiverpodPageState();
}

class _RiverpodPageState extends ConsumerState<RiverpodPage> {

  final ScrollController _controller = ScrollController();

  @override
  Widget build(BuildContext context) {

    final userRepository =ref.watch(usersProvider);


    return Scaffold(
      appBar: AppBar(
        title: const Text("Riverpod Page"),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            ListView.builder(
              controller: _controller,
              shrinkWrap: true,
              itemCount: userRepository.users.length,
              itemBuilder: (BuildContext context, int index) {
                return ListTile(title: UserFeed(userRepository.users[index]));
              },
            )
          ],
        ),
      ) ,
    );
  }
}
class UserFeed extends ConsumerWidget {
  final Users users;

  const UserFeed(this.users, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Center(
      child: Card(
        child: Column(
          children: [
            Row(
              children: [
                CircleAvatar(
                  radius: 20,
                  backgroundImage: users.userPhoto,
                ),
                const Padding(
                    padding:
                    EdgeInsets.only(right: 4.0, left: 4.0)),
                Text(
                    users.userName
                ),
              ],
            ),
            SizedBox(
                width: 200,
                height: 200,
                child: users.userSharePhoto
            )
          ],
        ),
      ),

    );
  }
}