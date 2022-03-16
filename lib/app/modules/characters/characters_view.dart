import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:futurama_thrive/app/core/extensions/app_utils.dart';
import 'package:futurama_thrive/app/core/model/characters_response.dart';
import 'package:futurama_thrive/app/core/services/service_locator.dart';
import 'package:futurama_thrive/app/core/theme/styles.dart';
import 'package:futurama_thrive/app/core/widgets/default_loading.dart';
import 'package:futurama_thrive/app/modules/characters/character_detail_view.dart';
import 'package:futurama_thrive/app/modules/characters/characters_controller.dart';
import 'package:provider/provider.dart';

class CharactersView extends StatefulWidget {
  const CharactersView({Key? key}) : super(key: key);

  @override
  State<CharactersView> createState() => _CharactersViewState();
}

class _CharactersViewState extends State<CharactersView> {
  CharactersController controller = serviceLocator<CharactersController>();

  @override
  void initState() {
    controller.getCharacters();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Characters"),
      ),
      body: Consumer<CharactersController>(
          builder: (context, controller, child) => _buildBody(controller)),
    );
  }

  Widget _buildBody(CharactersController controller) {
    if (controller.loading) {
      return const DefaultLoading();
    }

    if (controller.error != null) {
      context.onWidgetDidBuild(() {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: Text('${controller.error}'),
          action: SnackBarAction(
              label: "Try Again", onPressed: () => controller.getCharacters()),
        ));
        controller.error = null;
      });
    }

    if (controller.response.items != null) {
      return ListView.builder(
          itemCount: controller.response.items?.length,
          itemBuilder: (BuildContext context, int index) {
            Character? item = controller.response.items?[index];
            return Padding(
              padding: EdgeInsets.only(left: 16.dp, right: 16.dp, top: 8),
              child: GestureDetector(
                onTap: () => navigateTo(
                    context,
                    CharacterDetailView(
                      character: item,
                    )),
                child: Card(
                  child: Column(
                    children: [
                      CachedNetworkImage(
                          height: 250.dp,
                          imageUrl: '${item?.images?.main}',
                          placeholder: (context, url) =>
                              const DefaultLoading()),
                      Container(
                        width: double.maxFinite,
                        color: colorPrimary,
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            '${item?.name?.first} ${item?.name?.last}',
                            style: subTitleStyle.copyWith(color: Colors.white),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
            );
          });
    }

    return const SizedBox();
  }
}
