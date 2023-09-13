import 'package:book/api/naver_open_api.dart';
import 'package:book/models/naver_book_dto.dart';
import 'package:flutter/material.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  // NaverOpenAPI().loadBooks();
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: ViewBooksPage(),
    );
  }
}

class ViewBooksPage extends StatefulWidget {
  const ViewBooksPage({super.key});

  @override
  State<ViewBooksPage> createState() => _ViewBooksPageState();
}

class _ViewBooksPageState extends State<ViewBooksPage> {
  Future<List<NaverBookDto>>? resultBooks = NaverOpenAPI().loadBooks();

  void searchBox(search) {
    Future<List<NaverBookDto>>? searchresultBooks =
        NaverOpenAPI().loadBooks(search);
    setState(() {
      resultBooks = searchresultBooks;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: SearchBox(searchBooks: searchresultBooks),
      ),
      body: ViewlListPage(resultBooks: resultBooks),
    );
  }
}

class SearchBox extends StatelessWidget {
  SearchBox({
    super.key,
    required this.searchBooks,
  });
  final Function(String search) searchBooks;
  final searchInputaCotroller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Row(mainAxisAlignment: MainAxisAlignment.center, children: [
      Flexible(
        child: TextField(
          controller: searchInputaCotroller,
          keyboardType: TextInputType.text,
          textInputAction: TextInputAction.search,
          onSubmitted: (value) => searchBooks(value),
          decoration: const InputDecoration(
              border: OutlineInputBorder(),
              labelText: "검색어",
              hintText: "도서 검색어를 입력하세요"),
        ),
      ),
    ]);
  }
}

class ViewlListPage extends StatelessWidget {
  const ViewlListPage({
    super.key,
    required this.resultBooks,
  });

  final Future<List<NaverBookDto>>? resultBooks;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: FutureBuilder(
        future: resultBooks,
        builder: (context, snapshot) {
          return ListView.builder(
            itemCount: snapshot.data!.length,
            itemBuilder: (context, index) => ListTile(
              leading: CircleAvatar(
                backgroundImage: NetworkImage(snapshot.data![index].image!),
              ),
              title: Text(snapshot.data![index].title!),
              subtitle: Text(snapshot.data![index].author!),
            ),
          );
        },
      ),
    );
  }
}
