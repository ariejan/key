Feature: Decryption

    Encrypted files can be decrypted with Key:

        > key decrypt input.txt.asc

    Scenario: Decrypt a file
        When I run `bundle exec key decrypt input.txt.asc`
        Then "gpg --decrypt input.txt.asc" should be run
