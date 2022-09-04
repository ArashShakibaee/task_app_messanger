// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'get_list_cubit.dart';

class GetListState extends Equatable {
  final GetListStatus getListStatus;
  final GetList getList;
  final CustomError error;

  const GetListState({
    required this.getListStatus,
    required this.getList,
    required this.error,
  });

  factory GetListState.initial() {
    return GetListState(
      getListStatus: GetListStatus.initial,
      getList: GetList.initial(),
      error: const CustomError(errorMsg: ""),
    );
  }

  GetListState copyWith({
    GetListStatus? getListStatus,
    GetList? getList,
    CustomError? error,
  }) {
    return GetListState(
      getListStatus: getListStatus ?? this.getListStatus,
      getList: getList ?? this.getList,
      error: error ?? this.error,
    );
  }

  @override
  String toString() =>
      'GetListState(getListStatus: $getListStatus, getList: $getList, error: $error)';

  @override
  List<Object?> get props => [getListStatus, getList, error];
}
