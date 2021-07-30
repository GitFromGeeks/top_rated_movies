import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

class Home_Page extends StatefulWidget {
  @override
  _Home_PageState createState() => _Home_PageState();
}

class _Home_PageState extends State<Home_Page> {
  final String Url =
      "https://api.themoviedb.org/3/movie/top_rated?api_key=48931aef8b6fbe5d30db83c772068353";
  List data = [];

// https://api.themoviedb.org/3/movie/top_rated?api_key=48931aef8b6fbe5d30db83c772068353
  @override
  void initState() {
    super.initState();
    getMovieList();
  }

  getMovieList() async {
    var jsonResponse;
    try {
      var response = await http.get(Uri.parse(Url));
      if (response.statusCode == 200) {
        print("OK status code 200");
        jsonResponse = json.decode(response.body);
        setState(() {
          data = jsonResponse['results'];
        });
        return jsonResponse;
      } else {
        print(" Error Found ");
      }
    } catch (e) {
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Top Rated Movies'),
        ),
        body: Container(
          child: ListView.builder(
            itemCount: data == null ? 0 : data.length,
            itemBuilder: (BuildContext context, int index) {
              return Card(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0)),
                elevation: 4.0,
                child: Column(
                  children: [
                    ListTile(
                      onTap: () =>
                          Navigator.of(context).pushNamed('/movie_detials'),
                      leading: ConstrainedBox(
                        constraints: BoxConstraints(
                          maxHeight: 100,
                          maxWidth: 100,
                          minHeight: 44,
                          minWidth: 44,
                        ),
                        child: Image(
                          image: NetworkImage('http://image.tmdb.org/t/p/w500' +
                              data[index]['poster_path']),
                        ),
                      ),
                      title: Text(
                        data[index]['original_title'],
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 15.0,
                        ),
                      ),
                      subtitle: Text(data[index]['original_language']),
                    ),
                  ],
                ),
              );
            },
          ),
        ));
  }
}
