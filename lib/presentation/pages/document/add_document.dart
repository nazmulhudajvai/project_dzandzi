import 'dart:io';

import 'package:dzandzi/theams/app_colors.dart';
import 'package:dzandzi/theams/app_color2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:file_picker/file_picker.dart';

class UploadedFile {
  final String name;
  final String status;

  UploadedFile({required this.name, this.status = 'processing'});
}

class AddDocument extends StatefulWidget {
  const AddDocument({super.key});

  @override
  State<AddDocument> createState() => _AddDocumentState();
}

class _AddDocumentState extends State<AddDocument> {
  final List<UploadedFile> _uploadQueue = [];

  void _addFilesToQueue(List<File> files) {
    setState(() {
      for (var file in files) {
        _uploadQueue.add(UploadedFile(name: file.path.split('/').last));
      }
    });
  }

  void _removeFileFromQueue(int index) {
    setState(() {
      _uploadQueue.removeAt(index);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF0F4F8),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 16.h),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    InkWell(
                      onTap: () {
                        Get.back();
                      },
                      child: Icon(
                        Icons.arrow_back,
                        color: AppColors.headerColor,
                      ),
                    ),
                    SizedBox(width: 50.w),
                    Text(
                      'Add New Documents',
                      style: TextStyle(
                        color: AppColors.headerColor,
                        fontSize: 24.sp,
                        fontStyle: GoogleFonts.roboto().fontStyle,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 24.h),
                Text(
                  'Upload Files',
                  style: TextStyle(
                    color: AppColors.txtcolor2,
                    fontSize: 20.sp,
                    fontStyle: GoogleFonts.roboto().fontStyle,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                SizedBox(height: 20.h),
                Text(
                  'Document Tittle*',
                  style: TextStyle(
                    color: AppColors.textFeieldTitle,
                    fontSize: 16.sp,
                    fontStyle: GoogleFonts.roboto().fontStyle,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                SizedBox(height: 8.h),
                TextField(
                  cursorColor: Colors.grey,
                  decoration: InputDecoration(
                    hintText: 'Type name',
                    hintStyle: const TextStyle(color: Colors.grey),
                    filled: true,
                    fillColor: AppColors.textFieldColor,
                    contentPadding: EdgeInsets.symmetric(
                      vertical: 12.h,
                      horizontal: 16.w,
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(48.r),
                      borderSide: const BorderSide(color: AppColors.greyborder),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(48.r),
                      borderSide: const BorderSide(color: AppColors.greyborder),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(48.r),
                      borderSide: const BorderSide(color: AppColors.greyborder),
                    ),
                  ),
                ),
                SizedBox(height: 20.h),
                Text(
                  'Project*',
                  style: TextStyle(
                    color: AppColors.textFeieldTitle,

                    fontSize: 16.sp,
                    fontStyle: GoogleFonts.roboto().fontStyle,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                SizedBox(height: 8.h),
                DropdownButtonFormField<String>(
                  icon: Icon(
                    Icons.keyboard_arrow_down_rounded,
                    color: Colors.grey,
                    size: 24.sp,
                  ),
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: AppColors.textFieldColor,
                    contentPadding: EdgeInsets.symmetric(
                      vertical: 12.h,
                      horizontal: 16.w,
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(48.r),
                      borderSide: BorderSide(color: AppColors.greyborder),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(48.r),
                      borderSide: BorderSide(color: AppColors.greyborder),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(48.r),
                      borderSide: BorderSide(color: AppColors.greyborder),
                    ),
                  ),
                  hint: Text(
                    'Select Project',
                    style: TextStyle(color: Colors.grey),
                  ),
                  items: <String>['Project 1', 'Project 2', 'Project 3']
                      .map<DropdownMenuItem<String>>((String value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: Text(value),
                        );
                      })
                      .toList(),
                  onChanged: (String? newValue) {},
                ),
                SizedBox(height: 24.h),
                FileUploadCard(onFilesSelected: _addFilesToQueue),
                SizedBox(height: 24.h),
                if (_uploadQueue.isNotEmpty)
                  UploadQueue(
                    files: _uploadQueue,
                    onRemove: _removeFileFromQueue,
                  ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class FileUploadCard extends StatelessWidget {
  final Function(List<File>) onFilesSelected;

  const FileUploadCard({super.key, required this.onFilesSelected});

  Future<void> _pickFiles() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles(
      allowMultiple: true,
    );

    if (result != null) {
      List<File> files = result.paths.map((path) => File(path!)).toList();
      onFilesSelected(files);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 32.h),
      decoration: BoxDecoration(
        color: AppColors.lightBlue2,
        borderRadius: BorderRadius.circular(16.r),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            padding: EdgeInsets.all(12.r),
            decoration: const BoxDecoration(
              color: AppColor.blueColor,
              shape: BoxShape.circle,
            ),
            child: Image.asset(
              "assets/icon/upload2.png",
              height: 20.h,
              width: 20.w,
            ),
          ),
          SizedBox(height: 16.h),
          Text(
            'Upload files',
            style: TextStyle(
              fontSize: 20.sp,
              fontWeight: FontWeight.w500,
              color: AppColor.textColor,
            ),
          ),
          SizedBox(height: 4.h),
          Text(
            'Click to browse files',
            style: TextStyle(fontSize: 16.sp, color: Colors.grey.shade600),
          ),
          SizedBox(height: 24.h),
          SizedBox(
            height: 39.h,
            width: double.infinity,
            child: ElevatedButton(
              onPressed: _pickFiles,
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFF1E90FF),
                padding: EdgeInsets.symmetric(vertical: 8.h),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30.r),
                ),
                elevation: 0,
              ),
              child: Text(
                'Upload',
                style: TextStyle(
                  fontSize: 16.sp,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class UploadQueue extends StatelessWidget {
  final List<UploadedFile> files;
  final Function(int) onRemove;

  const UploadQueue({super.key, required this.files, required this.onRemove});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16.w),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16.r),
        border: Border.all(color: const Color(0xFFE0E0E0)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Upload Queue',
            style: TextStyle(
              fontSize: 18.sp,
              fontWeight: FontWeight.bold,
              color: const Color(0xFF0D2549),
            ),
          ),
          SizedBox(height: 12.h),
          ListView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: files.length,
            itemBuilder: (context, index) {
              final file = files[index];
              return Padding(
                padding: EdgeInsets.only(bottom: 8.h),
                child: Container(
                  padding: EdgeInsets.symmetric(
                    horizontal: 12.w,
                    vertical: 8.h,
                  ),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(24.r),
                    border: Border.all(color: AppColor.blackColor),
                  ),
                  child: Row(
                    children: [
                      const Icon(
                        Icons.circle,
                        color: Color(0xFF0D2549),
                        size: 12,
                      ),
                      SizedBox(width: 12.w),
                      Expanded(
                        child: Text(file.name, overflow: TextOverflow.ellipsis),
                      ),
                      SizedBox(width: 12.w),
                      Text(file.status, style: TextStyle(color: Colors.grey)),
                      SizedBox(width: 8.w),
                      InkWell(
                        onTap: () => onRemove(index),
                        child: Icon(Icons.close, color: Colors.grey, size: 18),
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
