resource "aws_iam_role" "code_deploy_role" {
  name = "${var.owner}-${var.environment}-codedeploy_role"

  assume_role_policy = <<EOF
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Sid": "",
      "Effect": "Allow",
      "Principal": {
        "Service": "codedeploy.amazonaws.com"
      },
      "Action": "sts:AssumeRole"
    }
  ]
}
EOF
}

resource "aws_iam_role_policy_attachment" "code_deploy_role_attachment" {
  policy_arn = "arn:aws:iam::aws:policy/AWSCodeDeployRoleForECS"
  role       = aws_iam_role.code_deploy_role.name
}