# git-credential-gpg

A fairly simple Git credential store encrypted with GnuPG.

## Setup

Set up GnuPG and your encryption key and then do the following:

1. Put `git-credential-gpg` in a directory on PATH.
2. Set it as a credential helper with the following command:
   ```sh
   git config --global credential.helper 'gpg GPGKEY'
   ```
   where `GPGKEY` is the key ID of your GPG key.

Credentials are encrypted with the given GPG key and
stored in `~/.local/share/git-credential-gpg` directory.

## License

MIT
