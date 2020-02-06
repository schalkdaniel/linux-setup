### Fix upgrade with unmounted boot ###

1. Boot from stick and mount `root` and `boot`:

   ```
   mount /dev/nvme0n1p1 /mnt
   mount /dev/nvme0n1p3 /mnt/boot
   ```

2. Upgrade linux by reinstalling the kernel:

   ```
   sudo pacman -S linux
   ```

   