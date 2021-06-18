# **APTX4869 OS**

![Main picture](http://img.tonychang1069.top/picgo/20210617221413.png?TalkisCheap,ShowMeYourDick)

## What is **APTX4869 OS**?

**APTX4869 OS** is an operating system written by me. It's a great time to explore the world of operating system developing.

Use make command to build two bootable image at a same time. One can be booted with **GRUB**, and the other booted with **QEMU**.

## How to use?

### 1. Clone
```
git clone https://github.com/tony-aptx4869/aptx4869os.git
```

### 2. Build
```
cd aptx4869os
make
```

### 3. Run

#### 3.1 Run with **QEMU**
```
qemu-system-x86_64 -curses -drive 'file=aptx4869os.img,format=raw,index=0,media=disk'
```

#### 3.2 Run with **GRUB**
- Copy .bin file to /boot
```
make copy
```

- Edit file: /etc/grub.d/40_custom
```
menuentry 'APTX4869 OS' {
    insmod part_msdos
    insmod ext2

    #It depends on where your /boot is mounted.
    set root='hd0,msdos5'

    multiboot2 /boot/aptx4869os.bin
    boot
}
```

- Edit file: /etc/default/grub
```
#GRUB_TIMEOUT_STYLE=hidden
GRUB_TIMEOUT=10
```

- Update GRUB config
```
sudo update-grub
```

- Reboot
```
reboot
```

- Enter **APTX4869 OS**
![GRUB menu](http://img.tonychang1069.top/picgo/20210617223227.png?TalkisCheap,ShowMeYourDick)


## What can this OS do?

It can do **NOTHING** just for now! Ah~hahahahaha~~~~~
