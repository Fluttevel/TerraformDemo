# =========| PUBLIC SUBNETS |=========

# Create Public Subnet 1
# terraform aws create subnet
resource "aws_subnet" "public-subnet-1" {
  vpc_id                  = aws_vpc.vpc.id
  cidr_block              = "${var.public-subnet-1-cidr}"
  availability_zone       = "eu-west-2a"
  map_public_ip_on_launch = true

  tags      = {
    Name    = "Public Subnet 1"
  }
}


# Create Public Subnet 2
# terraform aws create subnet
resource "aws_subnet" "public-subnet-2" {
  vpc_id                  = aws_vpc.vpc.id
  cidr_block              = "${var.public-subnet-2-cidr}"
  availability_zone       = "eu-west-2b"
  map_public_ip_on_launch = true

  tags      = {
    Name    = "Public Subnet 2"
  }
}

# =====================================



# =========| PRIVATE SUBNETS |=========

# Create Private Subnet 1
# terraform aws create subnet
resource "aws_subnet" "private-subnet-1" {
  vpc_id                  = aws_vpc.vpc.id
  cidr_block              = "${var.private-subnet-1-cidr}"
  availability_zone       = "eu-west-2b"
  map_public_ip_on_launch = false

  tags      = {
    Name    = "Private Subnet 1"
  }
}


# Create Private Subnet 2
# terraform aws create subnet
resource "aws_subnet" "private-subnet-2" {
  vpc_id                  = aws_vpc.vpc.id
  cidr_block              = "${var.private-subnet-2-cidr}"
  availability_zone       = "eu-west-2b"
  map_public_ip_on_launch = false

  tags      = {
    Name    = "Private Subnet 2"
  }
}

# =====================================