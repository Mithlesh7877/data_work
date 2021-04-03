# email regex
# [a-zA-Z0-9_.+-]+@[a-zA-Z0-9-]+\.[a-zA-Z0-9-.]+

# url
# https?://(www\.)?(\w+)(\.\w+)
# replace - $2$3
import re

s = 'https://www.geeksforgeeks.org/'
pat=r'(www\.)?(\w+)(\.\w+)'
test=re.findall(pat,s)
print(test)



# url
# s1 = 'http://www.example.com/index.html' 
  
# # searching for all capture groups
# obj = re.findall('(\w+)://([\w\-\.]+)/(\w+).(\w+)',
#                  s1)
  
# print(obj)


# Task	Text	Capture Groups	 
# Capture	ftp://file_server.com:21/top_secret/life_changing_plans.pdf	ftp file_server.com 21	Success
# Capture	https://regexone.com/lesson/introduction#section	https regexone.com	Success
# Capture	file://localhost:4040/zip_file	file localhost 4040	Success
# Capture	https://s3cur3-server.com:9999/	https s3cur3-server.com 9999	Success
# Capture	market://search/angry%20birds	market search

# (\w+)://([\w+\.?\-?]+)(:(\d+))?    (\w+)://([\w\-\.]+)(:(\d+))? 