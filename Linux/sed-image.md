This documentation explain how to sed words after the word `image` with the
desired word.

## Refer to this link for some details https://linuxhint.com/environment-variables-sed-command/

```zsh
# Echo a typical configuration line for specifying the image in Kubernetes to test-file
echo "\t\timage: 22064.dkr.ecr.io/hien-image:v1.0.0" > test-file

# Set environment variable IMAGE_NAME to have value of 17239.dkr.ecr.aws.com/test-repo/changed-ecr:v1.0.1
export IMAGE_NAME=17239.dkr.ecr.aws.com/test-repo/changed-ecr:v1.0.1


# `sed` to change the part after the "image" word in the test-file
# (i.e., 12732.dkr.ecr.io/hien-image:v1.0.0) to another words and output to terminal.
# In this case, the words would be value of the $IMAGE_NAME variable

sed -r "s/^([[:space:]]*image: ).*/\1${IMAGE_NAME//\//\\/}/" test-file
```

## Explanation of the `sed` command
### Refer to this documentation for full details of the `sed` command: https://www.gnu.org/software/sed/manual/sed.html
1.  The `-r` part after the `sed` word means to use Extended Regular Expression
    instead of basic Regular Expression. This is to avoid having to escape some
    symbols to make it have special meaning
    * Refer to this part of the documentation for the difference between
      Extended Regular Expression and Basic Regular Expression <br>
      https://www.gnu.org/software/sed/manual/sed.html#ERE-syntax:~:text=%5D%5BIndex%5D-,5.4%20Overview%20of%20extended%20regular%20expression%20syntax,-The%20only%20difference

2.  The matching part

    2.1 The `^` symbol means to match at the beginning of the line
      * Refer to this for understanding <br>
        https://support.smartbear.com/alertsite/docs/appendixes/regular-expressions.html#:~:text=Match%20the%20beginning%20of%20the%20line

    2.2 The `(` symbol after the `^` symbol and its matching `)` means to
        remember the part inside of it. This is used for the `\1` later.
      * Think of it as the remembered part will be "pasted" in the `\1` when
        substituting.
      * Techincally, this will keep the `\t\timage: ` part (notice the white
        space after `:`)
      * Refer to this for understanding of `()` and `\1` <br>
        https://www.grymoire.com/Unix/Sed.html#uh-4 or <br>
        https://www.gnu.org/software/sed/manual/sed.html#ERE-syntax:~:text=%5D%5BIndex%5D-,5.7%20Back%2Dreferences%20and%20Subexpressions,-back%2Dreferences%20are

    2.3 The `[[:space:]]*` part matches any number of white spaces (including
        tabs and new lines)
      * Refer to this for understanding of `[[:space:]]` <br>
        https://www.gnu.org/software/sed/manual/sed.html#ERE-syntax:~:text=Space%20characters%3A%20in%20the%20%E2%80%98C%E2%80%99%20locale%2C%20this%20is%20tab%2C%20newline%2C%20vertical%20tab%2C%20form%20feed%2C%20carriage%20return%2C%20and%20space
      * Refer to this for understading of `*` <br>
        https://www.gnu.org/software/sed/manual/sed.html#ERE-syntax:~:text=character%20matches%20itself.-,*,-Matches%20a%20sequence

    2.4 The `.*` symbols matches any number of characters
      * `.` means matching one occurrence of any character
      * `*` matches zero or more occurrences of the character preceeding the `*`
        symbol <br>
        Refer to this for understanding of `*` <br>
        https://www.gnu.org/software/sed/manual/sed.html#Regexp-Addresses:~:text=character%20matches%20itself.-,*,-Matches%20a%20sequence
      * Thus `.*` means matching zero or more occurrences of any character.

3.  The replacing part

    3.1 The `\1` part will "pasted" the remembered part before that its position

    3.2 ${IMAGE_NAME//\//\\/} changes all the occurrences of "/" in the value of
        the IMAGE_NAME variable to "\/" to escape the "/" for later use in `sed`
      * Refer to this for understanding of bash substitution for variables <br>
        https://tldp.org/LDP/abs/html/parameter-substitution.html#:~:text=%24%7Bvar/Pattern/Replacement%7D

4.  `test-file` is the input file to the `sed` command. Since no output file is
    given. It prints out on the terminal instead.

