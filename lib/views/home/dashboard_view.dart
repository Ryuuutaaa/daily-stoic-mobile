import 'package:flutter/material.dart';
import 'package:stoicism/views/qoutes_view.dart';
import 'package:stoicism/views/reflection_view.dart';

class DashboardView extends StatelessWidget {
  const DashboardView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Dashboard screen"),
      ),
      body: Column(
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
          )
        ],
      ),
    );
  }
}
