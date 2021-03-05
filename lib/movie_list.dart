import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:great_movie/models/movie_list_model.dart';
import 'package:great_movie/movie_detail.dart';
import 'package:great_movie/services/get_movies.dart';

class MovieList extends StatefulWidget {
  @override
  _MovieListState createState() => _MovieListState();
}

class _MovieListState extends State<MovieList> {
  MovieListModel movieList;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(
      alignment: Alignment.bottomCenter,
      children: [
        Container(
          alignment: Alignment.topCenter,
          color: Colors.blue[300],
          padding: EdgeInsets.only(top: Get.height / 15, right: 16),
          child: Text(
            "Movies List",
            style: TextStyle(
                fontWeight: FontWeight.bold,
                shadows: [
                  Shadow(
                    color: Colors.black.withOpacity(0.1),
                    offset: Offset(2, 2),
                    blurRadius: 2,
                  ),
                ],
                fontSize: 22,
                color: Colors.white),
          ),
        ),
        Container(
          height: Get.height / 1.15,
          decoration: BoxDecoration(
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.1),
                blurRadius: 7,
                offset: Offset(0, -4),
              ),
            ],
            borderRadius: BorderRadius.vertical(
              top: Radius.circular(7),
            ),
          ),
          child: FutureBuilder(
            future: getMovies(),
            builder: (context, snap) {
              if (snap.hasData) {
                return ListView.builder(
                  physics: BouncingScrollPhysics(),
                  padding: EdgeInsets.symmetric(vertical: 16),
                  itemBuilder: (BuildContext context, int index) {
                    movieList = snap.data;
                    Movies movieData = movieList.data.movies[index];
                    return GestureDetector(
                      onTap: () {
                        Get.to(() => MovieDetail(movieData));
                      },
                      child: Container(
                        margin:
                            EdgeInsets.only(bottom: 16, left: 16, right: 16),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(5),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withOpacity(0.1),
                              offset: Offset(4, 4),
                              blurRadius: 7,
                            )
                          ],
                        ),
                        child: Row(
                          children: [
                            Container(
                              decoration: BoxDecoration(boxShadow: [
                                BoxShadow(
                                  color: Colors.black.withOpacity(0.2),
                                  offset: Offset(2, 2),
                                  blurRadius: 7,
                                )
                              ], color: Colors.grey[300]),
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(5),
                                child: Image.network(
                                  movieData.thumbnail,
                                  fit: BoxFit.cover,
                                  height: Get.height / 6,
                                  width: Get.height / 8,
                                ),
                              ),
                            ),
                            SizedBox(
                              width: Get.width / 10,
                            ),
                            Text(
                              movieData.name,
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  shadows: [
                                    Shadow(
                                      color: Colors.black.withOpacity(0.1),
                                      offset: Offset(2, 2),
                                      blurRadius: 2,
                                    ),
                                  ],
                                  fontSize: 20,
                                  color: Colors.blue[900]),
                            ),
                            Spacer(),
                            Container(
                              alignment: Alignment.center,
                              width: Get.width / 5,
                              height: Get.height / 6,
                              decoration: BoxDecoration(
                                color: Colors.blue[900],
                                borderRadius: BorderRadius.horizontal(
                                  right: Radius.circular(5),
                                ),
                              ),
                              child: Text(
                                movieData.year,
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    shadows: [
                                      Shadow(
                                        color: Colors.black.withOpacity(0.2),
                                        offset: Offset(2, 2),
                                        blurRadius: 2,
                                      ),
                                    ],
                                    color: Colors.white),
                              ),
                            )
                          ],
                        ),
                      ),
                    );
                  },
                  itemCount: snap.data.data.movies.length,
                );
              } else {
                return Center(child: CircularProgressIndicator());
              }
            },
          ),
        ),
      ],
    ));
  }
}
