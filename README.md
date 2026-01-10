# Waybar with ASCII Art Modules

### Theme: Ghostpane

![Waybar Preview](assets/preview.png)

## Overview

- ASCII art system monitoring (CPU, Memory, Battery, Volume)
- Workspace app icon integration with YAMIS (Yet Another Monochrome Icon Set) icons
- Custom analog clock display (shoutout to [fshaxe](https://github.com/fshaxe) for the clock glyph)

> The analog clock uses glyphs from SimpleAnalogClockFont. The font displays a different clock face for each minute of the day (720 unique glyphs).
>
> ![Analog Clock Glyph](assets/clock.gif)

## Installation

1. Copy configuration files to `~/.config/waybar/`:

   ```bash
   cp config.jsonc style.css ~/.config/waybar/

   # Optional for analog clock glpyh
   cp -r scripts/ ~/.config/waybar/
   ```

2. Make scripts executable:

   ```bash
   chmod +x ~/.config/waybar/scripts/*.sh
   ```

3. Install YAMIS icon theme (for workspace icons):

   Download the theme from [KDE Store YAMIS](https://store.kde.org/p/2303161)

   ```bash
   # Extract the tar.gz file
   tar -xzf yet-another-monochrome-icon-set-*.tar.gz

   # Go into the extracted folder and copy YAMIS to /usr/share/icons
   cd yet-another-monochrome-icon-set
   sudo cp -r YAMIS /usr/share/icons/
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

4. Install [SimpleAnalogClockFont](https://github.com/fshaxe/SimpleAnalogClockFont) (for analog clock glyph display):

   ```bash
   # Create fonts directory and download fonts
   mkdir -p ~/.local/share/fonts

   # Regular font
   curl -L https://github.com/fshaxe/SimpleAnalogClockFont/raw/main/SimpleAnalogClockFont.ttf -o ~/.local/share/fonts/SimpleAnalogClockFont.ttf

   # Bold font
   curl -L https://github.com/fshaxe/SimpleAnalogClockFont/raw/main/SimpleAnalogClockFont-Bold.ttf -o ~/.local/share/fonts/SimpleAnalogClockFont-Bold.ttf

   # Reload font cache
   fc-cache -f -v
   ```

   Make sure the font name is specified in the custom clock module in `style.css`:

   ```css
   #custom-analog-clock {
     font-family: "SimpleAnalogClockFont"; /* or SimpleAnalogClockFont-Bold */
     /* ... */
   }
   ```

5. Restart your waybar:
   - For Omarchy users:
   - Run:

   ```bash
   omarchy-restart-waybar
   ```

   - Or run:

   ```bash
     pkill waybar && nohup waybar &`
   ```

### ASCII Visualization

All system monitoring modules use block character format-icons for a retro ASCII aesthetic:

```jsonc
"format-icons": [
  "░░░░░░░░░░",  // 0-10%
  "█░░░░░░░░░",  // 10-20%
  "██░░░░░░░░",  // 20-30%
  // ... up to
  "██████████",  // 90-100%
]
```

## Preview

![Waybar Preview](assets/waybar.png)

> [!NOTE]
> **For Omarchy users**: This configuration uses `omarchy-menu-tofi` in the config (tofi variant instead of walker). If you're using omarchy, ensure you have removed the `-tofi` suffix commands.
