FROM debian:jessie

MAINTAINER Yu XiaoRui <yxiaorui2012@gmail.com>

RUN (echo "deb http://mirrors.ustc.edu.cn/debian/ jessie main contrib non-free" > /etc/apt/sources.list && echo "deb http://mirrors.ustc.edu.cn/debian/ jessie-updates main contrib non-free" >> /etc/apt/sources.list && echo "deb http://mirrors.ustc.edu.cn/debian-security/ jessie/updates main contrib non-free" >> /etc/apt/sources.list)
RUN apt-get update
RUN apt-get install -y python python-pip python-dev libxml2-dev libxslt-dev libffi-dev libssl-dev supervisor libmysqld-dev

RUN pip install lxml && pip install pyopenssl && pip install Scrapy && pip install twisted && pip install mysql

VOLUME ["/opt/scrapy/app"]
WORKDIR /opt/scrapy/app
ENTRYPOINT ["/usr/local/bin/scrapy","crawl"]