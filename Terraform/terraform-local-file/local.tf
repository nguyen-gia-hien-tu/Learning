resource "local_file" "pet" {
    filename = "pets.txt"
    content = "We love pets!!!"
    file_permission = "0700"
}

resource "local_file" "cat" {
    filename = "cat.txt"
    content = "CATTTTTTTT, MEOWWWWW!!!!"
}

resource "random_pet" "my-pet" {
    prefix = "Mrs"
    separator = "."
    length = "1"
}
