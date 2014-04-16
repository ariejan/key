Feature: Version information

    The `version` command shows the currently installed version of Key.

    ```bash
    $ key version
    Key v0.0.1 using gpg (GnuPG/MacGPG2) 2.0.22 at /usr/local/bin/gpg
    ```

    Scenario: Show version information
        When I run `bundle exec key version`
        Then the output should contain current version information
        And `gpg --version` should be run
