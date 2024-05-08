import 'package:carousel_slider/carousel_slider.dart';
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
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: CarouselSlider(
              items: book?.data!
                  .map(
                    (e) => Image(
                      image: NetworkImage(
                          '${e.cover ?? 'https://res.cloudinary.com/dswhy0qpi/image/upload/v1715001307/elkuryqdvod9sx21xnef.jpg'}'),
                      width: double.infinity,
                      fit: BoxFit.fill,
                    ),
                  )
                  .toList(),
              options: CarouselOptions(
                height: 250,
                initialPage: 0,
                viewportFraction: 1.0,
                enableInfiniteScroll: true,
                reverse: false,
                autoPlay: true,
                autoPlayInterval: const Duration(seconds: 3),
                autoPlayAnimationDuration: const Duration(seconds: 1),
                autoPlayCurve: Curves.fastOutSlowIn,
                scrollDirection: Axis.horizontal,
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
            builder: (context) => BookDetailsViewBody(bookModel: books,),
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

