import 'package:bookmyfilm/data/Movie_info.dart';
import 'package:bookmyfilm/data/api_manager.dart';
import 'package:bookmyfilm/widgets/show_item_view.dart';
import 'package:flutter/material.dart';

class SimilarMovies extends StatefulWidget {
  final String movieId;
  SimilarMovies(this.movieId);

  @override
  _SimilarMoviesState createState() => _SimilarMoviesState();
}

class _SimilarMoviesState extends State<SimilarMovies> {
  var _responceSimilar;
  @override
  void initState() {
    _responceSimilar = ApiManage().getSimilarMovies(widget.movieId);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      Row(
        children: [
          SizedBox(
            width: 10,
            height: 10,
          ),
          Text(
            'Similar Movies',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 28,
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
          future: _responceSimilar,
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
    ]);
  }
}
