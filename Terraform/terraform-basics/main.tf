resource "local_file" "greet" {
    filename = "greet.txt"
    content = "Hello ${var.name}"
}

resource "local_file" "greet-pet" {
    filename = "greet-pet.txt"
    content = var.pet-name
}