# luci-app-eoip
Ethernet Over IP, mikrotik compatible Luci Web interface

For use web config https://github.com/bogdik/openwrt-linux-eoip

- First you need install linux-eoip packet on link up
- Download this repository
- Place this to openwrt/feeds/luci/applications/luci-app-eoip
- Create sym link from openwrt/feeds/luci/applications/luci-app-eoip to openwrt/package/feeds/luci/luci-app-eoip
- Run ```make menuconfig```
- Select packet on LuCI-> Applications 
(Don't forget this packege need linux-eoip my version)


<img src="https://sun9-33.userapi.com/c857524/v857524187/f2b64/DuGECC2YE_I.jpg" width="440" alt="">

After install you get web to work EOIP

<img src="https://sun9-20.userapi.com/c857524/v857524187/f2b86/3hchdvR60zs.jpg" width="440" alt="">

-TODO:
- 1. Check for duplicate channel identifiers
- 2. Manage VLAN tag on this channel(s)

