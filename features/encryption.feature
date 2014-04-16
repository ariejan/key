Feature: Encryption

    Encrypting a plain text files requires an input file and a recipient:

    ```bash
    key encrypt input.txt recipient@example.com
    ```

    Key will encrypt and sign the plain text input file.

    Scenario: Encrypt a file
        When I run `bundle exec key encrypt input.txt test1@example.com`
        Then `gpg --sign --armor --encrypt --recipient test1@example.com input.txt` should be run
