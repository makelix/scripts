#!/usr/bin/bash
montage '*.JPG' -geometry 413x620+50+50 -density 150 -page a4 -tile 2x2 -set label '%t' Seinäkuvat.pdf
