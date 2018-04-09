http://boristyukin.com/benchmarking-apache-kudu-vs-apache-impala/


Data Dump
# KUDU
2018-02-27 21:12:52,336 INFO Using Database: tpch_kudu (16 buckets)
2018-02-27 21:13:18,186 INFO Query in /home/ec2-user/hive-benchmark/sample-queries-tpch/tpch_query1.sql: Time Taken(25.8496699333)
2018-02-27 21:13:42,161 INFO Query in /home/ec2-user/hive-benchmark/sample-queries-tpch/tpch_query10.sql: Time Taken(23.9751980305)
2018-02-27 21:14:09,565 INFO Query in /home/ec2-user/hive-benchmark/sample-queries-tpch/tpch_query11.sql: Time Taken(27.4033639431)
2018-02-27 21:14:32,419 INFO Query in /home/ec2-user/hive-benchmark/sample-queries-tpch/tpch_query12.sql: Time Taken(22.8533608913)
2018-02-27 21:15:26,774 INFO Query in /home/ec2-user/hive-benchmark/sample-queries-tpch/tpch_query13.sql: Time Taken(54.3549849987)
2018-02-27 21:15:49,202 INFO Query in /home/ec2-user/hive-benchmark/sample-queries-tpch/tpch_query14.sql: Time Taken(22.4272880554)
2018-02-27 21:16:09,196 INFO Query in /home/ec2-user/hive-benchmark/sample-queries-tpch/tpch_query15.sql: Time Taken(19.9943170547)
2018-02-27 21:16:12,729 INFO Query in /home/ec2-user/hive-benchmark/sample-queries-tpch/tpch_query16.sql: Time Taken(3.53244709969)
2018-02-27 21:16:22,497 INFO Query in /home/ec2-user/hive-benchmark/sample-queries-tpch/tpch_query17.sql: Time Taken(9.76764512062)
2018-02-27 21:17:46,808 INFO Query in /home/ec2-user/hive-benchmark/sample-queries-tpch/tpch_query18.sql: Time Taken(84.3103950024)
2018-02-27 21:18:05,521 INFO Query in /home/ec2-user/hive-benchmark/sample-queries-tpch/tpch_query19.sql: Time Taken(18.7128000259)
2018-02-27 21:18:24,162 INFO Query in /home/ec2-user/hive-benchmark/sample-queries-tpch/tpch_query2.sql: Time Taken(18.6409921646)
2018-02-27 21:18:33,573 INFO Query in /home/ec2-user/hive-benchmark/sample-queries-tpch/tpch_query20.sql: Time Taken(9.41041994095)
2018-02-27 21:19:00,968 INFO Query in /home/ec2-user/hive-benchmark/sample-queries-tpch/tpch_query22.sql: Time Taken(27.3947031498)
2018-02-27 21:19:20,184 INFO Query in /home/ec2-user/hive-benchmark/sample-queries-tpch/tpch_query3.sql: Time Taken(19.2153170109)
2018-02-27 21:21:36,653 INFO Query in /home/ec2-user/hive-benchmark/sample-queries-tpch/tpch_query4.sql: Time Taken(136.469609976)
2018-02-27 21:21:55,696 INFO Query in /home/ec2-user/hive-benchmark/sample-queries-tpch/tpch_query5.sql: Time Taken(19.0424218178)
2018-02-27 21:22:01,767 INFO Query in /home/ec2-user/hive-benchmark/sample-queries-tpch/tpch_query6.sql: Time Taken(6.07064795494)
2018-02-27 21:22:24,221 INFO Query in /home/ec2-user/hive-benchmark/sample-queries-tpch/tpch_query7.sql: Time Taken(22.4540231228)
2018-02-27 21:22:44,765 INFO Query in /home/ec2-user/hive-benchmark/sample-queries-tpch/tpch_query8.sql: Time Taken(20.5430798531)
2018-02-27 21:23:24,742 INFO Query in /home/ec2-user/hive-benchmark/sample-queries-tpch/tpch_query9.sql: Time Taken(39.9764339924)


# Parquet (running with impala on all nodes)
2018-02-27 21:35:20,918 INFO Using Database: tpch_parquet 
2018-02-27 21:35:34,156 INFO Query in /home/ec2-user/hive-benchmark/sample-queries-tpch/tpch_query1.sql: Time Taken(13.2375679016)
2018-02-27 21:36:00,693 INFO Query in /home/ec2-user/hive-benchmark/sample-queries-tpch/tpch_query10.sql: Time Taken(26.5370988846)
2018-02-27 21:36:27,881 INFO Query in /home/ec2-user/hive-benchmark/sample-queries-tpch/tpch_query11.sql: Time Taken(27.1869029999)
2018-02-27 21:36:36,439 INFO Query in /home/ec2-user/hive-benchmark/sample-queries-tpch/tpch_query12.sql: Time Taken(8.55844306946)
2018-02-27 21:36:54,674 INFO Query in /home/ec2-user/hive-benchmark/sample-queries-tpch/tpch_query13.sql: Time Taken(18.2342321873)
2018-02-27 21:37:07,202 INFO Query in /home/ec2-user/hive-benchmark/sample-queries-tpch/tpch_query14.sql: Time Taken(12.5272660255)
2018-02-27 21:37:33,110 INFO Query in /home/ec2-user/hive-benchmark/sample-queries-tpch/tpch_query15.sql: Time Taken(25.9077911377)
2018-02-27 21:37:37,677 INFO Query in /home/ec2-user/hive-benchmark/sample-queries-tpch/tpch_query16.sql: Time Taken(4.56654691696)
2018-02-27 21:37:46,488 INFO Query in /home/ec2-user/hive-benchmark/sample-queries-tpch/tpch_query17.sql: Time Taken(8.8107111454)
2018-02-27 21:38:17,653 INFO Query in /home/ec2-user/hive-benchmark/sample-queries-tpch/tpch_query18.sql: Time Taken(31.1646051407)
2018-02-27 21:38:27,584 INFO Query in /home/ec2-user/hive-benchmark/sample-queries-tpch/tpch_query19.sql: Time Taken(9.9311850071)
2018-02-27 21:38:43,241 INFO Query in /home/ec2-user/hive-benchmark/sample-queries-tpch/tpch_query2.sql: Time Taken(15.6561501026)
2018-02-27 21:38:52,475 INFO Query in /home/ec2-user/hive-benchmark/sample-queries-tpch/tpch_query20.sql: Time Taken(9.23418498039)
2018-02-27 21:39:19,892 INFO Query in /home/ec2-user/hive-benchmark/sample-queries-tpch/tpch_query22.sql: Time Taken(27.4163570404)
2018-02-27 21:39:32,650 INFO Query in /home/ec2-user/hive-benchmark/sample-queries-tpch/tpch_query3.sql: Time Taken(12.7577691078)
2018-02-27 21:39:40,491 INFO Query in /home/ec2-user/hive-benchmark/sample-queries-tpch/tpch_query4.sql: Time Taken(7.84088993073)
2018-02-27 21:39:54,859 INFO Query in /home/ec2-user/hive-benchmark/sample-queries-tpch/tpch_query5.sql: Time Taken(14.3681750298)
2018-02-27 21:39:58,300 INFO Query in /home/ec2-user/hive-benchmark/sample-queries-tpch/tpch_query6.sql: Time Taken(3.44039702415)
2018-02-27 21:40:30,298 INFO Query in /home/ec2-user/hive-benchmark/sample-queries-tpch/tpch_query7.sql: Time Taken(31.9977719784)
2018-02-27 21:40:44,777 INFO Query in /home/ec2-user/hive-benchmark/sample-queries-tpch/tpch_query8.sql: Time Taken(14.4789688587)
2018-02-27 21:41:12,827 INFO Query in /home/ec2-user/hive-benchmark/sample-queries-tpch/tpch_query9.sql: Time Taken(28.0494329929)

#Parquet (running with impala daemon only on worker nodes)
2018-03-01 17:40:24,440 INFO Using Database: tpch_parquet
2018-03-01 17:40:41,232 INFO Query in /home/ec2-user/hive-benchmark/sample-queries-tpch/tpch_query1.sql: Time Taken(16.7920529842)
2018-03-01 17:41:05,295 INFO Query in /home/ec2-user/hive-benchmark/sample-queries-tpch/tpch_query10.sql: Time Taken(24.0623428822)
2018-03-01 17:41:31,541 INFO Query in /home/ec2-user/hive-benchmark/sample-queries-tpch/tpch_query11.sql: Time Taken(26.2451839447)
2018-03-01 17:41:43,364 INFO Query in /home/ec2-user/hive-benchmark/sample-queries-tpch/tpch_query12.sql: Time Taken(11.8233029842)
2018-03-01 17:42:03,843 INFO Query in /home/ec2-user/hive-benchmark/sample-queries-tpch/tpch_query13.sql: Time Taken(20.4787790775)
2018-03-01 17:42:16,888 INFO Query in /home/ec2-user/hive-benchmark/sample-queries-tpch/tpch_query14.sql: Time Taken(13.0445189476)
2018-03-01 17:42:50,467 INFO Query in /home/ec2-user/hive-benchmark/sample-queries-tpch/tpch_query15.sql: Time Taken(33.5781347752)
2018-03-01 17:42:54,473 INFO Query in /home/ec2-user/hive-benchmark/sample-queries-tpch/tpch_query16.sql: Time Taken(4.00582003593)
2018-03-01 17:43:03,530 INFO Query in /home/ec2-user/hive-benchmark/sample-queries-tpch/tpch_query17.sql: Time Taken(9.05689001083)
2018-03-01 17:43:40,413 INFO Query in /home/ec2-user/hive-benchmark/sample-queries-tpch/tpch_query18.sql: Time Taken(36.8831150532)
2018-03-01 17:43:52,716 INFO Query in /home/ec2-user/hive-benchmark/sample-queries-tpch/tpch_query19.sql: Time Taken(12.3025650978)
2018-03-01 17:44:09,391 INFO Query in /home/ec2-user/hive-benchmark/sample-queries-tpch/tpch_query2.sql: Time Taken(16.6746520996)
2018-03-01 17:44:18,796 INFO Query in /home/ec2-user/hive-benchmark/sample-queries-tpch/tpch_query20.sql: Time Taken(9.40461206436)
2018-03-01 17:44:46,173 INFO Query in /home/ec2-user/hive-benchmark/sample-queries-tpch/tpch_query22.sql: Time Taken(27.3766109943)
2018-03-01 17:44:59,044 INFO Query in /home/ec2-user/hive-benchmark/sample-queries-tpch/tpch_query3.sql: Time Taken(12.8701307774)
2018-03-01 17:45:06,304 INFO Query in /home/ec2-user/hive-benchmark/sample-queries-tpch/tpch_query4.sql: Time Taken(7.26007008553)
2018-03-01 17:45:20,295 INFO Query in /home/ec2-user/hive-benchmark/sample-queries-tpch/tpch_query5.sql: Time Taken(13.9909830093)
2018-03-01 17:45:23,933 INFO Query in /home/ec2-user/hive-benchmark/sample-queries-tpch/tpch_query6.sql: Time Taken(3.63704514503)
2018-03-01 17:46:06,036 INFO Query in /home/ec2-user/hive-benchmark/sample-queries-tpch/tpch_query7.sql: Time Taken(42.1031761169)
2018-03-01 17:46:20,985 INFO Query in /home/ec2-user/hive-benchmark/sample-queries-tpch/tpch_query8.sql: Time Taken(14.948554039)
2018-03-01 17:46:59,278 INFO Query in /home/ec2-user/hive-benchmark/sample-queries-tpch/tpch_query9.sql: Time Taken(38.2925059795)
2018-03-01 17:47:54,335 ERROR Query in /home/ec2-user/hive-benchmark/sample-queries-tpch/tpch_query21.sql: Error in running.

# HDFS Seq file
2018-02-27 21:48:53,368 INFO Using Database: tpch_text_impala
2018-02-27 21:50:33,699 INFO Query in /home/ec2-user/hive-benchmark/sample-queries-tpch/tpch_query1.sql: Time Taken(100.330415964)
2018-02-27 21:52:49,893 INFO Query in /home/ec2-user/hive-benchmark/sample-queries-tpch/tpch_query10.sql: Time Taken(136.193037033)
2018-02-27 21:53:22,406 INFO Query in /home/ec2-user/hive-benchmark/sample-queries-tpch/tpch_query11.sql: Time Taken(32.5133590698)
2018-02-27 21:55:13,086 INFO Query in /home/ec2-user/hive-benchmark/sample-queries-tpch/tpch_query12.sql: Time Taken(110.679755211)
2018-02-27 21:55:33,913 INFO Query in /home/ec2-user/hive-benchmark/sample-queries-tpch/tpch_query13.sql: Time Taken(20.8263010979)
2018-02-27 21:57:05,881 INFO Query in /home/ec2-user/hive-benchmark/sample-queries-tpch/tpch_query14.sql: Time Taken(91.9679381847)
2018-02-27 21:59:52,146 INFO Query in /home/ec2-user/hive-benchmark/sample-queries-tpch/tpch_query15.sql: Time Taken(166.263972998)
2018-02-27 22:00:11,517 INFO Query in /home/ec2-user/hive-benchmark/sample-queries-tpch/tpch_query16.sql: Time Taken(19.371240139)
2018-02-27 22:02:51,203 INFO Query in /home/ec2-user/hive-benchmark/sample-queries-tpch/tpch_query17.sql: Time Taken(159.685808897)
2018-02-27 22:07:28,319 INFO Query in /home/ec2-user/hive-benchmark/sample-queries-tpch/tpch_query18.sql: Time Taken(277.115427017)
2018-02-27 22:09:07,702 INFO Query in /home/ec2-user/hive-benchmark/sample-queries-tpch/tpch_query19.sql: Time Taken(99.3832011223)
2018-02-27 22:09:38,551 INFO Query in /home/ec2-user/hive-benchmark/sample-queries-tpch/tpch_query2.sql: Time Taken(30.8482499123)
2018-02-27 22:11:10,215 INFO Query in /home/ec2-user/hive-benchmark/sample-queries-tpch/tpch_query20.sql: Time Taken(91.6637518406)
2018-02-27 22:11:47,931 INFO Query in /home/ec2-user/hive-benchmark/sample-queries-tpch/tpch_query22.sql: Time Taken(37.7152450085)
2018-02-27 22:13:42,489 INFO Query in /home/ec2-user/hive-benchmark/sample-queries-tpch/tpch_query3.sql: Time Taken(114.558295965)
2018-02-27 22:15:26,026 INFO Query in /home/ec2-user/hive-benchmark/sample-queries-tpch/tpch_query4.sql: Time Taken(103.536772013)
2018-02-27 22:17:12,624 INFO Query in /home/ec2-user/hive-benchmark/sample-queries-tpch/tpch_query5.sql: Time Taken(106.597422838)
2018-02-27 22:18:41,007 INFO Query in /home/ec2-user/hive-benchmark/sample-queries-tpch/tpch_query6.sql: Time Taken(88.3825769424)
2018-02-27 22:20:38,517 INFO Query in /home/ec2-user/hive-benchmark/sample-queries-tpch/tpch_query7.sql: Time Taken(117.509729862)
2018-02-27 22:22:34,354 INFO Query in /home/ec2-user/hive-benchmark/sample-queries-tpch/tpch_query8.sql: Time Taken(115.836786032)
2018-02-27 22:24:37,314 INFO Query in /home/ec2-user/hive-benchmark/sample-queries-tpch/tpch_query9.sql: Time Taken(122.959137201)

# tpch_kudu_32 : (kudu mem: 3Gb and Impala Mem Gb)
2018-03-01 16:53:39,127 INFO Using Database: tpch_kudu_32
2018-03-01 16:54:04,405 INFO Query in /home/ec2-user/hive-benchmark/sample-queries-tpch/tpch_query1.sql: Time Taken(25.2764930725)
2018-03-01 16:54:33,060 INFO Query in /home/ec2-user/hive-benchmark/sample-queries-tpch/tpch_query10.sql: Time Taken(28.6542570591)
2018-03-01 16:55:00,046 INFO Query in /home/ec2-user/hive-benchmark/sample-queries-tpch/tpch_query11.sql: Time Taken(26.9847919941)
2018-03-01 16:55:12,844 INFO Query in /home/ec2-user/hive-benchmark/sample-queries-tpch/tpch_query12.sql: Time Taken(12.7972729206)
2018-03-01 16:55:30,679 INFO Query in /home/ec2-user/hive-benchmark/sample-queries-tpch/tpch_query13.sql: Time Taken(17.8344831467)
2018-03-01 16:55:43,911 INFO Query in /home/ec2-user/hive-benchmark/sample-queries-tpch/tpch_query14.sql: Time Taken(12.7759850025)
2018-03-01 16:56:04,075 INFO Query in /home/ec2-user/hive-benchmark/sample-queries-tpch/tpch_query15.sql: Time Taken(20.1621510983)
2018-03-01 16:56:08,473 INFO Query in /home/ec2-user/hive-benchmark/sample-queries-tpch/tpch_query16.sql: Time Taken(4.39742803574)
2018-03-01 16:56:18,730 INFO Query in /home/ec2-user/hive-benchmark/sample-queries-tpch/tpch_query17.sql: Time Taken(10.2557039261)
2018-03-01 16:59:52,599 INFO Query in /home/ec2-user/hive-benchmark/sample-queries-tpch/tpch_query18.sql: Time Taken(213.8686409)
2018-03-01 17:00:07,452 INFO Query in /home/ec2-user/hive-benchmark/sample-queries-tpch/tpch_query19.sql: Time Taken(14.8524129391)
2018-03-01 17:00:26,866 INFO Query in /home/ec2-user/hive-benchmark/sample-queries-tpch/tpch_query2.sql: Time Taken(19.4119799137)
2018-03-01 17:00:33,903 INFO Query in /home/ec2-user/hive-benchmark/sample-queries-tpch/tpch_query20.sql: Time Taken(7.0361790657)
2018-03-01 17:01:01,284 INFO Query in /home/ec2-user/hive-benchmark/sample-queries-tpch/tpch_query22.sql: Time Taken(27.3794641495)
2018-03-01 17:01:25,609 INFO Query in /home/ec2-user/hive-benchmark/sample-queries-tpch/tpch_query3.sql: Time Taken(24.3247931004)
2018-03-01 17:02:02,008 INFO Query in /home/ec2-user/hive-benchmark/sample-queries-tpch/tpch_query4.sql: Time Taken(36.3970937729)
2018-03-01 17:02:16,766 INFO Query in /home/ec2-user/hive-benchmark/sample-queries-tpch/tpch_query5.sql: Time Taken(14.7575981617)
2018-03-01 17:02:19,178 INFO Query in /home/ec2-user/hive-benchmark/sample-queries-tpch/tpch_query6.sql: Time Taken(2.4106760025)
2018-03-01 17:03:01,875 INFO Query in /home/ec2-user/hive-benchmark/sample-queries-tpch/tpch_query7.sql: Time Taken(42.6958870888)
2018-03-01 17:03:15,571 INFO Query in /home/ec2-user/hive-benchmark/sample-queries-tpch/tpch_query8.sql: Time Taken(13.695374012)
2018-03-01 17:03:50,294 INFO Query in /home/ec2-user/hive-benchmark/sample-queries-tpch/tpch_query9.sql: Time Taken(34.7182738781)
2018-03-01 17:04:46,753 ERROR Query in /home/ec2-user/hive-benchmark/sample-queries-tpch/tpch_query21.sql: Error in running.

# tpch_kudu 32 running with kudu memory = 4Gb Impala Memory 3Gb
2018-03-01 23:17:54,201 INFO Using Database: tpch_kudu_32
2018-03-01 23:18:14,485 INFO Query in /home/ec2-user/hive-benchmark/sample-queries-tpch/tpch_query1.sql: Time Taken(20.2838139534)
2018-03-01 23:18:38,564 INFO Query in /home/ec2-user/hive-benchmark/sample-queries-tpch/tpch_query10.sql: Time Taken(24.0776500702)
2018-03-01 23:19:07,426 INFO Query in /home/ec2-user/hive-benchmark/sample-queries-tpch/tpch_query11.sql: Time Taken(28.8615109921)
2018-03-01 23:19:19,312 INFO Query in /home/ec2-user/hive-benchmark/sample-queries-tpch/tpch_query12.sql: Time Taken(11.8850169182)
2018-03-01 23:19:36,034 INFO Query in /home/ec2-user/hive-benchmark/sample-queries-tpch/tpch_query13.sql: Time Taken(16.7213280201)
2018-03-01 23:19:55,517 INFO Query in /home/ec2-user/hive-benchmark/sample-queries-tpch/tpch_query14.sql: Time Taken(19.4822530746)
2018-03-01 23:20:16,896 INFO Query in /home/ec2-user/hive-benchmark/sample-queries-tpch/tpch_query15.sql: Time Taken(21.3781919479)
2018-03-01 23:20:20,692 INFO Query in /home/ec2-user/hive-benchmark/sample-queries-tpch/tpch_query16.sql: Time Taken(3.79239487648)
2018-03-01 23:20:30,520 INFO Query in /home/ec2-user/hive-benchmark/sample-queries-tpch/tpch_query17.sql: Time Taken(9.82661390305)
2018-03-01 23:23:57,105 INFO Query in /home/ec2-user/hive-benchmark/sample-queries-tpch/tpch_query18.sql: Time Taken(206.583505154)
2018-03-01 23:24:04,712 INFO Query in /home/ec2-user/hive-benchmark/sample-queries-tpch/tpch_query19.sql: Time Taken(7.60684299469)
2018-03-01 23:24:23,374 INFO Query in /home/ec2-user/hive-benchmark/sample-queries-tpch/tpch_query2.sql: Time Taken(18.6591770649)
2018-03-01 23:24:29,508 INFO Query in /home/ec2-user/hive-benchmark/sample-queries-tpch/tpch_query20.sql: Time Taken(6.13271999359)
2018-03-01 23:24:59,428 INFO Query in /home/ec2-user/hive-benchmark/sample-queries-tpch/tpch_query22.sql: Time Taken(29.9197499752)
2018-03-01 23:25:22,747 INFO Query in /home/ec2-user/hive-benchmark/sample-queries-tpch/tpch_query3.sql: Time Taken(23.3181738853)
2018-03-01 23:25:58,053 INFO Query in /home/ec2-user/hive-benchmark/sample-queries-tpch/tpch_query4.sql: Time Taken(35.3044710159)
2018-03-01 23:26:12,879 INFO Query in /home/ec2-user/hive-benchmark/sample-queries-tpch/tpch_query5.sql: Time Taken(14.8260900974)
2018-03-01 23:26:15,090 INFO Query in /home/ec2-user/hive-benchmark/sample-queries-tpch/tpch_query6.sql: Time Taken(2.21018791199)
2018-03-01 23:26:54,731 INFO Query in /home/ec2-user/hive-benchmark/sample-queries-tpch/tpch_query7.sql: Time Taken(39.6393668652)
2018-03-01 23:27:08,990 INFO Query in /home/ec2-user/hive-benchmark/sample-queries-tpch/tpch_query8.sql: Time Taken(14.2585699558)
2018-03-01 23:27:35,247 INFO Query in /home/ec2-user/hive-benchmark/sample-queries-tpch/tpch_query9.sql: Time Taken(26.2564511299)



