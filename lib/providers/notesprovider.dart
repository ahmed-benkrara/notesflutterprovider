import 'package:flutter/material.dart';
import 'package:notesprovider/models/note.dart';

class NotesProvider extends ChangeNotifier{
  final List<NoteModel> _notes = [];
  List<NoteModel> _filtered = [];

  List<NoteModel> get notes => _filtered.isNotEmpty ? _filtered : _notes;

  void addNote(NoteModel note){
    _notes.add(note);
    notifyListeners();
  }

  void editNote(NoteModel note){
    _notes.firstWhere((element) => element.id == note.id).title = note.title;
    _notes.firstWhere((element) => element.id == note.id).content = note.content;
    _notes.firstWhere((element) => element.id == note.id).date = DateTime.now();
    notifyListeners();
  }

  void deleteNote(int id){
    _notes.removeWhere((element) => element.id == id);
    notifyListeners();
  }

  void filterNotes(String title){
    if(title.isEmpty){
      _filtered = _notes;
    }else{
      _filtered = _notes.where((element) => element.title.toLowerCase().contains(title.toLowerCase())).toList();
    }
    notifyListeners();
  }
}