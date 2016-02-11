#!/bin/bash
# Run in TWRP after mounting vendor partition.
vendor_filelist="/vendor/lib64/libQSEEComAPI.so \
/vendor/lib64/hw/keystore.msm8994.so \
/vendor/lib64/libdrmfs.so \
/vendor/lib64/libdrmtime.so \
/vendor/lib64/librpmb.so \
/vendor/lib64/libssd.so \
/vendor/lib64/libdiag.so \
/vendor/bin/qseecomd"
# already copied: libcryptfslollipop.so libcrypto.so libc.so libcutils.so libdl.so libhardware.so liblog.so libm.so libstdc++.so libc++.so
system_filelist="libbacktrace.so libbase.so libnetd_client.so libunwind.so libutils.so linker64"
rm -r multirom_enc_blobs
for i in $vendor_filelist
do
	echo $i
	outfile="multirom_enc_blobs/`basename $i`"
	mkdir -p `dirname $outfile`
	adb pull $i $outfile
done
for i in $system_filelist
do
	echo $i
	outfile="multirom_enc_blobs/$i"
	mkdir -p `dirname $outfile`
	adb pull "/sbin/$i" $outfile
done
mv multirom_enc_blobs/linker64 multirom_enc_blobs/linker
mkdir -p multirom_enc_blobs/vendor/lib64/hw
# property service not running at startup, so it'll try to load keystore.default.so instead.
cp multirom_enc_blobs/keystore.msm8994.so multirom_enc_blobs/vendor/lib64/hw/keystore.default.so
# and just in case it wants the library under its real name
mv multirom_enc_blobs/keystore.msm8994.so multirom_enc_blobs/vendor/lib64/hw/
chmod 755 multirom_enc_blobs/*
