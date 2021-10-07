import pymysql
import csv
import boto3


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
    cursor.execute('''select u.authid, u.email, u.name, u.avatarUrl, u.lastLogin, cs.friendlyName, r.name Role from brand_navigator_client.User u, brand_navigator_client.CompetitiveSet cs, brand_navigator_client.Role r
    inner join brand_navigator_client.Brand_User_Role bur
    where u.id = bur.user_id
    and cs.id = bur.competitive_set_id
    and r.id = bur.role_id
    and u.id in
    (select distinct user_id from brand_navigator_client.Brand_User_Role)
    and u.isActive = 1
    and not (email like '%blueocean.ai' or email like '%fusemachines.com' or email = 'saratavares843@gmail.com' or email like '%@test.com')
    order by friendlyName, Role;
    ''')
    cols = ["authid", "email", "name","avatarUrl","lastLogin","friendlyName","Role"]
    rows = cursor.fetchall()
    with open('users_assigned_to_sets.csv','w',newline = '') as csv_file:
        myFile = csv.writer(csv_file)
        myFile.writerow(cols)
        myFile.writerows(rows)
    csv_file.close()
    print('success')
#above success

    s3 = boto3.resource('s3')
    bucket = 'weekly-query-of-user'
    filename = 'users_assigned_to_sets.csv'
    s3.meta.client.upload_file(Filename=filename, Bucket=bucket, Key=filename)
    print('destination arrived!')
