import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:screeningtest_nusantara/models/book_add_model.dart';
import '../provider/books_provider.dart';
import '../shared/themes.dart';

class AddBook extends StatefulWidget {
  const AddBook({Key? key}) : super(key: key);

  @override
  State<AddBook> createState() => _AddBookState();
}

class _AddBookState extends State<AddBook> {
  TextEditingController isbnController = TextEditingController();
  TextEditingController judulController = TextEditingController();
  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    Widget addISBN() {
      return Container(
        margin: const EdgeInsets.only(top: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'ISBN',
              style: regularTextStyle.copyWith(
                fontSize: 16,
              ),
            ),
            const SizedBox(
              height: 4,
            ),
            Container(
              height: 50,
              padding: const EdgeInsets.symmetric(
                horizontal: 16,
              ),
              decoration: BoxDecoration(
                color: Colors.white,
                border: Border.all(
                  color: textColor,
                  width: 1,
                ),
                borderRadius: BorderRadius.circular(6),
              ),
              child: Center(
                child: Row(
                  children: [
                    // const Icon(
                    //   Icons.person,
                    //   size: 17,
                    // ),
                    // const SizedBox(
                    //   width: 14,
                    // ),
                    Expanded(
                      child: TextFormField(
                        style: regularTextStyle,
                        controller: isbnController,
                        decoration: InputDecoration.collapsed(
                          hintText: 'Masukkan ISBN buku',
                          hintStyle: regularTextStyle.copyWith(
                            fontSize: 14,
                            color: Colors.grey,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      );
    }

    Widget addTitle() {
      return Container(
        margin: const EdgeInsets.only(top: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Judul',
              style: regularTextStyle.copyWith(
                fontSize: 16,
              ),
            ),
            const SizedBox(
              height: 4,
            ),
            Container(
              height: 50,
              padding: const EdgeInsets.symmetric(
                horizontal: 16,
              ),
              decoration: BoxDecoration(
                color: Colors.white,
                border: Border.all(
                  color: textColor,
                  width: 1,
                ),
                borderRadius: BorderRadius.circular(6),
              ),
              child: Center(
                child: Row(
                  children: [
                    // const Icon(
                    //   Icons.person,
                    //   size: 17,
                    // ),
                    // const SizedBox(
                    //   width: 14,
                    // ),
                    Expanded(
                      child: TextFormField(
                        style: regularTextStyle,
                        controller: judulController,
                        decoration: InputDecoration.collapsed(
                          hintText: 'Masukkan ISBN buku',
                          hintStyle: regularTextStyle.copyWith(
                            fontSize: 14,
                            color: Colors.grey,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      );
    }

    Widget addButton() {
      return Container(
        margin: const EdgeInsets.only(top: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: 50,
              padding: const EdgeInsets.symmetric(
                horizontal: 16,
              ),
              decoration: BoxDecoration(
                color: Colors.white,
                border: Border.all(
                  color: textColor,
                  width: 1,
                ),
                borderRadius: BorderRadius.circular(6),
              ),
              child: Center(
                child: Row(
                  children: [
                    // const Icon(
                    //   Icons.person,
                    //   size: 17,
                    // ),
                    // const SizedBox(
                    //   width: 14,
                    // ),
                    Expanded(
                      child: TextButton(
                        onPressed: () {
                          BookAddModel bookAddModel = BookAddModel(
                            isbn: isbnController.text,
                            title: judulController.text,
                          );
                          Provider.of<BookProvider>(context, listen: false)
                              .addBooks(bookAddModel: bookAddModel);
                          Navigator.pop(context);
                        },
                        child: Text(
                          'Tambah',
                          style: regularTextStyle.copyWith(
                            fontSize: 14,
                            color: Colors.grey,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      );
    }

    return Scaffold(
      backgroundColor: bgColor,
      body: SafeArea(
        child: Container(
          margin: const EdgeInsets.symmetric(
            horizontal: 32,
          ),
          child: ListView(
            children: [
              addISBN(),
              addTitle(),
              addButton(),
            ],
          ),
        ),
      ),
    );
  }
}
