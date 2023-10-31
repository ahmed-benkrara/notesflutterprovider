import 'package:flutter/material.dart';
import 'package:notesprovider/models/note.dart';
import 'package:notesprovider/providers/notesprovider.dart';
import 'package:notesprovider/utils/colors.dart';
import 'package:provider/provider.dart';
import 'dart:math';


class UpdateView extends StatelessWidget {
  final int? id;
  UpdateView({
    super.key,
    this.id
  });

  final TextEditingController title = TextEditingController();
  final TextEditingController content = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final notes = context.watch<NotesProvider>().notes;
    if(id != null){
      NoteModel note = notes.firstWhere((element) => element.id == id);
      title.text = note.title;
      content.text = note.content;
    }

    return Scaffold(
      backgroundColor: primary,
      appBar: AppBar(
        backgroundColor: primary,
        foregroundColor: Colors.white,
        actions: [
          PopupMenuButton(
            icon: const Icon(Icons.more_vert_rounded, color: Colors.white,),
            color: secondary,
            padding: const EdgeInsets.symmetric(vertical: -2),
            itemBuilder: (context) => [
              PopupMenuItem(
                onTap: () {
                  Random  random = Random();
                  int randomInt = 1 + random.nextInt(1000 - 1 + 1);
                  if(id == null){
                    context.read<NotesProvider>().addNote(NoteModel(id: randomInt, title: title.text, content: content.text, date: DateTime.now()));
                  }else{
                    context.read<NotesProvider>().editNote(NoteModel(id: id ?? 0, title: title.text, content: content.text, date: DateTime.now()));
                  }
                },
                child: const SizedBox(
                  child: Text(
                    'Update',
                    style: TextStyle(
                      color: Colors.white
                    ),
                  ),
                )
              ),
              PopupMenuItem(
                onTap: () {
                },
                child: const SizedBox(
                  child: Text(
                    'Delete',
                    style: TextStyle(
                      color: Colors.white
                    ),
                  ),
                )
              ),
            ]
          )
        ],
      ),
      body: SafeArea(child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          children: [
            TextField(
              controller: title,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 25,
                fontWeight: FontWeight.w400
              ),
              decoration: const InputDecoration(
                filled: true,
                fillColor: Colors.black,
                contentPadding: EdgeInsets.symmetric(horizontal: 10, vertical: 15),
                hintText: 'Title',
                hintStyle: TextStyle(
                  color: Color(0xff333333),
                  fontSize: 25,
                  fontWeight: FontWeight.w400
                ),
                border: InputBorder.none,
              ),
            ),

            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Row(
                children: [
                  Text(
                    '${DateTime.now().toString().split(' ')[0]} ${DateTime.now().hour.toString() +':'+ DateTime.now().minute.toString()} | 0 characters',
                    style: const TextStyle(
                      color: Color(0xff5d5d5d),
                      fontSize: 12
                    ),
                  )
                ],
              ),
            ),
            Expanded(
              child: Container(
                child: TextField(
                  controller: content,
                  maxLines: null,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 16,  
                  ),
                  decoration: const InputDecoration(
                    filled: true,
                    fillColor: Colors.black,
                    contentPadding: EdgeInsets.symmetric(horizontal: 10, vertical: 15),
                    hintText: 'Start typing',
                    hintStyle: TextStyle(
                      color: Color(0xff333333),
                      fontSize: 16,
                    ),
                    border: InputBorder.none,
                  ),
                ),
              ),
            )
          ],
        ),
      )),
    );
  }
}