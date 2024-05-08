import 'package:finalabanob/core/helper/cach.dart';
import 'package:finalabanob/features/auth/presentation/view/login.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class OnBoardingScreen extends StatefulWidget {
  const OnBoardingScreen({super.key});

  @override
  State<OnBoardingScreen> createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {
  var boardController = PageController();

  final List<OnBoardingModel> board = [
    OnBoardingModel(
        title: 'E-Bookstore',
        body:
            'We are here to help you discover the wonderful world of books. Start your journey now and enjoy a unique reading experience.',
        image: 'assets/1.jpg'),
    OnBoardingModel(
        title: 'Choose your preferences,',
        body:
            'Tell us about your interests and choose the sections you would like to explore. We will provide you with the perfect books based on your preferences.',
        image: 'assets/2.jpg'),
    OnBoardingModel(
        title: 'journey of discovery',
        body:
            'Explore our wide range of books, search, review reviews, and choose the books you want to read. From suspense novels to science books, you\'ll find everything you\'re looking for here.',
        image: 'assets/3.jpg'),
  ];
  bool islast = false;
  void submit() {
    ChachHelper.saveData(key: 'onBoarding', value: true).then((value) {
      if (value) {
        Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(
            builder: (context) => const LoginScreen(),
          ),
          (route) => false,
        );
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(0.0),
        child: Column(
          children: [
            Expanded(
              child: PageView.builder(
                physics: const BouncingScrollPhysics(),
                controller: boardController,
                onPageChanged: (int index) {
                  if (index == board.length - 1) {
                    setState(() {
                      islast = true;
                    });
                    print('Last');
                  } else {
                    print('Not Last');
                    setState(() {
                      islast = false;
                    });
                  }
                },
                itemBuilder: (context, index) {
                  return BuildBoardingItem(
                    board: board[index],
                  );
                },
                itemCount: board.length,
              ),
            ),
            const SizedBox(
              height: 40.0,
            ),
            Padding(
              padding: const EdgeInsets.all(16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  TextButton(
                    onPressed: () {
                      submit();
                    },
                    child: const Text(
                      'SKIP',
                    ),
                  ),
                  SmoothPageIndicator(
                    controller: boardController,
                    count: board.length,
                    effect: const ExpandingDotsEffect(
                      dotColor: Colors.grey,
                      dotHeight: 10.0,
                      expansionFactor: 4,
                      dotWidth: 10,
                      spacing: 5,
                    ),
                  ),
                  // const Spacer(),
                  FloatingActionButton(
                    onPressed: () {
                      if (islast) {
                        submit();
                      } else {
                        boardController.nextPage(
                          duration: const Duration(
                            milliseconds: 750,
                          ),
                          curve: Curves.fastLinearToSlowEaseIn,
                        );
                      }
                    },
                    child: const Icon(Icons.arrow_forward_ios),
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

class OnBoardingModel {
  final String image;
  final String title;
  final String body;

  OnBoardingModel(
      {required this.image, required this.title, required this.body});
}

// ignore: must_be_immutable
class CurveClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    final path = Path();
    path.lineTo(0, size.height - 50); // بداية القطع من أعلى يسار الصورة
    path.quadraticBezierTo(size.width / 2.3, size.height, size.width, size.height - 60); // منحنى courve
    path.lineTo(size.width, 0); // النهاية من أسفل يمين الصورة
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}

class BuildBoardingItem extends StatelessWidget {
  BuildBoardingItem({
    super.key,
    required this.board,
  });

  final OnBoardingModel board;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        ClipPath(
          clipper: CurveClipper(),
          child: Image(
            height: MediaQuery.of(context).size.height / 2, 
            width: double.infinity,
            fit: BoxFit.cover,
            image: AssetImage(board.image),
          ),
        ),
        Positioned(
          bottom: 110,
          left: 0,
          right: 0,
          child: Container(
            decoration: const BoxDecoration(
              // color: Colors.white,
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16), 
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Center(
                    child: Text(
                      board.title,
                      style: const TextStyle(
                        fontSize: 24.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 10.0,
                  ),
                  Text(
                    board.body,
                    style: const TextStyle(
                      fontSize: 14,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
