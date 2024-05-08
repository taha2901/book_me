import 'package:finalabanob/features/home/data/book/datum.dart';
import 'package:finalabanob/features/home/presentation/view/widgets/book_details_section.dart';
import 'package:finalabanob/features/home/presentation/view/widgets/custom_book_details_app_bar.dart';
import 'package:flutter/material.dart';

class BookDetailsViewBody extends StatelessWidget {
  const BookDetailsViewBody({
    super.key,
    required this.bookModel,
  });
  final DataBooks bookModel;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverFillRemaining(
            hasScrollBody: false,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30),
              child: Column(
                children: [
                  const CustomBookDetailsAppBar(),
                  const SizedBox(height: 64,),
                  BookDetailsSection(
                    bookModel: bookModel,
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
