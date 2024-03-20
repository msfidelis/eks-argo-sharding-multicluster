# resource "aws_efs_file_system" "karmada_etcd" {
#   creation_token = format("%s-etcd", var.cluster_name)

#   tags = {
#     Name = format("%s-etcd", var.cluster_name)
#   }
# }

# resource "aws_efs_mount_target" "etcd_a" {
#   file_system_id = aws_efs_file_system.karmada_etcd.id
#   subnet_id      = data.aws_ssm_parameter.private_subnet_1.value
#   security_groups = [aws_security_group.efs.id] 
# }

# resource "aws_efs_mount_target" "etcd_b" {
#   file_system_id = aws_efs_file_system.karmada_etcd.id
#   subnet_id      = data.aws_ssm_parameter.private_subnet_2.value
#   security_groups = [aws_security_group.efs.id] 
# }

# resource "aws_efs_mount_target" "etcd_c" {
#   file_system_id = aws_efs_file_system.karmada_etcd.id
#   subnet_id      = data.aws_ssm_parameter.private_subnet_3.value
#   security_groups = [aws_security_group.efs.id] 
# }


# resource "aws_security_group" "efs" {
#   name        = format("%s-efs", var.cluster_name)

#   vpc_id      = data.aws_ssm_parameter.vpc.value

#   ingress {
#     from_port   = 2049
#     to_port     = 2049
#     protocol    = "tcp"
#     cidr_blocks = ["0.0.0.0/0"] 
#   }

#   egress {
#     from_port   = 0
#     to_port     = 0
#     protocol    = "-1" 
#     cidr_blocks = ["0.0.0.0/0"]
#   }

#   tags = {
#     Name = format("%s-efs", var.cluster_name)
#   }
# }

# resource "kubectl_manifest" "efs_storageclass" {
#   yaml_body = <<YAML
# kind: StorageClass
# apiVersion: storage.k8s.io/v1
# metadata:
#   name: efs-sc
# provisioner: efs.csi.aws.com
# YAML

#   depends_on = [
#     aws_eks_cluster.main,
#     aws_eks_node_group.cluster,
#     kubernetes_config_map.aws-auth
#   ]
# }

# resource "kubectl_manifest" "efs_pv" {
#   yaml_body = <<YAML
# apiVersion: v1
# kind: PersistentVolume
# metadata:
#   name: etc-data
# spec:
#   capacity:
#     storage: 5Gi
#   volumeMode: Filesystem
#   accessModes:
#     - ReadWriteMany
#   persistentVolumeReclaimPolicy: Retain
#   storageClassName: efs-sc
#   csi:
#     driver: efs.csi.aws.com
#     volumeHandle: ${aws_efs_file_system.karmada_etcd.id}
# YAML

#   depends_on = [
#     kubectl_manifest.efs_storageclass
#   ]
# }

# resource "kubectl_manifest" "efs_pvc" {
#   yaml_body = <<YAML
# apiVersion: v1
# kind: PersistentVolumeClaim
# metadata:
#   name: efs-claim
# spec:
#   accessModes:
#     - ReadWriteMany
#   storageClassName: efs-sc
#   resources:
#     requests:
#       storage: 5Gi
# YAML

#   depends_on = [
#     kubectl_manifest.efs_storageclass
#   ]
# }