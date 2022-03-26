class Note {
  int? id;
  String? note;
  Note({this.id, required this.note});
  Note.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    note = json['note'];
  }
  Map<String, dynamic> toMap() {
    return {'id': id, 'note': note};
  }
}
