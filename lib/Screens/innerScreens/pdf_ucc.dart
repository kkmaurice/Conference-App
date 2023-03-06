// ignore_for_file: avoid_unnecessary_containers

import 'package:conference/Screens/innerScreens/gallery.dart';
import 'package:conference/Widgets/pdf.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../helpers/style.dart';

class PdfUcc extends StatefulWidget {
  const PdfUcc({super.key});
  static const routeName = 'pdf_ucc';

  @override
  State<PdfUcc> createState() => _PdfUccState();
}

class _PdfUccState extends State<PdfUcc> {
  bool _isloading = false;

  late PdfViewerController _pdfViewerController;
  @override
  void initState() {
    _pdfViewerController = PdfViewerController();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: 2,
        child: Scaffold(
          backgroundColor: primaryColor,
          appBar: AppBar(
            backgroundColor: primaryColor,
            automaticallyImplyLeading: false,
            flexibleSpace: Container(
                height: 300,
                decoration: const BoxDecoration(
                  color: cardColor,
                  // image: DecorationImage(
                  //     image: AssetImage('assets/images/photo1.png'),
                  //     fit: BoxFit.cover),
                  // borderRadius: BorderRadius.only(
                  //   bottomLeft: Radius.circular(40),
                  //   bottomRight: Radius.circular(40),
                  // ),
                )),
            centerTitle: true,
            elevation: 0.0,
            bottom: const TabBar(
              indicatorColor: Colors.white,
              indicatorPadding: EdgeInsets.only(
                left: 50,
                right: 50,
              ),
              indicatorWeight: 7.0,
              tabs: [
                Tab(
                  icon: Icon(
                    Icons.picture_as_pdf,
                    size: 27,
                  ),
                  text: 'About UCC',
                ),
                Tab(
                  icon: Icon(Icons.airplane_ticket, size: 27),
                  text: 'Get Ticket',
                ),
                // Tab(
                //   icon: Icon(Icons.airplane_ticket, size: 27),
                //   text: 'Gallery',
                // ),
              ],
            ),
          ),
          body: TabBarView(children: [
            //const Pdf(),
            SfPdfViewer.asset(
              'assets/pdfFile/ucc.pdf',
              controller: _pdfViewerController,
            ),
            //const GalleryScreen(),
            Container(
              child: Center(
                child: ElevatedButton.icon(
                    onPressed: () async {
                      await EasyLoading.show(status: 'loading...');
                      // setState(() {
                      //   _isloading = true;
                      // });

                      const url =
                          'https://www.eventbrite.com/e/uganda-canada-convention-ottawa-2023-edition-tickets-452430771617';
                      if (await canLaunchUrl(Uri.parse(url))) {
                        await launchUrl(Uri.parse(url));
                      } else {
                        throw 'Could not launch $url';
                      }
                      EasyLoading.dismiss();
                      // setState(() {
                      //   _isloading = false;
                      // });
                    },
                    icon: const Icon(Icons.airplane_ticket),
                    label: Text('Get Ticket')),
              ),
            )
          ]),
        ));
  }
}
