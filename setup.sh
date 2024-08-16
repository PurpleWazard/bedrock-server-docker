#!/bin/bash

TMP="/thistmp"

mkdir $TMP

cd "$TMP"


  # Retrieve latest version of Minecraft Bedrock dedicated server
  echo "Checking for the latest version of Minecraft Bedrock server..."
  curl -H "Accept-Encoding: identity" -H "Accept-Language: en" -L -A "Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.33 (KHTML, like Gecko) Chrome/90.0.$RandNum.212 Safari/537.33" -o $TMP/version.html https://minecraft.net/en-us/download/server/bedrock/
  DownloadURL=$(grep -o 'https://minecraft.azureedge.net/bin-linux/[^"]*' $TMP/version.html)
  DownloadFile=$(echo "$DownloadURL" | sed 's#.*/##')
  echo "$DownloadURL"
  echo "$DownloadFile"

  # Download latest version of Minecraft Bedrock dedicated server
  echo "Downloading the latest version of Minecraft Bedrock server..."
  UserName=$(whoami)
  curl -H "Accept-Encoding: identity" -H "Accept-Language: en" -L -A "Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.33 (KHTML, like Gecko) Chrome/90.0.$RandNum.212 Safari/537.33" -o "$TMP/$DownloadFile" "$DownloadURL"
  unzip -o "$TMP/$DownloadFile"

  rsync -av --ignore-existing $TMP/ /minecraft/
  rsync -av --exclude 'worlds' --exclude 'config' --exclude 'server.properties' $TMP/* /minecraft

  rm -rf $TMP

  chmod +x /minecraft/bedrock_server

