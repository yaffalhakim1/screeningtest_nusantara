import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:screeningtest_nusantara/models/books_model.dart';
import 'package:screeningtest_nusantara/provider/books_provider.dart';
import 'package:screeningtest_nusantara/screens/login.dart';
import 'package:screeningtest_nusantara/services/auth_service.dart';
import 'package:screeningtest_nusantara/widgets/book_card.dart';

import '../shared/themes.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  @override
  void initState() {
    super.initState();

    Future.microtask(() {
      Provider.of<BookProvider>(
        context,
        listen: false,
      )..getBooks();
      // stickUserData();
    });
  }

  @override
  Widget build(BuildContext context) {
    Widget booksList() {
      return Container(
        margin: const EdgeInsets.only(
          top: 18,
          left: 24,
          right: 24,
          bottom: 30,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Daftar buku',
              style: titleTextStyle.copyWith(
                fontSize: 16,
                fontWeight: semibold,
              ),
            ),
            Consumer<BookProvider>(
              builder: (context, data, _) {
                final state = data.bookState;
                final BookResponseModel dataBook = data.bookResponseModel;
                final BookMetaModel meta = data.bookMetaModel;
                if (state == BookState.Loading) {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                } else if (state == BookState.Success) {
                  return Column(
                    children: dataBook.data!
                        .map(
                          (book) => BookCard(
                            book,
                          ),
                        )
                        .toList(),
                  );
                } else {
                  return Center(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        const Icon(Icons.block_rounded, color: Colors.red),
                        Text("Failed State // Error // ${meta.message}"),
                      ],
                    ),
                  );
                }
              },
            )
          ],
        ),
      );
    }

    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Column(
            children: [
              const Text('Main Screen'),

              //list view
              booksList(),
              ElevatedButton(
                  onPressed: () {
                    Navigator.pushNamed(context, '/add-book');
                  },
                  child: const Text('Tambah Buku')),

              ElevatedButton(
                  onPressed: () {
                    AuthService().logout();
                    Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const Login(),
                        ));
                  },
                  child: const Text('Logout')),
            ],
          ),
        ),
      ),
    );
  }
}
