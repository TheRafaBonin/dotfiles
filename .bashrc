# bashrc

# Initialize ble.sh [must be at the beginning of this file]
BLE_PATH=$(blesh-share)
[[ $- == *i* ]] && source $BLE_PATH/ble.sh --noattach

# your bashrc settings come here...

# Attach ble.sh [must be at the end of this file]
[[ ${BLE_VERSION-} ]] && ble-attach

