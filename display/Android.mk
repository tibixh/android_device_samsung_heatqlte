display-hals := \
    libcopybit \
    libexternal \
    libgralloc \
    libhwcomposer \
    liboverlay \
    libqdutils \
    libvirtual \
    libqservice

ifeq ($(call is-vendor-board-platform,QCOM),true)
    include $(call all-named-subdir-makefiles,$(display-hals))
else
ifneq ($(filter msm% apq%,$(TARGET_BOARD_PLATFORM)),)
    include $(call all-named-subdir-makefiles,$(display-hals))
endif
endif
