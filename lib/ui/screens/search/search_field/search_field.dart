import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:xera_task/models/utilities/shared_preferences/shared_preferences.dart';
import 'package:xera_task/ui/components/text_fields/default_text_field.dart';
import 'package:xera_task/ui/screens/search/search_field/options_view.dart';

class SearchMovieField extends StatelessWidget {
  final void Function(String)? onFieldSubmitted;
  final void Function(String)? onSuggestionSelected;
  const SearchMovieField(
      {Key? key, this.onFieldSubmitted, this.onSuggestionSelected})
      : super(key: key);

  final bool _clearIconEnabled = true;

  final double _optionsViewHeight = 200.0;

  @override
  Widget build(BuildContext context) {
    return RawAutocomplete(
      optionsBuilder: (TextEditingValue textEditingValue) async {
        final String query = textEditingValue.text.toLowerCase();

        List<String> matches =
            await SharedPreferences.instance.getMoviesSearchHistory();
        matches.retainWhere((option) => option.toLowerCase().contains(query));

        return matches;
      },
      onSelected: onSuggestionSelected,
      fieldViewBuilder: (BuildContext context,
              TextEditingController textEditingController,
              FocusNode focusNode,
              VoidCallback onFieldSubmitted) =>
          DefaultTextField(
        controller: textEditingController,
        focusNode: focusNode,
        prefixIcon: Icons.search,
        onFieldSubmitted: this.onFieldSubmitted,
        clearIcon: _clearIconEnabled,
        hint: AppLocalizations.of(context)!.search,
      ),
      optionsViewBuilder: (BuildContext context,
              void Function(String) onSelected, Iterable<String> options) =>
          Material(
        child: SizedBox(
          height: _optionsViewHeight,
          child: SingleChildScrollView(
            child: Column(
              children: options
                  .map((opt) => SearchMovieFieldOption(
                      onSelected: () => onSelected(opt), option: opt))
                  .toList(),
            ),
          ),
        ),
      ),
    );
  }
}
