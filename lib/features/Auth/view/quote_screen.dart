import 'package:flutter/material.dart';
import '../../../core/widgets/custom_app_bar.dart';
import '../../../core/widgets/primary_button.dart';
import '../../home/model/quote_model.dart';
import '../services/quote_service.dart';

class QuotesScreen extends StatefulWidget {
  const QuotesScreen({super.key});

  @override
  State<QuotesScreen> createState() => _QuotesScreenState();
}

class _QuotesScreenState extends State<QuotesScreen> {
  final QuoteService _quoteService = QuoteService();
  Future<List<Quote>>? _quotesFuture;
  bool _showQuotes = false;

  void _loadQuotes() {
    setState(() {
      _showQuotes = true;
      _quotesFuture = _quoteService.fetchQuotes();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // ✅ Using your custom app bar
      appBar: CustomAppBar(
        title: 'Quotes',
        leftIcon: Icons.arrow_back,
        onLeftIconTap: () => Navigator.pop(context),
        rightIcon: Icons.refresh,
        onRightIconTap: _loadQuotes,
        customColor: Colors.deepPurpleAccent,
        iconColor: Colors.white,
      ),

      body: _showQuotes
          ? FutureBuilder<List<Quote>>(
              future: _quotesFuture,
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const Center(child: CircularProgressIndicator());
                } else if (snapshot.hasError) {
                  return Center(child: Text('Error: ${snapshot.error}'));
                } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
                  return const Center(child: Text('No quotes found.'));
                } else {
                  final quotes = snapshot.data!;
                  return ListView.builder(
                    itemCount: quotes.length,
                    itemBuilder: (context, index) {
                      final quote = quotes[index];
                      return Card(
                        margin: const EdgeInsets.symmetric(
                            horizontal: 12, vertical: 8),
                        child: ListTile(
                          title: Text(
                            '"${quote.quote}"',
                            style: const TextStyle(fontWeight: FontWeight.bold),
                          ),
                          subtitle: Text('- ${quote.author}'),
                        ),
                      );
                    },
                  );
                }
              },
            )
          : Center(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      'Do you want to see some amazing quotes today?',
                      style: TextStyle(fontSize: 18),
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: 20),
                    PrimaryButton(
                      text: 'Yes',
                      onPressed: _loadQuotes,
                      buttonColor: Colors.deepPurple, // Optional
                      textColor: Colors.white, // Optional
                    ),
                  ],
                ),
              ),
            ),
    );
  }
}
