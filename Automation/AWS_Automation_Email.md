# Blueocean-Transition-AWS_Automation_Query
This repo is set for Blueocean transition related documentation in aws automation for their weekly and daily query in Blueocean database

## Background for the automation process
  Currently Blueocean has different query request needed from their database, they want to automate the query results into csv files and send to different audience. Weekly report audience and daily report audience.(See details in **Audience_list** within this repo).
 
  
## Current process design
  1 Utilize AWS RDS, AWS Lambda Function and AWS S3 to create the pipeline.
  
  2 Set ideal time daily/weekly through Cloudwatch to trigger the lambda function to transform Mysql query results to csv files and upload to S3 buckets.
  
  3 Uploaded csv files in S3 buckets will trigger lambda function to send emails to designated group of audience.
  
  
## Related location and resources reference

**IAM role: test-email-attachment-send**

### 1 Daily morning for not visable query

**S3** : daily-morning-query-notyetvisible: https://s3.console.aws.amazon.com/s3/buckets/daily-morning-query-notyetvisible?region=us-west-2&tab=objects
![image](https://user-images.githubusercontent.com/43761876/136408455-55d848c3-bca4-4e1f-8b0a-ac8c254e3c6b.png)

	
**Lambda_email** : Daily-morning-query-NotYetVisible: https://us-west-2.console.aws.amazon.com/lambda/home?region=us-west-2#/functions/Daily-morning-query-NotYetVisible?tab=code

![image](https://user-images.githubusercontent.com/43761876/136408608-42ce7304-6a84-4931-9b31-0deb69d9e7d8.png)

**Lambda_query_daily** :mysql-csv-email: https://us-west-2.console.aws.amazon.com/lambda/home?region=us-west-2#/functions/mysql-csv-email?tab=code
![image](https://user-images.githubusercontent.com/43761876/136461499-e38bbdf7-c70b-4f23-829b-c529531fd99f.png)

	

### 2 Daily morning for Held Back query
	
**S3**: daily-morning-query-heldback: https://s3.console.aws.amazon.com/s3/buckets/daily-morning-query-heldback?region=us-west-2&tab=objects
![image](https://user-images.githubusercontent.com/43761876/136408700-c4be8043-14eb-4c27-bd6f-66625c433c62.png)
	
**Lambda_email** : Daily-morning-query-with-column-HeldBack: https://us-west-2.console.aws.amazon.com/lambda/home?region=us-west-2#/functions/Daily-morning-query-with-column-HeldBack?tab=code
	
**Lambda_query_daily**: mysql-csv-email: https://us-west-2.console.aws.amazon.com/lambda/home?region=us-west-2#/functions/mysql-csv-email?tab=code
![image](https://user-images.githubusercontent.com/43761876/136461511-8522944a-9278-4e6b-8667-197ae2f8f1bb.png)




### 3 Weekly query for user
	
**S3** : Weekly-query-of-User: https://s3.console.aws.amazon.com/s3/buckets/weekly-query-of-user?region=us-west-2&tab=objects
![image](https://user-images.githubusercontent.com/43761876/136408742-da5fca16-97f7-4435-ba3f-94d13205e732.png)
	
**Lambda_email** : Weekly-query-of-User: https://us-west-2.console.aws.amazon.com/lambda/home?region=us-west-2#/functions/Weekly-query-of-User?newFunction=true&tab=code
![image](https://user-images.githubusercontent.com/43761876/136408803-901d1bac-b6eb-44c4-8f3f-1400d23a7f8e.png)
	
**Lambda_query_weekly**: weekly-mysql-csv-email: https://us-west-2.console.aws.amazon.com/lambda/home?region=us-west-2#/functions/weekly-mysql-csv-email?newFunction=true&tab=code
![image](https://user-images.githubusercontent.com/43761876/136463164-07400a49-e610-4019-8c0c-a94f90587d80.png)





