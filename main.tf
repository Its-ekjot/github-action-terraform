resource "aws_s3_bucket" "my_bucket" {
  bucket = "${var.bucket_name}-${random_id.rand.hex}"
}

resource "random_id" "rand" {
  byte_length = 4
}

# deploy an IAM role with PowerUserAccess policy

/*
resource "aws_iam_role" "test_role" {
  name = "test_role"

  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Action = "sts:AssumeRole"
        Effect = "Allow"
        Sid    = ""
        Principal = {
          Service = "ec2.amazonaws.com"
        }
      },
    ]
  })

  tags = {
    tag-key = "tag-value"
  }
}

# actually attach the PowerUserAccess managed policy to the role
resource "aws_iam_role_policy_attachment" "test_role_poweruser" {
  role       = aws_iam_role.test_role.name
  policy_arn = "arn:aws:iam::aws:policy/PowerUserAccess"
}


# deploy an RDS instance
variable "db_password" {
  description = "Master password for the RDS instance"
  type        = string
  sensitive   = true
}

resource "aws_db_instance" "default" {
  identifier            = "mydb"
  allocated_storage     = 10
  db_name               = "mydb"
  engine                = "mysql"
  engine_version        = "8.0"
  instance_class        = "db.t3.micro"
  username              = "foo"
  password              = var.db_password
  parameter_group_name  = "default.mysql8.0"
  storage_encrypted     = true
  skip_final_snapshot   = true
}

*/
  
  # deploy an ec2 instance

  resource "aws_instance" "public_ec2" {
  ami                    = var.ec2_ami
  instance_type          = var.instance_type
  key_name               = var.ec2_key_pair
  subnet_id              = data.aws_ssm_parameter.resources["subnet1_id"].value
  vpc_security_group_ids = [data.aws_ssm_parameter.resources["ec2_sg_id"].value]

  tags = {
    Name = "Public_EC2"
  }
}
