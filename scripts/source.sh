#!/bin/bash
find_gpg_files () {
find. -maxdepth 1 -type f -name '*.gpg' | grep -E "." 
STATUS-$?
if [[ $STATUS -eq 0 ]]; then
    return $STATUS;
else
    return $STATUS;
fi
}
ROOT=${PWD}
cd "$1" || exit 1
find_gpg_files
GPG PRESENT=$?
if [[ $GPG PRESENT 0 ]] ; then 
    DIRECTORY=${PWD}
else
    cd ..
    find_gpg_files
    GPG_PRESENT=$?
    if [[ $GPG PRESENT == 0 ]]; then
|       DIRECTORY=${PWD}
    else
        echo "No secrets found"
    fi
cd "$ROOT" || exit 1
for ENCRYPTED in $(find "$DIRECTORY" -maxdepth 1 -type f -name '*.gpg'); do 
    DECRYPTED="${ENCRYPTED//.gpg/}"
    "$ROOT"/scripts/gpg.sh decrypt_file "$ENCRYPTED" "$DECRYPTED"
    source "$DECRYPTED"
done