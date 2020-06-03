## CRSPAM_Localization
Localization Detection Through CSPAM Feature Extractor

(https://ieeexplore.ieee.org/document/8401564)

2018-2019 Department of Information Engineering and Mathematics, University of Siena, Italy.

Authors:  [Mauro Barni](https://scholar.google.it/citations?hl=en&user=ntRScY8AAAAJ), [Ehsan Nowroozi](https://scholar.google.com/citations?user=C0bNkP8AAAAJ&hl=en), [Benedetta Tondi](https://scholar.google.it/citations?hl=en&user=xpNEfq4AAAAJ)
(Ehsan.Nowroozi65@gmail.com)

This program is free software: you can redistribute it and/or modify it under the terms of the GNU General Public License as published by the Free Software Foundation, either version 3 of the License, or (at your option) any later version. This program is distributed in the hope that it will be useful, but WITHOUT ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License for more details. You should have received a copy of the GNU General Public License along with this program. If not, see <http://www.gnu.org/licenses/>.

If you are using this software, please cite from [IEEE](https://ieeexplore.ieee.org/document/8401564).

### Cite
@INPROCEEDINGS{8401564,
author={M. {Barni} and E. {Nowroozi} and B. {Tondi}},
booktitle={2018 International Workshop on Biometrics and Forensics (IWBF)},
title={Detection of adaptive histogram equalization robust against JPEG compression},
year={2018},
volume={},
number={},
pages={1-8},
keywords={data compression;feature extraction;image coding;image enhancement;support vector machines;JPEG compression;CE detectors;JPEG-aware SVM detector;adaptive histogram equalization;SVM detector;Contrast Enhancement detection;QF;contrast-enhanced-then-JPEG-compressed images;Transform coding;Image coding;Detectors;Feature extraction;Support vector machines;Histograms;Image color analysis;Multimedia forensics;Histogram equalization detection;Adversarial multimedia forensics;JPEG quality factor estimation},
doi={10.1109/IWBF.2018.8401564},
ISSN={null},
month={June},}

How to work?

1) In the folder feature computation run FeatureComputation.m code.
   The code utomatically compute features from two components SPAM686 and cross the channles therefore final dimension will be 1372. (686 + 686 = 1372)
2) After feature computation CSPAM run the traning code from Train folder. 
3) Run test code from Test folder. The code automatically find localize region trhough window size.
