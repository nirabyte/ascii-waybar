# Retro ASCII Art Waybar

### Preview

![Waybar Preview](assets/preview.png)

## Overview

- ASCII art modules for CPU, Memory, Battery, Volume,etc
- Workspace app icon integration with YAMIS (Yet Another Monochrome Icon Set) icons

## Quick Start

1. Run:

```bash
git clone https://github.com/nirabyte/ascii-waybar.git /tmp/ascii-waybar && cp -rf /tmp/ascii-waybar/* ~/.config/waybar/ && rm -rf /tmp/ascii-waybar && omarchy-restart-waybar

```

2. (Optional) Download the [Doto](https://fonts.google.com/specimen/Doto) or directly get it from the repo and place in your `~/.local/share/fonts`.

```bash

  mkdir -p ~/.local/share/fonts && \
  curl -L -o ~/.local/share/fonts/Doto.ttf \
  https://raw.githubusercontent.com/nirabyte/ascii-waybar/main/fonts/Doto.ttf && \
  # Refresh font cache
  fc-cache -fv
```

3. (Optional) Install YAMIS icon theme (for monochrome workspace icons):

Download the theme from [KDE Store YAMIS](https://store.kde.org/p/2303161)

```bash
# Extract the tar.gz file
tar -xzf yet-another-monochrome-icon-set-*.tar.gz

# Go into the extracted folder and copy YAMIS to ~/.local/share/icons
cd yet-another-monochrome-icon-set
sudo cp -r YAMIS ~/.local/share/icons
```

> To change the icon theme, edit `config.jsonc`:

```jsonc
"hyprland/workspaces": {
  "workspace-taskbar": {
    "icon-theme": "YAMIS",  // Change to your preferred icon theme name
    // ...
  },
  // ...
}
```

> You can install your preferred icon theme and update the name accordingly.

4. Restart your waybar:\

  For Omarchy users run:

  ```bash
  omarchy-restart-waybar
  ```

  Or run:

  ```bash
  pkill waybar && waybar &
  ```

### ASCII Visualization

All system monitoring modules use block character format-icons for a retro ASCII aesthetic:

```jsonc
// Horizontal progress bar
 "format-icons":
  [
  "░░░░░░░░░░",
  "█░░░░░░░░░",
  "██░░░░░░░░",
  "███░░░░░░░",
  "████░░░░░░",
  "█████░░░░░",
  "██████░░░░",
  "███████░░░",
  "████████░░",
  "█████████░",
  "██████████",

  ]
 // Vertical progress bar
  "format-icons": [
  "░", "▁", "▂", "▃", "▄", "▅", "▆", "▇", "█"
  ]
```

> [!NOTE]
> **For Omarchy users**: This configuration uses `omarchy-menu-tofi` in the config (uses tofi instead of walker that comes with omarchy). If you're using omarchy, ensure you have removed the `-tofi` suffix commands.
