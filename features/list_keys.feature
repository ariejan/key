Feature: Listing keys

    It's easy to list known public and secret keys with Key.

    To get a list of public keys, you can simply issue the `list` command:

        > key list

    Showing secret keys requires you to specify the `--secret` flag.

        > key list --secret

    It's also possible to show public key signatures together with your
    public keys.

        > key list --sigs

    Scenario: List public keys by default
        When I run `bundle exec key list`
        Then "gpg --list-keys" should be run

    Scenario: List public keys with signatures
        When I run `bundle exec key list --sigs`
        Then "gpg --list-sigs" should be run

    Scenario: List secret keys
        When I run `bundle exec key list --secret`
        Then "gpg --list-secret-keys" should be run
