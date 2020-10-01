##
## Role to EC2 Jenkins
##
resource "aws_iam_role" "ec2_access_role" {
  name               = "Jenkins-EC2"
  assume_role_policy = <<EOF
{
 "Version": "2012-10-17",
 "Statement": [
   {
     "Action": "sts:AssumeRole",
     "Principal": {
       "Service": "ec2.amazonaws.com"
     },
     "Effect": "Allow",
     "Sid": ""
   }
 ]
}
EOF 
}

##
## Policy for plugin EC2 Fleet
##
resource "aws_iam_policy" "policy" {
  name        = "jenkins"
  policy      = <<EOF
{
   "Version":"2012-10-17",
   "Statement":[
      {
         "Action": "ec2:*",
         "Effect": "Allow",
         "Resource": "*"
      },
      {
         "Effect": "Allow",
         "Action": "s3:*",
         "Resource": "*"
      },
      {
         "Effect":"Allow",
         "Action":[
            "autoscaling:*"
         ],
         "Resource":"*"
      },
      {
         "Effect":"Allow",
         "Action":[
            "iam:ListInstanceProfiles",
            "iam:ListRoles",
            "iam:PassRole"
         ],
         "Resource":"*"
      }
   ]
}
EOF
}
resource "aws_iam_policy_attachment" "jenkins_attach" {
  name       = "jenkins-attachment"
  roles      = ["${aws_iam_role.ec2_access_role.name}"]
  policy_arn = aws_iam_policy.policy.arn
}

resource "aws_iam_instance_profile" "Jenkins_profile" {
  name  = "jenkins_profile"
  role = aws_iam_role.ec2_access_role.name
}