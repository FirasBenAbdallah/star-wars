import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:think_it/details.dart';

class Films extends StatefulWidget {
  const Films({super.key});

  @override
  State<Films> createState() => _FilmsState();
}

class _FilmsState extends State<Films> {
  List films = [];
  bool isLoading = true;

  // initState is called when the widget is first created
  @override
  void initState() {
    super.initState();
    fetchFilms();
  }

  // Fetch films data from the API
  Future<void> fetchFilms() async {
    const String url = 'https://swapi.dev/api/films/';
    try {
      final response = await http.get(Uri.parse(url));
      final Map<String, dynamic> data = json.decode(response.body);
      if (mounted) {
        setState(() {
          films = data['results'];
          isLoading = false; // Set loading to false after data is fetched
        });
      }
    } catch (e) {
      if (kDebugMode) {
        print('Failed to load films: $e');
      }
      if (mounted) {
        setState(() {
          isLoading = false; // Set loading to false even if there's an error
        });
      }
    }
  }

  // Build the UI
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // AppBar
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: const Text(
          'Think-it Star Wars',
          style: TextStyle(
            color: Colors.black,
            fontSize: 22,
            letterSpacing: -0.5,
          ),
        ),
        centerTitle: true,
        backgroundColor: const Color(0xaaebebeb),
        elevation: 1,
      ),
      // Body
      body: isLoading
          ? const Center(
              child: CircularProgressIndicator(
              valueColor: AlwaysStoppedAnimation<Color>(Colors.black),
              strokeWidth: 6,
              strokeAlign: 6,
            ))
          : Column(
              children: [
                // Header
                Container(
                  padding: const EdgeInsets.only(bottom: 6),
                  width: double.maxFinite,
                  height: 200,
                  color: const Color(0xee161614), // Adjust the color as needed
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      // Star Wars logo
                      Image.asset('assets/images/star_wars.png',
                          width: 146, height: 146),
                      // Total movies count
                      Padding(
                        padding: const EdgeInsets.only(left: 12),
                        child: SizedBox(
                          width: double.maxFinite,
                          child: Text(
                            'Total ${films.length} Movies',
                            style: const TextStyle(
                              color: Color(0xFFD7D7D7),
                              fontSize: 15,
                              fontWeight: FontWeight.w400,
                              height: 0.09,
                              letterSpacing: -0.24,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                // List of films
                Expanded(
                    child: ListView.builder(
                  itemCount: films.length,
                  itemBuilder: (context, index) {
                    var person = films[index];
                    // Return a container for each film
                    return InkWell(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => Details(movie: person),
                          ),
                        );
                      },
                      // Container for each film
                      child: Container(
                        margin: const EdgeInsets.symmetric(vertical: 6),
                        padding: const EdgeInsets.all(8),
                        decoration: const BoxDecoration(
                          color: Color(0xee161614),
                        ),
                        // Main column
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            // Title and release date row
                            Padding(
                              padding:
                                  const EdgeInsets.only(left: 9, right: 12),
                              child: Row(
                                children: [
                                  // Title
                                  Text(
                                    person['title'],
                                    style: const TextStyle(
                                      fontSize: 20,
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  const Spacer(),
                                  // Release date
                                  Text(
                                    'Release date\n${person['release_date'].replaceAll('-', '/')}',
                                    style: const TextStyle(
                                      color: Color(0xEFF9F9F9),
                                      fontSize: 9,
                                    ),
                                    textAlign: TextAlign.right,
                                  ),
                                ],
                              ),
                            ),
                            const SizedBox(height: 10),
                            // Director and producer row
                            Row(
                              children: [
                                // Director
                                Padding(
                                  padding: const EdgeInsets.only(
                                      left: 12.0, right: 16),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      const Text(
                                        'Director',
                                        style: TextStyle(
                                          color: Color(0xEFF9F9F9),
                                          fontSize: 9,
                                          fontWeight: FontWeight.w400,
                                          height: 0.25,
                                          letterSpacing: -0.24,
                                        ),
                                      ),
                                      const SizedBox(height: 4),
                                      Text(
                                        person['director'],
                                        style: const TextStyle(
                                            fontSize: 10, color: Colors.white),
                                      ),
                                    ],
                                  ),
                                ),
                                // Producers
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      const Text(
                                        'Producer',
                                        style: TextStyle(
                                          color: Color(0xEFF9F9F9),
                                          fontSize: 9,
                                          fontWeight: FontWeight.w400,
                                          height: 0.25,
                                          letterSpacing: -0.24,
                                        ),
                                      ),
                                      const SizedBox(height: 4),
                                      Text(
                                        person['producer'],
                                        style: const TextStyle(
                                            fontSize: 10, color: Colors.white),
                                        softWrap: true,
                                        overflow: TextOverflow.fade,
                                        maxLines: 2,
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(height: 10),
                            // Opening crawl
                            Padding(
                              padding: const EdgeInsets.only(
                                  right: 32.0, bottom: 20.0, left: 12.0),
                              child: Text(
                                person['opening_crawl']
                                    .replaceAll(RegExp(r'\r\n|\r|\n'), ' '),
                                style: const TextStyle(
                                  color: Color(0xEFF9F9F9),
                                  fontSize: 13,
                                  fontWeight: FontWeight.w400,
                                  letterSpacing: -0.24,
                                ),
                                maxLines: 2,
                                overflow: TextOverflow.ellipsis,
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                )),
              ],
            ),
    );
  }
}
