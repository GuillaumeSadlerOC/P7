Terraform module wich creates AWS VPC.


resource "aws_vpc" "default" {
  vpc = true # Boolean if the EIP is in a VPC or not
  # Bloc CIDR principal IPv4 -> 16bits/4octets(ex. 200.140.0.1)
  # Adresses IP "privées" non routables à l'extérieur du VPC
  cidr_block           = "10.0.0.0/16" # Masque de sous-réseau 255.255.0.0 (65532 machines 0/2/3/255)
  # ??? Le réseau peut contenir 261 (65532/251) sous-réseau de 251 machines chacunes (dont 1044 adresses réservées 0/2/3/255)
}
# AWS SUBNET
resource "aws_subnet" "public_subnet" {
  # Adresse du ss-réseau 10.0.1
  # Plage d'adresse dispo 10.0.1.1 à 10.0.1.254 (2 et 3 réservé par AWS)
  vpc_id = aws_vpc.default.id
  cidr_block = "10.0.1.0/24" # Masque de sous-réseau 255.255.255.0 (251 machines 0/2/3/255)
  tags = {
    Name = "public"
  }
}
resource "aws_subnet" "private_subnet" {
  # Adresse du ss-réseau 10.0.2
  # Plage d'adresse dispo 10.0.2.1 à 10.0.2.254 (2 et 3 réservé par AWS)
  vpc_id = aws_vpc.default.id 
  cidr_block = "10.0.2.0/24" # Masque de sous-réseau 255.255.255.0 (251 machines 0/2/3/255)
  tags = {
    Name = "private"
  }
}

AWS SERVICES
> VPC
> INTERNET GATEWAY
> NAT GATEWAY
> SUBNET
> SECURITY GROUP
> SECURITY GROUP RULE
> ROUTE TABLE
> ROUTE
> ROUTE TABLE ASSOCIATION
