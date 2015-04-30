HOWTO: Releasing the CLI
========================

The CLI is hosted by PyPI and installed by a script found in the `mesosphere/install-scripts`_ repository. Releases are currently manual.

Steps
-----

#. Ensure the :code:`.pypirc` file in your home directory is correctly configure with the credentials necessary to publish packages to the :code:`dcos` and :code:`dcoscli` packages on PyPI::

    [distutils]
    index-servers =
        test
        pypi

    [test]
    repository: https://testpypi.python.org/pypi
    username:<USERNAME>
    password:<PASSWORD>

    [pypi]
    repository: https://pypi.python.org/pypi
    username:<USERNAME>
    password:<PASSWORD>

#. From the root of the :code:`dcos-cli` repository, run:

    make publish


#. Change to :code:`cli` repository and run do the same:

    cd cli
    make publish


Testing
-------

You should be able to manually :code:`pip install dcoscli` now. Assuming that you have incremented the version, this will pull down your package. Verify the version with :code:`pip show dcoscli`. Unless you've set up the environment variables as per the install script, `dcos` will not run correctly. (If you want to test a specific version, :code:`pip install dcoscli==1.2.3`, where 1.2.3 is the version to test.)

You should also be able to see the new version appear on the `dcos package page`_, and the `dcoscli package page`_

Troubleshooting
---------------

You can't upload a package if an existing version of it is already in PyPI. To delete the old package, go to the PyPI page for the `dcos package`_ or the `dcoscli package`_. You will need to be authenticated using the same credentials given earlier.

.. _dcos package page: https://pypi.python.org/pypi/dcos
.. _dcoscli package page: https://pypi.python.org/pypi/dcoscli
.. _dcos package: https://pypi.python.org/pypi?%3Aaction=pkg_edit&name=dcos
.. _dcoscli package: https://pypi.python.org/pypi?%3Aaction=pkg_edit&name=dcoscli
.. _mesosphere/install-scripts: https://github.com/mesosphere/install-scripts
