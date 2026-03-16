import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:aashirwad/core/core.dart';
import 'package:aashirwad/features/dashboard/presentation/bloc/bloc_provider.dart';
import 'package:aashirwad/styles/app_colors.dart';
import 'package:aashirwad/widgets/app_error_widget.dart';
import 'package:aashirwad/widgets/loading_indicator.dart';
import 'package:aashirwad/widgets/widgets.dart';

class DashboardWebview extends StatefulWidget {
  const DashboardWebview({super.key, required this.name, required this.title});

  final String name;
  final String title;

  @override
  State<DashboardWebview> createState() => _DashboardWebviewState();
}

class _DashboardWebviewState extends State<DashboardWebview> {
  @override
  void initState() {
    super.initState();
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
      DeviceOrientation.landscapeLeft,
      DeviceOrientation.landscapeRight,
    ]);
  }

  @override
  void dispose() {
    super.dispose();
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
    ]);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.dashboard,
        automaticallyImplyLeading: false,
        leadingWidth: 38,
        leading: const Padding(
          padding: EdgeInsets.only(left: 8.0),
          child: GoBackWidget(),
        ),
        title: Text(
          widget.title,
          style: context.textTheme.titleMedium?.copyWith(
            fontWeight: FontWeight.bold,
            color: AppColors.white,
          ),
        ),
      ),
      body: BlocBuilder<DashboardURLCubit, DashboardURLState>(
        builder: (_, state) => state.maybeWhen(
          orElse: () => const LoadingIndicator(),
          failure: (failure) => AppErrorWidget(
            error: failure.error,
            onRefresh: () =>
                context.cubit<DashboardURLCubit>().request(widget.name),
          ),
          success: (url) => OrientationBuilder(
            builder: (context, orientation) =>SizedBox (
              key: ValueKey(orientation),
              width: context.sizeOfWidth,
              child: _WebViewWidget(url)),
          ),
        ),
      ),
    );
  }
}

class _WebViewWidget extends StatefulWidget {
  const _WebViewWidget(this.url);

  final String url;

  @override
  State<_WebViewWidget> createState() => _WebViewWidgetState();
}

class _WebViewWidgetState extends State<_WebViewWidget> {
  double linearProgress = 0;
  InAppWebViewController? _webViewController;

  @override
  Widget build(BuildContext context) {
    return Stack(
      fit: StackFit.expand,
      children: [
        InAppWebView(
            initialUrlRequest: URLRequest(
              url: WebUri(
                '${Urls.baseUrl.replaceFirst(RegExp(r"/api$"), '')}/insights/public/dashboard/${widget.url}',
              ),
            ),
            contextMenu: ContextMenu(menuItems: []),
            onReceivedLoginRequest: (controller, loginRequest) {},
            onWebViewCreated: (InAppWebViewController controller) {
              _webViewController = controller;
            },
            onProgressChanged: (controller, progress) {
              setState(() {
                linearProgress = progress / 100;
              });
            },
            onReceivedError: (controller, request, error) {
              $logger.error(
                  '[Dashboard WebView]', error.type, error.description);
            },
            onLoadStop: (controller, url) async {
              await _webViewController?.evaluateJavascript(source: """
              var elements = document.getElementsByClassName("whitespace-nowrap px-1.5 text-2xl font-medium");
              if (elements.length > 0) {
                elements[0].style.display = 'none';
              }
              var elements = document.getElementsByClassName("rg:w-60 flex w-14 flex-shrink-0 flex-col border-r border-gray-300 bg-white");
              if (elements.length > 0) {
                elements[0].style.display = 'none';
              }
              """);
            }),
        Align(alignment: Alignment.topCenter, child: _buildProgressBar()),
      ],
    );
  }

  Widget _buildProgressBar() {
    if (linearProgress != 1.0) {
      return LinearProgressIndicator(
          value: linearProgress, color: AppColors.shyMoment);
    }
    return const SizedBox.shrink();
  }
}
