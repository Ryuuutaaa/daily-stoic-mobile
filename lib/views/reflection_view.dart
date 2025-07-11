import 'package:flutter/material.dart';
import 'package:stoicism/controllers/reflection_controller.dart';
import 'package:stoicism/models/reflection.dart';

class ReflectionScreen extends StatelessWidget {
  ReflectionScreen({super.key});

  final ReflectionController _controller = ReflectionController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Reflection screen"),
      ),
      body: FutureBuilder<List<Reflection>>(
        future: _controller.getReflection(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }
          if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          }
          if (snapshot.data == null || snapshot.data!.isEmpty) {
            return const Center(child: Text('No reflections available'));
          }
          return ListView.builder(
            itemCount: snapshot.data!.length,
            itemBuilder: (context, index) {
              final reflection = snapshot.data![index];
              return Padding(
                padding: const EdgeInsets.symmetric(vertical: 8.0),
                child: Column(
                  children: [
                    Card(
                      margin: const EdgeInsets.symmetric(horizontal: 15),
                      child: Padding(
                        padding: const EdgeInsets.all(15.0),
                        child: ListTile(
                          leading: const CircleAvatar(
                            backgroundColor: Colors.blue,
                            child: Icon(Icons.question_answer,
                                color: Colors.white),
                          ),
                          title: Text(reflection.question),
                        ),
                      ),
                    ),
                    const SizedBox(height: 10),
                    Card(
                      margin: const EdgeInsets.symmetric(horizontal: 15),
                      child: Padding(
                        padding: const EdgeInsets.all(15.0),
                        child: ListTile(
                          trailing: const CircleAvatar(
                            backgroundColor: Colors.blue,
                            child: Icon(Icons.check, color: Colors.white),
                          ),
                          title: const Text("Answer"),
                          subtitle: Text(reflection.answer),
                        ),
                      ),
                    ),
                  ],
                ),
              );
            },
          );
        },
      ),
    );
  }
}
