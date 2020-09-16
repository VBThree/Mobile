import 'dart:convert';
import 'dart:io';

import 'package:VBThreeMobile/core/base/state/base_state.dart';
import 'package:VBThreeMobile/core/base/view/base_view.dart';
import 'package:VBThreeMobile/core/components/shadedButton.dart';
import 'package:VBThreeMobile/core/extension/string_extension.dart';
import 'package:VBThreeMobile/core/init/lang/language_manager.dart';
import 'package:VBThreeMobile/core/init/notifiers/theme_notifier.dart';
import 'package:VBThreeMobile/generated/locale_keys.g.dart';
import 'package:VBThreeMobile/views/post_announcement_page/viewmodel/post_announcement_viewmodel.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:provider/provider.dart';
import 'package:image_picker/image_picker.dart';

class PostAnnouncementAddImageView extends StatefulWidget {
  PostAnnouncementAddImageView({Key key}) : super(key: key);

  @override
  _PostAnnouncementAddImageViewState createState() =>
      _PostAnnouncementAddImageViewState();
}

class _PostAnnouncementAddImageViewState
    extends BaseState<PostAnnouncementAddImageView> {
  PostAnnouncementViewModel viewModel = PostAnnouncementViewModel();

  @override
  Widget build(BuildContext context) {
    return BaseView(
      onPageBuilder: (contex, value) => Scaffold(
        appBar: AppBar(
          actions: [
            IconButton(
                icon: Icon(Icons.cached),
                onPressed: () {
                  Provider.of<ThemeNotifier>(context, listen: false)
                      .changeTheme();
                }),
            IconButton(
                icon: Icon(Icons.language),
                onPressed: () {
                  final tr = LanguageManager.instance.trLocale;
                  final en = LanguageManager.instance.enLocale;
                  context.locale = context.locale == tr ? en : tr;
                })
          ],
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Card(
                child: Container(
                  padding: EdgeInsets.all(dynamicHeight(0.05)),
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Icon(Icons.image),
                          SizedBox(width: dynamicWidth(0.05)),
                          Text(LocaleKeys.postAnnouncementPage_images.locale),
                        ],
                      ),
                      Divider(),
                      GridView.count(
                        shrinkWrap: true,
                        crossAxisCount: 3,
                        crossAxisSpacing: dynamicHeight(0.02),
                        mainAxisSpacing: dynamicHeight(0.02),
                        children: [
                          imageField(0, viewModel),
                          imageField(1, viewModel),
                          imageField(2, viewModel),
                          imageField(3, viewModel),
                          imageField(4, viewModel),
                          imageField(5, viewModel),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Expanded(
              child: Center(
                child: Text(
                  LocaleKeys.postAnnouncementPage_pleaseAddImages.locale,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: dynamicWidth(0.05),
                  ),
                ),
              ),
            ),
            Expanded(child: ShadedButton("Gönder", () {}))
          ],
        ),
      ),
      viewModel: viewModel,
      onModelReady: (model) => {
        viewModel = model,
      },
    );
  }
}

Widget imageField(int index, viewModel) => GestureDetector(
      child: Observer(
        builder: (_) => Container(
          color: Colors.black12,
          child: viewModel.images[index].isNotEmpty
              ? Image.memory(base64Decode(viewModel.images[index]))
              : Icon(Icons.add),
        ),
      ),
      onTap: () async {
        var image = await ImagePicker().getImage(source: ImageSource.gallery);
        final bytes = base64Encode(File(image.path).readAsBytesSync());
        viewModel.addImage(bytes, index);
      },
    );
