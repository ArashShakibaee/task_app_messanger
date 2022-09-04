import 'package:diaco/Model/get_list.dart';
import 'package:diaco/Utils/app_style.dart';
import 'package:diaco/cubit/GetList/get_list_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';

class BaseContainer extends StatefulWidget {
  final Data user;
  const BaseContainer({super.key, required this.user});

  @override
  State<BaseContainer> createState() => _BaseContainerState();
}

class _BaseContainerState extends State<BaseContainer> {
  final TextEditingController textController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    var date =
        DateTime.fromMillisecondsSinceEpoch(int.parse(widget.user.date) * 1000);
    final dateTime = DateFormat.yMMMd().format(date);
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 8),
      child: Container(
        //width: MediaQuery.of(context).size.width*0.45,
        decoration: BoxDecoration(
            color: Colors.white, borderRadius: BorderRadius.circular(30)),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 16),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const CircleAvatar(
                backgroundColor: Colors.grey,
                radius: 4,
              ),
              const SizedBox(height: 6),
              Text(
                widget.user.username,
                style: AppStyle.normalTextStyle,
              ),
              const SizedBox(height: 5),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    dateTime,
                    style: AppStyle.smallTextStyle.copyWith(color: Colors.grey),
                  ),
                  Text(
                    "id:${widget.user.id}",
                    style: AppStyle.smallTextStyle.copyWith(color: Colors.grey),
                  ),
                ],
              ),
              const SizedBox(height: 15),
              Expanded(
                  child: Text(widget.user.text,
                      style: AppStyle.smallTextStyle,
                      overflow: TextOverflow.fade)),
              Expanded(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    IconButton(
                        splashRadius: 20,
                        splashColor: Colors.grey,
                        onPressed: () {
                          context
                              .read<GetListCubit>()
                              .deleteMessage(widget.user.id);
                        },
                        icon: const Icon(
                          Icons.delete_rounded,
                          color: Colors.red,
                          size: 20,
                        )),
                    IconButton(
                        splashRadius: 10,
                        splashColor: Colors.grey,
                        onPressed: () {
                          showDialog(
                              context: context,
                              builder: (context) {
                                textController.text = widget.user.text;
                                return StatefulBuilder(
                                    builder: ((context, setState) =>
                                        AlertDialog(
                                          title: const Text("Edit Message !"),
                                          content: TextField(
                                            autofocus: true,
                                            controller: textController,
                                            decoration: InputDecoration(
                                                hintText: "Change Message",
                                                errorText: textController
                                                        .text.isEmpty
                                                    ? "this field can not be empty"
                                                    : null),
                                          ),
                                          actions: [
                                            TextButton(
                                                onPressed: () =>
                                                    Navigator.pop(context),
                                                child: const Text("Cancel")),
                                            TextButton(
                                                onPressed: () {
                                                  setState(() {
                                                    if (textController
                                                        .text.isNotEmpty) {
                                                      context
                                                          .read<GetListCubit>()
                                                          .updateMessage(
                                                              widget.user.id,
                                                              textController
                                                                  .text);

                                                      Navigator.pop(context);
                                                    }
                                                  });
                                                },
                                                child: const Text("Edit")),
                                          ],
                                        )));
                              });
                        },
                        icon: const Icon(
                          Icons.edit_rounded,
                          color: Colors.green,
                          size: 20,
                        )),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
