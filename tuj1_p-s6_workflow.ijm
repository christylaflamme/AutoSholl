//This <.ijm> performs Sholl analysis on individual neurons using only Fiji
ImageJ
// Created using ijmacros recorder
// Conversion factor used here is for a VS-120 microscope at 40X magnification
run("Set Scale...", "distance=1 known=0.16094 pixel=1 unit=micron global");
// Draw soma
run("Split Channels");
// setTool("freehand");
waitForUser("Waiting for user to draw a soma in green channel. Press Okay to
continue....");
// Save soma
roiManager("Add");
run("Measure");
// Record p-S6 brightness
waitForUser("Select red channel and press Okay to continue....");
roiManager("Select", 0);
run("Measure");
// Trace neurites in Simple Neurite Tracer (SNT)
waitForUser("Select green channel and press Okay to continue....");
run("Simple Neurite Tracer", "look_for_tubeness look_for_previously_traced");
roiManager("Select", 0);
roiManager("Show All");
waitForUser("Waiting for user to draw a neurites, save trace, obtain summary, and
exit. Press Okay to continue....");
// Run Sholl analysis
waitForUser("Select neurite trace and press Okay to continue....");
setAutoThreshold("Default no-reset");
roiManager("Select", 0);
run("Sholl Analysis (From Image)...");
waitForUser("Waiting for user to set end radius and run Sholl. Press Okay to
close....");
run("Close");
