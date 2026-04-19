sudo pkill -9 anaconda
sudo pkill -9 livemedia-creator

sudo umount -Fl /tmp/lmc-* 2>/dev/null
sudo umount -Fl /var/tmp/bonsai-iso/* 2>/dev/null
sudo rm -rf /var/tmp/bonsai-iso
sudo rm -rf /tmp/lmc-*


sudo rm -f /var/lib/dnf/lock

sudo setenforce 0

sudo livemedia-creator \
  --ks bonsai.ks \
  --no-virt \
  --resultdir /var/tmp/bonsai-iso \
  --project "Bonsai Linux" \
  --make-iso \
  --volid BonsaiLive \
  --iso-only \
  --iso-name Bonsai-Live-x86_64.iso \
  --releasever 43

sudo setenforce 1

mkdir -p ~/bonsai-linux-iso
sudo mv /var/tmp/bonsai-iso/Bonsai-Live-x86_64.iso ~/bonsai-linux-iso/

sudo chown $USER:$USER ~/bonsai-linux-iso/Bonsai-Live-x86_64.iso

exit
