import 'package:diaco/Model/get_list.dart';
import 'package:diaco/Utils/app_style.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class BaseContainer extends StatelessWidget {
  final Data user;
  const BaseContainer({super.key, required this.user});

  @override
  Widget build(BuildContext context) {
    var date = DateTime.fromMillisecondsSinceEpoch(int.parse(user.date) * 1000);
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
                user.username,
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
                    "id:${user.id}",
                    style: AppStyle.smallTextStyle.copyWith(color: Colors.grey),
                  ),
                ],
              ),
              const SizedBox(height: 15),
              Expanded(
                  child: Text(user.text,
                      style: AppStyle.smallTextStyle,
                      overflow: TextOverflow.fade)),
            ],
          ),
        ),
      ),
    );
  }
}
