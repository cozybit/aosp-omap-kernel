AOSP_DIR=/mnt/sdd/aosp
MODULES_PATH=${AOSP_DIR}/out/target/product/maguro/system
if ! arm-eabi-gcc --version
then
	export PATH=/mnt/sdd/aosp/prebuilt/linux-x86/toolchain/arm-eabi-4.4.3/bin:${PATH}
fi
#ARCH=arm SUBARCH=arm CROSS_COMPILE=arm-eabi- make tuna_defconfig
[[ $( git status 2> /dev/null | tail -n1 ) != "nothing to commit (working directory clean)" ]] && \
	{ echo '!!!!! warning: building a dirty tree.  chech the version number is the one you expect !!!!'; echo; }
ARCH=arm SUBARCH=arm CROSS_COMPILE=arm-eabi- make
ARCH=arm SUBARCH=arm CROSS_COMPILE=arm-eabi- INSTALL_MOD_PATH=${MODULES_PATH} make modules_install
cp arch/arm/boot/zImage /mnt/sdd/aosp/device/samsung/tuna/kernel
