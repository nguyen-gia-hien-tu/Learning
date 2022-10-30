This documentation explain how to sed words after the word `image` with the
desired word.

Refer to this link for details
https://linuxhint.com/environment-variables-sed-command/

```zsh
# Echo a typical configuration line for specifying the image in Kubernetes to test-file
echo "\t\timage: 22064.dkr.ecr.io/hien-image:v1.0.0" >> test-file

# Set environment variable IMAGE_NAME to have value of 17239.dkr.ecr.aws.com/test-repo/changed-ecr:v1.0.1
IMAGE_NAME=17239.dkr.ecr.aws.com/test-repo/changed-ecr:v1.0.1


# `sed` to change the part after the "image" word in the test-file
# (i.e., 12732.dkr.ecr.io/hien-image:v1.0.0) to another words and output to terminal.
# In this case, the words would be value of the $IMAGE_NAME variable

# Refer to this https://tldp.org/LDP/abs/html/parameter-substitution.html#:~:text=%24%7Bvar/Pattern/Replacement%7D
# for bash substitution for variables
# ${IMAGE_NAME//\//\/} change all the occurrences of "/" in the value of the
# IMAGE_NAME variable to "\/" to escape the "/" for later use in `sed`
sed -r "s/^([[:space:]]*image: ).*/\1 ${IMAGE_NAME//\//\/}/" test-file
```