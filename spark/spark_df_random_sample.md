spark에서 data random 하게 뽑기
 * 정렬을 random 함수를 통해 order by 한 후에 위의 n개를 가져오는 방식.
'''
import org.apache.spark.sql.functions.rand

dataset.orderBy(rand()).limit(n)
'''



https://stackoverflow.com/questions/39344769/spark-dataframe-select-n-random-rows (edited)
