import 'dart:ffi';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_templete/core/data/models/file_model.dart';
import 'package:flutter_templete/core/data/reposotories/user_repository.dart';
import 'package:flutter_templete/core/services/base_controller.dart';

import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

import '../../../../core/enums/file_type_enum.dart';

class ProfileViewController extends BaseController {
  bool shoeOptions = false;
  FileModel? selectedFile;
  RxBool showOptions = false.obs;
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  TextEditingController age = TextEditingController();
  TextEditingController firstName = TextEditingController();
  TextEditingController lastName = TextEditingController();
  final ImagePicker picker = ImagePicker();

  void setShowOPtion(bool value) {
    showOptions.value = value;
  }

  Future<FileModel> pickFile(FileTypeEnum type) async {
    String path = '';

    switch (type) {
      case FileTypeEnum.CAMERA:
        await picker
            .pickImage(source: ImageSource.camera)
            .then((value) => path = value?.path ?? '');
        break;
      case FileTypeEnum.GALLERY:
        await picker
            .pickImage(source: ImageSource.gallery)
            .then((value) => path = value?.path ?? '');
        break;
      case FileTypeEnum.FILE:
        await FilePicker.platform
            .pickFiles()
            .then((value) => path = value?.paths[0] ?? '');
        break;
    }
    setShowOPtion(false);
    return FileModel(path.isNotEmpty ? path : selectedFile!.path,
        path.isNotEmpty ? type : selectedFile!.type);
  }
}
