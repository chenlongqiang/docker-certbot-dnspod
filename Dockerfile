# 基础镜像
FROM ubuntu:20.04

# 安装 certbot 和 certbot-dnspod 插件所需的依赖
RUN apt update && \
    apt-get install -y python3-pip && \
    pip install certbot-dnspod

# 将 entrypoint.sh 脚本复制到容器中
COPY entrypoint.sh /entrypoint.sh

# 给 entrypoint.sh 脚本执行权限
RUN chmod +x /entrypoint.sh

# 设置工作目录
WORKDIR /etc/letsencrypt

# 设置脚本文件为入口点
ENTRYPOINT ["/entrypoint.sh"]

# 默认参数
# CMD ["-d", "example.com", "-d", "*.example.com"]