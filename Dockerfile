FROM stilliard/pure-ftpd

RUN apt-get install -y expect
RUN echo '#!/usr/bin/expect -f\n\
spawn pure-pw useradd vicftp -u ftpuser -d /vagrant\n\
expect "Password:"\n\
#log_user 0\n\
set mypass $expect_out(0,string)\n\
send -- "[exec echo password]\r"\n\
send -- "[exec echo password]\r"\n\
expect eof\n\
' > /tmp/ExpectScript.sh
RUN chmod u+x /tmp/ExpectScript.sh
RUN /tmp/ExpectScript.sh
RUN pure-pw mkdb


