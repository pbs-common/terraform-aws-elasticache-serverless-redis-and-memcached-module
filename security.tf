resource "aws_security_group" "sg" {
  count = var.security_group_ids == null ? 1 : 0

  description = "Controls access to the ${local.name} serverless cache"

  name        = local.sg_name
  name_prefix = local.sg_name_prefix
  vpc_id      = local.vpc_id

  tags = local.tags
}

resource "aws_security_group_rule" "ingress" {
  count = var.security_group_ids == null && (var.ingress_cidr_blocks != null || var.ingress_source_sg_id != null) ? 1 : 0

  type                     = "ingress"
  protocol                 = "tcp"
  from_port                = local.port
  to_port                  = local.port
  source_security_group_id = var.ingress_source_sg_id
  cidr_blocks              = var.ingress_cidr_blocks
  security_group_id        = aws_security_group.sg[0].id
}

resource "aws_security_group_rule" "egress" {
  count = var.security_group_ids == null ? 1 : 0

  type              = "egress"
  protocol          = "-1"
  from_port         = 0
  to_port           = 0
  cidr_blocks       = ["0.0.0.0/0"]
  security_group_id = aws_security_group.sg[0].id
}
