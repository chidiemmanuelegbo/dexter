#networking for dexter

resource "aws_vpc" "dexter-vpc" {
    cidr_block       = "10.0.0.0/16"
    instance_tenancy = "default"

tags = {
    Name = "dexter-vpc"
 }
}

#public subnet
resource "aws_subnet" "dexter-pub-sub1" {
cidr_block = "10.0.100.0/24"
availability_zone = "eu-west-2a"
vpc_id = aws_vpc.dexter-vpc.id

tags = {
    Name = "dexter-pub-sub1"
   }
}

#private subnet1
resource "aws_subnet" "dexter-priv-sub1" {
cidr_block = "10.0.120.0/24"
availability_zone = "eu-west-2b"
vpc_id = aws_vpc.dexter-vpc.id

tags = {
    Name = "dexter-priv-sub1"
  }
}

# Public Route table
resource "aws_route_table" "dexter-pubRT"{
    vpc_id = aws_vpc.dexter-vpc.id

    tags = {
        Name = "dexter-pubRT"
    }
}

#associate public subnet to public route table
resource "aws_route_table_association" "assoc-dexter-pubRT-Pub-sub1"{
subnet_id = aws_subnet.dexter-pub-sub1.id
route_table_id = aws_route_table.dexter-pubRT.id
}

# Private Route table
resource "aws_route_table" "dexter-privRT"{
    vpc_id = aws_vpc.dexter-vpc.id

    tags = {
        Name = "dexter-privRT"
    }
}

#associate private subnet to private route table
resource "aws_route_table_association" "assoc-dexter-privRT-Priv-sub1"{
subnet_id = aws_subnet.dexter-priv-sub1.id
route_table_id = aws_route_table.dexter-privRT.id
}