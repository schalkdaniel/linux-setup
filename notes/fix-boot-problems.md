Fix warning:

```
[ TIME ] Timed out waiting for device /sys/subsystem/net/devices/wlan0
[DEPEND] Dependency failed for Automatically generated profile by wifi-menu
```

Final solution: Disable service:

```bash
systemctl disable netctl@wlan0\\x2dFRITZ\\x21Box\\x207590\\x20VD.service
```



### Get system boot log

```bash
sudo dmesg -d | less
```

### Get netctl profiles

```bash
ls -la /etc/netctl/
```

### Search systemctl

```bash
systemctl | grep sys-subsystem-net-devices
```

### Tried commands

Tried commands with no effect:

```bash
systemctl enable netctl-auto@interface
systemctl enable netctl-auto@wlan0.service
systemctl disable netctl-auto@wlan0.service
```

Way to solution:

```bash
ls /etc/systemd/system
# sys-subsystem-net-devices-wlan0.device.wants
ls /etc/systemd/system/sys-subsystem-net-devices-wlan0.device.wants
# netctl-auto@wlan0.service ⇒ /usr/lib/systemd/system/netctl-auto@.service

## There was also a folder with the FRITZBox profile:
vim /etc/systemd/system/netctl@wlan0\\x2dFRITZ\\x21Box\\x207590\\x20VD.service.d/profile.conf
# [Unit]
# Description=Automatically generated profile by wifi-menu
# BindsTo=sys-subsystem-net-devices-wlan0.device
# After=sys-subsystem-net-devices-wlan0.device

# check status:
systemctl status netctl@wlan0\\x2dFRITZ\\x21Box\\x207590\\x20VD.service
# ● netctl@wlan0\x2dFRITZ\x21Box\x207590\x20VD.service - Automatically gener...
#     Loaded: loaded (/usr/lib/systemd/system/netctl@.service; enabled; vend...
#    Drop-In: /etc/systemd/system/netctl@wlan0\x2...90\x20VD.service
#             └─profile.conf
#     Active: inactive (dead)
#       Docs: man:netctl.profile(5)
# 
# Mär 08 21:39:24 dsarchlenovo systemd[1]: Dependency failed for Auto...
# Mär 08 21:39:24 dsarchlenovo systemd[1]: netctl@wlan0\x2dFRITZ\x21Box...

systemctl disable netctl@wlan0\\x2dFRITZ\\x21Box\\x207590\\x20VD.service
```

