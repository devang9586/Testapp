env        = "dev"

dbusername = "techtestapp"
dbpassword = "changeme"

# ensure this is unique, please change it.
# this is s3 bucket name and dynamodb table name
bucket          = "devang-techtestapp-terraform-state-changeme"
dynamodb_table  = "devang-techtestapp-terraform-state-changeme"

instance_count_min = 2
instance_count_max = 4