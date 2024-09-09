
import 'package:bazar/core/utils/details/app_details.dart';
import 'package:bazar/domain/entities/product.dart';
import 'package:bazar/presentation/widgets/home_screen_widgets/write_review_for_product.dart';
import 'package:flutter/material.dart';

class ProductDetails extends StatefulWidget {
  Product product;
  ProductDetails({
    super.key,
    required this.product,
  });

  @override
  State<ProductDetails> createState() => _ProductDetailsState();
}

class _ProductDetailsState extends State<ProductDetails> {
  double score = 0;

  @override
  void initState() {
    super.initState();
    for (int i = 0; i < widget.product.reviews.length; i++)
      score += widget.product.reviews[i].score;
  }

  Color hexToColor(String code) {
    print('bu code $code');
    return Color(
        int.parse(code.substring(0, code.length), radix: 16) + 0xFF000000);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              widget.product.name,
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 20,
                color: Color(0xFF223263),
              ),
            ),
            Container(
              width: 40,
              height: 40,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: hexToColor(widget.product.color),
              ),
            )
          ],
        ),
        const SizedBox(
          height: 20,
        ),
        SizedBox(
          height: 50,
          width: MediaQuery.of(context).size.width,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: 5,
            itemBuilder: (context, index) {
              return Icon(
                score >= index + 1 ? Icons.star : Icons.star_border,
                color: score >= index + 1
                    ? Colors.yellow
                    : const Color(0xFFEBF0FF),
                size: 30,
              );
            },
          ),
        ),
        Text(
          "\$${widget.product.price}",
          style: const TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: Color(0xFF40BFFF)),
        ),
        const SizedBox(
          height: 50,
        ),
        if(!widget.product.reviews.any((value) => value.userId == AppDetails.model!.id))
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: WriteReviewForProduct(productId: widget.product.id),
          ),
        const SizedBox(
          height: 20,
        ),
        const Text(
          "Review Product",
          style: TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(
          height: 10,
        ),
        widget.product.reviews.isEmpty
            ? const Padding(
                padding: EdgeInsets.only(
                  bottom: 20,
                  top: 60,
                ),
                child: Center(
                  child: Text(
                    "Reviews not available!",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
                  ),
                ),
              )
            : ListView.builder(
                shrinkWrap: true,
                physics: const ScrollPhysics(),
                itemCount: widget.product.reviews.length,
                itemBuilder: (context, index) {
                  final review = widget.product.reviews[index];
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      ListTile(
                        leading: Container(
                          height: 50,
                          width: 50,
                          decoration: const BoxDecoration(
                            shape: BoxShape.circle,
                            image: DecorationImage(
                              image: AssetImage("assets/images/person.jpg"),
                            ),
                          ),
                        ),
                        title: Text(
                          review.userName,
                          style: const TextStyle(
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        subtitle: Row(
                          children: [
                            for(int i = 0;i < 5;i++)
                              Icon(review.score >= i ? Icons.star : Icons.star_border,color: review.score >= i ? Colors.yellow : Colors.blue,),
                          ],
                        )
                      ),
                      const SizedBox(height: 10,),
                      Text(review.message,style: const TextStyle(fontWeight: FontWeight.bold,),),
                    ],
                  );
                },
              ),
      ],
    );
  }
}
