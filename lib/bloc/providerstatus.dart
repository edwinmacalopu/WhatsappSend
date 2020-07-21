import 'dart:io';
import 'dart:typed_data';

import 'package:flutter/cupertino.dart';
import 'package:image_gallery_saver/image_gallery_saver.dart';
import 'package:permission_handler/permission_handler.dart';

class ProviderStatus extends ChangeNotifier {
  List<FileSystemEntity> files;
  var imageList;
  bool _visible = false;
  bool _visiblecheck = false;
  bool _statuspermstorage = false;
  bool get statuspermstorage => _statuspermstorage;
  set statuspermstorage(bool status) {
    _statuspermstorage = status;
    notifyListeners();
  }

  bool get visiblecheck => _visiblecheck;
  void displaycheck() {
    _visiblecheck = true;
    visiblecheck = false;
    notifyListeners();
  }

  set visiblecheck(bool vcheck) {
    Future.delayed(Duration(seconds: 2), () {
      _visiblecheck = vcheck;
      notifyListeners();
    });
  }

  bool get visible => _visible;
  set visible(bool visible) {
    _visible = visible;
    notifyListeners();
  }

  Future getlocalfile() async {
    final _photodir = Directory('/storage/emulated/0/WhatsApp/Media/.Statuses');
    imageList = _photodir
        .listSync()
        .map((item) => item.path)
        .where((item) => item.endsWith(".jpg"))
        .toList(growable: false);
  }

  Future saveimage(String imgview) async {
    Uri myUri = Uri.parse(imgview);
    File originalImageFile = new File.fromUri(myUri);
    Uint8List bytes;
    await originalImageFile.readAsBytes().then((value) {
      bytes = Uint8List.fromList(value);
      print('reading of bytes is completed');
    }).catchError((onError) {
      print('Exception Error while reading audio from path:' +
          onError.toString());
    });
    final result = await ImageGallerySaver.saveImage(Uint8List.fromList(bytes));
    print(result);
    Future.delayed(Duration(seconds: 1), () {
      visible = false;
      displaycheck();
    });
    ChangeNotifier();
  }

  void getPermissionStorage() async {
    var status = await Permission.storage.status;
    if (status.isGranted) {
      statuspermstorage = true;
    } else {
      statuspermstorage = false;
    }
    notifyListeners();
  }

  void grandPermissionStorage() async {
    var status = await Permission.storage.request();
    if (status.isGranted) {
      statuspermstorage = true;
    } else {
      statuspermstorage = false;
    }
  }
}
