
abstract class IView {
  void showToast(String msg);
}
abstract class IPresenter<T> {
  void attachView(T baseView);
  void detachView();
  bool isAttached();
}

abstract class BasePresenter<T extends IView> implements IPresenter<T> {
  T _view;

  @override
  void attachView(T baseView) {
    this._view = baseView;
    initView();
    initModel();
  }

  void initView();
  void initModel();

  @override
  void detachView() {
    this._view = null;
  }

  @override
  bool isAttached() {
    return this._view != null;
  }
}

abstract class IModel<T> {

  /// 请求数据之前， 比如开启加载动画等
  void onBefore();

  /// 请求成功回调
  void onSuccess(T data);

  void onFailure(String msg);

  void onComplete();

  void onNetError();
  /// 数据异常
  void onDataError();
}