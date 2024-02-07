// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return Scaffold(
        backgroundColor: Color.fromARGB(255, 255, 255, 255),
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(height*0.15),
          child: AppBar(
            backgroundColor: Color.fromARGB(255, 14, 131, 136),
            centerTitle: true,
            flexibleSpace: Center(
              child: Text("Any Downloader",
              style: TextStyle(
                fontSize: width*0.08,
                fontWeight: FontWeight.bold,
              ),)),
          ),
        ),
        body: Center(
            child: Stack(
              children: [
                Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
                SizedBox(
                  height: height * 0.1,
                ),
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Hero(
                    tag: 'link',
                    child: TextFormField(
                      controller: searchController,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return "Please enter the url";
                        }
                        return null;
                      },
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10.0),
                          borderSide: BorderSide(
                            color: Colors.blueGrey.shade900, // Change the border color here
                            width: 2.0, // Adjust the border width if needed
                          ),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10.0),
                          borderSide: BorderSide(
                            color: Colors.blueGrey.shade900,
                            width: 2.0,
                          ),
                        ),
                        prefixIcon: Icon(
                          Icons.search,
                          color: Colors.blueGrey.shade900,
                        ),
                        hintText: 'Enter your url here',
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: height * 0.03,
                ),
                FloatingActionButton.extended(
                  heroTag: Text('save'),
                  onPressed: () async {
                    Navigator.pushNamed(context, '/searchResult',
                        arguments: searchController.text);
                  },
                  backgroundColor: Colors.blueGrey.shade900,
                  label: Text(
                    ' Go ',
                    style: TextStyle(
                        fontSize: 15.0,
                        fontWeight: FontWeight.bold,
                        color: Colors.white),
                  ),
                ),
                
          ],
        ),
        Positioned(
              bottom: height * 0.1,
              left: 0,
              right: 0,
              child: Column(
                children: [
                  Text(
                    "Download anything with Us",
                    style: TextStyle(
                        fontStyle: FontStyle.italic,
                        color: Colors.black,
                        fontFamily: 'Quintessential'),
                  ),
                ],
              ),
            ),
              ],
              
            )
            )
            );
  }
}
