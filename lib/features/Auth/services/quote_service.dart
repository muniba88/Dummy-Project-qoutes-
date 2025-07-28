import 'package:supabase_flutter/supabase_flutter.dart';
import '../../home/model/quote_model.dart';

class QuoteService {
  final _client = Supabase.instance.client;

  Future<List<Quote>> fetchQuotes() async {
    try {
      final data = await _client
          .from('quotes')
          .select()
          .limit(30);

      return (data as List)
          .map((item) => Quote.fromJson(item as Map<String, dynamic>))
          .toList();
    } catch (e) {
      throw Exception('Failed to fetch quotes: $e');
    }
  }

  // Future<void> addSampleQuotes() async {
  //   final quotes = [
  //     {'quote': 'The only limit to our realization of tomorrow is our doubts of today.', 'author': 'Franklin D. Roosevelt'},
  //     {'quote': 'In the middle of every difficulty lies opportunity.', 'author': 'Albert Einstein'},
  //     {'quote': 'Success is not final, failure is not fatal: It is the courage to continue that counts.', 'author': 'Winston Churchill'},
  //     {'quote': 'What we think, we become.', 'author': 'Buddha'},
  //     {'quote': 'Do what you can, with what you have, where you are.', 'author': 'Theodore Roosevelt'},
  //   ];

  //   try {
  //     await _client.from('quotes').insert(quotes);
  //   } catch (e) {
  //     throw Exception('Failed to insert quotes: $e');
  //   }
  // 
}
