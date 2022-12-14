resource "local_file" "greet" {
  filename = "greet.txt"
  content  = "Hello ${var.name}"
}

resource "local_file" "greet-pet" {
  filename = "greet-pet.txt"
  content  = var.pet-name
}

resource "local_file" "greet-me" {
    filename = "greet-me.txt"
    # Since "my-name" variable is in the "vars.tfvars" file, which is not
    # auto-loaded by Terraform, we need to load it in the terminal when
    # executing "terraform plan" or "terraform apply" or "terraform destroy" by
    # adding "-var-file <file_name>" (i.e., "terraform plan -var-file
    # vars.tfvars" and "terraform apply -var-file vars.tfvars" and "terraform
    # destroy -var-file vars.tfvars")
    content = var.my-name
}

resource "local_file" "test-export-file-name" {
    filename = var.file_name
    content = "${
        "The file name should be created using `export TF_VAR_<variable_name>=<file_name>`\n" }${
        "(e.g., export TF_VAR_file_name=\"test-export-file-name.txt\")"
    }"
}

# "combine-file" is the resource created by variables used from multiple
# approaches
resource "local_file" "combine-vars-file" {
    filename = var.combine-filename
    content = "My favorite pet is ${random_pet.my-pet.id}"
}

resource "random_pet" "my-pet" {
    prefix = var.pet-prefix
    separator = var.pet-separator
    # To use "pet-length" variable, need to add "-var-file vars.tfvars"
    length = var.pet-length
}