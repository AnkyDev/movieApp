import 'package:bookmyfilm/screens/show_item_overview_screen.dart';
import 'package:flutter/material.dart';

class ShowItemView extends StatelessWidget {
  final String title;
  final String imdbid;
  final String year;
  final String poster;
  final String overview;
  final double voteRating;
  final bool adult;
  ShowItemView(
      {required this.imdbid,
      required this.poster,
      required this.title,
      required this.year,
      required this.overview,
      required this.voteRating,
      required this.adult});

  @override
  Widget build(BuildContext context) {
    final imageUrl = 'https://image.tmdb.org/t/p/w500' + poster;
    return Card(
      color: Color(0xFF4C5962),
      child: GestureDetector(
        onTap: () {
          Navigator.push(context, MaterialPageRoute(builder: (ctx) {
            return ShowItemOverviewScreen(
                imdbid, title, voteRating, overview, year, poster, adult);
          }));
        },
        child: Container(
          /// color: Colors.blueAccent,
          height: 350,
          width: 200,
          margin: EdgeInsets.all(8),
          padding: EdgeInsets.all(6),
          child: Column(
            //mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: Image.network(
                  imageUrl,
                  fit: BoxFit.contain,
                ),
              ),
              SizedBox(
                height: 5,
              ),
              Padding(
                padding: EdgeInsets.all(8),
                child: Row(
                  // mainAxisAlignment: MainAxisAlignment.spaceAround,
                  // crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Expanded(
                      child: Text(title,
                          style: TextStyle(
                              color: Colors.white70,
                              fontWeight: FontWeight.bold),
                          overflow: TextOverflow.ellipsis),
                    ),
                    Text(
                      year.substring(0, 4),
                      style: TextStyle(
                          color: Colors.white70, fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
