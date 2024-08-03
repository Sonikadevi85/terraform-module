lb={
    lb1={
        lb_name                = "frontendvmlb"
  location            = "eastus"
  rg_name = "hclrg1"
  pip_name                 = "public_ip_lb"
allocation_method   = "Static"
 sku                 = "Standard"
    }

}