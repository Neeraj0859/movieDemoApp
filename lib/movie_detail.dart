import 'dart:ui';

import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MovieDetails extends StatefulWidget {
  final String title;
  final String imageUrl;
  final String storyline;
  final List generes;
  final List actors;
  MovieDetails(
      {this.imageUrl, this.storyline, this.title, this.generes, this.actors});
  @override
  _MovieDetailsState createState() => _MovieDetailsState();
}

class _MovieDetailsState extends State<MovieDetails> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(widget.title),
          backgroundColor: Colors.black,
        ),
        body: LayoutBuilder(
          builder: (context, constraints) {
            print(constraints.maxWidth);
            return Stack(
              children: [
                Hero(
                  tag: widget.imageUrl,
                  child: Container(
                    width: constraints.maxWidth,
                    height: constraints.maxHeight,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                          image: NetworkImage(widget.imageUrl),
                          fit: BoxFit.cover),
                    ),
                    child: ClipRRect(
                      child: BackdropFilter(
                        filter: ImageFilter.blur(sigmaY: 7, sigmaX: 7),
                        child: new Container(
                          decoration: new BoxDecoration(
                            color: Colors.black.withOpacity(0.4),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                constraints.maxWidth >= 1000
                    ? Row(
                        children: [
                          Expanded(
                            child: ZoomIn(
                              child: Container(
                                height: constraints.maxHeight,
                                padding:
                                    EdgeInsets.all(constraints.maxWidth / 10),
                                child: Image.network(
                                  widget.imageUrl,
                                ),
                              ),
                            ),
                          ),
                          Expanded(
                            child: Container(
                                color: Colors.black.withOpacity(0.4),
                                height: constraints.maxHeight,
                                padding:
                                    EdgeInsets.all(constraints.maxWidth / 10),
                                child: Column(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: [
                                    Row(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Expanded(
                                          child: Container(
                                            padding: EdgeInsets.all(10),
                                            decoration: BoxDecoration(
                                                color: Colors.black
                                                    .withOpacity(0.3),
                                                borderRadius:
                                                    BorderRadius.circular(5)),
                                            child: Row(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                FadeInUp(
                                                  child: Text(
                                                    "Actors : ",
                                                    style: TextStyle(
                                                        color: Colors.white,
                                                        fontSize: constraints
                                                                .maxHeight /
                                                            50),
                                                  ),
                                                ),
                                                Expanded(
                                                  child: ListView.builder(
                                                    shrinkWrap: true,
                                                    itemBuilder:
                                                        (BuildContext context,
                                                            int index) {
                                                      return FadeInUp(
                                                        child: Text(
                                                          widget.actors[index],
                                                          style: TextStyle(
                                                              color:
                                                                  Colors.white,
                                                              fontSize: constraints
                                                                      .maxHeight /
                                                                  50),
                                                        ),
                                                      );
                                                    },
                                                    itemCount:
                                                        widget.generes.length,
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                        SizedBox(
                                          width: 10,
                                        ),
                                        Expanded(
                                          child: Container(
                                            padding: EdgeInsets.all(10),
                                            decoration: BoxDecoration(
                                                color: Colors.black
                                                    .withOpacity(0.3),
                                                borderRadius:
                                                    BorderRadius.circular(5)),
                                            child: Row(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                FadeInUp(
                                                  child: Text(
                                                    "Genres : ",
                                                    style: TextStyle(
                                                        color: Colors.white,
                                                        fontSize: constraints
                                                                .maxHeight /
                                                            50),
                                                  ),
                                                ),
                                                Expanded(
                                                  child: ListView.builder(
                                                    shrinkWrap: true,
                                                    itemBuilder:
                                                        (BuildContext context,
                                                            int index) {
                                                      return FadeInUp(
                                                        child: Text(
                                                          widget.generes[index],
                                                          style: TextStyle(
                                                              color:
                                                                  Colors.white,
                                                              fontSize: constraints
                                                                      .maxHeight /
                                                                  50),
                                                        ),
                                                      );
                                                    },
                                                    itemCount:
                                                        widget.generes.length,
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        )
                                      ],
                                    ),
                                    FadeInRight(
                                      child: Text(
                                        widget.storyline,
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontSize:
                                                constraints.maxHeight / 50),
                                      ),
                                    )
                                  ],
                                )),
                          ),
                        ],
                      )
                    : Column(
                        children: [
                          Expanded(
                            child: ZoomIn(
                              child: Container(
                                padding:
                                    EdgeInsets.all(constraints.maxWidth / 10),
                                child: Image.network(
                                  widget.imageUrl,
                                ),
                              ),
                            ),
                          ),
                          Expanded(
                            child: Container(
                                alignment: Alignment.center,
                                color: Colors.black.withOpacity(0.4),
                                padding:
                                    EdgeInsets.all(constraints.maxWidth / 10),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: [
                                    Row(
                                      children: [
                                        Expanded(
                                          child: Container(
                                            padding: EdgeInsets.all(10),
                                            decoration: BoxDecoration(
                                                color: Colors.black
                                                    .withOpacity(0.3),
                                                borderRadius:
                                                    BorderRadius.circular(5)),
                                            child: Row(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                FadeInUp(
                                                  child: Text(
                                                    "Actors : ",
                                                    style: TextStyle(
                                                        color: Colors.white,
                                                        fontSize: constraints
                                                                .maxHeight /
                                                            50),
                                                  ),
                                                ),
                                                Expanded(
                                                  child: ListView.builder(
                                                    shrinkWrap: true,
                                                    itemBuilder:
                                                        (BuildContext context,
                                                            int index) {
                                                      return FadeInUp(
                                                        child: Text(
                                                          widget.actors[index],
                                                          style: TextStyle(
                                                              color:
                                                                  Colors.white,
                                                              fontSize: constraints
                                                                      .maxHeight /
                                                                  50),
                                                        ),
                                                      );
                                                    },
                                                    itemCount:
                                                        widget.generes.length,
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                        SizedBox(
                                          width: 10,
                                        ),
                                        Expanded(
                                          child: Container(
                                            padding: EdgeInsets.all(10),
                                            decoration: BoxDecoration(
                                                color: Colors.black
                                                    .withOpacity(0.3),
                                                borderRadius:
                                                    BorderRadius.circular(5)),
                                            child: Row(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                FadeInUp(
                                                  child: Text(
                                                    "Genres : ",
                                                    style: TextStyle(
                                                        color: Colors.white,
                                                        fontSize: constraints
                                                                .maxHeight /
                                                            50),
                                                  ),
                                                ),
                                                Expanded(
                                                  child: ListView.builder(
                                                    shrinkWrap: true,
                                                    itemBuilder:
                                                        (BuildContext context,
                                                            int index) {
                                                      return FadeInUp(
                                                        child: Text(
                                                          widget.generes[index],
                                                          style: TextStyle(
                                                              color:
                                                                  Colors.white,
                                                              fontSize: constraints
                                                                      .maxHeight /
                                                                  50),
                                                        ),
                                                      );
                                                    },
                                                    itemCount:
                                                        widget.generes.length,
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        )
                                      ],
                                    ),
                                    FadeInUp(
                                      child: Text(
                                        widget.storyline,
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontSize:
                                                constraints.maxHeight / 50),
                                      ),
                                    ),
                                  ],
                                )),
                          ),
                        ],
                      )
              ],
            );
          },
        ));
  }
}
