import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:flutter_getx_news/extension/news_extension.dart';
import 'package:flutter_getx_news/features/presentation/news/controller/news_controller.dart';
import 'package:url_launcher/url_launcher.dart';

class NewsPage extends StatelessWidget {
  NewsPage({Key? key}) : super(key: key);

  final news = Get.find<NewsController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('News'),
      ),
      body: Obx(() => news.loading.value
          ? const Center(child: CircularProgressIndicator())
          : 0.toList(
              length: news.data.length,
              builder: (_, i) {
                var model = news.data[i];
                if (news.data.isNotEmpty) {
                  return GestureDetector(
                    onTap: () async {
                      showDialog(
                          context: context,
                          builder: (BuildContext context) {
                            return AlertDialog(
                              title: const Text('Open with Browser'),
                              content: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  GestureDetector(
                                    onTap: () async {
                                      Navigator.pop(context);
                                      await launchUrl(Uri.parse(model.url),
                                          mode: LaunchMode.externalApplication);
                                    },
                                    child: Container(
                                        padding: EdgeInsets.all(4.sp),
                                        decoration: const BoxDecoration(
                                            color: Colors.blue),
                                        child: const Text(
                                          'External',
                                          style: TextStyle(color: Colors.white),
                                        )),
                                  ),
                                  GestureDetector(
                                    onTap: () async {
                                      Navigator.pop(context);
                                      await launchUrl(Uri.parse(model.url));
                                    },
                                    child: Container(
                                        padding: EdgeInsets.all(4.sp),
                                        decoration: const BoxDecoration(
                                            color: Colors.blue),
                                        child: const Text(
                                          'Internal',
                                          style: TextStyle(color: Colors.white),
                                        )),
                                  )
                                ],
                              ),
                            );
                          });
                    },
                    child: Container(
                      padding: EdgeInsets.symmetric(horizontal: 12.sp),
                      margin: EdgeInsets.symmetric(
                          horizontal: 6.sp, vertical: 8.sp),
                      child: Row(
                        children: [
                          CachedNetworkImage(
                            imageUrl: model.urlToImage,
                            fit: BoxFit.cover,
                            height: 90.sp,
                            width: 90.sp,
                            placeholder: (context, url) => Center(
                              child: SizedBox(
                                  height: 34.sp,
                                  width: 34.sp,
                                  child: const CircularProgressIndicator()),
                            ),
                            errorWidget: (context, url, error) =>
                                const Icon(Icons.error),
                          ),
                          SizedBox(
                            width: 10.sp,
                          ),
                          Expanded(
                            child: ListTile(
                              contentPadding: EdgeInsets.zero,
                              title: Text(
                                model.title,
                                maxLines: 2,
                                overflow: TextOverflow.ellipsis,
                                style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 16.sp,
                                    fontWeight: FontWeight.w500),
                              ),
                              subtitle: Padding(
                                padding: EdgeInsets.symmetric(vertical: 6.sp),
                                child: Text(
                                  model.description,
                                  maxLines: 3,
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                } else {
                  return const Center(
                    child: Text('Belum ada berita'),
                  );
                }
              })),
    );
  }
}
