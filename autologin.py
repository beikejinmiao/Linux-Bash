#!/usr/bin/env python
#coding:utf-8

import urllib
import urllib2
import cookielib
import time

url = 'http://202.204.48.66/'
url_logout = 'http://202.204.48.66/F.htm'

stuid = 's12345678'
stupass = '123456'

h_accept = 'text/html,application/xhtml+xml,application/xml;q=0.9,image/webp,*/*;q=0.8'
h_accept_encoding = 'gzip, deflate'
h_accept_language = 'zh-CN,zh;q=0.8,en;q=0.6,ja;q=0.4'
h_cache_control = 'max-age=0'
h_connection = 'keep-alive'
h_content_type = 'application/x-www-form-urlencoded'
h_cookie = 'myusername='+ stuid +'; pwd='+ stupass +'; username='+ stuid +'; smartdot='+ stupass
h_host = '202.204.48.66'
h_origin = 'http://202.204.48.66'
h_referer = 'http://202.204.48.66/'
h_user_agent = '''Mozilla/5.0 (Linux; U; Android 4.0; en-us; GT-I9300 Build/IMM76D) 
                AppleWebKit/534.30 (KHTML, like Gecko) Version/4.0 Mobile Safari/534.30'''

headers_cookie = [
        ('Accept', h_accept),
        ('Accept-Encoding', h_accept_encoding),
        ('Accept-Language', h_accept_language),
        ('Cache-Control', h_cache_control),
        ('Connection', h_connection),
        ('Content-Type', h_content_type),
        ('Cookie', h_cookie),
        ('Host', h_host),
        ('Origin', h_origin),
        ('Referer', h_referer),
        ('User-Agent', h_user_agent)
    ]


headers = [
        ('Accept', h_accept),
        ('Accept-Encoding', h_accept_encoding),
        ('Accept-Language', h_accept_language),
        ('Cache-Control', h_cache_control),
        ('Connection', h_connection),
        ('Content-Type', h_content_type),
        ('Host', h_host),
        ('Origin', h_origin),
        ('Referer', h_referer),
        ('User-Agent', h_user_agent)
    ]



def prereq():
    urllib2.urlopen(url);
    #req = urllib2.Request(url, headers=headers)
    #try:
    #    urllib2.urlopen(req)
    #except Exception, e:
    #    print 'prereq():', e
    #else:
    #    pass
    #finally:
    #    pass
    

def login():
    data = {'DDDDD':stuid, 'upass':stupass, '0MKKey':'123456789', 'v6ip':''}
    post_data = urllib.urlencode(data)

    try:
        opener = urllib2.build_opener()
        opener.addheaders = headers_cookie
        urllib2.install_opener(opener)
        req = urllib2.Request(url, post_data)
        resp = urllib2.urlopen(req)
        print resp.read(100)
    
    except httplib.BadStatusLine, emsg:
        print 'login()-', 'httplib.BadStatusLine Except:'
        print emsg
        pass
    except:
        print 'other excepts'

def logout():
   urllib2.urlopen(url_logout) 

def main():
   prereq()
   time.sleep(2)
   login()
   #time.sleep(3)
   #logout()

if __name__ == '__main__':
    main()







