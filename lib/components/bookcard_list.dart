import 'package:flutter/material.dart';
import 'package:library_app/model/books_data.model.dart';
import 'package:url_launcher/url_launcher.dart';

class BookCardListView extends StatelessWidget {
  const BookCardListView(
      {Key? key,
      required this.booksData,
      required this.constraints,
      required this.index})
      : super(key: key);

  final BooksData booksData;
  final BoxConstraints constraints;
  final int index;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: constraints.maxWidth,
      height: 100,
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      margin: const EdgeInsets.all(5),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.white60, width: 2),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Image.network(
            booksData.books[index].image,
            fit: BoxFit.cover,
            height: 100,
          ),
          SizedBox(
            width: constraints.maxWidth * 0.45,
            child: Text(
              booksData.books[index].title,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 15,
                fontWeight: FontWeight.w900,
              ),
              textAlign: TextAlign.center,
            ),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Text(
                booksData.books[index].price,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 15,
                  fontWeight: FontWeight.w900,
                ),
              ),
              MaterialButton(
                color: Colors.blueGrey,
                onPressed: () {
                  launch(booksData.books[index].url);
                },
                child: const Text(
                  "buy",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 15,
                    fontWeight: FontWeight.w900,
                  ),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
