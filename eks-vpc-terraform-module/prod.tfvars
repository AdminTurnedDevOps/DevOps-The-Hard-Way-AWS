cluster_name = "eksprod"
kubernetes_version = "1.32"
desired_size = 3
max_size = 4
min_size = 3
instance_types = ["c5.xlarge"]
env = "prod"
state_bucket = "tfstate-dev"