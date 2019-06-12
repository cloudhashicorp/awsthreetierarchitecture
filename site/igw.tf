resource "aws_internet_gateway" "gw" {
        vpc_id = "${aws_vpc.vpcdarwin.id}"

        tags   = {
        Name   = "Internet Gateway_Darwin"
        }
  
}



