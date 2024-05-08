import 'package:finalabanob/features/home/data/book/datum.dart';
import 'package:flutter/material.dart';

class BookRating extends StatelessWidget {
  const BookRating({
    super.key,
    this.mainAxisAlignment = MainAxisAlignment.start,
    required this.books,
  });
  final MainAxisAlignment mainAxisAlignment;
  final DataBooks books;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Icon(
          Icons.star,
          color: Color(0xffFFDD4F),
        ),
        const SizedBox(
          width: 6.3,
        ),
        Text(
          '${books.rating}',
          style: const TextStyle(fontSize: 16),
        ),
        const SizedBox(
          width: 4,
        ),
        Text(
          '(${books.averageRating})',
          style:const TextStyle(fontSize: 14, color: Color(0xff707070)),
        ),
      ],
    );
  }
}
