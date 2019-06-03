package com.example.startup_namer;

import com.baidu.mapapi.map.MapView;

import io.flutter.plugin.common.PluginRegistry;
import io.flutter.plugin.common.StandardMessageCodec;

/**
 * MapRegistrant 注册和实例化百度地图api
 */
public final class MapRegistrant {
    public static void registerWith(PluginRegistry registry, MapView mapView) {
        final String key = MapRegistrant.class.getCanonicalName();

        if (registry.hasPlugin(key)) return;

        PluginRegistry.Registrar registrar = registry.registrarFor(key);                //注册
        //返回百度地图api
        registrar.platformViewRegistry().registerViewFactory("MyMap", new MapViewFactory(new StandardMessageCodec(), mapView));
    }
}
