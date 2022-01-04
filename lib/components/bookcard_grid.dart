import 'package:flutter/material.dart';
import 'package:library_app/model/books_data.model.dart';

class BookCardGridView extends StatelessWidget {
  const BookCardGridView({
    Key? key,
    required this.booksData,
    required this.constraints,
    required this.index,
  }) : super(key: key);

  final BooksData booksData;
  final BoxConstraints constraints;
  final int index;

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: const BoxConstraints(minHeight: 250),
      width: constraints.maxWidth * 0.45,
      padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 10),
      margin: const EdgeInsets.symmetric(horizontal: 5, vertical: 10),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.white60, width: 2),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        children: [
          Image.network(
            booksData.books[index].image,
            fit: BoxFit.fitHeight,
            width: constraints.maxWidth,
            height: 200,
          ),
          Text(
            booksData.books[index].title,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 15,
              fontWeight: FontWeight.w900,
            ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                onPressed: () {},
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
