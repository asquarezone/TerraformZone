resource "aws_vpc" "ntier" {
    cidr_block  = var.primary_network_cidr
    tags        = {
        Name    = "ntier primary"
    }
}

resource "aws_subnet" "subnets" {
    vpc_id      = aws_vpc.ntier.id
    count       = length(var.primary_subnets)
    cidr_block  = cidrsubnet(var.primary_network_cidr, 8, count.index)
    tags        = {
        Name    = var.primary_subnets[count.index]
    }
}

# internet gateway
resource "aws_internet_gateway" "igw" {
    vpc_id      = aws_vpc.ntier.id
    tags        = {
        Name    = "ntier primary"
    }

    depends_on  = [
        aws_subnet.subnets
    ]

}

# public route table and private route table
resource "aws_route_table" "route_tables" {
    vpc_id          = aws_vpc.ntier.id
    count           = length(var.route_table_names)

    route {
        cidr_block  = "0.0.0.0/0"
        gateway_id  = aws_internet_gateway.igw.id
    }

    tags        = {
        Name    =  var.route_table_names[count.index]
    }
}


## associate public subnets
resource "aws_route_table_association" "public-associations" {
    subnet_id           = aws_subnet.subnets[local.public_subnets[count.index]].id
    route_table_id      = aws_route_table.route_tables[0].id
    count               = length(local.public_subnets)
}

## associate private subnets

resource "aws_route_table_association" "private-associations" {
    subnet_id           = aws_subnet.subnets[local.private_subnets[count.index]].id
    route_table_id      = aws_route_table.route_tables[1].id
    count               = length(local.private_subnets)
}

## Fetch subnet ids for db subnets
data "aws_subnet_ids" "dbsubnets" {
    vpc_id          = aws_vpc.ntier.id
    filter {
        name   = "tag:Name"
        values = local.dbsubnets 
    }
}

resource "aws_db_subnet_group" "ntier-db-group" {
    name            = "ntier"
    subnet_ids      = data.aws_subnet_ids.dbsubnets.ids
    tags            = {
        Name        =  "ntier-db-subnet-group"
    }

    depends_on  = [
        aws_subnet.subnets,
        aws_route_table_association.public-associations,
        aws_route_table_association.private-associations,
    ]
}

