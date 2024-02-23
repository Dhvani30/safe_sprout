import 'package:flutter/material.dart';
import 'package:dio/dio.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:dice_app/modules/article.dart';
import 'package:dice_app/modules/consts.dart';
import 'package:intl/intl.dart'; // Import the intl package for date formatting

class EMagazine extends StatefulWidget {
  const EMagazine({Key? key}) : super(key: key);

  @override
  State<EMagazine> createState() => _EMagazineState();
}

class _EMagazineState extends State<EMagazine> {
  final Dio dio = Dio();

  List<Article> articles = [];

  @override
  void initState() {
    super.initState();
    _getNews();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Women's Safety News"),
      ),
      body: _buildUI(),
    );
  }

  String DEFAULT_IMAGE_PATH =
      'assets/images/default.jpg'; // Placeholder image path

  Widget _buildUI() {
    return ListView.builder(
      itemCount: articles.length,
      itemBuilder: (context, index) {
        final article = articles[index];
        // Format the published date to IST
        String formattedDateTime = _convertToIST(article.publishedAt ?? "");

        // Check if the article's image URL is not available or contains [object ProgressEvent]
        if (article.urlToImage == null ||
            article.urlToImage!.contains('ProgressEvent')) {
          return ListTile(
            onTap: () {
              _launchUrl(
                Uri.parse(article.url ?? ""),
              );
            },
            leading: Image.asset(
              DEFAULT_IMAGE_PATH,
              height: 250,
              width: 100,
              fit: BoxFit.cover,
            ),
            title: Text(
              article.title ?? "",
            ),
            subtitle: Text(
              formattedDateTime, // Display formatted date
            ),
          );
        } else {
          return ListTile(
            onTap: () {
              _launchUrl(
                Uri.parse(article.url ?? ""),
              );
            },
            leading: Image.network(
              article.urlToImage ?? PLACEHOLDER_IMAGE_LINK,
              height: 250,
              width: 100,
              fit: BoxFit.cover,
              errorBuilder: (context, error, stackTrace) {
                // Display a placeholder image or error message
                return Image.asset(DEFAULT_IMAGE_PATH); // Placeholder image
              },
            ),
            title: Text(
              article.title ?? "",
            ),
            subtitle: Text(
              formattedDateTime, // Display formatted date
            ),
          );
        }
      },
    );
  }

  Future<void> _getNews() async {
    final response = await dio.get(
        "https://newsapi.org/v2/everything?q=women%20safety%20campus%20OR%20women%27s%20safety%20OR%20self-defense%20OR%20laws%20for%20women%20OR%20tips%20for%20safety%20OR%20sexual%20harassment%20OR%20safe%20travel%20OR%20violence%20laws%20OR%20rights%20advocacy%20OR%20work%20safety%20OR%20community%20support%20OR%20domestic%20abuse%20OR%20legal%20help%20OR%20consent%20education%20OR%20tech%20safety%20OR%20public%20spaces&sortBy=popularity&apiKey=$NEWS_API_KEY");

    final articlesJson = response.data["articles"] as List;
    setState(() {
      List<Article> newsArticle =
          articlesJson.map((a) => Article.fromJson(a)).toList();
      newsArticle = newsArticle.where((a) => a.title != "[Removed]").toList();
      articles = newsArticle;
    });
  }

  Future<void> _launchUrl(Uri url) async {
    try {
      if (!await launchUrl(url)) {
        throw Exception('Could not launch $url');
      }
    } catch (e) {
      print('Error launching URL: $e');
      // Handle the error gracefully, such as showing a snackbar or dialog
    }
  }

  // Function to convert UTC to IST
  String _convertToIST(String? utcDateTimeString) {
    if (utcDateTimeString == null) return "";
    DateTime utcDateTime = DateTime.parse(utcDateTimeString);
    DateTime istDateTime = utcDateTime.toLocal();
    return DateFormat('dd-MM-yyyy HH:mm:ss').format(istDateTime);
  }
}
