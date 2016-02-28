Introduction/Steps
==================

1. run 'conda config --add channels https://conda.binstar.org/ambermd' before build.

2. Upload package to ambermd channel.

    - login to you account in bash terminal, use your own account that has administration permission.

    ```bash
        anaconda login
    ```

    - upload

    ```bash
        anaconda upload --user ambermd package.tar.bz2
    ```

    See also: http://docs.anaconda.org/using.html#UploadingPackagesToAnOrganization

3. Notes

    - There is no auto-build for all packages yet

4. How?

    ```bash
    conda build cpptraj/
    conda build libcpptraj/
    ./run_build.sh pytraj/ # for py2.7, 3.4, 3.5
    ./run_build.sh parmed/ # for py2.7, 3.4, 3.5
    ```
and so on.

Package-specific notes
----------------------

pysander
~~~~~~~~

For pysander: you need to have Amber built before building pysander -- it
requires the presence of libsander.so and libsanderles.so (as well as the
sander.h header file) inside the $AMBERHOME/lib (and $AMBERHOME/include)
directories. These files are then copied to the lib and include directory for
the build, and pysander is built against them. In order to generate a portable,
standalone version of libsander.so and libsander.dylib, you need to configure
Amber *without* the ``--with-netcdf`` flag (i.e., you need Amber to build its
own NetCDF).
