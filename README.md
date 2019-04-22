# Histology_Liver_NP_Int_WP
Analysis of liver histology images are used to segment CD209 positive areas (intravascular), and CD209 negative areas (extravascular). These areas are then overlayed with the nanoparticle intensity images to calculate the mean nanoparticle intensity in each area. Data for this project is published by Poon et al in "Elimination Pathways of Nanoparticles" 2019. ACS Nano. All code was tested with MATLAB version 2017b. 

The MATLAB function "Lvr_hist_analysis_Poon" requires tinputs of the segmented CD209 positive area as a binary image (see https://www.ilastik.org/ for details on segmentation), the darkfield scattering image, as well as a sample name and save directory. The output files are a .csv file of the measured data, as well as an image of the refined CD209+ mask. 



This software license is the 2-clause BSD license plus a third clause that prohibits redistribution and use for commercial purposes without further permission from the authors of this work (Poon et al).

Redistribution and use in source and binary forms, with or without modification, are permitted provided that the following conditions are met:

Redistributions of source code must retain the above copyright notice, this list of conditions and the following disclaimer.

Redistributions in binary form must reproduce the above copyright notice, this list of conditions and the following disclaimer in the documentation and/or other materials provided with the distribution.

Redistributions and use for commercial purposes are not permitted without the written permission of the authors of this work (Poon et al). For purposes of this license, commercial purposes are the incorporation of the software into anything for which you will charge fees or other compensation or use of the software to perform a commercial service for a third party.

THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS" AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT HOLDER OR CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
