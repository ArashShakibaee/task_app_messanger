class GetList {
  GetList({
    required this.status,
    required this.data,
  });
  late final bool status;
  late final List<Data> data;

  factory GetList.fromJson(Map<String, dynamic> json) {
    return GetList(
        status: json['status'],
        data: List.from(json['data']).map((e) => Data.fromJson(e)).toList());
  }

  factory GetList.initial() {
    return GetList(
      status: true,
      data: [Data.initial()],
    );
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['status'] = status;
    _data['data'] = data.map((e) => e.toJson()).toList();
    return _data;
  }
}

class Data {
  Data({
    required this.id,
    required this.username,
    required this.text,
    required this.date,
  });
  late final int id;
  late final String username;
  late final String text;
  late final String date;

  factory Data.fromJson(Map<String, dynamic> json) {
    return Data(
        id: json['id'],
        username: json['username'],
        text: json['text'],
        date: json['date']);
  }

  factory Data.initial() {
    return Data(
      id: -1,
      username: "arash",
      text: "hello",
      date: "01/05/18",
    );
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['id'] = id;
    _data['username'] = username;
    _data['text'] = text;
    _data['date'] = date;
    return _data;
  }
}
