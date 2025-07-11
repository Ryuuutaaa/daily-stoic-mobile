import 'package:flutter/material.dart';
import 'package:stoicism/controllers/qoute_controller.dart';
import 'package:stoicism/models/qoute.dart';

class QuotesView extends StatelessWidget {
  final QuoteController _controller = QuoteController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Stoic Quotes')),
      body: FutureBuilder<List<Quote>>(
        future: _controller.getQuotes(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }
          if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          }
          if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return const Center(child: Text('No quotes available'));
          }
          return ListView.builder(
            itemCount: snapshot.data!.length,
            itemBuilder: (context, index) {
              final quote = snapshot.data![index];
              return Card(
                margin: const EdgeInsets.all(15),
                child: ListTile(
                  title: Text(quote.text),
                  subtitle: Padding(
                    padding: const EdgeInsets.only(top: 8),
                    child: Text(
                      ' - ${quote.author}',
                    ),
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
