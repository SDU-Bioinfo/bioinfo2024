#!/bin/bash

# 指定 Python 解释器路径, 请根据自己的python环境进行修改
PYTHON_PATH="/home/san/miniconda3/bin/python"

# 确保输入了两个参数：query列表文件和输出文件
if [ "$#" -ne 2 ]; then
    echo "Usage: $0 query.lst result.out"
    exit 1
fi

# 赋值输入和输出文件变量
QUERY_LIST=$1
OUTPUT_FILE=$2

# 使用指定的 Python 解释器运行您的脚本
$PYTHON_PATH main.py $QUERY_LIST --output $OUTPUT_FILE

# 结束脚本
echo "运行完成"