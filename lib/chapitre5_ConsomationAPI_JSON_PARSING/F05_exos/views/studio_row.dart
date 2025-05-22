import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

import '../models/studio.dart';

class MovieWidget extends StatelessWidget {
  final Film movie;

  const MovieWidget({super.key, required this.movie});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Row(
          children: [
            if (MediaQuery.of(context).size.width > 960)
              Image.network(movie.image, width: 200),
            const SizedBox(width: 16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    movie.releaseDate,
                    style: const TextStyle(color: Colors.grey),
                  ),
                  const Divider(),
                  Text(
                    movie.title,
                    style: const TextStyle(fontWeight: FontWeight.bold),
                  ),
                  const Divider(),
                  Text(
                    "${movie.rtScore} %",
                    style: TextStyle(
                      color: int.parse(movie.rtScore) > 80
                          ? Colors.green
                          : Colors.red,
                    ),
                  ),
                  if (MediaQuery.of(context).size.width > 480) const Divider(),
                  if (MediaQuery.of(context).size.width > 480)
                    Text("${movie.runningTime} minutes"),
                  if (MediaQuery.of(context).size.width > 480) const Divider(),
                  if (MediaQuery.of(context).size.width > 480)
                    Text("Directed by ${movie.director}"),
                  if (MediaQuery.of(context).size.width > 480) const Divider(),
                  if (MediaQuery.of(context).size.width > 480)
                    Text(
                      movie.description,
                      textAlign: TextAlign.justify,
                      softWrap: true,
                    ),
                  const Divider(),
                  InkWell(
                    onTap: () => launchUrl(Uri.parse(movie.url)),
                    child: Text(movie.url),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}