# About Repository


Initial terraform learning.

1. Code in the Terraform Language stored with extension .tf file extention.
2. UTF-8 encoding is supoorted.


# Modules and Directories

A terraform module us collection of .tf and .tf.json files kept together in a directory. A Terraform module only consists of the top-level configuration files in a directory; nested directories are treated as completely separate modules, and are not automatically included in the configuration.

Terraform evaluates all of the configuration files in a module, effectively treating the entire module as a single document. Separating various blocks into different files is purely for the convenience of readers and maintainers, and has no effect on the module's behavior.

A Terraform module can use module calls to explicitly include other modules into the configuration. These child modules can come from local directories (nested in the parent module's directory, or anywhere else on disk), or from external sources like the Terraform Registry.

# The Root Module

Terraform always runs in the context of a single root module. A complete Terraform configuration consists of a root module and the tree of child modules (which includes the modules called by the root module, any modules called by those modules, etc.).

In Terraform CLI, the root module is the working directory where Terraform is invoked. (You can use command line options to specify a root module outside the working directory, but in practice this is rare.)
In Terraform Cloud and Terraform Enterprise, the root module for a workspace defaults to the top level of the configuration directory (supplied via version control repository or direct upload), but the workspace settings can specify a subdirectory to use instead

Referance : 
https://developer.hashicorp.com/terraform/language/files
