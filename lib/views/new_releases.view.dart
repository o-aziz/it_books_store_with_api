import 'package:flutter/material.dart';
import 'package:library_app/api/new_releases.dart';
import 'package:library_app/api/search.dart';
import 'package:library_app/components/bookcard_grid.dart';
import 'package:library_app/components/bookcard_list.dart';
import 'package:library_app/const.dart';
import 'package:library_app/model/books_data.model.dart';
import 'package:library_app/services/search_books.services.dart';

class NewReleases extends StatefulWidget {
  const NewReleases({Key? key}) : super(key: key);

  @override
  State<NewReleases> createState() => _NewReleasesState();
}

class _NewReleasesState extends State<NewReleases> {
  late BooksData booksData;
  bool isGridView1 = true;
  bool isGridView2 = true;
  PageController pageController = PageController();
  TextEditingController searchController = TextEditingController();
  SearchBooksServices searchBooksServices = SearchBooksServices();

  getNewBooksData() async {
    booksData = await fetchData();
  }

  @override
  void initState() {
    getNewBooksData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return AnimatedBuilder(
        animation: searchBooksServices,
        builder: (context, snapshot) {
          return Scaffold(
            floatingActionButtonLocation:
                FloatingActionButtonLocation.centerFloat,
            floatingActionButton: Container(
              height: 50,
              width: size.width * 0.75,
              decoration: BoxDecoration(
                gradient: kBackgoundColor,
                borderRadius: BorderRadius.circular(15),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  TextButton(
                    onPressed: () {
                      pageController.animateToPage(
                        0,
                        duration: const Duration(milliseconds: 300),
                        curve: Curves.easeIn,
                      );
                    },
                    child: const Text(
                      "New Releases",
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                      ),
                    ),
                  ),
                  TextButton(
                    onPressed: () {
                      pageController.animateToPage(
                        1,
                        duration: const Duration(milliseconds: 300),
                        curve: Curves.easeIn,
                      );
                    },
                    child: const Text(
                      "Search",
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            body: LayoutBuilder(
              builder: (context, constraints) {
                return PageView(
                  controller: pageController,
                  physics: const NeverScrollableScrollPhysics(),
                  children: [
                    Container(
                      height: constraints.maxHeight,
                      width: constraints.maxWidth,
                      decoration: BoxDecoration(
                        gradient: kBackgoundColor,
                      ),
                      child: SafeArea(
                        child: SingleChildScrollView(
                          child: Column(
                            children: [
                              Row(
                                children: [
                                  const Spacer(),
                                  IconButton(
                                    onPressed: () {
                                      setState(() {
                                        isGridView1 = false;
                                      });
                                    },
                                    icon: const Icon(
                                      Icons.list,
                                      color: Colors.white,
                                      size: 30,
                                    ),
                                  ),
                                  IconButton(
                                    onPressed: () {
                                      setState(() {
                                        isGridView1 = true;
                                      });
                                    },
                                    icon: const Icon(
                                      Icons.grid_4x4,
                                      color: Colors.white,
                                    ),
                                  ),
                                  const SizedBox(width: 10),
                                ],
                              ),
                              SizedBox(height: constraints.maxHeight * 0.01),
                              const Text(
                                "New Released IT Books",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 25,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              SizedBox(height: constraints.maxHeight * 0.03),
                              Wrap(
                                children: List.generate(
                                  int.parse(booksData.total),
                                  (index) => isGridView1
                                      ? BookCardGridView(
                                          booksData: booksData,
                                          constraints: constraints,
                                          index: index,
                                        )
                                      : BookCardListView(
                                          booksData: booksData,
                                          constraints: constraints,
                                          index: index),
                                ),
                              ),
                              const SizedBox(height: 70),
                            ],
                          ),
                        ),
                      ),
                    ),
                    Container(
                      height: constraints.maxHeight,
                      width: constraints.maxWidth,
                      decoration: BoxDecoration(
                        gradient: kBackgoundColor,
                      ),
                      child: SafeArea(
                        child: SingleChildScrollView(
                          child: Column(
                            children: [
                              Row(
                                children: [
                                  const Spacer(),
                                  IconButton(
                                    onPressed: () {
                                      setState(() {
                                        isGridView2 = false;
                                      });
                                    },
                                    icon: const Icon(
                                      Icons.list,
                                      color: Colors.white,
                                      size: 30,
                                    ),
                                  ),
                                  IconButton(
                                    onPressed: () {
                                      setState(() {
                                        isGridView2 = true;
                                      });
                                    },
                                    icon: const Icon(
                                      Icons.grid_4x4,
                                      color: Colors.white,
                                    ),
                                  ),
                                  const SizedBox(width: 10),
                                ],
                              ),
                              SizedBox(
                                height: 50,
                                width: constraints.maxWidth * 0.75,
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Container(
                                      width: constraints.maxWidth * 0.55,
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 10),
                                      alignment: Alignment.center,
                                      decoration: BoxDecoration(
                                        border: Border.all(
                                            color: Colors.white, width: 2),
                                        borderRadius: BorderRadius.circular(13),
                                      ),
                                      child: TextField(
                                        controller: searchController,
                                        onChanged: (value) {
                                          searchBooksServices.searchWord =
                                              value;
                                        },
                                        style: const TextStyle(
                                          color: Colors.white,
                                          fontSize: 17,
                                          fontWeight: FontWeight.bold,
                                        ),
                                        decoration: const InputDecoration(
                                          hintText: "enter book title",
                                          hintStyle: TextStyle(
                                            color: Colors.white54,
                                            fontSize: 15,
                                            fontWeight: FontWeight.w500,
                                          ),
                                          border: InputBorder.none,
                                        ),
                                      ),
                                    ),
                                    IconButton(
                                      padding: EdgeInsets.zero,
                                      onPressed: () async {
                                        if (searchController.text.isNotEmpty) {
                                          await searchBooksServices
                                              .getSearchedBooks(
                                            bookName: searchController.text,
                                            page:
                                                searchBooksServices.pageNumber,
                                          )
                                              .whenComplete(() {
                                            searchBooksServices.getPages(
                                              int.parse(searchBooksServices
                                                  .searchedBooks!.total),
                                            );
                                            searchController.clear();
                                          });
                                          searchBooksServices.pageNumber = 1;
                                        }
                                      },
                                      icon: const Icon(
                                        Icons.search,
                                        color: Colors.white,
                                        size: 40,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              const SizedBox(height: 10),
                              if (searchBooksServices.searchedBooks != null)
                                SizedBox(
                                  width: constraints.maxWidth * 0.5,
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      IconButton(
                                        onPressed: () {
                                          if (searchBooksServices.pageNumber >
                                              1) {
                                            searchBooksServices
                                                .getSearchedBooks(
                                                    bookName:
                                                        searchBooksServices
                                                            .searchWord,
                                                    page: searchBooksServices
                                                            .pageNumber -
                                                        1);
                                            setState(() {
                                              searchBooksServices.pageNumber--;
                                            });
                                          }
                                        },
                                        icon: const Icon(
                                          Icons.arrow_back_ios,
                                          color: Colors.white,
                                          size: 30,
                                        ),
                                      ),
                                      Text(
                                        "${searchBooksServices.pageNumber}/${searchBooksServices.pages}",
                                        style: const TextStyle(
                                          color: Colors.white,
                                          fontSize: 20,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      IconButton(
                                        onPressed: () {
                                          if (searchBooksServices.pageNumber <
                                              searchBooksServices.pages) {
                                            searchBooksServices
                                                .getSearchedBooks(
                                                    bookName:
                                                        searchBooksServices
                                                            .searchWord,
                                                    page: searchBooksServices
                                                            .pageNumber +
                                                        1);
                                            setState(() {
                                              searchBooksServices.pageNumber++;
                                            });
                                          }
                                        },
                                        icon: const Icon(
                                          Icons.arrow_forward_ios,
                                          color: Colors.white,
                                          size: 30,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              const SizedBox(height: 10),
                              if (searchBooksServices.searchedBooks != null)
                                Wrap(
                                  children: List.generate(
                                    10,
                                    (index) => isGridView2
                                        ? BookCardGridView(
                                            booksData: searchBooksServices
                                                .searchedBooks!,
                                            constraints: constraints,
                                            index: index,
                                          )
                                        : BookCardListView(
                                            booksData: searchBooksServices
                                                .searchedBooks!,
                                            constraints: constraints,
                                            index: index,
                                          ),
                                  ),
                                ),
                              const SizedBox(height: 70),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                );
              },
            ),
          );
        });
  }
}
