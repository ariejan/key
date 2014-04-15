Feature: Signatures and encryption

    Signing text and verifying signatures can be done with the following
    commands:

        > key sign input.txt

    Verifying a signed text can be done with the 'verify command'

        > key verify input.txt.asc

    Signing is done using clear text signatures and ASCII armoring.

    Scenario: Sign a file
        Given a file named "input.txt" with:
          """
          This is a message
          """
        When I run `bundle exec key sign input.txt`
        Then "gpg --armor --clearsign input.txt" should be run

    Scenario: Verify a signature
        When I run `bundle exec key verify input.txt.asc`
        Then "gpg --verify input.txt.asc" should be run

    Scenario: Encrypt a file
        When I run `bundle exec key encrypt input.txt test1@example.com`
        Then "gpg --sign --armor --encrypt --recipient test1@example.com input.txt" should be run

    Scenario: Decrypt a file
        When I run `bundle exec key decrypt input.txt.asc`
        Then "gpg --decrypt input.txt.asc" should be run
