# The variable "filename_count" is used for "pet_count" local file
variable "filename_count" {
    default = [
        "pet_count_1.txt",
        "pet_count_2.txt",
        "pet_count_3.txt"
    ]
}

# The variable "filename_for_each" is used for "pet_for_each" local file
variable "filename_for_each" {
    type = list(string)
    default = [ 
        "pet_for_each_1.txt",
        "pet_for_each_2.txt",
        "pet_for_each_3.txt"
    ]
}
