# tfetch

![System Information](https://te.legra.ph/file/4132b2d3e64a4ba7db5f9.jpg)

This script provides a detailed overview of your system information, including OS, kernel, uptime, and more.

## Usage

Simply run the script:

```bash
./tfetch.sh
```

## Installation

### Prerequisites

- Bash
- Core utilities (standard Unix command-line utilities)

### Installation via `make`

1. Clone the repository:

```bash
git clone https://github.com/harajit05/tfetch.git
cd tfetch
```

2. Run the following commands:

```bash
make install
```

This will install the script to `/usr/local/bin`. You might need superuser privileges (use `sudo make install`).

## Uninstallation

To remove the script:

```bash
make uninstall
```

## Results

After running the script, you will see a detailed overview of your system information, including the OS, kernel, uptime, packages, and more.

## Advantages

- Faster than Neofetch
- Lightweight and efficient

## License

This script is licensed under the [MIT License](LICENSE).
