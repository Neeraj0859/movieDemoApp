import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:great_movie/models/movie_list_model.dart';

class MovieDetail extends StatefulWidget {
  final Movies movies;

  MovieDetail(this.movies);
  @override
  _MovieDetailState createState() => _MovieDetailState();
}

class _MovieDetailState extends State<MovieDetail> {
  String moviePoster;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    moviePoster = widget.movies.thumbnail.replaceAll("/thumb/", "/medium/");
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
            padding: EdgeInsets.only(top: Get.height / 20, right: 16),
            child: Row(
              children: [
                IconButton(
                    icon: Icon(Icons.arrow_back_ios_rounded),
                    onPressed: () {
                      Get.back();
                    }),
                Spacer(),
                Text(
                  "${widget.movies.name} (${widget.movies.year})",
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
              ],
            ),
          ),
          Container(
            alignment: Alignment.center,
            height: Get.height / 1.15,
            padding: EdgeInsets.only(left: 16, right: 16),
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
                top: Radius.circular(10),
              ),
            ),
            child: SingleChildScrollView(
              physics: BouncingScrollPhysics(),
              child: Column(
                children: [
                  SizedBox(
                    height: Get.height / 40,
                  ),
                  Container(
                    height: Get.height / 3,
                    decoration: BoxDecoration(boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.2),
                        offset: Offset(2, 2),
                        blurRadius: 7,
                      ),
                    ], color: Colors.grey[300]),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: Image.network(
                        moviePoster,
                        height: Get.height / 3,
                        fit: BoxFit.contain,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: Get.height / 40,
                  ),
                  Row(
                    children: [
                      Text(
                        "Description",
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
                          color: Colors.blue[800],
                        ),
                      ),
                      SizedBox(
                        width: 16,
                      ),
                      Expanded(
                        child: Container(
                          height: 10,
                          decoration: BoxDecoration(
                              color: Colors.blue[800],
                              borderRadius: BorderRadius.circular(40),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.black.withOpacity(0.1),
                                  offset: Offset(0, 2),
                                  blurRadius: 5,
                                )
                              ]),
                        ),
                      ),
                    ],
                  ),
                  Padding(
                    padding: EdgeInsets.all(16),
                    child: Row(
                      children: [
                        Expanded(
                          child: Container(
                            child: Text(
                              widget.movies.description.length == 0
                                  ? "Not Found"
                                  : widget.movies.description,
                              style: TextStyle(
                                fontSize: 18,
                                color: Colors.blue[600],
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                  Row(
                    children: [
                      Text(
                        "Genres",
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
                          color: Colors.blue[800],
                        ),
                      ),
                      SizedBox(
                        width: 16,
                      ),
                      Expanded(
                        child: Container(
                          height: 10,
                          decoration: BoxDecoration(
                              color: Colors.blue[800],
                              borderRadius: BorderRadius.circular(40),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.black.withOpacity(0.1),
                                  offset: Offset(0, 2),
                                  blurRadius: 5,
                                )
                              ]),
                        ),
                      ),
                    ],
                  ),
                  ListView.builder(
                    physics: NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    padding: EdgeInsets.all(16),
                    itemBuilder: (BuildContext context, int index) {
                      return Row(
                        children: [
                          Icon(
                            Icons.arrow_forward_ios_rounded,
                            color: Colors.blue[600],
                          ),
                          SizedBox(
                            width: 5,
                          ),
                          Text(
                            widget.movies.genres[index],
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              shadows: [
                                Shadow(
                                  color: Colors.black.withOpacity(0.1),
                                  offset: Offset(2, 2),
                                  blurRadius: 2,
                                ),
                              ],
                              fontSize: 18,
                              color: Colors.blue[600],
                            ),
                          )
                        ],
                      );
                    },
                    itemCount: widget.movies.genres.length,
                  ),
                  Row(
                    children: [
                      Text(
                        "Director",
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
                          color: Colors.blue[800],
                        ),
                      ),
                      SizedBox(
                        width: 16,
                      ),
                      Expanded(
                        child: Container(
                          height: 10,
                          decoration: BoxDecoration(
                            color: Colors.blue[800],
                            borderRadius: BorderRadius.circular(40),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black.withOpacity(0.1),
                                offset: Offset(0, 2),
                                blurRadius: 5,
                              )
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                  Padding(
                    padding: EdgeInsets.all(16),
                    child: Row(
                      children: [
                        Icon(
                          Icons.arrow_forward_ios_rounded,
                          color: Colors.blue[600],
                        ),
                        SizedBox(
                          width: 5,
                        ),
                        Text(
                          widget.movies.director.length == 0
                              ? "Not Found"
                              : widget.movies.director,
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            shadows: [
                              Shadow(
                                color: Colors.black.withOpacity(0.1),
                                offset: Offset(2, 2),
                                blurRadius: 2,
                              ),
                            ],
                            fontSize: 18,
                            color: Colors.blue[600],
                          ),
                        )
                      ],
                    ),
                  ),
                  Row(
                    children: [
                      Text(
                        "Main Star",
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
                          color: Colors.blue[800],
                        ),
                      ),
                      SizedBox(
                        width: 16,
                      ),
                      Expanded(
                        child: Container(
                          height: 10,
                          decoration: BoxDecoration(
                              color: Colors.blue[800],
                              borderRadius: BorderRadius.circular(40),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.black.withOpacity(0.1),
                                  offset: Offset(0, 2),
                                  blurRadius: 5,
                                )
                              ]),
                        ),
                      ),
                    ],
                  ),
                  Padding(
                    padding: EdgeInsets.all(16),
                    child: Row(
                      children: [
                        Icon(
                          Icons.arrow_forward_ios_rounded,
                          color: Colors.blue[600],
                        ),
                        SizedBox(
                          width: 5,
                        ),
                        Text(
                          widget.movies.mainStar.length == 0
                              ? "Not Found"
                              : widget.movies.mainStar,
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            shadows: [
                              Shadow(
                                color: Colors.black.withOpacity(0.1),
                                offset: Offset(2, 2),
                                blurRadius: 2,
                              ),
                            ],
                            fontSize: 18,
                            color: Colors.blue[600],
                          ),
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
