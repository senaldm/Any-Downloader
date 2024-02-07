// ignore_for_file: use_key_in_widget_constructors, must_be_immutable, prefer_const_constructors, non_constant_identifier_names, prefer_const_declarations

import 'dart:convert';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:path_provider/path_provider.dart';
import 'package:api_service/api_service.dart';

class SearchResult extends StatefulWidget {
  String searchResult;
  SearchResult({required this.searchResult});

  @override
  State<SearchResult> createState() => _SearchResultState();
}

class _SearchResultState extends State<SearchResult> {
  final downloader = Downloader();
  RxString apikey = '5b74186648msh5f95acf1db2881ap14a40ejsnd947d7d92359'.obs;
  String URL = '';
  @override
  void initState() {
    URL = widget.searchResult;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return SafeArea(
        top: true,
        bottom: true,
        left: true,
        right: true,
        child: Scaffold(
            appBar: PreferredSize(
                preferredSize: Size.fromHeight(height * 0.1),
                child: AppBar(
                  backgroundColor: Color.fromARGB(255, 14, 131, 136),
                  centerTitle: true,
                  flexibleSpace: Center(
                      child: Text(
                    "Any Downloader",
                    style: TextStyle(
                      fontSize: width * 0.08,
                      fontWeight: FontWeight.bold,
                    ),
                  )),
                )),
            body: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("URL:$URL"),
                FloatingActionButton.extended(
                    onPressed: () {
                      searchYouTube(URL);
                    },
                    label: Text("Download"))
              ],
            )));
  }

  void downloadFile() {
    final url = URL; // Replace with your download link
    final fileName = 'download.mp4'; // Replace with your desired file name

    downloader.downloadFile(url, fileName);
  }

  void searchYouTube(URL) async {
    
    final String apiUrl =
        "https://youtube-search-and-download.p.rapidapi.com/channel/about";
    final Map<String, String> queryParameters = {
      "id": "UCE_M8A5yxnLfW0KghEeajjw",
    };

    var headers = {
      'Authorization':
          'Client-ID ${apikey.value}', // Add the API key in headers
      'Content-Type': 'application/json',
    };
    try {
      var response = await ApiService().getMethod(
          "https://api.unsplash.com/photos/?per_page=30&order_by=popular&client_id=mZWpG8t2oknfFn6q6pxu5Ry92G1jxkML_Z_YFPTcBOY",
          headers: headers);
      final response = await http.get(
        
        Uri.parse(URL).replace(queryParameters: queryParameters),
        headers: {
          "X-RapidAPI-Key":
              "5b74186648msh5f95acf1db2881ap14a40ejsnd947d7d92359",
          "X-RapidAPI-Host": "youtube-search-and-download.p.rapidapi.com",
        },
      );

      if (response.statusCode == 200) {
        final Map<String, dynamic> data = json.decode(response.body);
        print('Search Results: $data');
      } else {
        print('Error: ${response.statusCode}');
        print('Response Body: ${response.body}');
      }
    } catch (error) {
      print('Error: $error');
    }
  }
}

class Downloader {
  Future<void> downloadFile(String url, String fileName) async {
    final response = await http.get(Uri.parse(url));
    if (response.statusCode == 200) {
      print("succesfully found");
      final appDir = await getApplicationDocumentsDirectory();
      final file = File('${appDir.path}/$fileName');
      await file.writeAsBytes(response.bodyBytes);
    } else {
      print("Didn't find");
    }
  }
}
