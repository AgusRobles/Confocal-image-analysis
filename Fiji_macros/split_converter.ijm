// === Input/Output Setup ===
inputDir = getDirectory("Choose the folder with .czi files");
outputDir1 = inputDir + "Channel1_Tiffs/";
outputDir2 = inputDir + "Channel2_Tiffs/";
File.makeDirectory(outputDir1);
File.makeDirectory(outputDir2);

// === File Loop ===
fileList = getFileList(inputDir);
for (i = 0; i < fileList.length; i++) {
    fileName = fileList[i];
    if (endsWith(fileName, ".czi")) {

        // === Open with Bio-Formats ===
        run("Bio-Formats Importer", 
            "open=[" + inputDir + fileName + "] autoscale color_mode=Default view=Hyperstack stack_order=XYCZT");

        // === Get base name (without extension) ===
        baseName = substring(fileName, 0, lastIndexOf(fileName, "."));

        // === Split Channels ===
        run("Split Channels");

        // === Save Channels ===
        titles = getList("image.titles");
        for (j = 0; j < titles.length; j++) {
            title = titles[j];
            if (startsWith(title, "C1-")) {
                selectWindow(title);
                saveAs("Tiff", outputDir1 + baseName + "_ch1.tif");
                close();
            } else if (startsWith(title, "C2-")) {
                selectWindow(title);
                saveAs("Tiff", outputDir2 + baseName + "_ch2.tif");
                close();
            }
        }

        // === Close original image if still open ===
        if (isOpen(fileName)) {
            selectWindow(fileName);
            close();
        }
    }
}

print("All .czi files converted, split, and saved.");
