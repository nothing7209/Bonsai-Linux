lang en_US.UTF-8
keyboard us
timezone America/New_York

authselect --enableshadow --passalgo=sha512
selinux --enforcing
firewall --enabled --service=ssh
bootloader --location=none

%include /home/nothing7209/bonsai-build/fedora-live-workstation.ks

%packages
dracut-live
# Wir lassen fedora-logos drin, damit Anaconda nicht abstürzt
fedora-logos
# Wir entfernen NUR die Pakete, die den Namen "Fedora" im System-Info-Feld erzwingen
-fedora-release-workstation
-fedora-release-identity-workstation
%end

%post --nochroot
mkdir -p $INSTALL_ROOT/usr/share/backgrounds/bonsai/
mkdir -p $INSTALL_ROOT/usr/share/pixmaps/
cp /home/nothing7209/bonsai-build/images/default-wallpaper.jpg $INSTALL_ROOT/usr/share/backgrounds/bonsai/
cp /home/nothing7209/bonsai-build/images/bonsai-logo.png $INSTALL_ROOT/usr/share/pixmaps/
%end

%post
# 1. System-Identität überschreiben
cat <<EOF > /etc/os-release
NAME="Bonsai Linux"
VERSION="1.0"
ID=bonsai
ID_LIKE=fedora
VERSION_ID="1.0"
PRETTY_NAME="Bonsai Linux 1.0"
ANSI_COLOR="0;32"
LOGO="bonsai-logo"
EOF

# 2. GNOME Branding (Wallpaper & Dark Mode)
cat <<EOF > /usr/share/glib-2.0/schemas/99-bonsai-custom.gschema.override
[org.gnome.desktop.interface]
color-scheme='prefer-dark'

[org.gnome.desktop.background]
picture-uri='file:///usr/share/backgrounds/bonsai/default-wallpaper.jpg'
picture-uri-dark='file:///usr/share/backgrounds/bonsai/default-wallpaper.jpg'

[org.gnome.desktop.screensaver]
picture-uri='file:///usr/share/backgrounds/bonsai/default-wallpaper.jpg'
EOF

glib-compile-schemas /usr/share/glib-2.0/schemas/

# 3. Das "visuelle" Branding: Fedora-Icons durch Bonsai ersetzen
# Wir überschreiben einfach die Dateien der fedora-logos
if [ -f /usr/share/pixmaps/bonsai-logo.png ]; then
    cp /usr/share/pixmaps/bonsai-logo.png /usr/share/pixmaps/fedora-logo-icon.png
    # Optional: Verhindert, dass das Fedora-Logo im Boot-Menü erscheint
    rm -f /usr/share/pixmaps/fedora-logo.png
fi
%end
