package com.example.startup_namer;

import android.Manifest;
import android.app.FragmentManager;
import android.content.pm.PackageManager;
import android.os.Bundle;
import android.support.v7.app.AppCompatActivity;
import android.view.View;
import android.widget.Button;
import android.widget.Toast;

import io.flutter.app.FlutterActivity;
import io.flutter.plugins.GeneratedPluginRegistrant;

import com.baidu.location.BDAbstractLocationListener;
import com.baidu.location.BDLocation;
import com.baidu.location.BDLocationListener;
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
//    MapStatus mapStatus = new MapStatus.Builder().zoom(18.0f).build();
//    baiduMapOptions.mapStatus(mapStatus);
    mMapView = new MapView(this, baiduMapOptions);
    mBaiduMap = mMapView.getMap();
    mBaiduMap.setMyLocationEnabled(true);

    //切换初始定位到上海
//    LatLng GEO_SHANGHAI = new LatLng(31.227, 121.481);
//    MapStatusUpdate status2 = MapStatusUpdateFactory.newLatLng(GEO_SHANGHAI);
//    mBaiduMap.setMapStatus(status2);
    setContentView(mMapView);



    initLocationOption();
//    //定位初始化
//    mLocationClient = new LocationClient(this);
//    //通过LocationClientOption设置LocationClient相关参数
//    LocationClientOption option = new LocationClientOption();
//    option.setOpenGps(true); // 打开gps
//    option.setCoorType("bd09ll"); // 设置坐标类型
//    option.setScanSpan(1000);
//   //设置locationClientOption
//    mLocationClient.setLocOption(option);
//    //注册LocationListener监听器
//    MyLocationListener myLocationListener = new MyLocationListener();
//    mLocationClient.registerLocationListener(myLocationListener);
//    //开启地图定位图层
//    mLocationClient.start();
    System.out.println("method onCreate end");

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
  /**
   * 初始化定位参数配置
   */

  private void initLocationOption() {
//定位服务的客户端。宿主程序在客户端声明此类，并调用，目前只支持在主线程中启动
    LocationClient locationClient = new LocationClient(getApplicationContext());
//声明LocationClient类实例并配置定位参数
    LocationClientOption locationOption = new LocationClientOption();
    MyLocationListener myLocationListener = new MyLocationListener();
//注册监听函数
    locationClient.registerLocationListener(myLocationListener);
//可选，默认高精度，设置定位模式，高精度，低功耗，仅设备
    locationOption.setLocationMode(LocationClientOption.LocationMode.Hight_Accuracy);
//可选，默认gcj02，设置返回的定位结果坐标系，如果配合百度地图使用，建议设置为bd09ll;
    locationOption.setCoorType("gcj02");
//可选，默认0，即仅定位一次，设置发起连续定位请求的间隔需要大于等于1000ms才是有效的
    locationOption.setScanSpan(1000);
//可选，设置是否需要地址信息，默认不需要
    locationOption.setIsNeedAddress(true);
//可选，设置是否需要地址描述
    locationOption.setIsNeedLocationDescribe(true);
//可选，设置是否需要设备方向结果
    locationOption.setNeedDeviceDirect(false);
//可选，默认false，设置是否当gps有效时按照1S1次频率输出GPS结果
    locationOption.setLocationNotify(true);
//可选，默认true，定位SDK内部是一个SERVICE，并放到了独立进程，设置是否在stop的时候杀死这个进程，默认不杀死
    locationOption.setIgnoreKillProcess(true);
//可选，默认false，设置是否需要位置语义化结果，可以在BDLocation.getLocationDescribe里得到，结果类似于“在北京天安门附近”
    locationOption.setIsNeedLocationDescribe(true);
//可选，默认false，设置是否需要POI结果，可以在BDLocation.getPoiList里得到
    locationOption.setIsNeedLocationPoiList(true);
//可选，默认false，设置是否收集CRASH信息，默认收集
    locationOption.SetIgnoreCacheException(false);
//可选，默认false，设置是否开启Gps定位
    locationOption.setOpenGps(true);
//可选，默认false，设置定位时是否需要海拔信息，默认不需要，除基础定位版本都可用
    locationOption.setIsNeedAltitude(false);
//设置打开自动回调位置模式，该开关打开后，期间只要定位SDK检测到位置变化就会主动回调给开发者，该模式下开发者无需再关心定位间隔是多少，定位SDK本身发现位置变化就会及时回调给开发者
    locationOption.setOpenAutoNotifyMode();
//设置打开自动回调位置模式，该开关打开后，期间只要定位SDK检测到位置变化就会主动回调给开发者
    locationOption.setOpenAutoNotifyMode(3000,1, LocationClientOption.LOC_SENSITIVITY_HIGHT);
//需将配置好的LocationClientOption对象，通过setLocOption方法传递给LocationClient对象使用
    locationClient.setLocOption(locationOption);
//开始定位
    locationClient.start();
  }

//  public class MyLocationListener extends BDAbstractLocationListener {
//    @Override
//    public void onReceiveLocation(BDLocation location) {
//      //mapView 销毁后不在处理新接收的位置
//      System.out.println("method onReceiveLocation start");
//      System.out.println("----");
//      System.out.println(new StringBuffer().append(location.getLongitude()).toString());
//      System.out.println(location.getLatitude());
//      System.out.println("----");
//      if (location == null || mMapView == null){
//        return;
//      }
//      MyLocationData locData = new MyLocationData.Builder()
//              .accuracy(location.getRadius())
//              // 此处设置开发者获取到的方向信息，顺时针0-360
//              .direction(location.getDirection()).latitude(location.getLatitude())
//              .longitude(location.getLongitude()).build();
//      mBaiduMap.setMyLocationData(locData);
//      System.out.println("method onReceiveLocation end");
//    }
//  }

  /**
   * 实现定位回调
   */
  public class MyLocationListener extends BDAbstractLocationListener{
    @Override
    public void onReceiveLocation(BDLocation location){
      //此处的BDLocation为定位结果信息类，通过它的各种get方法可获取定位相关的全部结果
      //以下只列举部分获取经纬度相关（常用）的结果信息
      //更多结果信息获取说明，请参照类参考中BDLocation类中的说明

      //获取纬度信息
      double latitude = location.getLatitude();
      //获取经度信息
      double longitude = location.getLongitude();
      //获取定位精度，默认值为0.0f
      float radius = location.getRadius();
      //获取经纬度坐标类型，以LocationClientOption中设置过的坐标类型为准
      String coorType = location.getCoorType();
      //获取定位类型、定位错误返回码，具体信息可参照类参考中BDLocation类中的说明
      int errorCode = location.getLocType();

            MyLocationData locData = new MyLocationData.Builder()
              .accuracy(location.getRadius())
              // 此处设置开发者获取到的方向信息，顺时针0-360
              .direction(location.getDirection()).latitude(location.getLatitude())
              .longitude(location.getLongitude()).build();
      mBaiduMap.setMyLocationData(locData);

    }
  }
}

