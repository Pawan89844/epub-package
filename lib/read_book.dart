import 'package:flutter/material.dart';

import 'epub_viewer.dart';

class ReadBook extends StatefulWidget {
  final String identifier, bookId, bookPath, href;
  final Color themeColor;
  const ReadBook(
      {Key? key,
      required this.identifier,
      required this.bookId,
      required this.bookPath,
      required this.href,
      required this.themeColor})
      : super(key: key);

  @override
  State<ReadBook> createState() => _ReadBookState();
}

class _ReadBookState extends State<ReadBook> with WidgetsBindingObserver {
  @override
  void initState() {
    super.initState();
    VocsyEpub.setConfig(
      themeColor: widget.themeColor,
      identifier: widget.identifier,
      scrollDirection: EpubScrollDirection.ALLDIRECTIONS,
      allowSharing: true,
      enableTts: true,
      nightMode: false,
    );
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    super.didChangeAppLifecycleState(state);
    print('current state:- ${state.name}');
  }

  void openBook() {
    VocsyEpub.open(
      widget.bookPath,
      lastLocation: EpubLocator.fromJson({
        "bookId": widget.bookId,
        // "href":
        //     "/EPUB/${snapshot.data?.Chapters?[i].ContentFileName}",
        "href": widget.href,
        // "created": 1675858955963,
        "locations": {
          "cfi": "epubcfi()"
          // "cfi": "epubcfi(/0!/4/2[_preface]/2))"
        }
      }),
    );
  }

  @override
  Widget build(BuildContext context) {
    openBook();
    return Container();
  }
}
