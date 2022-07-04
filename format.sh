#!/bin/awk -f

# CASE
# Marry   2143 78 84 77
# Jack    2321 66 78 45
# Tom     2122 48 77 71
# Mike    2537 87 97 95
# Bob     2415 40 57 62

# Expected Result
# NAME    NO.   MATH  ENGLISH  COMPUTER   TOTAL
# ---------------------------------------------
# Marry  2143     78       84       77      239
# Jack   2321     66       78       45      189
# Tom    2122     48       77       71      196
# Mike   2537     87       97       95      279
# Bob    2415     40       57       62      159
# ---------------------------------------------
#   TOTAL:       319      393      350
# AVERAGE:     63.80    78.60    70.00

# BEGIN LINE
BEGIN {
  title[0]="Name"
  title[1]="No."
  title[2]="Math"
  title[3]="English"
  title[4]="Computer"
  title[5]="Total"
  math=0
  english=0
  computer=0
  total=0
  for (i = 0; i < 6; ++i) 
    printf "%-10s", title[i]
    printf "\n"
  for (i = 0; i < 6; ++i) 
    printf "--------  ", title[i]
    printf "\n"
  # printf "%-8s  %-8s  %-8s  %-8s  %-8s  %-8s\n", "Name", "No.", "Math", "English", "Computer", "Total"
  # printf "--------\n"
}
{
  math+=$3
  english+=$4
  computer+=$5
  total+=$3+$4+$5
  # printf "%-6s %-6s %4d %8d %8d %8d\n", $1, $2, $3,$4,$5, $3+$4+$5
  printf "%-10s%-10s%-10d%-10d%-10d%-10d\n", $1, $2, $3, $4, $5, $3+$4+$5
}
END {
  for (i = 0; i < 6; ++i) 
    printf "--------  ", title[i]
    printf "\n"
  printf "%-10s%-10s%-10d%-10d%-10d%-10d\n", "TOTAL:", "", math, english, computer, total
  # NR means the current line number
  printf "%-10s%-10s%-10d%-10d%-10d%-10d\n", "AVERAGE:", "", math/NR, english/NR, computer/NR, total/NR
}