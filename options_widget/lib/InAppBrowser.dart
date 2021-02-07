import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';

class Browser extends StatefulWidget
{
  final String url;
  Browser({Key key, this.url}) : super(key: key);

  @override
  _BrowserState createState() => _BrowserState(url);

}

class _BrowserState extends State<Browser>
{
  String url;
  double bar = 0;
  InAppWebViewController webViewController;

  _BrowserState(this.url);

  @override
  void initState()
  {
    super.initState();
  }

  @override
  void dispose()
  {
    super.dispose();
  }
  @override
  Widget build(BuildContext context)
  {
    debugPrint(url);
    return Container
    (
      child: Column
      (
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>
        [
          Container
          (
            padding: EdgeInsets.all(0),
            child: bar < 1.0 ? LinearProgressIndicator(value: bar) : Container()
          ),
          Expanded
          (
            child: Container
            (
              margin: const EdgeInsets.all(0),
              decoration: BoxDecoration(border: Border.all(color: Colors.blueAccent)),
              child: InAppWebView
              (
                initialUrl: url,
                initialHeaders: {},
                initialOptions: InAppWebViewGroupOptions
                (
                  crossPlatform: InAppWebViewOptions
                  (
                    debuggingEnabled: true,
                  )
                ),
                onWebViewCreated: (InAppWebViewController controller)
                {
                  webViewController = controller;
                },
                onLoadStart: (InAppWebViewController controller, String url)
                {
                  setState
                  (
                    ()
                    {
                      this.url = url;
                    }
                  );
                },
                onLoadStop: (InAppWebViewController controller, String url) async
                {
                  setState
                  (
                    ()
                    {
                      this.url = url;
                    }
                  );
              },
              onProgressChanged: (InAppWebViewController controller, int bar)
              {
                setState
                (
                  ()
                  {
                    this.bar = bar / 100;
                  }
                );
              },
            ),
          ),
        ),
          ButtonBar
          (
            alignment: MainAxisAlignment.center,
            children: <Widget>[
              ElevatedButton.icon
              (
                label: Text(""),
                style: ElevatedButton.styleFrom
                (
                  primary: Colors.white,
                  onPrimary: Colors.blue,
                  shape:RoundedRectangleBorder(borderRadius: BorderRadius.circular(30.0),),
                ),
                icon: Icon(Icons.arrow_back),
                onPressed: ()
                {
                  if (webViewController != null)
                  {
                    webViewController.goBack();
                  }
                },
              ),
              ElevatedButton.icon
              (
                label: Text(""),
                style: ElevatedButton.styleFrom
                (
                  primary: Colors.white,
                  onPrimary: Colors.blue,
                  shape:RoundedRectangleBorder(borderRadius: BorderRadius.circular(30.0),),
                ),
                icon: Icon(Icons.arrow_forward),
                onPressed: ()
                {
                  if (webViewController != null)
                  {
                    webViewController.goForward();
                  }
                },
              ),
              ElevatedButton.icon
               (
                label: Text(""),
                style: ElevatedButton.styleFrom
                (
                  primary: Colors.white,
                  onPrimary: Colors.blue,
                  shape:RoundedRectangleBorder(borderRadius: BorderRadius.circular(30.0),),
                ),
                icon: Icon(Icons.refresh),
                onPressed: ()
                {
                  if (webViewController != null)
                  {
                    webViewController.reload();
                  }
                },
              ),
            ],
          ),
        ],
      ),
    );
  }

}
