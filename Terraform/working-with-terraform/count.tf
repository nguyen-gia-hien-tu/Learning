resource "local_file" "pet_count" {
    filename = var.filename_count[count.index]
    content = "The name of this file is ${var.filename_count[count.index]}"
    count = length(var.filename_count)
}

output "pets_count" {
    value = local_file.pet_count
}

resource "local_file" "pet_for_each" {
    filename = each.value
    content = "The name of this file is ${each.value}"
    for_each = toset(var.filename_for_each)
}

output "pets_for_each" {
    value = local_file.pet_for_each
}