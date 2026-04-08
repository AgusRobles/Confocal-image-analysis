# Confocal-image-analysis

This repository contains a step-by-step workflow for analyzing immunofluorescence confocal images from mouse brain slices. The workflow combines Cellpose for nuclear segmentation and CellProfiler for fluorescence quantification.

Confocal images → Fiji preprocessing → Cellpose segmentation → CellProfiler quantification → Data analysis in R

## Image preparation

The acquired images consist of confocal z-stacks with two channels: NF-κB signal and DAPI-stained nuclei.  
For nuclear segmentation in Cellpose, the channels are first separated and the images converted to `.tif` format using the `channel_splitter.ijm` Fiji macro.

## Segmentation in Cellpose

Z-stacks of the DAPI channel were segmented using the customized model brain_nuclei to generate binary masks corresponding to individual nuclei.
<img width="1024" height="1024" alt="C2-1SM-1 DG 40x" src="https://github.com/user-attachments/assets/6103c3aa-8b3d-4f38-839f-70c8a9145de9" />

<img width="479" height="475" alt="1SM_1DG_3Dview" src="https://github.com/user-attachments/assets/788f1aee-6426-46e6-84ef-f6edc50392c7" />




## Quantification in CellProfiler

Fluorescence measurements were extracted using CellProfiler pipelines.  
The `nuc_total.cppipe` pipeline was used to calculate the nuclear/total fluorescence ratio, while the `speckles.cppipe` pipeline was used to quantify speckle size and count.

