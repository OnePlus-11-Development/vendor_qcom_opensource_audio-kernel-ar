M=$(PWD)
AUDIO_ROOT=$(KERNEL_SRC)/$(M)

KBUILD_OPTIONS += CONFIG_SND_SOC_KALAMA=m
KBUILD_OPTIONS += MODNAME=audio_dlkm
KBUILD_OPTIONS += BOARD_PLATFORM=$(TARGET_BOARD_PLATFORM)
KBUILD_OPTIONS += $(AUDIO_SELECT)
KBUILD_OPTIONS += AUDIO_ROOT=$(AUDIO_ROOT)
KBUILD_OPTIONS += KBUILD_EXTRA_SYMBOLS=$(ANDROID_BUILD_TOP)/out/vendor/qcom/opensource/mm-drivers/msm_ext_display/Module.symvers

all: modules

clean:
	$(MAKE) -C $(KERNEL_SRC) M=$(M) clean

%:
	$(MAKE) -C $(KERNEL_SRC) M=$(M) $@ $(KBUILD_OPTIONS)

