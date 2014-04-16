Feature: Version information

    The `version` command shows the currently installed version of Key.

    ```bash
    key version
    ```

    Scenario: Show version information
        When I run `bundle exec key version`
        Then the output should contain current version information
