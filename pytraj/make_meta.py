#!/usr/bin/env python

meta_template = """
package:
  name: {pytraj_status}
  version: !!str {pytraj_version}

source:
{source}

requirements:
  build:
    - python
    - cython
    - libcpptraj {libcpptraj_version}
    - libnetcdf
  run:
    - python
    - libcpptraj-dev
    - libnetcdf
    - numpy

test:
  commands:
    - python -c 'import pytraj as pt; pt.show_versions(); from pytraj.testing import get_remd_fn'

about:
  home: http://github.com/amber-md/pytraj
  license: BSD
  summary: Python API for cpptraj - a package for data analysis of MD simulations
"""

source_git = """
  git_url: https://github.com/amber-md/pytraj.git
  git_tag: master
"""

source_pypi = """
  fn: pytraj-{pytraj_version}.tar.gz
  url: https://pypi.python.org/packages/source/p/pytraj/pytraj-{pytraj_version}.tar.gz
"""


if __name__ == '__main__':
    import sys
    from argparse import ArgumentParser
    
    parser = ArgumentParser()
    parser.add_argument('-lc',
            '--libcpptraj-version',
            default='4.3.0',
            help='libcpptraj version')
    parser.add_argument('-r',
            '--release',
            action='store_true')
    parser.add_argument('--version',
            help='pytraj version',
            default='1.3.0')
    args = parser.parse_args(sys.argv[1:])

    is_released = args.release
    pytraj_version_str = args.version if is_released else args.version + '.dev'
    pytraj_status = 'pytraj' if is_released else 'pytraj-dev'
    source_ = source_pypi if is_released else source_git
    source = source_.format(pytraj_version=pytraj_version_str) if '{pytraj_version}' in source_ else source_

    meta_str = meta_template.format(
            libcpptraj_version=args.libcpptraj_version,
            pytraj_status=pytraj_status,
            source=source,
            pytraj_version=pytraj_version_str)

    print(meta_str)

    with open('meta.yaml', 'w') as fh:
        fh.write(meta_str)
