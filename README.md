# Confocal-image-analysis

This repository contains a step-by-step workflow for analyzing immunofluorescence confocal images from mouse brain slices. The workflow combines Cellpose for nuclear segmentation and CellProfiler for fluorescence quantification.

Confocal images → Fiji preprocessing → Cellpose segmentation → CellProfiler quantification → Data analysis in R

## Image preparation

The acquired images consist of confocal z-stacks with two channels: NF-κB signal and DAPI-stained nuclei.  
For nuclear segmentation in Cellpose, the channels are first separated and the images converted to `.tif` format using the `channel_splitter.ijm` Fiji macro.

## Segmentation in Cellpose

Z-stacks of the DAPI channel were segmented using the customized model brain_nuclei to generate binary masks corresponding to individual nuclei.

<img width="370" height="370" alt="DG_DAPI" src="https://github.com/user-attachments/assets/cf5e8c45-6a4e-423b-9f60-3d0ccdb2e4a0" />

<img width="373" height="370" alt="CP_mask" src="https://github.com/user-attachments/assets/a244444d-0667-4e8e-bd06-3620dec22be2" />

**On the left**: an image of the Dentate gyrus DAPI channel. **On the right**: the 3-D mask generated in Cellpose.

## Quantification in CellProfiler

Fluorescence measurements were extracted using CellProfiler pipelines.  
The `nuc_total.cppipe` pipeline was used to calculate the nuclear/total fluorescence ratio, while the `speckles.cppipe` pipeline was used to quantify speckle size and count.

The following figure shows the original image and the masked nuclear signal on the top row. In the bottom row is the Cellpose mask (left), the isolated speckles (middle), and the speckles associated to their corresponding nucleus depicted in the same color (right) 

<img width="1007" height="648" alt="Cellprofiler_flow" src="https://github.com/user-attachments/assets/b2b53bf8-cccf-45b2-b70a-b7d05a50eef5" />


