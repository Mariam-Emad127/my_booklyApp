import 'package:flutter/material.dart';
import 'package:my_bookly/Features/home/data/models/book_model/book_model.dart';
import 'package:my_bookly/core/widgets/custom_button.dart';
import 'package:url_launcher/url_launcher.dart';

class BooksAction extends StatelessWidget {
  const BooksAction({super.key,  required this.bookModel});
final BookModel bookModel;
  @override
  Widget build(BuildContext context) {
    return Row(children: [
      Expanded(
        child: CustomButton(
            text: 'preview',
            backgroundColor: Colors.white,
            textColor: Colors.black,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(16),
              bottomLeft: Radius.circular(16),
            )),
      ),
      Expanded(
          child: CustomButton(
        onPressed: ()async {
Uri uri =Uri.parse("https://www.google.com.eg/?hl=ar");
//bookModel.volumeInfo.previewLink!
 if (await canLaunchUrl(uri)) {
  await launchUrl(uri);
   
  }
        },
        fontSize: 16,
        text: "Free",
        backgroundColor: const Color(0xffEF8262),
        textColor: Colors.white,
        borderRadius: const BorderRadius.only(
          topRight: Radius.circular(16),
          bottomRight: Radius.circular(16),
        ),
      )),
    ]);
  }
}
