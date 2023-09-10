log=/tmp/expense.log
echo installing nginx
dnf install nginx -y  >>$log
echo placing expenselog file

cp expense.conf /etc/nginx/default.d/expense.conf >>$log

echo enable nginx
systemctl enable nginx >>$log
echo starting nginx
systemctl start nginx >>$log
echo deleting old content
rm -rf /usr/share/nginx/html/* >>$log


echo downloading frontend code
curl -s -o /tmp/frontend.zip https://expense-artifacts.s3.amazonaws.com/frontend.zip >>$log


cd /usr/share/nginx/html >>$log
echo extracting frontend code
unzip /tmp/frontend.zip >>$log




systemctl restart nginx >>$log
