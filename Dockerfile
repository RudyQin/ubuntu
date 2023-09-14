# 基于官方的Ubuntu 20.04镜像作为基础镜像
FROM ubuntu:20.04

# 设置环境变量
ENV JDK_VERSION 17
ENV JDK_HOME /opt/jdk-17.0.8
ENV PATH $JDK_HOME/bin:$PATH

# 安装JDK17
RUN apt-get update && \
    apt-get install -y wget && \
    wget --no-check-certificate --no-cookies --header "Cookie: oraclelicense=accept-securebackup-cookie" https://download.oracle.com/java/17/archive/jdk-17.0.8_linux-x64_bin.tar.gz && \
    tar -xzf jdk-17.0.8_linux-x64_bin.tar.gz -C /opt && \
    rm -f jdk-17.0.8_linux-x64_bin.tar.gz

# 配置Java环境变量
RUN echo "export JAVA_HOME=$JDK_HOME" >> /etc/profile && \
    echo "export PATH=$JDK_HOME/bin:$PATH" && \
    echo "export CLASSPATH=.:$JAVA_HOME/lib/dt.jar:$JAVA_HOME/lib/tools.jar" >> /etc/profile

# 验证JDK安装
RUN java -version
