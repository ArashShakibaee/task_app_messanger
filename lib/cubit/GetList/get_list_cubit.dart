// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:diaco/Model/post_message.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:diaco/Model/custom_error.dart';
import 'package:diaco/Model/get_list.dart';
import 'package:diaco/repositories/diaco_repositories.dart';

part 'get_list_state.dart';

class GetListCubit extends Cubit<GetListState> {
  final DiacoRepositories diacoRepositories;
  GetListCubit({
    required this.diacoRepositories,
  }) : super(GetListState.initial());

  Future<void> getListOfMessages() async {
    emit(state.copyWith(getListStatus: GetListStatus.loading));
    try {
      final GetList getList = await diacoRepositories.fetchList();
      emit(state.copyWith(
          getList: getList, getListStatus: GetListStatus.loaded));
    } on CustomError catch (e) {
      emit(
        state.copyWith(getListStatus: GetListStatus.error, error: e),
      );
    }
  }

  Future<void> setListOfMessages(String username, String text) async {
    emit(state.copyWith(getListStatus: GetListStatus.loading));
    try {
      final GetList getList = await diacoRepositories
          .fetchPost(PostMessage(username: username, text: text));
      emit(state.copyWith(
          getList: getList, getListStatus: GetListStatus.loaded));
    } on CustomError catch (e) {
      emit(
        state.copyWith(getListStatus: GetListStatus.error, error: e),
      );
    }
  }
}
