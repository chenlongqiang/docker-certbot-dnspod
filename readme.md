# readme
近期免费证书有效期从 1 年缩短到 3 个月，避免经常要上云平台手动申请，所以想找个工具可以简单的申请、续期证书。通过了解，发现 Certbot 工具，但官方没提供 Dnspod 插件，于是找了 Python3 的封装并打包成 Docker 方便使用。

## 安装与使用步骤
1.clone 仓库
```
git@github.com:chenlongqiang/docker-certbot-dnspod.git
```

2.构建镜像
```
# 构建 Docker 镜像
cd docker-certbot-dnspod
docker build -t certbot-dnspod .
```

3.获取并填写 dnspod.ini 配置
```
在 https://console.dnspod.cn/account/token/token 进行 DNSPod Token 秘钥创建。
```

4.使用
```
# 申请新证书，执行后会进行命令行交互，填写完信息后将在 certs 目录下生成申请成功的证书
docker run -it --rm -v ./conf/dnspod.ini:/data/certbot/dnspod.ini -v ./certs:/etc/letsencrypt certbot-dnspod -d your_domain.com -d "*.your_domain.com"

# 续期 certs 目录下的证书
docker run -it --rm -v ./conf/dnspod.ini:/data/certbot/dnspod.ini -v ./certs:/etc/letsencrypt certbot-dnspod renew
```

## certbot 相关参考资料
官方文档：https://eff-certbot.readthedocs.io/en/latest/install.html  
官方 Github 仓库：https://github.com/certbot/certbot  
Certbot Python3 封装：https://pypi.org/project/certbot-dnspod/  
