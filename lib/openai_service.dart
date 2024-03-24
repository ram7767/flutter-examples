import 'dart:convert';

import 'package:http/http.dart' as http;

String openAiKey = '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';
String echo = 'https://platform.openai.com/docs/guides/text-to-speech/echo';

class OpenAiServices {
  final List<Map<String, String>> messages = [];

  Future<String> promptRefAPI(String prompt) async {
    try {
      final res = await http.post(
          Uri.parse('https://api.openai.com/v1/chat/completions'),
          headers: {
            'Content-Type': 'application/json',
            'Authorization': 'Bearer $openAiKey'
          },
          body: jsonEncode({
            "model": "gpt-3.5-turbo-0125",
            "meassages": [
              {
                "role": "user",
                "content":
                    "Dose this message want to genarate AI picture, image, art or any thing similar? $prompt simply answer in yes or no"
              },
            ],
          }));
      // print(res.body);
      if (res.statusCode == 200) {
        String content =
            jsonDecode(res.body)['choices'][0]['messages']['content'];

        if (content.toLowerCase().contains('yes')) {
          return 'done';
        } else {
          return 'fail';
        }
      }
      return "An internal error occured";
    } catch (e) {
      return e.toString();
    }
  }

  Future<String> chatGPTAPI(String prompt) async {
    messages.add({
      'role': 'user',
      'content': prompt,
    });

    try {
      final res = await http.post(
          Uri.parse('https://api.openai.com/v1/chat/completions'),
          headers: {
            'Content-Type': 'application/json',
            'Authorization': 'Bearer $openAiKey'
          },
          body: jsonEncode({
            "model": "gpt-3.5-turbo-0125",
            "meassages": [messages],
          }));
      // print(res.body);
      if (res.statusCode == 200) {
        String content =
            jsonDecode(res.body)['choices'][0]['messages']['content'];

        messages.add({
          'role': 'assistant',
          'content': content,
        });
        return content;
      }
      return "An internal error occured";
    } catch (e) {
      return e.toString();
    }
  }

  Future<String> dallEAPI(String prompt) async {
    messages.add({
      'role': 'user',
      'content': prompt,
    });
    try {
      final res = await http.post(
          Uri.parse('https://api.openai.com/v1/chat/completions'),
          headers: {
            'Content-Type': 'application/json',
            'Authorization': 'Bearer $openAiKey'
          },
          body: jsonEncode({
            'prompt': prompt,
            'n': 1,
          }));
      // print(res.body);
      if (res.statusCode == 200) {
        String imageUrl = jsonDecode(res.body)['data'][0]['url'];

        messages.add({
          'role': 'assistant',
          'content': imageUrl,
        });
        return imageUrl;
      }
      return "An internal error occured";
    } catch (e) {
      return e.toString();
    }
  }
}
