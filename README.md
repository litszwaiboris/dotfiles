## Dotfiles

Nix-based dotfiles managed via [flake-parts](https://github.com/hercules-ci/flake-parts) and [import-tree](https://github.com/vic/import-tree).

Acknowledgements:
[Vimjoyer](https://github.com/vimjoyer) for tutorials and inspirations

```
dotfiles/
├── flake.nix          Flake entry point
├── flake.lock         Locked flake inputs
├── modules/
│   ├── parts.nix            flake-parts system declarations
│   ├── base/                Shared system modules
│   │   ├── AI/              AI Stuff
│   │   ├── boot/            Bootloader, plymouth, kernel modules
│   │   ├── desktop/         Desktop Configurations (Login, Sound, Printing, etc)
│   │   ├── home-manager/    User-level Configurations (GTK, Qt, Neovim, Zen Browser)
│   │   ├── nextcloud/       Nextcloud Server Configuration
│   │   └── terminal/        Terminal Configurations (Fish, Git, Starship, Neovim)
│   ├── features/            Specific Features
│   │   ├── hypr/            Hyprland compositor
│   │   └── noctalia-shell/  Custom settings for Noctalia Shell
│   └── hosts/               Per-machine configurations
│       ├── NixOS-Mac/       Apple Silicon Mac
│       ├── NixOS-Nextcloud/ Nextcloud Server
│       ├── NixOS-P1/        Primary Laptop
│       ├── NixVM/           Generic NixOS VM (Dropped)
│       └── NixVM-Mac/       NixOS VM on Parallels Desktop for Apple Silicon Mac (Dropped)
```
