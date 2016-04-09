LOCAL_PATH := $(call my-dir)

# Camera Sensors
include $(CLEAR_VARS)

LOCAL_SRC_FILES := \
    android/sensor.cpp \
    gui/SensorManager.cpp

LOCAL_C_INCLUDES := gui
LOCAL_SHARED_LIBRARIES := libgui libutils liblog libbinder libandroid
LOCAL_MODULE := libshim_camera_sensor
LOCAL_MODULE_CLASS := SHARED_LIBRARIES

include $(BUILD_SHARED_LIBRARY)

# Camera
include $(CLEAR_VARS)

LOCAL_SRC_FILES := \
    camera/libshim_camera.c

LOCAL_SHARED_LIBRARIES := libutils libgui liblog
LOCAL_MODULE := libshim_camera
LOCAL_MODULE_TAGS := optional

include $(BUILD_SHARED_LIBRARY)

