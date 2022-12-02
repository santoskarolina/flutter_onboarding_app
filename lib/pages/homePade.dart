import 'package:flutter/material.dart';
import 'package:onboarding/models/screenData.dart';
import 'package:onboarding/widgets/Siglepage.dart';

class Homepage extends StatefulWidget {
  const Homepage({key});
  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  late PageController _controller = PageController();

  int _currentIndex = 0;

  @override
  void initState() {
    super.initState();

    _controller.addListener(() {
      if (_controller.page!.round() != _currentIndex) {
        setState(() {
          _currentIndex = _controller.page!.round();
        });
      }
    });
    _controller = PageController(initialPage: 0);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: PageView.builder(
                physics: const BouncingScrollPhysics(),
                controller: _controller,
                scrollDirection: Axis.horizontal,
                onPageChanged: (value) {
                  setState(() {
                    _currentIndex = value;
                  });
                },
                itemCount: slides.length,
                itemBuilder: (context, index) {
                  return SingleScreen(
                    data: slides[index],
                  );
                }),
          ),
          Wrap(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: List.generate(
                  slides.length,
                  (index) => sliderController(index, context),
                ),
              ),
            ],
          ),
          Container(
            height: 60,
            margin: const EdgeInsets.all(40),
            width: 180,
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                primary: Colors.green[400],
                onPrimary: Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(32.0),
                ),
              ),
              child: Text(
                  _currentIndex == slides.length - 1 ? "Continue" : "Next",
                  style: const TextStyle(color: Colors.white, fontSize: 20)),
              onPressed: () {
                if (_currentIndex == slides.length - 1) {
                  // navigate to another page
                  print('last slide');
                } else if (_controller.positions.isNotEmpty) {
                  _controller.nextPage(
                      duration: const Duration(milliseconds: 100),
                      curve: Curves.bounceIn);
                }
              },
            ),
          ),
        ],
      ),
      backgroundColor: const Color.fromARGB(255, 37, 37, 37),
    );
  }

  // slider controller
  Container sliderController(int index, BuildContext context) {
    return Container(
      height: 10,
      width: _currentIndex == index ? 38 : 20,
      margin: const EdgeInsets.only(right: 5),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: Colors.green[400],
      ),
    );
  }
}
