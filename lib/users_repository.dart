  import 'package:flutter/material.dart';
  import 'package:flutter_riverpod/flutter_riverpod.dart';
  import 'package:riverpod_state_management_ex/users.dart';


  class UsersRepository extends ChangeNotifier{

    final List<Users> users =[
      Users("user1", const AssetImage("assets/user1.jpg"), Image.asset("assets/user1.jpg")),
      Users("user2", const AssetImage("assets/user2.jpg"), Image.asset("assets/user2.jpg")),
      Users("user3", const AssetImage("assets/user3.jpg"), Image.asset("assets/user3.jpg")),
      Users("user4", const AssetImage("assets/user4.jpg"), Image.asset("assets/user4.jpg")),
    ];

  }

  final usersProvider = ChangeNotifierProvider((any){

    return UsersRepository();
  });

