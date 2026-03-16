## Cellpose segmentation

Open Cellpose for 3D stacks:

python -m cellpose --Zstack

### Parameters used

- stitch_threshold: 0.5  
- flow3D_smooth: 0.5  
- anisotropy: 3.21 (Z voxel size / XY voxel size; 0.5 µm / 0.156 µm ≈ 3.21)  
- resample: False  
- min_size: 15  

### Workflow

1. Load the z-stack of the DAPI channel.
2. Restore the image using **Denoise/Restore** with the dataset **cyto2**.
3. Select the **custom trained model**.
4. Run segmentation.
5. Save the resulting mask as `.png`.
