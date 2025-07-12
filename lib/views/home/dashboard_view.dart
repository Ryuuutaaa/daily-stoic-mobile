import 'package:flutter/material.dart';
import 'package:stoicism/controllers/filsuf_controller.dart';
import 'package:stoicism/models/filsuf.dart';
import 'package:stoicism/views/qoutes_view.dart';
import 'package:stoicism/views/reflection_view.dart';

class DashboardView extends StatelessWidget {
  DashboardView({super.key});

  final FilsufController _controller = FilsufController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Dashboard screen"),
      ),
      body: FutureBuilder<List<Filsuf>>(
        future: _controller.getFilsuf(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }
          if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          }
          if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return const Center(child: Text('No data available'));
          }
          return Column(
            children: [
              Container(
                height: 200,
                child: Card(
                  margin: const EdgeInsets.all(15),
                  shadowColor: Colors.blueGrey,
                  elevation: 5,
                  child: Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: const [
                        Padding(
                          padding: EdgeInsets.all(8.0),
                          child: CircleAvatar(),
                        ),
                        Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Text("Welcome to dashboard"),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Row(
                children: [
                  Expanded(
                    child: GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => ReflectionScreen(),
                          ),
                        );
                      },
                      child: Container(
                        height: 100,
                        child: Card(
                          color: Colors.lightBlue,
                          margin: const EdgeInsets.all(15),
                          shadowColor: Colors.blueGrey,
                          elevation: 5,
                          child: const Center(
                            child: Text(
                              "Reflections",
                              style: TextStyle(color: Colors.white),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    child: GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => QuotesView()),
                        );
                      },
                      child: Container(
                        height: 100,
                        child: Card(
                          color: Colors.greenAccent,
                          margin: const EdgeInsets.all(15),
                          shadowColor: Colors.blueGrey,
                          elevation: 5,
                          child: const Center(
                            child: Text(
                              "Quotes",
                              style: TextStyle(color: Colors.white),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              Expanded(
                child: Container(
                  margin: EdgeInsets.symmetric(horizontal: 30),
                  child: ListView.builder(
                    itemCount: snapshot.data!.length,
                    itemBuilder: (context, index) {
                      final filsuf = snapshot.data![index];
                      return ListTile(
                        title: Text(filsuf.nama),
                        leading: const CircleAvatar(),
                        subtitle: Text(filsuf.tahun),
                      );
                    },
                  ),
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
