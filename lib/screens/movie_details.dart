import 'package:flutter/material.dart';

class Movie_Details extends StatefulWidget {
  Movie_Details({Key? key}) : super(key: key);

  @override
  _Movie_DetailsState createState() => _Movie_DetailsState();
}

class _Movie_DetailsState extends State<Movie_Details> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Movie Detials"),
      ),
      body: Column(
        children: [
          Image(
            width: MediaQuery.of(context).size.width,
            height: 400,
            image: NetworkImage(
                "https://www.joblo.com/assets/images/joblo/posters/2019/01/IO-poster-1.jpg"),
          ),
          // ConstrainedBox(
          //   constraints: BoxConstraints(
          //     maxHeight: 400,
          //     minHeight: 350,
          //     maxWidth: MediaQuery.of(context).size.width,
          //     minWidth: MediaQuery.of(context).size.width,
          //   ),
          //   child:
          // ),
        ],
      ),
    );
  }
}
