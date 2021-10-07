import pymysql
import csv
import boto3
import os


#Configuration Values

endpoint = os.getenv('endpoint')
username = os.getenv('username')
password = os.getenv('password')
database_name = os.getenv('database_name')

#Connection
connection = pymysql.connect(host=endpoint, user=username,
                             password=password)
print('success')

def lambda_handler(event,context):

    cursor = connection.cursor()
    cursor.execute('''SELECT b.name "Main Brand", cs.id "Set ID", count(s.sessionKey) "Not Yet Visible"
FROM brand_navigator_client.Brand b, brand_navigator_client.CompetitiveSet cs, brand_navigator_client.Session s
where b.id = cs.hero_brand_id and cs.id = s.competitive_set_id and s.isClientVisible = 0 and s.isVisible = 1
group by s.competitive_set_id order by 3 desc;
''')
    cols = ["Main Brand", "Set ID", "Not Yet Visible"]
    rows = cursor.fetchall()
    with open('brand_sessions_not_yet_visible.csv','w',newline = '') as csv_file:
        myFile = csv.writer(csv_file)
        myFile.writerow(cols)
        myFile.writerows(rows)
    csv_file.close()
    print('success')
#above success

    s3 = boto3.resource('s3')
    bucket = 'daily-morning-query-notyetvisible'
    filename = 'brand_sessions_not_yet_visible.csv'
    s3.meta.client.upload_file(Filename=filename, Bucket=bucket, Key=filename)
    print('destination arrived!')
# above for Daily morning query with column "Not Yet Visible"


#below is Daily morning query with column "Held Back"
    #cursor = connection.cursor()
    cursor.execute('''SELECT b.name "Main Brand", cs.id "Set ID", count(s.sessionKey) "Held Back"
FROM brand_navigator_client.Brand b, brand_navigator_client.CompetitiveSet cs, brand_navigator_client.Session s
where b.id = cs.hero_brand_id and cs.id = s.competitive_set_id and s.isClientVisible = 0 and s.isVisible = 0 and s.isActive = 1
group by s.competitive_set_id order by 3 desc;
    ''')
    cols_2 = ["Main Brand", "Set ID", "Held Back"]
    rows_2 = cursor.fetchall()
    with open('hidden_sessions.csv','w',newline = '') as csv_file:
        myFile = csv.writer(csv_file)
        myFile.writerow(cols_2)
        myFile.writerows(rows_2)
    csv_file.close()
    print('success 2')
#above success

    s3 = boto3.resource('s3')
    bucket = 'daily-morning-query-heldback'
    filename = 'hidden_sessions.csv'
    s3.meta.client.upload_file(Filename=filename, Bucket=bucket, Key=filename)
    print('destination arrived!')



