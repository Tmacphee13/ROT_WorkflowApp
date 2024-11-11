id=$1
read1=$2
read2=$3

# reads are the n%4=2  lines
# sort before getting unique lines (reads)
# re-sort after getting counts to get highest counts at top
echo -e "count\tread" > "${id}_R1_counts.txt"
cat ${read1} | awk 'NR%4==2 {print}' \
| sort \
| uniq -c \
| sort -bgr \
| awk '{print $1, $2}' OFS='\t' >> "${id}_R1_counts.txt"

