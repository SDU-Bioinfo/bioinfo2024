# 远程同源蛋白质搜索引擎项目

## 项目描述

识别远程序列中具有相似结构的蛋白质是一项具有挑战性的任务。为解决这个问题，科学家们开发了各种执行远程同源性搜索的技术。本项目的目标是创建一个基于深度学习的算法，该算法能够从蛋白质数据库（PDB）中为给定的蛋白质结构查询识别出最多12个具有相似结构的同源蛋白质。

### 评分标准

使用TMalign程序计算查询结构与配对的PDB结构之间的TM-score和SEQID（按查询序列长度归一化）来评估查询和候选蛋白质之间的配对质量。最终得分按以下公式计算：

```
(TM-score - 0.6) + min(0.4 - SEQID, 0)
```

算法的有效性通过所有查询-候选对的总分来评估。

### 数据说明

1. **query.lst**: 包含1024个用作查询的蛋白质结构文件路径。您的程序应该接受相同格式（但数据不同）的文件作为输入，并为每个查询蛋白质返回最多12个相似蛋白质。

2. **/data/pdb**: 这个文件夹包含可供搜索的蛋白质数据库结构。可以使用各种Python包（如Graphein和BioPython）访问其中的PDB文件。

3. **tmalign.out**: 这个训练文件包含一些潜在的成功蛋白质配对，其TM-score大于0.6且SEQID低于0.4。

4. **result.out**: 这个示例输出文件为每个查询蛋白质提供了最多12个潜在的蛋白质。您的程序应生成相同格式的输出。

## 提交指南

### 选择测评用户
- 每个队伍需指定一名用户作为提交用户。
- 我们会进入该用户的 `bioinfo/project/submission` 目录用于评估您团队的最终成绩。


### 预提交时间以及正式提交时间

- 预提交开放时间为18周周末，即 2025 年 1 月 12 日 00:00:00。
- 正式提交截止时间为19周周末晚24点， 即 2025 年 1 月 19 日 24:00:00。

### 我们如何测试(🔥提交后助教运行，大家不需要执行🔥)
- 在 `~/bioinfo/project/submission` 目录下，执行命令 `bash run.sh $query $output_path`。
- `$query` 和 `$output_path` 分别为输入的PDB文件路径以及输出文件路径

## 项目要求

### 1. 脚本文件
- `~/bioinfo/project/submission` 目录下必须包含名为 `run.sh` 的脚本文件。
- 此脚本将作为项目运行的主入口。

### 2. Python 环境
- 在 `run.sh` 中调用 Python 环境时，需指定具体的 Python 解释器位置。
- 例如：使用 `/home/san/miniconda3/bin/python`。

### 3. 运行时间限制
- 对于每个query数据的限制时间为 20 分钟。
- 如果超过二十分钟，程序会被强制终止，所以建议随着程序的运行，输出结果到输出文件中

## 联系方式
- 如遇任何问题或疑问，可以发邮件到 sdu_cs_bioinfo@163.com 联系课程助教

祝大家项目顺利！

---

### `run.sh` 文件示例

```bash
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
```

请确保根据您的具体项目需求对上述 `run.sh` 脚本进行适当的调整。
