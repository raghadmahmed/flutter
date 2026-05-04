import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:final_app/Model/Provider.dart';
import 'package:final_app/Model/note_model.dart';

class AddNotes extends StatefulWidget {
  const AddNotes({super.key});

  @override
  State<AddNotes> createState() => _AddNotesState();
}

class _AddNotesState extends State<AddNotes> {

  TextEditingController titleController = TextEditingController();
  TextEditingController descController = TextEditingController();

  Color selectedColor = Colors.blueGrey;
  bool isFav = false;

  void saveNote() {
    if (titleController.text.isEmpty || descController.text.isEmpty) return;

    Provider.of<AppProvider>(context, listen: false).addNote(
      Note(
        title: titleController.text,
        desc: descController.text,
        color: selectedColor,
        isFav: isFav,
      ),
    );

    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF0B1B3B),
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(16),
              child: Row(
                children: [
                  GestureDetector(
                    onTap: () => Navigator.pop(context),
                    child: Container(
                      padding: const EdgeInsets.all(8),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: const Icon(Icons.arrow_back),
                    ),
                  ),
                  const SizedBox(width: 20),
                  const Text(
                    "Add Note",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 28,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),

            Expanded(
              child: Container(
                padding: const EdgeInsets.all(16),
                decoration: const BoxDecoration(
                  color: Color(0xFFF2F2F2),
                  borderRadius: BorderRadius.vertical(
                    top: Radius.circular(30),
                  ),
                ),
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [

                      const SizedBox(height: 20),

                      const Text("Note Title"),
                      const SizedBox(height: 8),

                      textField(titleController),

                      const SizedBox(height: 20),

                      const Text("Note"),
                      const SizedBox(height: 8),

                      textField(descController, height: 120),

                      const SizedBox(height: 20),

                      const Text("Colors"),
                      const SizedBox(height: 10),

                      Row(
                        children: [
                          colorCircle(Colors.blueGrey),
                          colorCircle(Colors.brown),
                          colorCircle(Colors.grey),
                          colorCircle(Colors.red),
                          colorCircle(Colors.blue.shade100),
                        ],
                      ),

                      const SizedBox(height: 30),

                      Center(
                        child: GestureDetector(
                          onTap: saveNote,
                          child: Container(
                            width: 200,
                            padding: const EdgeInsets.symmetric(vertical: 15),
                            decoration: BoxDecoration(
                              color: const Color(0xFF0B1B3B),
                              borderRadius: BorderRadius.circular(20),
                            ),
                            child: const Center(
                              child: Text(
                                "Add",
                                style: TextStyle(
                                    color: Colors.white, fontSize: 20),
                              ),
                            ),
                          ),
                        ),
                      ),

                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget textField(TextEditingController controller, {double height = 50}) {
    return Container(
      height: height,
      padding: const EdgeInsets.symmetric(horizontal: 10),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15),
      ),
      child: TextField(
        controller: controller,
        maxLines: height > 100 ? null : 1,
        decoration: const InputDecoration(border: InputBorder.none),
      ),
    );
  }

  Widget colorCircle(Color color) {
    return GestureDetector(
      onTap: () {
        setState(() {
          selectedColor = color;
        });
      },
      child: Container(
        margin: const EdgeInsets.only(right: 10),
        width: 30,
        height: 30,
        decoration: BoxDecoration(
          color: color,
          shape: BoxShape.circle,
          border: selectedColor == color
              ? Border.all(color: Colors.black, width: 2)
              : null,
        ),
      ),
    );
  }
}