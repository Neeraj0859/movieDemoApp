import 'dart:convert';
import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:great_movie/models/movie_list_model.dart';
import 'package:great_movie/movie_detail.dart';
import 'package:great_movie/movies_data.dart';

class MovieList extends StatefulWidget {
  @override
  _MovieListState createState() => _MovieListState();
}

class _MovieListState extends State<MovieList> {
  MovieListModel movieList;
  var data;
  @override
  void initState() {
    data = jsonDecode(moviesData);
    data.forEach((element) {
      setState(() {
        movie.add(element);
      });
    });
    // TODO: implement initState
    super.initState();
  }

  int selectedIndex;
  String filter;
  List movie = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text("MOVIES"),
        actions: [
          DropdownButton(
            underline: SizedBox(),
            icon: Icon(
              Icons.keyboard_arrow_down,
              color: Colors.white,
            ),
            hint: Text(
              "Filter",
              style: TextStyle(color: Colors.white),
            ),
            onChanged: (value) {
              movie.clear();
              if (value == "All") {
                data.forEach((element) {
                  setState(() {
                    filter = value;
                    movie.add(element);
                  });
                });
              } else {
                data.forEach((element) {
                  if (element["genres"].contains(value)) {
                    setState(() {
                      filter = value;
                      movie.add(element);
                    });
                  }
                });
              }
            },
            value: filter,
            style: TextStyle(color: Colors.white),
            items: [
              DropdownMenuItem(
                child: Text(
                  "All",
                  style: TextStyle(color: Colors.blue),
                ),
                value: "All",
              ),
              DropdownMenuItem(
                child: Text(
                  "Action",
                  style: TextStyle(color: Colors.blue),
                ),
                value: "Action",
              ),
              DropdownMenuItem(
                child: Text(
                  "Comedy",
                  style: TextStyle(color: Colors.blue),
                ),
                value: "Comedy",
              ),
              DropdownMenuItem(
                child: Text(
                  "Thriller",
                  style: TextStyle(color: Colors.blue),
                ),
                value: "Thriller",
              ),
            ],
          )
        ],
      ),
      drawer: Drawer(),
      backgroundColor: Colors.black,
      body: LayoutBuilder(
        builder: (BuildContext context, BoxConstraints constraints) {
          return GridView.builder(
            padding: EdgeInsets.all(10),
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: constraints.maxWidth ~/ 150,
                childAspectRatio: 0.6,
                crossAxisSpacing: 10,
                mainAxisSpacing: 10),
            itemBuilder: (context, index) {
              return FadeInDown(
                duration: Duration(milliseconds: 300),
                child: InkWell(
                  onHover: (value) {
                    setState(() {
                      selectedIndex = index;
                    });
                  },
                  onTap: () {
                    Get.to(() => MovieDetails(
                          title: movie[index]["title"],
                          imageUrl: movie[index]["posterurl"],
                          storyline: movie[index]["storyline"],
                          generes: movie[index]["genres"],
                          actors: movie[index]["actors"],
                        ));
                  },
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(5),
                    child: Hero(
                      tag: movie[index]["posterurl"],
                      child: AnimatedContainer(
                        duration: Duration(milliseconds: 300),
                        width: Get.width,
                        decoration: BoxDecoration(
                          image: DecorationImage(
                              image: NetworkImage(movie[index]["posterurl"]),
                              fit: BoxFit.cover),
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Material(
                              child: Container(
                                  padding: EdgeInsets.symmetric(vertical: 2),
                                  alignment: Alignment.center,
                                  decoration: BoxDecoration(
                                    color: Colors.blue[900],
                                  ),
                                  child: Text(
                                    movie[index]["title"],
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        color: Colors.white),
                                  )),
                            ),
                            Material(
                              child: Container(
                                  padding: EdgeInsets.symmetric(vertical: 2),
                                  alignment: Alignment.center,
                                  decoration: BoxDecoration(
                                    color: Colors.blue[900],
                                  ),
                                  child: Text(
                                    movie[index]["year"],
                                    style: TextStyle(color: Colors.white),
                                  )),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              );
            },
            itemCount: movie.length,
          );
        },
      ),
    );
  }
}
