LOCAL_PATH := $(call my-dir)

include $(CLEAR_VARS)

LOCAL_SRC_FILES := \
    ../../../../hardware/samsung/ril/libril/ril.cpp \
    ../../../../hardware/samsung/ril/libril/ril_event.cpp \
    ../../../../hardware/samsung/ril/libril/RilSocket.cpp \
    ../../../../hardware/samsung/ril/libril/RilSapSocket.cpp

LOCAL_C_INCLUDES := \
    $(LOCAL_PATH)/include \
    hardware/samsung/ril/libril \
    hardware/samsung/ril/libril/include \
    hardware/samsung/ril/include \
    hardware/ril/include \
    external/nanopb-c

LOCAL_CFLAGS := -DSAMSUNG_NEXT_GEN_MODEM

LOCAL_SHARED_LIBRARIES := \
    liblog \
    libutils \
    libbinder \
    libcutils \
    libhardware_legacy \
    librilutils

LOCAL_STATIC_LIBRARIES := \
    libprotobuf-c-nano-enable_malloc

LOCAL_MODULE := libril
LOCAL_MODULE_CLASS := SHARED_LIBRARIES

include $(BUILD_SHARED_LIBRARY)
