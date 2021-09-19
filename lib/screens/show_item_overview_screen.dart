import 'package:bookmyfilm/data/Video_info.dart';
import 'package:bookmyfilm/data/api_manager.dart';
import 'package:bookmyfilm/widgets/play_trailer.dart';
import 'package:bookmyfilm/widgets/similarMovies.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ShowItemOverviewScreen extends StatefulWidget {
  final String movieId;
  final String title;
  final double voteRating;
  final String overview;
  final String dateTime;
  final String poster;
  final bool adult;
  // final List<int> genre;

  ShowItemOverviewScreen(this.movieId, this.title, this.voteRating,
      this.overview, this.dateTime, this.poster, this.adult);

  @override
  _ShowItemOverviewScreenState createState() => _ShowItemOverviewScreenState();
}

class _ShowItemOverviewScreenState extends State<ShowItemOverviewScreen> {
  var _responceVideo;
  @override
  void initState() {
    _responceVideo = ApiManage().getVideo(widget.movieId);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final imageUrl = 'https://image.tmdb.org/t/p/w500' + widget.poster;
    String year = widget.dateTime.substring(0, 4);
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [Colors.blue, Colors.red],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
      ),
      child: Scaffold(
          backgroundColor: Colors.transparent,
          appBar: AppBar(
            title: Text(widget.title),
          ),
          body: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 15,
                ),
                Row(
                  children: [
                    Container(
                        height: 100,
                        width: 100,
                        padding: EdgeInsets.all(10),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(8),
                          child: Image.network(
                            imageUrl,
                            fit: BoxFit.fill,
                          ),
                        )),
                    SizedBox(
                      width: 10,
                    ),
                    Container(
                      child: Expanded(
                        child: Text(
                          widget.title,
                          style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              color: Colors.white70),
                          overflow: TextOverflow.clip,
                          softWrap: false,
                        ),
                      ),
                    )
                  ],
                ),
                Container(
                  padding: EdgeInsets.all(15),
                  margin: EdgeInsets.all(9),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('Year: $year',
                          style:
                              TextStyle(fontSize: 18, color: Colors.white70)),
                      widget.adult == true
                          ? Text('Adult: Yes',
                              style: TextStyle(
                                  fontSize: 18, color: Colors.white70))
                          : Text(
                              'Adult: No',
                              style: TextStyle(
                                  fontSize: 18, color: Colors.white70),
                            )
                    ],
                  ),
                ),
                FutureBuilder<Welcome2>(
                    future: _responceVideo,
                    builder: (ctx, snapshot) {
                      if (snapshot.connectionState == ConnectionState.waiting) {
                        return Center(
                          child: CircularProgressIndicator(),
                        );
                      }
                      if (snapshot.data!.results.isNotEmpty)
                        return PlayTrailer(snapshot.data!.results[0].key);
                      else
                        return Center(
                            child: Text(
                          'No Video Available!!',
                          style: TextStyle(fontSize: 18),
                        ));
                    }),
                SizedBox(
                  height: 10,
                ),
                Container(
                  margin: EdgeInsets.all(9),
                  padding: EdgeInsets.all(5),
                  child: Text(
                    'Synopsy :-',
                    style: TextStyle(fontSize: 24),
                    textAlign: TextAlign.left,
                  ),
                ),
                Container(
                  padding: EdgeInsets.all(8),
                  margin: EdgeInsets.all(8),
                  decoration: BoxDecoration(
                      border: Border.all(),
                      borderRadius: BorderRadius.circular(10)),
                  child: Text(
                    widget.overview,
                    style: TextStyle(fontSize: 14),
                    overflow: TextOverflow.clip,
                  ),
                ),
                SimilarMovies(widget.movieId),
              ],
            ),
          )),
    );
  }
}
