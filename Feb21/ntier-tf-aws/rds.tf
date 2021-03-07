resource "aws_db_subnet_group" "dbsubnetgroup" {
    name = "ntierdbsubnet"
    subnet_ids = [ aws_subnet.subnets[4].id, aws_subnet.subnets[5].id ]
    tags = {
      "Name" = "ntier db subnet group"
    }

    depends_on = [ 
        aws_subnet.subnets[4],
        aws_subnet.subnets[5]
     ]
  
}