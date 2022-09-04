// ignore_for_file: public_member_api_docs, sort_constructors_first
class PostMessage {
  final String username;
  final String text;
  PostMessage({
    required this.username,
    required this.text,
  });

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['username'] = username;
    data['text'] = text;
    return data;
  }
}
