import 'package:finalabanob/features/home/data/book/book.dart';
import 'package:finalabanob/features/home/data/book/datum.dart';
import 'package:finalabanob/features/home/presentation/manager/cubit/home_cubit.dart';
import 'package:finalabanob/features/home/presentation/manager/cubit/home_state.dart';
import 'package:finalabanob/features/home/presentation/view/widgets/book_details_view_body.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomeCubit, HomeState>(
      listener: (context, state) {},
      builder: (context, state) {
        if (state is BooksLoadingState) {
          return const Center(child: CircularProgressIndicator());
        } else if (state is BooksSuccessState) {
          return HomeBuilder(
            book: HomeCubit.get(context).book!,
          );
        } else if (state is BooksErrorState) {
          return Center(child: Text('Error: ${state.error}'));
        } else {
          return const SizedBox();
        }
      },
    );
  }
}

class HomeBuilder extends StatelessWidget {
  const HomeBuilder({super.key, this.book});
  final Book? book;
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Popular Books',
            style: TextStyle(fontSize: 26, fontWeight: FontWeight.bold),
          ),
          const SizedBox(
            height: 8,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: SizedBox(
              height: MediaQuery.of(context).size.height * 0.25,
              child: ListView.builder(
                physics: const BouncingScrollPhysics(),
                itemCount: book?.data?.length,
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8),
                    child: Image.network('${book?.data?[index].cover}'),
                  );
                },
              ),
            ),
          ),
          const SizedBox(
            height: 20.0,
          ),
          const Padding(
            padding: EdgeInsets.all(8.0),
            child: Text(
              'Books',
              style: TextStyle(fontSize: 26, fontWeight: FontWeight.bold),
            ),
          ),
          const SizedBox(
            height: 20.0,
          ),
          ProductGridView(home: book!),
        ],
      ),
    );
  }
}

class ShowingBooks extends StatelessWidget {
  const ShowingBooks({
    super.key,
    required this.books,
  });

  final DataBooks? books;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Image.network('${books!.cover}'),
        Text('${books!.title}'),
      ],
    );
  }
}

class ProductGridView extends StatelessWidget {
  const ProductGridView({
    super.key,
    required this.home,
  });

  final Book home;

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double aspectRatio = screenWidth / 2 / ((screenWidth / 2) * 1.60);
    return Container(
      // color: Theme.of(context).scaffoldBackgroundColor,
      color: Colors.black,
      child: GridView.count(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        crossAxisCount: 2,
        mainAxisSpacing: 1.0,
        crossAxisSpacing: 1.0,
        childAspectRatio: aspectRatio,
        children: List.generate(
          home.data!.length,
          (index) => BuildGridProducts(
            books: home.data![index],
          ),
        ),
      ),
    );
  }
}

class BuildGridProducts extends StatelessWidget {
  const BuildGridProducts({
    required this.books,
    super.key,
  });

  final DataBooks books;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => BookDetailsViewBody(
              bookModel: books,
            ),
          ),
        );
      },
      child: Container(
        color: Theme.of(context).scaffoldBackgroundColor,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Stack(
              alignment: AlignmentDirectional.bottomStart,
              children: [
                Image(
                  image: NetworkImage('${books.cover}'),
                  width: double.infinity,
                  height: 200.0,
                ),
                if (books.newPrice != 0)
                  Container(
                    color: Colors.red,
                    padding: const EdgeInsets.symmetric(horizontal: 5.0),
                    child: const Text(
                      'Discount',
                      style: TextStyle(fontSize: 8.0, color: Colors.white),
                    ),
                  ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    '${books.description}',
                    maxLines: 2,
                    style: const TextStyle(fontSize: 14.0, height: 1.3),
                    overflow: TextOverflow.ellipsis,
                  ),
                  Row(
                    children: [
                      Text(
                        '${books.price!.round()} \$',
                        style: const TextStyle(fontSize: 12.0),
                      ),
                      const SizedBox(
                        width: 5.0,
                      ),
                      if (books.newPrice != 0)
                        Text(
                          '${books.newPrice!.round()} \$',
                          style: const TextStyle(
                              fontSize: 10.0,
                              color: Colors.grey,
                              decoration: TextDecoration.lineThrough),
                        ),
                      const Spacer(),
                      IconButton(
                        onPressed: () {},
                        icon: const CircleAvatar(
                          radius: 15.0,
                          backgroundColor: Colors.grey,
                          child: Icon(
                            Icons.favorite_border,
                            size: 16.0,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
