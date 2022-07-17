resource "aws_elasticache_subnet_group" "cache-subnet-group" {
  name       = "cache-subnet-group"
  subnet_ids = [module.network.private_subnet1_id, module.network.private_subnet2_id]
}

resource "aws_elasticache_cluster" "redis-elasticache" {
  cluster_id           = "cluster-example"
  engine               = "redis"
  node_type            = "cache.t2.micro"
  num_cache_nodes      = 1
  parameter_group_name = "default.redis3.2"
  subnet_group_name = aws_elasticache_subnet_group.cache-subnet-group.id
  engine_version       = "3.2.10"
  port                 = 6379

}