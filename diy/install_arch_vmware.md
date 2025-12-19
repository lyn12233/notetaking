# notes on installing archlinux on vmware

archlinux possesses high level customizability, suited for resource restricted environments like virtual machine. moreover, while the rolling update scheme of archlinux is critized for vulnerability, it will not impose unaffordable risk for many small purposes or under virtual machine. 

there are [official guides]() which is comprehensive, but you may neglect some details. this note is commentary to official guides, specifically under vmware situation.

> setfont -d to double font size

## install note

1. vmware config: 4gb ram, 30gb disk, can be smaller; NAT+LAN, for wlan may be problematic; os type choose linux kernel(max version); iso: archlinux-x86-64(depend on your need)
2. ping to test network
3. lsblk/fdisk to reassure disk provision, should have `dev/sda`
4. cfdisk(console interactive fdisk) to partition disk; for vmware, it is BIOS/GPT layout(sda1,BIOS boot partition, 2168.., 1M; sda2, swap, 0657.., 4G(?); sda3, root partition, 4f68.., remainder)
5. format disk(sda3: mkfs.ext4; sda2: mkswap)
6. `mount /dev/sda3 /mnt` (mount < disk > < dir >)
7. `swapon /dev/sda2`
8. `pacstrap -K base base-devel linux linux-firmware` (-K: empty keyring)
9. `genfstab -U /mnt >> /mnt/etc/fstab` (for systemd to check for boot unit?)
10. `arch-chroot /mnt`
> now you may need nano to edit files
11. localization and user config: timezone `ln -sf /usr/share/zoneinfo/<continent>/<city> /etc/localtime`, keyboard, language, user `/etc/locale.conf`, `/etc/locale/gen`, `etc/sudoers`, `/etc/hostname`
12. bootloader: grub `pacman -S grub; grub-install --target=i386-pc /dev/sda; grub-mkconfig -o /boot/grub/grub.cfg`; os-prober not required, to enable it, need to edit `/etc/default/grub`
13. `pacman -S networkmanager; systemctl enable NetworkManager` (to avoid network failure after reboot?)
14. `exit` from `arch-chroot`, may require `exit` many times; `umount -R /mnt` (update mount info)
15. reboot?
16. install desktop, for example kde-plasma

## misc notes 