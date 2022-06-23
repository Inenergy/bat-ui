cd "$( dirname "$0" )/.."

# MAIN APP INSTALLATION
npm i
npm run build

# MAIN APP AUTOSTART
chmod +x dist/bat-ui*.AppImage
mkdir -p ~/inenergy-gui/dist
cp dist/bat-ui*.AppImage ~/inenergy-gui/dist/
mkdir ~/.inenergy
echo '~/inengergy-gui/dist/bat-ui*.AppImage > ~/.inenergy/bat-ui.log' > ~/.config/openbox/autostart