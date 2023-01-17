import 'package:flutter/material.dart';

import '../models/books_model.dart';
import '../shared/themes.dart';

class BookCard extends StatelessWidget {
  final BookDataModel book;
  BookCard(this.book);
  int index = 0;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        // Navigator.push(
        //   context,
        //   MaterialPageRoute(
        //     builder: (context) => DetailTailor(tailor, tailor.uuid!),
        //   ),
        // );
      },
      child: Container(
        height: 114,
        margin: EdgeInsets.only(bottom: 12, top: 10),
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              offset: Offset(0, 2),
              blurRadius: 15,
              color: Color(0xFF000000).withOpacity(0.06),
            ),
          ],
          borderRadius: BorderRadius.circular(15),
          color: Colors.white,
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Container(
            //   width: 80,
            //   height: 80,
            //   margin: EdgeInsets.only(right: 18, top: 18, bottom: 18, left: 18),
            //   decoration: BoxDecoration(
            //     borderRadius: BorderRadius.circular(12),
            //     image: DecorationImage(
            //       image: NetworkImage(book. ?? ""),
            //       fit: BoxFit.cover,
            //     ),
            //   ),
            // ),

            CircleAvatar(
              //make circle avatar contains number from 1
              //to 10
              backgroundColor: Colors.blue,
              radius: 40,
              child: Text('${index + 1}'),
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 18,
                  ),
                  Text(
                    book.title!,
                    style: titleTextStyle.copyWith(
                      fontSize: 16,
                      fontWeight: semibold,
                    ),
                    overflow: TextOverflow.ellipsis,
                    maxLines: 1,
                  ),
                  SizedBox(
                    height: 2,
                  ),
                  Expanded(
                    child: Text(
                      book.subtitle!,
                      style: regularTextStyle.copyWith(
                        fontSize: 14,
                      ),
                      overflow: TextOverflow.ellipsis,
                      maxLines: 1,
                    ),
                  ),
                  SizedBox(
                    width: 4,
                  ),
                  SizedBox(
                    height: 2,
                  ),
                  Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(top: 2.5),
                        child: Text(
                          book.author!,
                          style: regularTextStyle.copyWith(
                              color: secondaryColor,
                              fontWeight: FontWeight.w600),
                        ),
                      ),
                      SizedBox(
                        width: 4,
                      ),
                    ],
                  ),
                  // Divider(
                  //   thickness: 1,
                  // ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
