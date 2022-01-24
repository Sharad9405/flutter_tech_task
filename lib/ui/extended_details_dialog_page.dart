import 'package:flutter/material.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart' as InAppWebView;

class ExtendedDetailsDialogPage extends StatefulWidget {
  const ExtendedDetailsDialogPage({Key key}) : super(key: key);

  @override
  _ExtendedDetailsDialogPageState createState() => _ExtendedDetailsDialogPageState();
}

class _ExtendedDetailsDialogPageState extends State<ExtendedDetailsDialogPage> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(20),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("Sharad", style: TextStyle(
            color: Colors.black,fontSize: 14
          ),),

          Container(
            child: InAppWebView.InAppWebView(
              initialUrlRequest: InAppWebView.URLRequest(url: Uri.parse('pub.dev')),
              initialOptions: InAppWebView.InAppWebViewGroupOptions(
                android: InAppWebView.AndroidInAppWebViewOptions(
                  useHybridComposition: true
                ),
                ios: InAppWebView.IOSInAppWebViewOptions(
                  allowsAirPlayForMediaPlayback: true
                ),
                crossPlatform: InAppWebView.InAppWebViewOptions(
                  useShouldOverrideUrlLoading: true,
                  mediaPlaybackRequiresUserGesture: false
                )
              ),

              shouldOverrideUrlLoading: (controller, navigationAction) async{
                var url = navigationAction.request.url.toString();
                if(url.startsWith('mailto:')){
                  // try{
                  //   launch()
                  // }
                  return InAppWebView.NavigationActionPolicy.CANCEL;
                }else{
                  return InAppWebView.NavigationActionPolicy.ALLOW;
                }
              },
              onLoadError: (controller, url, code, message){
                print('onLoadError url = $url');
              },

            ),
          ),
        ],
      ),
    );
  }
}
