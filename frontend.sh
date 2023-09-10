echo installing nginx
dnf install nginx -y  >/tmp/expense.log
echo placing expenselog file

cp expense.conf /etc/nginx/default.d/expense.conf >/tmp/expense.log

echo enable nginx
systemctl enable nginx >/tmp/expense.log
echo starting nginx
systemctl start nginx >/tmp/expense.log
echo deleting old content
rm -rf /usr/share/nginx/html/* >/tmp/expense.log


echo downloading frontend code
curl -s -o /tmp/frontend.zip https://expense-artifacts.s3.amazonaws.com/frontend.zip >/tmp/expense.log


cd /usr/share/nginx/html >/tmp/expense.log
echo extracting frontend code
unzip /tmp/frontend.zip >/tmp/expense.log




systemctl restart nginx >/tmp/expense.log
