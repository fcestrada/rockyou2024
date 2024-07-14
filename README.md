# RockYou2024

## Introduction

[RockYou2024](https://cybernews.com/security/rockyou2024-largest-password-compilation-leak/) is the biggest leak compilation of real-world passwords used by individuals all over the world, with almost 10 billion unique plaintext passwords posted on July 4th by forum user ObamaCare.

Currently, there are many sites that offer to validate if our passwords have been leaked or match those on the RockYou2024 list; however, I find it ironic to share our passwords on the web to validate that they have not been leaked, so I share this repository with the solution I used to perform my validation locally in case it may be useful to someone.

## Get the RockYou2024 file

1.   Download `rockyou2024.zip` file in your `Downloads` directory with the following magnet link using a BitTorrent client (i.e. [Transmission](https://transmissionbt.com/)):

     ```
     magnet:?xt=urn:btih:4e3915a8ecf6bc174687533d93975b1ff0bde38a
     ```

2.   Uncompress the `rockyou2024.zip` (49 GB) file to get the `rockyou2024.txt` (156 GB) file:

     ```bash
     unzip rockyou2024.zip
     ```

3.   Verify SHA-256 checksum:

     ```bash
     echo "457361a871f111014573ab3bda3e0f5dafd489a3217b62fc8cfb14c74d59bb11 rockyou2024.txt" | sha256sum -c
     ```

## Check your passwords

1.   Clone this git repository:

     ```bash
     git clone https://gitlab.com/fcestrada/rockyou2024.git && cd rockyou2024
     ```

2.   Put the downloaded `rockyou2024.txt` in this directory:

     ```bash
     mv ~/Downloads/rockyou2024.txt .
     ```

3.   Replace the `passwords.txt` file with your own passwords (one per line).

4.   Get execution permission to the script:

     ```bash
     chmod u+x checkPasswords.sh
     ```

5.   Execute the Bash script to check if your passwords match with the RockYou2024 passwords list:

     ```bash
     time ./checkPasswords.sh
     ```

## Notes

*   This is not a performance-optimized version (and I'm not interested in it) since it fulfilled its objective, for that reason it uses a Bash script with standard utilities from a GNU/Linux system. If you want to improve it maybe you can implement the use of [GNU Parallel](https://www.gnu.org/software/parallel/), or better to develop it in C or another high-performance language.

    ```bash
    #### Quick proposal using GNU Parallel
    # grep -a -F -x -f $passwordsFile $rockyouFile >> "$tempFile"
    parallel --pipe-part --block 100M -a $rockyouFile -k --compress grep -a -F -x -f $passwordsFile >> "$tempFile"
    ```
