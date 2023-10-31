class NoteModel{
  int id;
  String title;
  String content;
  DateTime? date;

  NoteModel({
    required this.id,
    required this.title,
    required this.content,
    this.date
  });
}