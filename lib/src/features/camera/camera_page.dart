import 'dart:io';

import 'package:flutter/material.dart';

import 'package:camerawesome/camerawesome_plugin.dart';
import 'package:go_router/go_router.dart';
import 'package:path_provider/path_provider.dart';

import 'package:flutter_wisy_app/src/features/photos/presentation/photo_preview.dart';
import 'package:flutter_wisy_app/src/routing/app_router.dart';

class CameraPage extends StatelessWidget {
  const CameraPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CameraAwesomeBuilder.awesome(
        saveConfig: SaveConfig.photo(
          pathBuilder: () async {
            Directory extDir = await getApplicationDocumentsDirectory();
            final testDir =
                await Directory('${extDir.path}/test').create(recursive: true);
            const String fileExtension = 'jpg';
            final String filePath =
                '${testDir.path}/${DateTime.now().millisecondsSinceEpoch}.$fileExtension';
            return filePath;
          },
        ),
        onMediaTap: (mediaCapture) {
          context.pushNamed(
            AppRoute.photoPreview.name,
            queryParams: {
              'imageUrl': mediaCapture.filePath,
              'imageType': TypeImagePreview.imageFile.name
            },
          );
        },
        topActionsBuilder: (state) => AwesomeTopActions(
          state: state,
          children: [
            AwesomeFlashButton(state: state),
          ],
        ),
        middleContentBuilder: (_) => const SizedBox.shrink(),
        theme: AwesomeTheme(
          buttonTheme: AwesomeButtonTheme(
            backgroundColor: const Color(0xFF3B3B3D),
            foregroundColor: Colors.white,
          ),
        ),
      ),
    );
  }
}
