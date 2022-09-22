resource "local_file" "create_before_destroy_pet" {
    filename = "create_before_destroy-pets.txt"
    content = "We love pets"
    file_permission = "0700"

    lifecycle {
        create_before_destroy = true
    }
}

resource "local_file" "prevent_destroy_pet" {
    filename = "prevent_destroy_pet.txt"
    content = "We love pets and cannot be destroyed. However, terraform destroy would still destroy it"
    file_permission = "0700"

    lifecycle {
        prevent_destroy = true
    }
}

resource "aws_instance" "webserver" {
    ami = "ami-0edab43b6fa892279"
    instance_type = "t2.micro"
    tags = {
        Name = "ProjectA-Webserver"
    }

    lifecycle {
        ignore_changes = [
          tags
        ]
    }
}
