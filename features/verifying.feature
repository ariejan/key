Feature: Verifying signatures

    Signature verification is achieved by supplying a file with a 
    a signed document.

    ```bash
    key verify message.txt.asc
    ```

    Scenario: Verify a signature
        When I run `bundle exec key verify input.txt.asc`
        Then `gpg --verify input.txt.asc` should be run
