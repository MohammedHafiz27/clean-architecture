import 'package:bookly/core/widgets/custom_fading_widget.dart';
import 'package:flutter/material.dart';

class FeaturedBooksListViewLoading extends StatelessWidget {
  const FeaturedBooksListViewLoading({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomFadingWidget(
      child: SizedBox(
        height: MediaQuery.of(context).size.height * .3,
        child: ListView.builder(
            itemCount: 15,
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8),
                child: CustomBookImageLoading(),
              );
            }),
      ),
    );
  }
}

class CustomBookImageLoading extends StatelessWidget {
  const CustomBookImageLoading({super.key});

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 2.6 / 4,
      child: Container(
        color: Colors.grey.shade800,
      ),
    );
  }
}
