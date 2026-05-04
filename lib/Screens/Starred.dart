import 'package:flutter/material.dart';
class StudyPage extends StatefulWidget {
  const StudyPage({super.key});
  @override
  State<StudyPage> createState() => _StudyPageState();
}
class _StudyPageState extends State<StudyPage> {
  final List<Map<String, dynamic>> items = [
    {
      "type":"task",
      "title":"JAVA Task",
      "desc":"rrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrr",
      "tag":"JAVA",
    },
    {
      "type":"note",
      "title":"Remember",
      "desc":
      "Stay organized and keep track of your daily tasks and important reminders.",
      "color":Color(0xFF8B1E1E),
    },
    {
      "type":"note",
      "title":"Remember",
      "desc":
      "Stay organized and keep track of your daily tasks and important reminders.",
      "color":Color(0xFF3D4B5A),
    },
  ];
  void addItem(){
    setState((){
      items.add({
        "type":items.length%2==0?"task":"note",
        "title":"New Item",
        "desc":"Added dynamically",
        "tag":"NEW",
        "color":Color(0xFF5A6C7D),
      });
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFEDEDED),
      appBar: AppBar(
        backgroundColor: const Color(0xFF0B1A2B),
        elevation: 0,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              padding: const EdgeInsets.all(6),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10),
              ),
              child: const Icon(Icons.chevron_left,
                  size: 30, color: Colors.black),
            ),
            const Icon(Icons.segment, size: 30, color: Colors.white),
          ],
        ),
      ),
      body: Column(
        children: [
          Container(
            width: double.infinity,
            color: const Color(0xFF0F172A),
            padding: const EdgeInsets.all(16),
            child: Container(
              padding: const EdgeInsets.all(12),
              decoration: const BoxDecoration(
                color: Color(0xFF0F172A),
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(15),
                  topRight: Radius.circular(15),
                ),
              ),
              child: const Text("Starred",style: TextStyle(color: Colors.white,fontSize: 32,fontWeight: FontWeight.bold,),
              ),
            ),
          ),
          SizedBox(height: 10),
          Expanded(
            child: ListView(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              children: [
                ...items.where((e) => e["type"] == "task").map((item) {
                  return Container(
                    margin: const EdgeInsets.only(bottom: 16),
                    padding: const EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      color: const Color(0xFFD9D9D9),
                      borderRadius: BorderRadius.circular(22),
                    ),
                    child: Row(
                      children: [
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                item["title"],
                                style: const TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              const SizedBox(height: 8),
                              Text(
                                item["desc"],
                                maxLines: 2,
                                overflow: TextOverflow.ellipsis,
                              ),
                            ],
                          ),
                        ),
                        Column(
                          children: [
                            Text(
                              item["tag"] ?? "",
                              style: const TextStyle(color: Colors.grey),
                            ),
                            const SizedBox(height: 10),
                            const Icon(Icons.star, color: Colors.amber),
                          ],
                        )
                      ],
                    ),
                  );
                }),
                const SizedBox(height: 10),
                Wrap(
                  spacing: 12,
                  runSpacing: 12,
                  children: items.where((e) => e["type"] == "note").map((item) {
                    return Container(
                      width: (MediaQuery.of(context).size.width - 44) / 2,
                      padding: const EdgeInsets.all(16),
                      decoration: BoxDecoration(
                        color: item["color"],
                        borderRadius: BorderRadius.circular(25),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Row(
                            children: [
                              Icon(Icons.star, color: Colors.white),
                              SizedBox(width: 6),
                              Text("Remember",style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,),
                              ),
                            ],
                          ),
                          const SizedBox(height: 12),
                          Text(
                            item["desc"],
                            style: const TextStyle(
                              color: Colors.white,
                              height: 1.5,
                            ),
                          ),
                        ],
                      ),
                    );
                  }).toList(),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}