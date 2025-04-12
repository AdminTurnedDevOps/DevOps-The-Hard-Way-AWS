cluster_name = "eks"
kubernetes_version = "1.32"
desired_size = 2
max_size = 3
min_size = 1
instance_types = ["t3.medium"]
env = "dev"
state_bucket = "tfstate-dev"