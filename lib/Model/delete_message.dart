// ignore_for_file: public_member_api_docs, sort_constructors_first
class DeleteMessage {
  final int id;
  DeleteMessage({
    required this.id,
  });

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['id'] = id;
    return data;
  }
}
