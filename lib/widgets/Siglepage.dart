import 'package:flutter/material.dart';
import 'package:onboarding/models/screenData.dart';

class SingleScreen extends StatelessWidget {
  ScreenData data;
  SingleScreen({Key? key, required this.data}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                child: Image(image: AssetImage(data.localImageSrc!)),
                height: MediaQuery.of(context).size.height * 0.5,
                width: MediaQuery.of(context).size.width * 0.8,
              ),
              SizedBox(
                child: Text(data.title!,
                    style: const TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: 30,
                        color: Color.fromARGB(255, 250, 241, 241))),
              ),
              const SizedBox(height: 10.0),
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.8,
                child: Text(data.description!,
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                        fontWeight: FontWeight.w400,
                        fontSize: 18,
                        color: Color.fromARGB(255, 219, 217, 217))),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
