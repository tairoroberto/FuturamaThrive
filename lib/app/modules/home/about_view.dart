import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:futurama_thrive/app/core/extensions/app_utils.dart';
import 'package:futurama_thrive/app/core/services/service_locator.dart';
import 'package:futurama_thrive/app/core/theme/styles.dart';
import 'package:futurama_thrive/app/core/widgets/default_loading.dart';
import 'package:futurama_thrive/app/modules/home/home_controller.dart';
import 'package:provider/provider.dart';

class AboutView extends StatefulWidget {
  const AboutView({Key? key}) : super(key: key);

  @override
  State<AboutView> createState() => _AboutViewState();
}

class _AboutViewState extends State<AboutView> {
  HomeController controller = serviceLocator<HomeController>();

  @override
  void initState() {
    controller.getInfos();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("About Futurama"),
      ),
      body: Consumer<HomeController>(
          builder: (context, controller, child) => _buildBody(controller)),
    );
  }

  Widget _buildBody(HomeController controller) {
    if (controller.loading) {
      return const Center(
        child: CircularProgressIndicator(),
      );
    }

    if (controller.error != null) {
      context.onWidgetDidBuild(() {
        showError(context, '${controller.error}', () => controller.getInfos());
        controller.error = null;
      });
    }

    if (controller.response.items != null) {
      return SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.only(
              left: 16.dp, right: 16.dp, top: 24.dp, bottom: 48.dp),
          child: Column(
            children: [
              CachedNetworkImage(
                imageUrl:
                    'https://disneyplusbrasil.com.br/wp-content/uploads/2022/02/Futurama-Star-Plus-750x422.jpg',
                placeholder: (context, url) => const DefaultLoading(),
                errorWidget: (context, url, error) => Image(
                  image: const AssetImage('assets/images/thrive-ladder.png'),
                  height: 250.dp,
                  fit: BoxFit.contain,
                ),
              ),
              Text(
                "${controller.response.items?[0].synopsis}",
                style: bodyTextStyle,
              ),
              Padding(
                padding: EdgeInsets.only(top: 24.dp),
                child: SizedBox(
                  width: double.maxFinite,
                  child: Text(
                    "Creators:",
                    style: titleStyle.copyWith(fontSize: 20),
                  ),
                ),
              ),
              Column(
                children: controller.response.items?[0].creators
                        ?.map((e) => Card(
                              child: ListTile(
                                title: Text(
                                  "${e.name}",
                                  style: bodyTextStyle,
                                ),
                              ),
                            ))
                        .toList() ??
                    [],
              )
            ],
          ),
        ),
      );
    }

    return const SizedBox();
  }
}
