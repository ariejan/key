Feature: Signing

    Creating signatures is easy using Key:

    ```bash
    $ key sign input.txt
    ```

    Signing plain text files will use your default key and create a clearsign,
    armored signature.

    Scenario: Sign a file
        Given a file named "input.txt" with:
          """
          This is a message
          """
        When I run `bundle exec key sign input.txt`
        Then `gpg --armor --clearsign input.txt` should be run
