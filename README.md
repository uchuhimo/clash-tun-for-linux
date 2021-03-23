# Clash Tun Scripts for Linux

## Usage
1. **Clone Repo**
   ```bash
   git clone https://github.com/Kr328/clash-tun-for-linux
   cd clash-tun-for-linux
   ```

2. **Build Clash Binary**  
   Build by install.sh (upstream [comzyh/clash](https://github.com/comzyh/clash))
   ```bash
   ./install.sh build
   ```
   or just copy one
   ```bash
   cp /path/to/clash ./clash
   ```

3. **Install**
   ```bash
   sudo ./install.sh install
   sudo cp config.yaml /srv/clash/
   sudo systemctl start clash-tun
   sudo systemctl enable clash-tun
   ```