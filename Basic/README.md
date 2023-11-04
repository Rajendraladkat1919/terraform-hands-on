
Terraforn is IAC tool which lets you build , change and version cloud and on-prem resources safely and efficently.

# Terraform workflow

The core Terraform workflow consists of three stages:

1. Write: You define resources, which may be across multiple cloud providers and services. For example, you might create a configuration to deploy an application on virtual machines in a Virtual Private Cloud (VPC) network with security groups and a load balancer.

2. Plan: Terraform creates an execution plan describing the infrastructure it will create, update, or destroy based on the existing infrastructure and your configuration.

3. Apply: On approval, Terraform performs the proposed operations in the correct order, respecting any resource dependencies. For example, if you update the properties of a VPC and change the number of virtual machines in that VPC, Terraform will recreate the VPC before scaling the virtual machines

# What happen when we do terraform init

```
1. Before terraform init directory structure.

➜  Basic git:(basic) ✗ ls -al
total 16
drwxr-xr-x  4 me me  128 Nov  4 07:56 .
drwxr-xr-x  5 me  me  160 Nov  3 16:40 ..
-rw-r--r--  1 me  me  116 Nov  3 16:47 README.md
-rw-r--r--  1 me  me   89 Nov  4 07:50 main.tf

2. When we perform `terraform init` in the directory

➜  Basic git:(basic) ✗ terraform init

Initializing the backend...

Initializing provider plugins...
- Finding latest version of hashicorp/local...
- Installing hashicorp/local v2.4.0...
- Installed hashicorp/local v2.4.0 (signed by HashiCorp)

Terraform has created a lock file .terraform.lock.hcl to record the provider
selections it made above. Include this file in your version control repository
so that Terraform can guarantee to make the same selections by default when
you run "terraform init" in the future.

Terraform has been successfully initialized!

You may now begin working with Terraform. Try running "terraform plan" to see
any changes that are required for your infrastructure. All Terraform commands
should now work.

If you ever set or change modules or backend configuration for Terraform,
rerun this command to reinitialize your working directory. If you forget, other
commands will detect it and remind you to do so if necessary.

3. directoey structure after terraform init in current workspace.

➜  Basic git:(basic) ✗ ls -al
total 24
drwxr-xr-x  6 me  me   192 Nov  4 07:57 .
drwxr-xr-x  5 me  me   160 Nov  3 16:40 ..
drwxr-xr-x  3 me  me    96 Nov  4 07:57 .terraform
-rw-r--r--  1 me  me  1153 Nov  4 07:57 .terraform.lock.hcl
-rw-r--r--  1 me  me   116 Nov  3 16:47 README.md
-rw-r--r--  1 me  me    87 Nov  4 07:56 main.tf
```

so after terraform init terraform create `.terraform` folder and `.terraform.lock.hcl` file in the current working directory.


=> .terraform folder contains provider details.

Basic git:(basic) ✗ ls -al .terraform/providers/registry.terraform.io/hashicorp/local/2.4.0/darwin_amd64/terraform-provider-local_v2.4.0_x5
-rwxr-xr-x  1 rajendraladkat  staff  14211904 Nov  4 07:57 .terraform/providers/registry.terraform.io/hashicorp/local/2.4.0/darwin_amd64/terraform-provider-local_v2.4.0_x5

=> .terraform.lock.hcl contains of which provider version terraform lock and uses to perform terraform workflow

➜  Basic git:(basic) ✗ cat .terraform.lock.hcl
# This file is maintained automatically by "terraform init".
# Manual edits may be lost in future updates.

provider "registry.terraform.io/hashicorp/local" {
  version = "2.4.0"
  hashes = [
    "h1:Bs7LAkV/iQTLv72j+cTMrvx2U3KyXrcVHaGbdns1NcE=",
    "zh:53604cd29cb92538668fe09565c739358dc53ca56f9f11312b9d7de81e48fab9",
    "zh:66a46e9c508716a1c98efbf793092f03d50049fa4a83cd6b2251e9a06aca2acf",
    "zh:70a6f6a852dd83768d0778ce9817d81d4b3f073fab8fa570bff92dcb0824f732",
    "zh:78d5eefdd9e494defcb3c68d282b8f96630502cac21d1ea161f53cfe9bb483b3",
    "zh:82a803f2f484c8b766e2e9c32343e9c89b91997b9f8d2697f9f3837f62926b35",
    "zh:9708a4e40d6cc4b8afd1352e5186e6e1502f6ae599867c120967aebe9d90ed04",
    "zh:973f65ce0d67c585f4ec250c1e634c9b22d9c4288b484ee2a871d7fa1e317406",
    "zh:c8fa0f98f9316e4cfef082aa9b785ba16e36ff754d6aba8b456dab9500e671c6",
    "zh:cfa5342a5f5188b20db246c73ac823918c189468e1382cb3c48a9c0c08fc5bf7",
    "zh:e0e2b477c7e899c63b06b38cd8684a893d834d6d0b5e9b033cedc06dd7ffe9e2",
    "zh:f62d7d05ea1ee566f732505200ab38d94315a4add27947a60afa29860822d3fc",
    "zh:fa7ce69dde358e172bd719014ad637634bbdabc49363104f4fca759b4b73f2ce",
  ]
}

# what happen when we do plan wokflow.

# Before plan


```
➜  Basic git:(basic) ✗ ls -al
total 32
drwxr-xr-x  6 rajendraladkat  staff   192 Nov  4 07:57 .
drwxr-xr-x  5 rajendraladkat  staff   160 Nov  3 16:40 ..
drwxr-xr-x  3 rajendraladkat  staff    96 Nov  4 07:57 .terraform
-rw-r--r--  1 rajendraladkat  staff  1153 Nov  4 07:57 .terraform.lock.hcl
-rw-r--r--  1 rajendraladkat  staff  4519 Nov  4 08:09 README.md
-rw-r--r--  1 rajendraladkat  staff    87 Nov  4 07:56 main.tf

```
# After terraform plan

➜  Basic git:(basic) ✗ terraform plan

Terraform used the selected providers to generate the following execution plan. Resource actions are indicated with the following symbols:
  + create

Terraform will perform the following actions:

  # local_file.foo will be created
  + resource "local_file" "foo" {
      + content              = "Rala"
      + content_base64sha256 = (known after apply)
      + content_base64sha512 = (known after apply)
      + content_md5          = (known after apply)
      + content_sha1         = (known after apply)
      + content_sha256       = (known after apply)
      + content_sha512       = (known after apply)
      + directory_permission = "0777"
      + file_permission      = "0777"
      + filename             = "./hello.name"
      + id                   = (known after apply)
    }

Plan: 1 to add, 0 to change, 0 to destroy.

───────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────

Note: You didn't use the -out option to save this plan, so Terraform can't guarantee to take exactly these actions if you run "terraform apply" now.
➜  Basic git:(basic) ✗ ls -al
total 32
drwxr-xr-x  6 rajendraladkat  staff   192 Nov  4 08:09 .
drwxr-xr-x  5 rajendraladkat  staff   160 Nov  3 16:40 ..
drwxr-xr-x  3 rajendraladkat  staff    96 Nov  4 07:57 .terraform
-rw-r--r--  1 rajendraladkat  staff  1153 Nov  4 07:57 .terraform.lock.hcl
-rw-r--r--  1 rajendraladkat  staff  4519 Nov  4 08:09 README.md
-rw-r--r--  1 rajendraladkat  staff    87 Nov  4 07:56 main.tf
```


Things to explore:

1. What happen if we directly use terraform plan or terraform apply before terraform init ?
2. What will happen when we create terraform plan with --out option and delete the all configuration created by terraform init and try terraform plan and terraform apply ?
3. Does terraform plan and terraform apply need terraform init configuration?