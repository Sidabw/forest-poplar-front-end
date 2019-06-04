package com.example.startup_namer;

import android.Manifest;
import android.app.FragmentManager;
import android.content.pm.PackageManager;
import android.os.Bundle;
import io.flutter.app.FlutterActivity;
import io.flutter.plugins.GeneratedPluginRegistrant;

import com.baidu.location.BDAbstractLocationListener;
import com.baidu.location.BDLocation;
import com.baidu.location.LocationClient;
import com.baidu.location.LocationClientOption;
import com.baidu.mapapi.CoordType;
import com.baidu.mapapi.SDKInitializer;
import com.baidu.mapapi.map.BaiduMap;
import com.baidu.mapapi.map.BaiduMapOptions;
import com.baidu.mapapi.map.MapStatus;
import com.baidu.mapapi.map.MapStatusUpdate;
import com.baidu.mapapi.map.MapStatusUpdateFactory;
import com.baidu.mapapi.map.MapView;
import com.baidu.mapapi.map.MyLocationData;
import com.baidu.mapapi.map.SupportMapFragment;
import com.baidu.mapapi.model.LatLng;

public class MainActivity extends FlutterActivity {
//  @Override
//  protected void onCreate(Bundle savedInstanceState) {
//    super.onCreate(savedInstanceState);
//    MapView mapView = new MapView(this);
//    MapRegistrant.registerWith(this, mapView);
//  }


  private MapView mMapView = null;
  private BaiduMap mBaiduMap = null;
  private LocationClient mLocationClient = null;

  private static final String[] authBaseArr = {//申请类型
          Manifest.permission.ACCESS_COARSE_LOCATION,
          Manifest.permission.ACCESS_FINE_LOCATION
  };
  private static final int authBaseRequestCode = 1;
  private void initNavi() {
    // 申请权限
    if (android.os.Build.VERSION.SDK_INT >= 23) {
      if (!hasLocateAuth()) {
        this.requestPermissions(authBaseArr, authBaseRequestCode);
        return;
      }
    }
  }
  private boolean hasLocateAuth() {
    PackageManager pm = getPackageManager();
    for (String auth : authBaseArr) {
      if (pm.checkPermission(auth, getPackageName()) != PackageManager.PERMISSION_GRANTED) {
        return false;
      }
    }
    return true;
  }
  @Override
  protected void onCreate(Bundle savedInstanceState) {
    initNavi();//申请权限
    System.out.println("method onCreate start");
    //1 显示地图
//    super.onCreate(savedInstanceState);
//    setContentView(R.layout.main_activity);
//    //获取地图控件引用
//    mMapView = (MapView) findViewById(R.id.bmapView);
//    setContentView(mMapView);

    //2显示卫星地图、设置缩放级别 (使用BaiduMapOptions)
    super.onCreate(savedInstanceState);
    BaiduMapOptions baiduMapOptions = new BaiduMapOptions();
    //显示卫星地图
    baiduMapOptions.mapType(BaiduMap.MAP_TYPE_NORMAL);
    //设置缩放级别
    MapStatus mapStatus = new MapStatus.Builder().zoom(18.0f).build();
    baiduMapOptions.mapStatus(mapStatus);
    mMapView = new MapView(this, baiduMapOptions);
    mBaiduMap = mMapView.getMap();
    mBaiduMap.setMyLocationEnabled(true);

    //定位初始化
    mLocationClient = new LocationClient(this);
    //通过LocationClientOption设置LocationClient相关参数
    LocationClientOption option = new LocationClientOption();
    option.setOpenGps(true); // 打开gps
    option.setCoorType("bd09ll"); // 设置坐标类型
    option.setScanSpan(1000);
   //设置locationClientOption
    mLocationClient.setLocOption(option);
    //注册LocationListener监听器
    MyLocationListener myLocationListener = new MyLocationListener();
    mLocationClient.registerLocationListener(myLocationListener);
    //开启地图定位图层
    mLocationClient.start();
    System.out.println("method onCreate end");
    setContentView(mMapView);

  }
  @Override
  protected void onResume() {
    //在activity执行onResume时执行mMapView. onResume ()，实现地图生命周期管理
    mMapView.onResume();
    super.onResume();
  }
  @Override
  protected void onPause() {
    //在activity执行onPause时执行mMapView. onPause ()，实现地图生命周期管理
    mMapView.onPause();
    super.onPause();
  }
  @Override
  protected void onDestroy() {
    mLocationClient.stop();
    mBaiduMap.setMyLocationEnabled(false);
    mMapView.onDestroy();
    mMapView = null;
    super.onDestroy();
  }

  public class MyLocationListener extends BDAbstractLocationListener {
    @Override
    public void onReceiveLocation(BDLocation location) {
      //mapView 销毁后不在处理新接收的位置
      System.out.println("method onReceiveLocation start");
      System.out.println("----");
      System.out.println(new StringBuffer().append(location.getLongitude()).toString());
      System.out.println(location.getLatitude());
      System.out.println("----");
      if (location == null || mMapView == null){
        return;
      }
      MyLocationData locData = new MyLocationData.Builder()
              .accuracy(location.getRadius())
              // 此处设置开发者获取到的方向信息，顺时针0-360
              .direction(location.getDirection()).latitude(location.getLatitude())
              .longitude(location.getLongitude()).build();
      mBaiduMap.setMyLocationData(locData);
      System.out.println("method onReceiveLocation end");
    }
  }
}
