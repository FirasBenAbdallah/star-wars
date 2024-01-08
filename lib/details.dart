import 'package:flutter/material.dart';

class Details extends StatelessWidget {
  final Map<String, dynamic> movie;

  const Details({Key? key, required this.movie}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Use the movie data to build your detail view
    return Scaffold(
      appBar: AppBar(
        title: Text(
          movie['title'],
          style: const TextStyle(
            color: Colors.black,
            fontSize: 22,
            letterSpacing: -0.5,
          ),
        ),
        centerTitle: true,
        backgroundColor: const Color(0xaaebebeb),
        elevation: 1,
      ),
      body: Column(
        children: [
          // Movie title, release date, director and producer
          Container(
            width: 414,
            height: 219,
            margin: const EdgeInsets.only(bottom: 6),
            padding: const EdgeInsets.all(8),
            decoration: const BoxDecoration(
              color: Color(0xee161614),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                // Movie title
                Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Padding(
                        padding:
                            const EdgeInsets.only(left: 9, top: 27, bottom: 27),
                        child: Text(
                          movie['title'],
                          style: const TextStyle(
                            color: Color(0xEFF9F9F9),
                            fontSize: 36,
                            fontWeight: FontWeight.w400,
                            letterSpacing: -0.24,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                // Release Date, Director and producer row
                Row(
                  children: [
                    // Release date
                    Padding(
                      padding: const EdgeInsets.only(left: 12.0, right: 16),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            'Release date',
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
                            movie['release_date'].replaceAll('-', '/'),
                            style: const TextStyle(
                                fontSize: 10, color: Colors.white),
                          ),
                        ],
                      ),
                    ),
                    // Director
                    Padding(
                      padding: const EdgeInsets.only(left: 12.0, right: 16),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
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
                            movie['director'],
                            style: const TextStyle(
                                fontSize: 10, color: Colors.white),
                          ),
                        ],
                      ),
                    ),
                    // Producers
                    Flexible(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
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
                            movie['producer'],
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
                const SizedBox(height: 27),
                // Opening crawl
              ],
            ),
          ),
          // Opening crawl and created/edited row
          Container(
            margin: const EdgeInsets.symmetric(vertical: 6),
            padding: const EdgeInsets.all(8),
            child: Container(
              margin: const EdgeInsets.symmetric(horizontal: 14),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Opening crawl
                  const Text(
                    'Opening crawl',
                    style: TextStyle(
                      color: Color(0xFF161614),
                      fontSize: 13,
                      fontWeight: FontWeight.w400,
                      height: 0.12,
                      letterSpacing: -0.24,
                    ),
                  ),
                  const SizedBox(height: 10),
                  // Opening crawl text
                  Text(
                    movie['opening_crawl']
                        .replaceAll(RegExp(r'\r\n|\r|\n'), ' '),
                    textAlign: TextAlign.justify,
                    style: const TextStyle(
                      color: Color(0xFF161614),
                      fontSize: 13,
                      fontWeight: FontWeight.w400,
                      letterSpacing: -0.24,
                    ),
                  ),
                  const SizedBox(height: 20),
                  // Created and edited row
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      // Created
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            'Created',
                            style: TextStyle(
                              color: Color(0xFF161614),
                              fontSize: 13,
                              fontWeight: FontWeight.w400,
                              height: 0.12,
                              letterSpacing: -0.24,
                            ),
                          ),
                          const SizedBox(height: 4),
                          Text(
                            movie['created']
                                .replaceAll('-', '/')
                                .substring(0, 10),
                            style: const TextStyle(
                              color: Color(0xFF161614),
                              fontSize: 13,
                              fontWeight: FontWeight.w400,
                              letterSpacing: -0.24,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(width: 20),
                      // Edited
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            'Edited',
                            style: TextStyle(
                              color: Color(0xFF161614),
                              fontSize: 13,
                              fontWeight: FontWeight.w400,
                              height: 0.12,
                              letterSpacing: -0.24,
                            ),
                          ),
                          const SizedBox(height: 4),
                          Text(
                            movie['edited']
                                .replaceAll('-', '/')
                                .substring(0, 10),
                            style: const TextStyle(
                              color: Color(0xFF161614),
                              fontSize: 13,
                              fontWeight: FontWeight.w400,
                              letterSpacing: -0.24,
                            ),
                          ),
                        ],
                      ),
                    ],
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
