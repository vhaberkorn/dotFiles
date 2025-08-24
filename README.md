# 🏠 Dotfiles

Personal configuration files for Arch Linux with Hyprland, featuring system configurations for optimal performance and hardware compatibility.

## 🖥️ System Overview

This repository contains dotfiles optimized for:
- **OS**: Arch Linux
- **Window Manager**: Hyprland (with Omarchy defaults)
- **Hardware**: Fujitsu Lifebook U7410
- **Filesystem**: Btrfs with encryption
- **Boot Loader**: systemd-boot

## 📁 Configuration Structure

```
dotFiles/
├── boot/loader/entries/          # systemd-boot entries
├── etc/
│   ├── X11/xorg.conf.d/         # X11 keyboard configuration  
│   └── mkinitcipio.conf         # Initial ramdisk configuration
└── hyprland/
    └── hyprland.conf            # Hyprland window manager config
```

## ⚙️ Key Features

### 🔐 Security & Encryption
- Full disk encryption with LUKS
- Btrfs filesystem with compression
- Secure boot configuration

### ⌨️ Hardware Optimizations
- **Fujitsu Lifebook U7410** PS/2 keyboard fixes
- International keyboard layout (US Intl)
- Display scaling optimizations for Hyprland

### 🪟 Hyprland Configuration
- Built on **Omarchy** defaults for consistency
- Modular configuration structure
- Custom monitor, input, and binding overrides
- Integrated theme support

## 🚀 Installation

### Prerequisites
- Arch Linux with systemd-boot
- Hyprland window manager
- Omarchy dotfiles framework

### Quick Setup

1. Clone the repository:
   ```bash
   git clone <your-repo-url> ~/.config/dotfiles
   cd ~/.config/dotfiles
   ```

2. Backup existing configurations:
   ```bash
   cp /etc/mkinitcipio.conf /etc/mkinitcipio.conf.backup
   cp -r /etc/X11/xorg.conf.d/ /etc/X11/xorg.conf.d.backup
   ```

3. Deploy system configurations (requires root):
   ```bash
   sudo cp etc/mkinitcipio.conf /etc/
   sudo cp etc/X11/xorg.conf.d/00-keyboard.conf /etc/X11/xorg.conf.d/
   ```

4. Deploy boot configurations:
   ```bash
   sudo cp boot/loader/entries/* /boot/loader/entries/
   ```

5. Deploy Hyprland configuration:
   ```bash
   cp hyprland/hyprland.conf ~/.config/hypr/
   ```

6. Regenerate initramfs:
   ```bash
   sudo mkinitcpio -P
   ```

## 🔧 Hardware-Specific Fixes

### Fujitsu Lifebook U7410 Keyboard Issues
The boot entries include kernel parameters to fix PS/2 keyboard problems:
```
i8042.nomux=1 i8042.reset=1 i8042.nopnp=1 i8042.noloop=1 atkbd.reset=1 i8042.kbdreset=1
```

### Display Scaling
Hyprland configuration includes optimizations for proper display scaling on the Lifebook U7410.

## 📝 Customization

### Hyprland
The configuration uses Omarchy defaults with custom overrides. Edit these files for personalization:
- `~/.config/hypr/monitors.conf` - Display configuration
- `~/.config/hypr/input.conf` - Input devices
- `~/.config/hypr/bindings.conf` - Key bindings
- `~/.config/hypr/envs.conf` - Environment variables
- `~/.config/hypr/autostart.conf` - Startup applications

### System Configuration
- **Keyboard Layout**: Modify `/etc/X11/xorg.conf.d/00-keyboard.conf`
- **Boot Options**: Edit boot entries in `/boot/loader/entries/`
- **Initramfs**: Update `/etc/mkinitcipio.conf` and regenerate with `sudo mkinitcpio -P`

## 🗂️ Recent Changes

- Fixed Fujitsu Lifebook U7410 PS/2 keyboard issues
- Resolved Hyprland display scaling problems  
- Added Btrfs optimization in mkinitcpio
- Updated systemd-boot entries with hardware fixes

## 🤝 Contributing

This is a personal dotfiles repository, but feel free to:
- Fork for your own use
- Submit issues for hardware-specific problems
- Share improvements for similar hardware setups

## 📄 License

This repository is provided as-is for personal use. Feel free to adapt configurations for your own setup.

---

*Optimized for Fujitsu Lifebook U7410 | Arch Linux | Hyprland*