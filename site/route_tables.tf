
# Public
resource "aws_route_table" "public" {

    vpc_id = "${aws_vpc.vpcdarwin.id}"
    route {
        cidr_block = "${var.any_ip}"
        gateway_id = "${aws_internet_gateway.gw.id}"
    }

    tags = {
        Name = "Public Route_Darwin"
    }
  
}

resource "aws_route_table_association" "public1" {

    subnet_id = "${aws_subnet.publicsubnet1.id}"
    route_table_id = "${aws_route_table.public.id}"

  
}

resource "aws_route_table_association" "public2" {

    subnet_id      = "${aws_subnet.publicsubnet2.id}"
    route_table_id = "${aws_route_table.public.id}"

  
}




# Private

resource "aws_route_table" "private" {

    vpc_id             = "${aws_vpc.vpcdarwin.id}"

    route {
        nat_gateway_id = "${aws_nat_gateway.natgw.id}"
        cidr_block     = "${var.any_ip}"
    }

    tags               = {
    Name               = "Private Route_Darwin"
    }
  
}

resource "aws_route_table_association" "private3" {

    subnet_id      = "${aws_subnet.privatesubnet3.id}"
    route_table_id = "${aws_route_table.private.id}"

}

resource "aws_route_table_association" "private4" {

    subnet_id      = "${aws_subnet.privatesubnet4.id}"
    route_table_id = "${aws_route_table.private.id}"
  
}



