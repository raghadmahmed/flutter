import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:final_app/Model/Provider.dart';
import 'package:final_app/Screens/Add_note_Screen.dart';

class Notes extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return const NotesScreen();
  }
}

class NotesScreen extends StatelessWidget {
  const NotesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<AppProvider>(context);

    // 🔍 فلترة ذكية (لو السيرش فاضي هيرجع كل النوتس)
    final notesToShow = provider.query.isEmpty
        ? provider.notes
        : provider.notes.where((note) {
      final q = provider.query.toLowerCase();
      return note.title.toLowerCase().contains(q) ||
          note.desc.toLowerCase().contains(q);
    }).toList();

    return Scaffold(
      backgroundColor: const Color(0xFF0F172A),

      appBar: AppBar(
        toolbarHeight: 150,
        backgroundColor: const Color(0xFF0F172A),
        elevation: 0,
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  padding: const EdgeInsets.all(6),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.white,
                  ),
                  child: const Icon(
                    Icons.arrow_back_ios_outlined,
                    color: Color(0xFF0F172A),
                  ),
                ),
                const Icon(Icons.segment_rounded, color: Colors.white),
              ],
            ),
            const SizedBox(height: 10),
            const Text(
              "My Notes",
              style: TextStyle(
                color: Colors.white,
                fontSize: 25,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),

      body: Container(
        decoration: BoxDecoration(
          color: Colors.grey[200],
          borderRadius: const BorderRadius.vertical(
            top: Radius.circular(30),
          ),
        ),
        child: Column(
          children: [

            Container(
              width: 330,
              padding: const EdgeInsets.symmetric(horizontal: 10),
              decoration: BoxDecoration(
                color: const Color(0xFFEDEDED),
                borderRadius: BorderRadius.circular(15)
              ),
              child: TextField(
                onChanged: (value) {
                  provider.setQuery(value);
                },
                decoration: const InputDecoration(
                  hintText: "Search Subject",
                  prefixIcon: Icon(Icons.search, color: Colors.grey),
                  border: InputBorder.none,
                ),
              ),
            ),

            const SizedBox(height: 10),

            Expanded(
              child: notesToShow.isEmpty
                  ? const Center(
                child: Text(
                  "No Notes Yet",
                  style: TextStyle(color: Colors.grey),
                ),
              )
                  : Padding(
                padding: const EdgeInsets.all(12),
                child: GridView.builder(
                  itemCount: notesToShow.length,
                  gridDelegate:
                  const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 12,
                    mainAxisSpacing: 12,
                    childAspectRatio: 0.9,
                  ),
                  itemBuilder: (context, index) {
                    final note = notesToShow[index];

                    return Container(
                      padding: const EdgeInsets.all(12),
                      decoration: BoxDecoration(
                        color: note.color,
                        borderRadius: BorderRadius.circular(16),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [

                          // ⭐ Title + Fav
                          Row(
                            children: [
                              GestureDetector(
                                onTap: () {
                                  provider.toggleFav(
                                    provider.notes.indexOf(note),
                                  );
                                },
                                child: Icon(
                                  note.isFav
                                      ? Icons.star
                                      : Icons.star_border_rounded,
                                  color: Colors.white,
                                ),
                              ),
                              const SizedBox(width: 8),
                              Expanded(
                                child: Text(
                                  note.title,
                                  overflow: TextOverflow.ellipsis,
                                  style: const TextStyle(
                                    color: Colors.white,
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            ],
                          ),

                          const SizedBox(height: 8),

                          Expanded(
                            child: Text(
                              note.desc,
                              style: const TextStyle(
                                color: Colors.white,
                              ),
                              overflow: TextOverflow.fade,
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                ),
              ),
            ),

            // ➕ Add Button
            SizedBox(
              width: double.infinity,
              height: 52,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const AddNotes(),
                    ),
                  );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF1A2340),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                ),
                child: const Text(
                  'Add Notes',
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}