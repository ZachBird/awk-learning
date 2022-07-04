# AWK Learning Demo

## usage 

```shell
awk -f format.sh awk-case.txt
```

## tips for me

awk 的处理规则为按行对于指令进行处理。默认按照空格来对字符进行拆分。分成 $1 ... $n。其中 $0 指原内容
如果指定了拆分字符，则按指定拆分字符对于每行字符进行拆分，规则与默认方式相同

awk 默认执行代码块是 {}

如果有前后分别执行的代码段，则：
```
BEGIN {}
[PATTERN] {}
END {}
```