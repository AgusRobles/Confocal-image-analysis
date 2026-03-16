# Confocal-image-analysis

This repository contains a step-by-step workflow for analyzing immunofluorescence confocal images from mouse brain slices. The workflow combines Cellpose for nuclear segmentation and CellProfiler for fluorescence quantification.

Confocal images → Fiji preprocessing → Cellpose segmentation → CellProfiler quantification → Data analysis in R

## Image preparation

The acquired images consist of confocal z-stacks with two channels: NF-κB signal and DAPI-stained nuclei.  
For nuclear segmentation in Cellpose, the channels are first separated and the images converted to `.tif` format using the `split_converter.ijm` Fiji macro.

## Segmentation

Z-stacks of the DAPI channel were segmented using Cellpose to generate binary masks corresponding to individual nuclei.

## Quantification in CellProfiler

Fluorescence measurements were extracted using CellProfiler pipelines.  
The `nuc_total.cppipe` pipeline was used to calculate the nuclear/total fluorescence ratio, while the `speckles.cppipe` pipeline was used to quantify speckle size and count.

