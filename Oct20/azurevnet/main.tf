resource "azurerm_resource_group" "ntier" {
    name            = "ntier"
    location        = "EastUs"
    tags            = {
        Purpose     = "Learning",
        CreatedBy   = "Terraform"
    }
}