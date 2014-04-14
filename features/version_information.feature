Feature: version
    The `version` command shows the currently installed version of Key.

    Scenario: Show version information
        When I run `bundle exec key version`
        Then the output should contain current version information
