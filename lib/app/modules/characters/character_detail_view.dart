import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:futurama_thrive/app/core/extensions/app_utils.dart';
import 'package:futurama_thrive/app/core/model/characters_response.dart';
import 'package:futurama_thrive/app/core/theme/styles.dart';
import 'package:futurama_thrive/app/core/widgets/default_loading.dart';

class CharacterDetailView extends StatelessWidget {
  final Character? character;
  const CharacterDetailView({Key? key, this.character}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('${character?.name?.first} ${character?.name?.last}'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            CachedNetworkImage(
                height: 250.dp,
                imageUrl: '${character?.images?.main}',
                placeholder: (context, url) => const DefaultLoading()),
            Container(
              width: double.maxFinite,
              color: colorPrimary,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  '${character?.species}',
                  style: subTitleStyle.copyWith(color: Colors.white),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
