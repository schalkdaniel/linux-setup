### Fix upgrade with unmounted boot ###

0. If Linux kernel version does not match:

   ```
   pacman -Q linux
   uname -r
   ```

1. Change language of keys: 

   ```
   loadkeys de
   ```

2. Mount `root` and `boot`:

   ```
   mount /dev/nvme0n1p1 /mnt
   mount /dev/nvme0n1p3 /mnt/boot
   ```

3. Chroot into system:

   ```
   arch-chroot /mnt
   ```

4. Upgrade Linux by reinstalling the kernel:

    ```
   sudo pacman -S linux
   ```

5. If this does not work, reset your kernel to match the version in `uname`:

   ```
   pacman -U /var/cache/pacman/pkg/linux-x.x.x
   ```


6. If `SDDM` does not use the nice login screen change, add in `/usr/lib/sddm/sddm.conf.d`:

   ```
   [Theme]
   current=chili
   ```

   