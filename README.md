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
    ./pytraj/run_build.sh # for py2.7, 3.4, 3.5
    ```
and so on.
