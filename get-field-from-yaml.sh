#!/usr/bin/awk -f

# CASE
# something:
#  - whatever:
#    - something
#  - toc: 4
#  - body: assets/footer.html
# pkg:
#  - pkg_a_1:
#    - Shass
#    - AJh55
#    - ASH7
#  - pkg_b_1:
#    - Kjs6
#    - opsaa
# other:
# morestuff:
#  - whatever

# Expect Result
# pkg_a_1 Shass
# pkg_a_1 AJh55
# pkg_a_1 ASH7
# pkg_b_1 Kjs6
# pkg_b_1 opsaa

/^[^ ]/ {
  # printf "%s\n", $0

  # str = "water, water, everywhere"
  # 
  # Build-in functions - global substitute
  # gsub(/at/, "ith", str)
  # printf "%s\n", str

  field=/^pkg:/
  # print $0, "pattern", field
  # 跳过当前行的执行
  next
}
field { 
  print $0, "match field"
  if (sub(/:$/,"")) 
    # print $0, "2"
    pkg=$2;
  else
    print pkg, $2
}

# 整个处理流程：
# 1. 匹配非空格开头的 record，然后在这些起始行里面，匹配 pkg: 开头的。
#    只有 pkg 开头的起始行这里，field 为 1，才会去处理下面的，属于一个条件 pattern，这是理解的关键。
# 2. 按要求处理 k-v 即可。

# 关键要理解 record, [pattern] { action }, next 指的是跳出当前行执行 awk action，没有 next 就是会多处理一行，结果不变

# /^pkg:/ {
#   print $0, "1111"
#   next
# }
# {
#   print $0, "2222"
# }