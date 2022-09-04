import 'package:diaco/Component/base_container.dart';
import 'package:diaco/Model/get_list.dart';
import 'package:diaco/Utils/app_style.dart';
import 'package:diaco/Utils/pref_manager.dart';
import 'package:diaco/cubit/GetList/get_list_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';

class MessageScreen extends StatefulWidget {
  static const String routeName = "message";
  const MessageScreen({super.key});

  @override
  State<MessageScreen> createState() => _MessageScreenState();
}

class _MessageScreenState extends State<MessageScreen> {
  String? username;
  String? email;
  final textController = TextEditingController();

  Future<void> getLocalData() async {
    username = await PrefManager.getUsername();
    email = await PrefManager.getEmailAddress();
    setState(() {});
  }

  Future<void> removeLocalData() async {
    final SharedPreferences preferences = await SharedPreferences.getInstance();
    preferences.remove('emailAddress');
    preferences.remove('username');
  }

  void reloadData() {
    setState(() {
      context.read<GetListCubit>().getListOfMessages();
    });
  }

  @override
  void initState() {
    reloadData();
    getLocalData();
    super.initState();
  }

  @override
  void dispose() {
    removeLocalData();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade300,
      appBar: AppBar(
          elevation: 1,
          backgroundColor: Colors.grey.shade300,
          title: const Text(
            "Message Screen",
          )),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
              child: Padding(
            padding: const EdgeInsets.all(4.0),
            child: ElevatedButton(
                onPressed: () {
                  context.read<GetListCubit>().getListOfMessages();
                },
                child: const Text("Refresh")),
          )),
          Expanded(
            child: Container(
              color: Colors.grey.shade300,
              padding: const EdgeInsets.all(16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("email Address : $email"),
                  Text("name: $username")
                ],
              ),
            ),
          ),
          Expanded(flex: 12, child: _showList()),
          Expanded(
            child: TextField(
              controller: textController,
              decoration: InputDecoration(
                border: InputBorder.none,
                filled: true,
                fillColor: Colors.grey.shade300,
                hintText: "Send Message",
                suffixIcon: IconButton(
                  onPressed: () {
                    if (username != null && textController.text.isNotEmpty) {
                      context
                          .read<GetListCubit>()
                          .setListOfMessages(username!, textController.text);
                      textController.clear();
                      setState(() {});
                    }
                  },
                  icon: const Icon(Icons.send_rounded),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }

  Widget _showList() {
    return BlocConsumer<GetListCubit, GetListState>(
      listener: (context, state) {
        if (state.getListStatus == GetListStatus.error) {
          context.read<GetListCubit>().getListOfMessages();
        }
      },
      builder: (context, state) {
        if (state.getListStatus == GetListStatus.initial) {
          return const Center(
            child: Text(
              "Messages are empty",
              style: TextStyle(fontSize: 20),
            ),
          );
        }
        if (state.getListStatus == GetListStatus.error) {
          return const Center(
            child: Text(
              "We have error",
              style: TextStyle(fontSize: 20),
            ),
          );
        }
        if (state.getListStatus == GetListStatus.loading) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
        return GridView.builder(
            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2, mainAxisExtent: 170),
            itemCount: state.getList.data.length,
            itemBuilder: (context, index) {
              final user = state.getList.data[index];
              return BaseContainer(user: user);
            });
      },
    );
  }
}
