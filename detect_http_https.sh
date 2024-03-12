#!/bin/bash

# 声明包含域名列表的文件
DOMAINS_FILE="domain_list.txt"

# 逐行读取域名列表文件中的域名
while IFS= read -r domain; do
    echo "Domain: $domain"
    
    # 使用 curl 获取网站响应头信息
    response=$(curl -sI "http://$domain" | head -n 1)
    
    if [[ "$response" == *"HTTP/1.1 200 OK"* ]]; then
        echo "HTTP"
    fi
    
    # 使用 curl 获取网站响应头信息
    response=$(curl -sI "https://$domain" | head -n 1)
    
    if [[ "$response" == *"HTTP/1.1 200 OK"* ]]; then
        echo "HTTPS"
    fi

    echo "-------------------------"
done < "$DOMAINS_FILE"