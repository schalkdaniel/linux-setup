### Fix upgrade with unmounted boot ###

0. Check if Linux kernel version matches:

   ```
   pacman -Q linux
   uname -r
   ```

1. Boot from stick and mount `root` and `boot`:

   ```
   mount /dev/nvme0n1p1 /mnt
   mount /dev/nvme0n1p3 /mnt/boot
   ```

2. Upgrade Linux by reinstalling the kernel:

   ```
   sudo pacman -S linux
   ```

3. If this does not work, reset your kernel to match the version in `uname`:

   ```
   pacman -U /var/cache/pacman/pkg/linux-x.x.x
   ```

   