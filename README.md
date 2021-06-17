# APTX4869 OS
把下面的代码复制，然后插入到/boot/grub/grub.cfg文件中
然后把APTX4869_OS.bin文件复制到/boot/目录下
最后重启计算机就可以看到 APTX4869 OS 启动选项了
原来如此啊啊啊啊


menuentry 'APTX4869 OS' {
    insmod part_msdos
    insmod ext2
    set root='hd0,msdos5' #注意boot目录挂载的分区，这是我机器上的情况
    multiboot2 /boot/APTX4869_OS.bin
    boot
}