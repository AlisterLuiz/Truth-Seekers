import 'dart:convert';
import 'package:http/http.dart' as http;

class Verification {
  final String result;
  final Map articles;
  final Map source;
  final String url;

  Verification({this.result, this.articles, this.source, this.url});

  factory Verification.fromJson(Map<String, dynamic> json) {
    return Verification(
      result: json['result'],
      articles: json['articles'],
      source: json['source'],
      url: json['url'],
    );
  }
}

Future<Verification> createText() async {
  final http.Response response = await http.post(
    'http://truth-seekers-covid19.herokuapp.com/verify-news/api/verify-text',
    headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
    },
    body: jsonEncode(<String, String>{
      'newsText':
          // 'https://economictimes.indiatimes.com/news/international/business/taiwan-approves-gileads-remdesivir-to-treat-covid-19/articleshow/76104196.cms',
          'The expert group which was constituted by the Tamil Nadu School Education department and headed by the Commissioner of School Education, has been given an extension for the submission of their report',
    }),
  );
  if (response.statusCode == 200) {
    // If the server did return a 201 CREATED response,
    // then parse the JSON.
    return Verification.fromJson(json.decode(response.body));
  } else {
    // If the server did not return a 201 CREATED response,
    // then throw an exception.
    throw Exception('Failed to retrieve info');
  }
}

Future<Verification> createUrl() async {
  final http.Response response = await http.post(
    'http://truth-seekers-covid19.herokuapp.com/verify-news/api/verify-url',
    headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
    },
    body: jsonEncode(<String, String>{
      'newsUrl':
          'https://economictimes.indiatimes.com/news/international/business/taiwan-approves-gileads-remdesivir-to-treat-covid-19/articleshow/76104196.cms',
    }),
  );
  if (response.statusCode == 200) {
    // If the server did return a 201 CREATED response,
    // then parse the JSON.
    return Verification.fromJson(json.decode(response.body));
  } else {
    // If the server did not return a 201 CREATED response,
    // then throw an exception.
    throw Exception('Failed to retrieve info');
  }
}
