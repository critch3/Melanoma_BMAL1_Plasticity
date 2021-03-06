myDIRin = "/n/scratch3/users/c/ccr13/BioNTech/ANALYSIS/IlastikStacks";
cropDIR=  "/n/scratch3/users/c/ccr13/BioNTech/ANALYSIS/CroppedData";

suffix = ".tif";

print(myDIRin);
list = getFileList(myDIRin);
for (i=0; i < list.length; i++) {
	if (endsWith(list[i], suffix)) {
// Make sure to change channel below 
	open(myDIRin+"/"+list[i]);
	imgsize = getWidth();
	n = nSlices;
	run("Properties...", "channels=n slices=1 frames=1 unit=pixel pixel_width=1.0000 pixel_height=1.0000 voxel_depth=1.0000");
	run("Save");	

	cropname = cropDIR +"/" + list[i];
	row_start = round(200+random*(imgsize-500));
	col_start = round(200+random*(imgsize-500));
	makeRectangle(col_start,row_start,250, 250);
	run("Crop");
	saveAs("Tiff", cropname);	
	run("Close");

	}
}


