locals {
  name               = var.name != null ? var.name : var.product
  security_group_ids = var.security_group_ids != null ? var.security_group_ids : [aws_security_group.sg[0].id]
  subnet_ids         = var.subnet_ids != null ? var.subnet_ids : slice(data.aws_subnets.private_subnets[0].ids, 0, min(3, length(data.aws_subnets.private_subnets[0].ids)))
  vpc_id             = var.vpc_id != null ? var.vpc_id : data.aws_vpc.vpc[0].id
  port               = var.engine == "memcached" ? 11211 : 6379

  sg_name        = var.use_prefix ? null : var.sg_name != null ? var.sg_name : local.name
  sg_name_prefix = var.use_prefix ? var.sg_name != null ? var.sg_name : local.name : null

  vpc_data_lookup_tags = var.vpc_data_lookup_tags != null ? var.vpc_data_lookup_tags : {
    "environment" : var.environment
  }

  subnet_data_lookup_filters = var.subnet_data_lookup_filters != null ? var.subnet_data_lookup_filters : {
    "vpc-id"   = [local.vpc_id]
    "tag:Name" = ["*-private-*"]
  }

  creator = "terraform"

  defaulted_tags = merge(
    var.tags,
    {
      Name                                      = local.name
      "${var.organization}:billing:product"     = var.product
      "${var.organization}:billing:environment" = var.environment
      "${var.organization}:billing:owner"       = var.owner
      creator                                   = local.creator
      repo                                      = var.repo
    }
  )

  tags = merge({ for k, v in local.defaulted_tags : k => v if lookup(data.aws_default_tags.common_tags.tags, k, "") != v })
}

data "aws_default_tags" "common_tags" {}
