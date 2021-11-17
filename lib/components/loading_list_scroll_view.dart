
import 'package:flutter/material.dart';

class LoadingListScrollView extends StatefulWidget {
  @override
  _LoadingListScrollViewState createState() => _LoadingListScrollViewState();
}

class _LoadingListScrollViewState extends State<LoadingListScrollView> {

  final ScrollController _scrollController= ScrollController();

  List<String> items = [];
  bool loading = false, allLoaded = false;

  mockFetch() async {
    if (allLoaded){
      return;
    }
    setState((){
      loading = true;
    });

    await Future.delayed(Duration(milliseconds: 500));

    List<String> newData = items.length >= 100 ? []: List.generate(20, (index) => "List Item ${index + items.length}");

    if(newData.isNotEmpty){
      items.addAll(newData);
    }
    setState((){
      loading = false;
      allLoaded = newData.isEmpty;
    });
  }

  @override
  void initState(){
    super.initState();
    mockFetch();
    _scrollController.addListener(() {
      if(_scrollController.position.pixels >= _scrollController.position.maxScrollExtent && !loading){
        print('New data called');
        mockFetch();
      }
    });
  }

  @override
  void dispose(){
    super.dispose();
    _scrollController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Loading List View'),
      ),
      body: LayoutBuilder(
        builder: (context, constraints){
          if(items.isNotEmpty){
            return Stack(
              children: [

                ListView.separated(
                    controller: _scrollController,
                    itemBuilder: (context, index){
                      if(index < items.length){
                        return ListTile(
                          title: Text(items[index]),
                        );
                      }else{
                        return Container(
                          width: constraints.maxWidth,
                          height: 50,
                          child: Center(
                            child: Text('Nothing else to load!'),
                          ),
                        );
                      }
                    }, separatorBuilder: (context, index){
                  return Divider(height: 1.0,);
                }, itemCount: items.length+(allLoaded?1 : 0)),

                if(loading)...[
                  Positioned(
                    left: 0,
                    bottom: 0,
                    child: Container(
                      width: constraints.maxWidth,
                      height: 80,
                      child: Center(
                        child: CircularProgressIndicator(),
                      ),
                    ),
                  ),
                ],
              ],
            );
          }else{
            return Container(
              child: Center(
                child: CircularProgressIndicator(),
              ),
            );
          }
        },
      ),
    );
  }
}
