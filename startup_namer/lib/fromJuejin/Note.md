### Jue Jin
*    Dart 不需要给变量设置 setter getter 方法, 自带 getter 和 setter ，而如果是 final 或者 const 的话，那么它只有一个 getter 方法。
*   Widget 分为 有状态 和 无状态 两种，在 Flutter 中每个页面都是一帧。无状态就是保持在那一帧。而有状态的 Widget 当数据更新时，其实是绘制了新的 Widget，只是 State 实现了跨帧的数据同步保存。
*   所谓有状态的Widget，每次setState()时候刷新一帧，重新调用build().