import 'package:flutter/material.dart';

class TabArticlePage extends StatefulWidget {
  TabArticlePage({Key key}) : super(key: key);

  @override
  _TabArticlePageState createState() => new _TabArticlePageState();
}

class _TabArticlePageState extends State<TabArticlePage> {

  bool _active = false;

  void _handleTapBoxChanged(bool newValue) {
    setState((){
      _active = newValue;
    });
  }

  @override
  Widget build(BuildContext context) {
    return new Container(
       child: new TapBoxC(
         active: _active,
         onChanged: _handleTapBoxChanged,
       ),
    ); 
  }
}
 
class TapBoxC extends StatefulWidget {
  TapBoxC({Key key, this.active:false, this.onChanged}) : super(key: key);
 
  final bool active;

  final ValueChanged<bool> onChanged;

  @override
  _TapBoxCState createState() => new _TapBoxCState();
}

class _TapBoxCState extends State<TapBoxC> {
  
  bool _highlight = false;

  void _handleTapDown(TapDownDetails details) {
    setState((){
      _highlight = true;
    });
  }

  void _handleTapUp(TapUpDetails details) {
    setState((){
      _highlight = false;
    });
  }

  void _handleTapCancel() {
    setState((){
      _highlight = false;
    });
  }

  void _handleTap() {
    widget.onChanged(!widget.active);
  }
    
  @override
  Widget build(BuildContext context) {
    return new GestureDetector(
      onTapDown: _handleTapDown,
      onTapUp: _handleTapUp,
      onTap: _handleTap,
      onTapCancel: _handleTapCancel,
      child: new Container(
        width: 200.0,
        height: 200.0,
        child: new Center(
          child: new Text(
            widget.active ? "Active" : "Inactive",
            style: new TextStyle(
              fontSize: 32.0,
              color: Colors.white
            ),
          ),
        ),
        decoration: new BoxDecoration(
          color: widget.active ? Colors.lightGreen[700] : Colors.grey[600],
          border: _highlight ? new Border.all(color: Colors.teal[700], width: 10.0) : null,
        ),
      ),
    );
  }
}