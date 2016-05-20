bash configure ^
                 --with-zlib=%PREFIX% ^
		 -nobzlib ^
		 -nomathlib ^
		 -nonetcdf ^
                 -shared ^
		 -noreadline ^
                 -noarpack gnu

c:\mingw32\bin\mingw32-make.exe libcpptraj -j8

mkdir -p %PREFIX%\include\cpptraj\

cp lib/libcpptraj.so %PREFIX%/lib/
cp src/*.h %PREFIX%/include/cpptraj/
