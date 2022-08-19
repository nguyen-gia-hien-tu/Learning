variable "name" {
  type    = string
  default = "Hien"
}

variable "pet-name" {
  type = string
}

# Defined in vars.tfvars
variable "my-name" {
    type = string
}

# Defined by using `export TF_VAR_file_name=<file_name>`
variable "file_name" {
    type = string
}

# The next 3 variables are to apply methods to get input variables
# "pet-prefix" uses approach of defining variable in variables.tf
variable "pet-prefix" {
    type = string
    default = "Mr"
}

# "pet-separator" uses approach of defining variable in terraform.tfvars
variable "pet-separator" {
    type = string
}

# "pet-length" uses approach of defining variable in .tfvars file that is not
# terraform.tfvars, which requires adding "-var-file <file_name>"
# NOTE: When destroying resource, need to type a number when asked for input
variable "pet-length" {
    type = number
}

# "combine-filename" uses approach of defining variable in terminal using "-var
# filename=<filename>"
variable "combine-filename" {
    type = string
}
