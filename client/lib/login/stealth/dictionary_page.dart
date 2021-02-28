import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:get/get.dart';
import 'package:html/parser.dart' show parse;
import 'package:http/http.dart' as http;
import 'package:stealth_chat/boot/boot_screen.dart';
import 'package:stealth_chat/login/LoginPage.dart';
import 'package:stealth_chat/util/logging.dart';

part 'dictionary_page.freezed.dart';

class DictionaryController extends LoginController {
  final searchTermController = TextEditingController();
  final RxBool isSearching = false.obs;
  final Rx<Search> currSearch = Rx(null);

  DictionaryController() : super();

  @override
  void onClose() {
    this.searchTermController.dispose();
    super.onClose();
  }

  void performSearch(BootConfig boot) async {
    isSearching.value = true;
    String term = searchTermController.text;
    await loginAndRedirect(term, boot, () async {
      // login failed
      currSearch.value = (await searchDictionary(term));
      isSearching.value = false;
    });
  }

  Future<Search> searchDictionary(String term) async {
    final response = await http
        .get(Uri.https('dictionary.cambridge.com', 'dictionary/english/$term'));
    final document = parse(response.body);
    final searchResults =
        document.querySelectorAll('.def-block.ddef_block').map((e) {
      String definition = e.querySelector('.def.ddef_d.db').text.trim();
      List<String> examples = e
          .querySelectorAll('.examp.dexamp')
          .map((e2) => e2.text.trim())
          .toList();
      return SearchResult(definition: definition, examples: examples);
    }).toList();
    return Search(term: term, results: searchResults);
  }
}

class DictionaryPage extends LoginPage {
  final BootConfig boot;

  DictionaryPage(BootConfig boot, {Key key})
      : this.boot = boot,
        super(boot, key: key);

  @override
  Widget build(BuildContext context) {
    logDebug('Dictionary page: ' + (boot.destination == null).toString());
    DictionaryController c = DictionaryController();

    final jumbotron = Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(
          Icons.book,
          size: 48,
          color: Colors.blueGrey.shade800,
        ),
        Text(
          'Dictionary',
          style: TextStyle(
              fontSize: 48,
              fontWeight: FontWeight.bold,
              color: Colors.blueGrey.shade800),
        ).paddingAll(10)
      ],
    );

    final searchBar = Obx(
      () => Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          TextField(
            controller: c.searchTermController,
            decoration: InputDecoration(labelText: 'Enter a term'),
          ),
          MaterialButton(
            onPressed: c.isSearching.value ? null : () => c.performSearch(boot),
            color: Colors.teal,
            disabledColor: Colors.teal.shade300,
            textColor: Colors.white,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text('Search'),
                const SizedBox(width: 10),
                const Icon(Icons.search)
              ],
            ),
          ),
          ...(c.isSearching.value
              ? [LinearProgressIndicator(minHeight: 10)]
              : []),
        ],
      ),
    );

    final resultsPanel = Obx(() => Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: c.currSearch.value == null
            ? []
            : (c.currSearch.value.results.isEmpty
                ? [
                    Text("No results found for '${c.currSearch.value.term}'",
                        style: TextStyle(fontSize: 36))
                  ]
                : [
                    Text("Results for '${c.currSearch.value.term}'",
                        style: TextStyle(fontSize: 36)),
                    const SizedBox(height: 30),
                    ...c.currSearch.value.results.map((result) => Card(
                            child: ListTile(
                          title: Text(result.definition),
                          subtitle: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: result.examples
                                .map((example) => Text('\u2022 ' + example))
                                .toList(),
                          ),
                        )))
                  ])));

    return Obx(() => Scaffold(
            body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: c.currSearch.value == null
              ? Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    jumbotron,
                    const SizedBox(height: 75),
                    searchBar,
                  ],
                )
              : SingleChildScrollView(
                  child: Column(
                  children: [
                    const SizedBox(height: 75),
                    searchBar,
                    const SizedBox(height: 50),
                    resultsPanel
                  ],
                )),
        )));
  }
}

@freezed
abstract class Search with _$Search {
  const factory Search({String term, List<SearchResult> results}) = _Search;
}

@freezed
abstract class SearchResult with _$SearchResult {
  const factory SearchResult({String definition, List<String> examples}) =
      _SearchResult;
}
