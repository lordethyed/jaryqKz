import 'package:flutter/material.dart';
import 'package:jaryq_kz/src/data/models/book_models.dart';
import 'package:jaryq_kz/src/domain/usecases/books_usecase.dart';
import 'package:jaryq_kz/src/presentations/pages/books/widget/book_category_tile.dart';
import 'package:jaryq_kz/src/presentations/pages/books/widget/book_tile.dart';
import 'package:jaryq_kz/src/presentations/pages/books/widget/custom_modal_bottom_sheet.dart';

class BooksPage extends StatefulWidget {
  const BooksPage({super.key, required this.booksUseCase});
  final BooksUseCase booksUseCase;

  @override
  State<BooksPage> createState() => _BooksPageState();
}

class _BooksPageState extends State<BooksPage> {
  bool _isBooksCategoryLoaded = false;
  bool _isSearching = false;
  bool _isActiveFilter = false;
  int _fiterIndex = 0;
  late List<BookCategory> _booksCategoryList;
  late List<Book> _searchBooksList;

  void filterSearchResults(String query) async {
    List<Book> searchResults = [];
    List<Book> booksList = await widget.booksUseCase.getBooks();
    if (query.isNotEmpty) {
      for (Book item in booksList) {
        if (item.bookName.toLowerCase().contains(query.toLowerCase())) {
          searchResults.add(item);
        }
      }
      setState(() {
        _searchBooksList = searchResults;
        _isSearching = true;
      });
    } else {
      setState(() {
        _isSearching = false;
      });
    }

    setState(() {
      _searchBooksList = searchResults;
    });
  }

  void getBookCategoryData() async {
    try {
      List<BookCategory> booksCategoryList =
          await widget.booksUseCase.getBooksCategory();
      setState(() {
        _booksCategoryList = booksCategoryList;
        _isBooksCategoryLoaded = true;
      });
    } catch (e) {
      rethrow;
    }
  }

  @override
  void initState() {
    getBookCategoryData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        surfaceTintColor: Colors.white,
        leading: Padding(
          padding: const EdgeInsets.only(left: 15),
          child: TextField(
            onChanged: filterSearchResults,
            decoration: const InputDecoration(
                border: OutlineInputBorder(),
                prefixIcon: Icon(Icons.search),
                labelText: "Іздеу",
                floatingLabelBehavior: FloatingLabelBehavior.never),
          ),
        ),
        leadingWidth: MediaQuery.sizeOf(context).width / 1.2,
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 15),
            child: IconButton(
                onPressed: () =>
                    _isSearching == false && _isBooksCategoryLoaded == true
                        ? _isActiveFilter
                            ? setState(() {
                                _isActiveFilter = false;
                              })
                            : showModalBottomSheet(
                                context: context,
                                builder: (context) => CustomModalBottomSheet(
                                      bookCategoryList: _booksCategoryList,
                                      onPressed: (int index) {
                                        setState(() {
                                          _fiterIndex = index;
                                          _isActiveFilter = true;
                                        });
                                      },
                                    ))
                        : null,
                icon: _isActiveFilter
                    ? const Icon(Icons.cancel)
                    : const Icon(Icons.filter_list_alt)),
          )
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
        child: _isSearching
            ? _searchBooksList.isNotEmpty
                ? GridView.builder(
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      childAspectRatio: 0.8,
                      crossAxisCount: 2,
                      crossAxisSpacing: 0.0,
                      mainAxisSpacing: 1.0,
                    ),
                    itemCount: _searchBooksList.length,
                    itemBuilder: (context, index) =>
                        BookTile(book: _searchBooksList[index]),
                  )
                : const Center(
                    child: CircularProgressIndicator(),
                  )
            : _isBooksCategoryLoaded
                ? _isActiveFilter
                    ? Column(
                      children: [
                        Text(_booksCategoryList[_fiterIndex].categoryName),
                        Expanded(
                          child: GridView.builder(
                              gridDelegate:
                                  const SliverGridDelegateWithFixedCrossAxisCount(
                                childAspectRatio: 0.6,
                                crossAxisCount: 2,
                                crossAxisSpacing: 0.0,
                                mainAxisSpacing: 1.0,
                              ),
                              itemCount:
                                  _booksCategoryList[_fiterIndex].booksList.length,
                              itemBuilder: (context, index) => BookTile(
                                  book: _booksCategoryList[_fiterIndex]
                                      .booksList[index]),
                            ),
                        ),
                      ],
                    )
                    : ListView.builder(
                        itemCount: _booksCategoryList.length,
                        itemBuilder: (context, index) => BookCategoryTile(
                          bookCategory: _booksCategoryList[index],
                        ),
                      )
                : const Center(
                    child: CircularProgressIndicator(),
                  ),
      ),
    );
  }
}
