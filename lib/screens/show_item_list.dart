import 'package:bookmyfilm/data/api_manager.dart';
import 'package:bookmyfilm/data/Movie_info.dart';
import 'package:bookmyfilm/widgets/show_item_view.dart';
import 'package:flutter/material.dart';

class MovieList extends StatefulWidget {
  @override
  _MovieListState createState() => _MovieListState();
}

class _MovieListState extends State<MovieList> {
  var _responcePopularMovie;
  var _responceTopratedMovie;
  var _responceUpcoming;
  var _responceNowPlayingMovie;

  @override
  void initState() {
    _responcePopularMovie = ApiManage().getPopular();
    _responceTopratedMovie = ApiManage().getTopRated();
    _responceUpcoming = ApiManage().getUpcoming();
    _responceNowPlayingMovie = ApiManage().getNowPlaying();
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Color.fromRGBO(17, 33, 49, 255),
      ),
      child: Scaffold(
          // backgroundColor: Color.fromRGBO(17, 33, 49, 255),
          backgroundColor: Color(0xFF112131),
          appBar: AppBar(
            title: Text('HotFLix Movies'),
          ),
          body: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  Column(
                    children: [
                      Row(
                        children: [
                          SizedBox(
                            width: 20,
                            height: 20,
                          ),
                          Text(
                            'Popular Movies',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 20,
                              color: Colors.white70,
                            ),
                            textAlign: TextAlign.left,
                          )
                        ],
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Container(
                        height: 365,
                        child: FutureBuilder<Welcome>(
                          future: _responcePopularMovie,
                          builder: (context, snapshot) {
                            if (!snapshot.hasData)
                              return Center(
                                child: CircularProgressIndicator(),
                              );
                            return ListView.builder(
                                itemCount: snapshot.data!.results.length,
                                scrollDirection: Axis.horizontal,
                                itemBuilder: (ctx, i) {
                                  var value = snapshot.data!.results[i];
                                  // print(value.originalTitle.toString());
                                  return ShowItemView(
                                    imdbid: value.id.toString(),
                                    poster: value.posterPath.trim(),
                                    title: value.originalTitle,
                                    year: value.releaseDate.toString(),
                                    overview: value.overview,
                                    voteRating: value.voteAverage,
                                    adult: value.adult,
                                  );
                                });
                          },
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      )
                    ],
                  ),
                  Column(
                    children: [
                      Row(
                        children: [
                          SizedBox(
                            width: 20,
                            height: 20,
                          ),
                          Text(
                            'TopRated Movies',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 20,
                              color: Colors.white70,
                            ),
                            textAlign: TextAlign.left,
                          )
                        ],
                      ),
                      Container(
                        height: 365,
                        child: FutureBuilder<Welcome>(
                          future: _responceTopratedMovie,
                          builder: (context, snapshot) {
                            if (!snapshot.hasData)
                              return Center(
                                child: CircularProgressIndicator(),
                              );
                            return ListView.builder(
                                itemCount: snapshot.data!.results.length,
                                scrollDirection: Axis.horizontal,
                                itemBuilder: (ctx, i) {
                                  var value = snapshot.data!.results[i];
                                  // print(value.originalTitle.toString());
                                  return ShowItemView(
                                    imdbid: value.id.toString(),
                                    poster: value.posterPath.trim(),
                                    title: value.originalTitle,
                                    year: value.releaseDate.toString(),
                                    overview: value.overview,
                                    voteRating: value.voteAverage,
                                    adult: value.adult,
                                  );
                                });
                          },
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      )
                    ],
                  ),
                  Column(
                    children: [
                      Row(
                        children: [
                          SizedBox(
                            width: 20,
                            height: 20,
                          ),
                          Text(
                            'Upcoming Movies',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 20,
                              color: Colors.white70,
                            ),
                            textAlign: TextAlign.left,
                          )
                        ],
                      ),
                      Container(
                        height: 365,
                        child: FutureBuilder<Welcome>(
                          future: _responceUpcoming,
                          builder: (context, snapshot) {
                            if (!snapshot.hasData)
                              return Center(
                                child: CircularProgressIndicator(),
                              );
                            return ListView.builder(
                                itemCount: snapshot.data!.results.length,
                                scrollDirection: Axis.horizontal,
                                itemBuilder: (ctx, i) {
                                  var value = snapshot.data!.results[i];
                                  // print(value.originalTitle.toString());
                                  return ShowItemView(
                                    imdbid: value.id.toString(),
                                    poster: value.posterPath.trim(),
                                    title: value.originalTitle,
                                    year: value.releaseDate.toString(),
                                    overview: value.overview,
                                    voteRating: value.voteAverage,
                                    adult: value.adult,
                                  );
                                });
                          },
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      )
                    ],
                  ),
                  Column(
                    children: [
                      Row(
                        children: [
                          SizedBox(
                            width: 20,
                            height: 20,
                          ),
                          Text(
                            'Now Playing Movies',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 20,
                              color: Colors.white70,
                            ),
                            textAlign: TextAlign.left,
                          )
                        ],
                      ),
                      Container(
                        height: 365,
                        child: FutureBuilder<Welcome>(
                          future: _responceNowPlayingMovie,
                          builder: (context, snapshot) {
                            if (!snapshot.hasData)
                              return Center(
                                child: CircularProgressIndicator(),
                              );
                            return ListView.builder(
                                itemCount: snapshot.data!.results.length,
                                scrollDirection: Axis.horizontal,
                                itemBuilder: (ctx, i) {
                                  var value = snapshot.data!.results[i];
                                  // print(value.originalTitle.toString());
                                  return ShowItemView(
                                    imdbid: value.id.toString(),
                                    poster: value.posterPath.trim(),
                                    title: value.originalTitle,
                                    year: value.releaseDate.toString(),
                                    overview: value.overview,
                                    voteRating: value.voteAverage,
                                    adult: value.adult,
                                  );
                                });
                          },
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      )
                    ],
                  ),
                ],
              ),
            ),
          )),
    );
  }
}
