import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rick_morty_cubit/app/domain/entity/CharacterRepo.dart';
import 'package:rick_morty_cubit/app/ui/characterDetail/CharacterDetailPage.dart';
import 'package:rick_morty_cubit/app/ui/characters/CharactersCubit.dart';
import 'package:rick_morty_cubit/app/ui/widgets/AuthenticationWidget.dart';

class CharactersListView extends StatefulWidget {
  @override
  _CharactersListViewState createState() => _CharactersListViewState();
}

class _CharactersListViewState extends State<CharactersListView> {
  final refreshIndicatorKey = GlobalKey<RefreshIndicatorState>();
  int page = 1;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<CharactersCubit, CharactersState>(
      listener: (context, state) {
        if (state.status == CharactersStatus.error) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(state.error!),
            ),
          );
        }
      },
      builder: (context, state) {
        if (state.status == CharactersStatus.loading) {
          return Center(
            child: CircularProgressIndicator(),
          );
        } else if (state.status == CharactersStatus.success) {
          final List<CharacterRepo> characters = state.characters!;
          return RefreshIndicator(
            key: refreshIndicatorKey,
            child: NotificationListener(
              onNotification: (ScrollNotification info) {
                if (info.metrics.pixels == info.metrics.maxScrollExtent) {
                  page++;
                  setState(() {});
                  context.read<CharactersCubit>().loadCharacters(page: page);
                }
                return false;
              },
              child: ListView.builder(
                itemCount: characters.length,
                itemBuilder: (context, index) {
                  return Container(
                    height: 140,
                    color: Colors.white,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 15.0,
                        vertical: 10.0,
                      ),
                      child: GestureDetector(
                        onTap: () => Navigator.of(context).push(
                            MaterialPageRoute(
                                builder: (_) => AuthenticationWidget(
                                    child: CharacterDetailPage()))),
                        child: Row(
                          children: [
                            Container(
                              width: 120,
                              height: 120,
                              child: Image.network(
                                characters[index].image,
                                fit: BoxFit.cover,
                                alignment: Alignment.centerLeft,
                              ),
                            ),
                            SizedBox(
                              width: 10.0,
                            ),
                            Flexible(
                              child: Center(
                                child: Text(
                                  characters[index].name,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
            onRefresh: () async {
              print('Refresh');
              page = 1;
              setState(() {});
              context.read<CharactersCubit>().loadCharacters(page: page);
            },
          );
        }

        return SizedBox.shrink();
      },
    );
  }
}
