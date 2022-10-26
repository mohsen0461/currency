import 'package:flutter/material.dart';
import 'package:get/get.dart';

class NewsPageView extends StatelessWidget {
  final String? imageUrl = Get.arguments["imageUrl"];
  final String title = Get.arguments["title"];
  final String? description = Get.arguments["description"];
  final String? content = Get.arguments["content"];

  NewsPageView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("News"),
        titleTextStyle: const TextStyle(color: Colors.blue),
        centerTitle: true,
        backgroundColor: Colors.white,
        foregroundColor: Colors.blue,
      ),
      body: ListView(
        children: [
          Center(
              child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 5),
            child: Text(
              title,
              textAlign: TextAlign.left,
              style: const TextStyle(fontWeight: FontWeight.bold),
            ),
          )),
          Padding(
            padding: const EdgeInsets.only(top: 8, bottom: 8),
            child: Card(
                margin: EdgeInsets.zero,
                shape: RoundedRectangleBorder(
                    side: const BorderSide(color: Colors.white70, width: 1),
                    borderRadius: BorderRadius.circular(10)),
                shadowColor: Colors.black87,
                color: const Color(0xFFF1FEFC),
                child: Container(
                  margin: const EdgeInsets.all(4),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(8),
                    child: imageUrl == null
                        ? Image.asset("images/no-image.png")
                        : Image.network(
                            imageUrl!,
                            fit: BoxFit.cover,
                          ),
                  ),
                )),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 5, right: 5, bottom: 10),
            child: description == null ?const Text(""):
            Text(description!,
                textAlign: TextAlign.center,
                style: const TextStyle(fontWeight: FontWeight.bold)),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 5, right: 5,bottom: 5),
            child: content == null ? const Text(''):
            Text(
              content!,
              textAlign: TextAlign.center,
            ),
          )
        ],
      ),
    );
  }
}
