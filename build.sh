#!/bin/sh
#excuse me for not using a Makefile ...

#build stuff
rustc rde.rs

#copy the referenced dynamic libs into the lib/ folder
#use 'otool -L <binary>' to see what libs are referenced!
mkdir lib
cp /usr/local/lib/librustrt.dylib lib/
cp /usr/local/lib/libstd-6c65cf4b443341b1-0.7.dylib lib/

#now tweak the binary to find the dynamic libs
install_name_tool -add_rpath @executable_path/lib rde


