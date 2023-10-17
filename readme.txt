Part-1:
introduction page: https://645bucket.s3.amazonaws.com/index.html

error page : https://645bucket.s3.amazonaws.com/error.html

bucket link: http://645bucket.s3-website-us-east-1.amazonaws.com

Part-2:
Survey page link: https://ec2-3-21-240-195.us-east-2.compute.amazonaws.com/645_assignment_1/survey.html

Instructions to open the link:
The anti-virus of the system, if any, may block the link. Force allow it. The home page also contains links to the survey page.

AWS Simple Storage Service (AWS S3) to create homepage:
1.Login to AWS management Console and select S3 and then click on create a bucket.
2.In order to create a bucket, the first thing we need to do is give a unique bucket name in my case it is “645bucket.s3.amazonaws.com”.
3.Next we need to select the region for which we chose US East (N. Virginia) US-east-1.
4.Choose the bucket for which we want to allow static website hosting from the Buckets list. Then choose Properties. Choose Edit from the Static website hosting menu. Choose Use this bucket to host a website, then select Enable. In the Index document area, provide the file name of the index document. 
5.Amazon S3 by default restricts public access to our account and buckets. If we want to host a static website in a bucket. Choose the name of the bucket that we have set up as a static website. Choose Permissions. Choose Edit under Block public access (bucket settings). Clear Block all public access, and choose Save changes. Amazon S3 disables our bucket's Block Public Access settings.
6.Add a bucket policy that makes our bucket content publicly available. After we edit S3 Block Public Access settings, we add a bucket policy to grant public read access to our bucket. Under Bucket Policy, choose Edit. To grant public read access for our website, type in policy in the Bucket policy editor. Update the Resource to our bucket name. And select save changes.
7.Configuring index document - When we enable static website hosting for our bucket, we enter the name of the index document. After we enable static website hosting for the bucket, we can upload an HTML file with this index document name to our bucket.
To upload the index document to your bucket, do one of the following:
Drag and drop the index file into the console bucket listing.
Choose Upload and follow the prompts to choose and upload the index file.
8.To Configure an error document, we just follow the same steps as index document.
9.After we configure static website hosting for our bucket, we test our website endpoint. Under Bucket, choose permissions. At the bottom of the page, under Static website hosting, choose our Bucket website endpoint.

Endpoint - http://645bucket.s3-website-us-east-1.amazonaws.com

Create, Find, Deploy an EC2 Instance:
1.After logging into the AWS Management Console, searched for Amazon EC2. Click “Launch Instance” to begin the process.
2.Choose an AMI, select AWS Marketplace and search for “Tomcat Certified by Bitnami” as per our assignment.
3.Next is to choose instance type, set it to default which is t2.micro and click next to configure instance details.
4.Configuring instance details is where you would set access, network settings, monitoring, and other options. We left all the default options and clicked next: add storage.
5.Adding storage, we can easily add more virtual hard driver change the drive size. We keep the default virtual hard drive.
6.Configuring security groups, accept the default security group, as it allows port 22(SSH) from anywhere to this instance.
7.Now after clicking review and launch, we can get an overview of all the settings of the instance we just created. Click launch to continue. 
8.We uploaded our public key or created our own key pair here in the AWS Management Console. Click the ack checkbox stating that you have access to the private key. 
9. Click view instances to look at the new instances. Once the instance state has changed to running, our instance will be ready to use. 
10.To view the instance in the Amazon EC2 dashboard, click the selection box next to our instance name and copy our public IPv4 address “3.21.240.195”

Deploying a WAR file on EC2 instance from windows:
1.We download the FTP Client for which we will use WinSCP. To set up a connection to our EC2 instance.
Copy the public DNS of our instance into hostname.
Select SCP as the file protocol.
Type in ‘bitnami’ as the username. 
Then select the advanced settings.
2.Choose SCP/Shell and Select “sudo su – “shell to get super user access on the AMI.
3.In authentication, browse to the path of the .pem file of our instance. Clicking ‘OK’ WinSCP will ask for permission to convert the .pem file to a .ppk file, select OK.
4.Save your settings and connect to our instance.  Copy our WAR file to the “/opt/bitnami/tomcat/webapps” folder to access our project through the browser.

Public DNS - https://ec2-3-21-240-195.us-east-2.compute.amazonaws.com/645_assignment_1/survey.html


 