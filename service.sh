#!/system/bin/sh
# Do NOT assume where your module will be located.
# ALWAYS use $MODDIR if you need to know where this script
# and module is placed.
# This will make sure your module will still work
# if Magisk change its mount point in the future
MODDIR=${0%/*}

# 启用 开发者模式
settings put global development_settings_enabled 1
# 启用 USB调试
settings put global adb_enabled 1
setprop ro.secure 0
setprop ro.adb.secure 1
setprop ro.debuggable 1
setprop persist.service.adb.enable 1
setprop persist.service.debuggable 1
# 禁用 ADB授权超时功能
settings put global adb_allowed_connection_time 0
# MIUI 启用 USB安装-允许通过USB安装应用
setprop persist.security.adbinstall 1
# MIUI 启用 USB调试(安全设置)-允许通过USB调试修改权限或模拟点击
setprop persist.security.adbinput 1
# 启用 远程无线USB调试5555端口
setprop persist.adb.tcp.port 5555
setprop service.adb.tcp.port 5555
stop adbd
start adbd