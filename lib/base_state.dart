import 'package:flutter/material.dart';

abstract class BaseState<T extends StatefulWidget, U> extends State<T>
    with AutomaticKeepAliveClientMixin {
  bool loading = true;
  late U data;
  APIResponse<U>? response;
  final GlobalKey<ScaffoldState> scaffold = GlobalKey();
  RefreshController refreshController =
      RefreshController(initialRefresh: false);
  ScrollController scrollController = ScrollController();

  int page = 1;
  bool? hasMore = false;

  bool showAd = false;

  @override
  void initState() {
    super.initState();
    getData();

    if (paginate) {
      scrollController.addListener(() {
        if (scrollController.position.pixels ==
                scrollController.position.maxScrollExtent &&
            hasMore!) {
          page++;
          getData();
        }
      });
    }
  }

  @override
  void dispose() {
    refreshController.dispose();
    scrollController.dispose();
    super.dispose();
  }

  void refresh() {
    if (paginate) {
      setState(() {
        page = 1;
      });
    }
    if (pullToRefresh) {
      refreshController.requestRefresh();
    }
    getData();
  }

  void handleResponse(APIResponse<U> _response) {
    if (!mounted) return;
    if (_response.status!.status == ApiStatus.OK) {
      setState(() {
        if (paginate) {
          hasMore = _response.hasMore;
          if (page == 1)
            data = _response.data;
          else
            (data as List).addAll(_response.data as List);
        } else
          data = _response.data;

        response = _response;
      });
    } else {
      setState(() {
        response = _response;
      });
    }
    setState(() {
      loading = false;
    });
    refreshController.refreshCompleted();
    dataLoadedCallback();
  }

  Future<bool> onWillPop() async {
    print_("----------------------scopePOP------------");
    return true;
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    if (withScaffold)
      return Scaffold(
        key: scaffold,
        appBar: withAppBar ? customAppBar as PreferredSizeWidget? : null,
        drawer: drawer,
        body: PopScope(
          canPop: true,
          child: content(),
        ),
        floatingActionButton: fab,
      );
    else
      return content();
  }

  @protected
  Widget content() {
    if (pullToRefresh)
      return Container(
        child: SmartRefresher(
          controller: refreshController,
          header: const WaterDropMaterialHeader(),
          onRefresh: refresh,
          child: showHeader(),
        ),
      );
    else
      return showHeader();
  }

  Widget showHeader() {
    return header == null
        ? builder()
        : Column(
            children: <Widget>[
              header!,
              Expanded(
                child: builder(),
              )
            ],
          );
  }

  Widget builder() {
    if (loading)
      return pageLoader;
    else if (response != null &&
        response!.status!.status == ApiStatus.NOT_FOUND)
      return notFound;
    else if (response != null &&
        response!.status!.status == ApiStatus.NO_INTERNET)
      return noInternet;
    else if (response != null && response!.status!.status != ApiStatus.OK)
      return unknownError;
    else
      return body();
  }

  Widget body();

  String get title => '';

  String get errorMessage => 'Not Found';

  bool get withScaffold => true;

  bool get withAppBar => true;

  Widget get customAppBar => AppBar(
        automaticallyImplyLeading: false,
        centerTitle: false,
        title: Text(
          title,
          style: const TextStyle(
            color: Colors.black,
            fontSize: 26,
            fontFamily: 'OverUsed',
            fontWeight: FontWeight.w600,
          ),
        ),
        actions: actions,
      );

  bool get pullToRefresh => true;

  bool get retry => true;

  Widget? get drawer => null;

  Widget? get fab => null;

  Widget? get header => null;

  dynamic get actions => null;

  @override
  bool get wantKeepAlive => true;

  void getData();

  void dataLoadedCallback() {}

  Widget get pageLoader {
    return FullLoader();
  }

  bool get paginate => false;

  Widget paginateLoader() {
    return (!hasMore!)
        ? const Divider(height: 10)
        : Padding(
            padding: const EdgeInsets.all(4.0),
            child: Center(child: Loader(size: 50, ball: 10)),
          );
  }

  Widget get notFound => SingleChildScrollView(
        child: NotAvailable(
          errorMessage,
          title: 'Error',
        ),
      );

  Widget get noInternet => NotAvailable(
        response!.status!.message,
        buttonText: retry ? 'Erneut versuchen' : null,
        callback: (_) {
          setState(() {
            // data = null;
            loading = true;
          });
          getData();
        },
      );

  Widget get unknownError => NotAvailable(response!.status!.message);
}
