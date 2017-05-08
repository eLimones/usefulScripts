#! /usr/bin/bash
BOARD_NAME=$1
ZIP_NAME=$(find -name "*CADCAM.ZIP")

unzip "$ZIP_NAME" -d temp_proteus_output
mkdir -p temp_gerber_files

LAYER_NAME=$(find -name "*Top Copper*")
mv "$LAYER_NAME" temp_gerber_files/$BOARD_NAME.GTL

LAYER_NAME=$(find -name "*Bottom Copper*")
mv "$LAYER_NAME" temp_gerber_files/$BOARD_NAME.GBL

LAYER_NAME=$(find -name "*Top Solder*")
mv "$LAYER_NAME" temp_gerber_files/$BOARD_NAME.GTS

LAYER_NAME=$(find -name "*Bottom Solder*")
mv "$LAYER_NAME" temp_gerber_files/$BOARD_NAME.GBS

LAYER_NAME=$(find -name "*Top Silk*")
mv "$LAYER_NAME" temp_gerber_files/$BOARD_NAME.GTO

LAYER_NAME=$(find -name "*Bottom Silk*")
mv "$LAYER_NAME" temp_gerber_files/$BOARD_NAME.GBO

LAYER_NAME=$(find -name "*Mechanical*")
mv "$LAYER_NAME" temp_gerber_files/$BOARD_NAME.GKO

LAYER_NAME=$(find -name "*Drill*")
mv "$LAYER_NAME" temp_gerber_files/$BOARD_NAME.XLN

zip -j $BOARD_NAME.zip temp_gerber_files/*
rm -rf temp_gerber_files
rm -rf temp_proteus_output
