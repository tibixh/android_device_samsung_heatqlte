LOCAL_PATH := $(call my-dir)

include $(CLEAR_VARS)

LOCAL_MODULE_TAGS := optional

LOCAL_SRC_FILES := $(call all-java-files-under, src)

LOCAL_PACKAGE_NAME := TimeService
LOCAL_CERTIFICATE := platform

# No resources, no obfuscation.
LOCAL_PROGUARD_ENABLED := disabled

include $(BUILD_PACKAGE)
