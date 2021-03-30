#!/bin/sh
# reset jetbrains ide evals

# Get options supplied to the script
while getopts ":p:" opt; do
  case $opt in
    p) PRODUCT="$OPTARG"
    ;;
    \?) echo "Invalid option -$OPTARG" >&2
    ;;
  esac
done

# Error if no product (-p option) provided
[ -z "$PRODUCT" ] && echo "No product specified" && exit

VERSION=$( php jetbrains_version.php "$PRODUCT" )

[ "$VERSION" = "Invalid" ] && echo "Invalid product specified" && exit

OS_NAME=$(uname -s)
JB_PRODUCTS="JetBrains ${PRODUCT}"

if [ "$OS_NAME" = "Darwin" ]; then
    echo "Your operating system is: MacOs"
    echo "Uninstalling ${PRODUCT}"

    # Delete all application related files
    for PRD in $JB_PRODUCTS; do
        sudo rm -f ~/Library/Preferences/com.jetbrains."${PRD}".plist
        sudo rm -f ~/Library/Preferences/jetbrains.*
        sudo rm -rf /Applications/"${PRD}".app
        sudo rm -rf ~/Library/Preferences/"${PRD}"
        sudo rm -rf ~/Library/Application\ Support/"${PRD}"
        sudo rm -rf ~/Library/Caches/"${PRD}"
    done

    # Download the latest version of PRODUCT
    echo "Downloading: ${PRODUCT}-${VERSION}.dmg"

    curl -o ~/"${PRODUCT}"-"${VERSION}".dmg https://download-cf.jetbrains.com/webide/"${PRODUCT}"-"${VERSION}".dmg

    echo "Unmounting ${PRODUCT}.dmg if already present"
    sudo hdiutil detach /Volumes/"${PRODUCT}"

    echo "Mounting Image: ${PRODUCT}.dmg"
    sudo hdiutil attach ~/"${PRODUCT}"-"${VERSION}".dmg

    echo "Installing App: ${PRODUCT}.app"
    sudo cp -rf /Volumes/"${PRODUCT}"/"${PRODUCT}".app /Applications

    echo "Unmounting Image: ${PRODUCT}.dmg"
    sudo hdiutil detach /Volumes/"${PRODUCT}"

elif [ "$OS_NAME" = "Linux" ]; then
    echo "Your operating system is: Linux"
    echo "Uninstalling ${PRODUCT}"

    for PRD in $JB_PRODUCTS; do
        rm -rf ~/."${PRD}"*/config/eval
    done
else
    echo "Unsupported Operating System"
    exit
fi

# Make a cron entry to run this script again. This will happen only the first time
if [ ! -d ~/Craftisan/JetbrainsInstaller ]; then
    echo "Copying JetbrainsInstaller for renewal"

    mkdir -p ~/Craftisan/JetbrainsInstaller && cp -aR "$( pwd )"/. ~/Craftisan/JetbrainsInstaller/.

    echo "Scheduling renewal every 20 days at 1200 Hrs"
    crontab -l > jetcron

    # Echo new cron into cron file
    echo "0 */12 */20 * * sudo ~/Craftisan/JetbrainsInstaller/jetbrains.sh -p ${PRODUCT} >> ~/cron_jetbrains.log" >> jetcron

    #install new cron file
    crontab jetcron
    rm jetcron
fi

echo "Done. Your IDE: ${PRODUCT} is now activated for next 30 days"
