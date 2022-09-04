// ignore_for_file: public_member_api_docs, sort_constructors_first
class EditMessage {
  final int id;
  final String text;
  EditMessage({
    required this.id,
    required this.text,
  });

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['id'] = id;
    data['text'] = text;
    return data;
  }
}
