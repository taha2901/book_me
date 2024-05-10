import 'package:finalabanob/core/widgets/custom_button.dart';
import 'package:finalabanob/features/home/data/book/datum.dart';
import 'package:finalabanob/features/home/presentation/view/widgets/book_ratings.dart';
import 'package:flutter/material.dart';

class BookDetailsSection extends StatelessWidget {
  const BookDetailsSection({
    super.key,
    required this.bookModel,
  });
  final DataBooks bookModel;

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: width * 0.17),
          child: Image.network('${bookModel.cover}'),
        ),
        SizedBox(
          height: MediaQuery.of(context).size.height * 0.001,
        ),
        Text(
          '${bookModel.title}',
          textAlign: TextAlign.center,
          style: const TextStyle(fontSize: 30),
        ),
        const SizedBox(
          height: 6,
        ),
        Text(
          '${bookModel.author!.firstName}${bookModel.author!.lastName}',
          style: const TextStyle(fontSize: 18),
        ),
        const SizedBox(
          height: 18,
        ),
        BookRating(
          mainAxisAlignment: MainAxisAlignment.center,
          books: bookModel,
        ),
        const SizedBox(
          height: 16,
        ),
        Text(
          textAlign: TextAlign.end,
          '${bookModel.author!.bio}',
          style: const TextStyle(fontSize: 16, color: Colors.grey),
          maxLines: 3,
          overflow: TextOverflow.ellipsis,
        ),
        const SizedBox(
          height: 16,
        ),
        const ButtonsDetails(),
      ],
    );
  }
}

class ButtonsDetails extends StatelessWidget {
  const ButtonsDetails({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: CustomButton(
            circular: 10,
            height: 50,
            text: 'Preview',
            icon: Icons.preview,
            color: const Color.fromARGB(179, 247, 238, 238),
          ),
        ),
        const SizedBox(width: 10,),
        Expanded(
        
          child: CustomButton(
            circular: 10,
            height: 50,
            text: 'Reviews',
            icon: Icons.rate_review_outlined,
            color: const Color.fromARGB(179, 247, 238, 238),
          ),
        ),
      ],
    );
  }
}
