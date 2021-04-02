import re

print('a\tb')
p=r'\d+'
text='35 my lucky number is 35'
match=re.match(p,text)
print(match.group(0),match.start())
# match used to find only start of the string
# --------------------------------------------------------------------
p=r'\d+'
text=' my lucky number is 35 and 35'
match=re.search(p,text)
print(match.group(0),match.start())
# search used to find only one string
# --------------------------------------------------------------------
p=r'\d+'
text=' my lucky number is 35 and 35'
match=re.findall(p,text)
print(match)
# findall used to find all string
# --------------------------------------------------------------------
p=r'\d+'
text='my lucky number is 35 and 35'
match=re.finditer(p,text)
for i in match:
    print(i.group(0))
# findinter used to find all string only if we instruct
# --------------------------------------------------------------------
# Groups
p='(\d{4})(\d{2})(\d{2})'
text='year is 20210331'
ma=re.search(p,text)
print(ma.group(0))
print(ma.groups())
# --------------------------------------------------------------------
p='(?P<year>\d{4})(?P<month>\d{2})(?P<date>\d{2})'
text='year is 20210331'
ma=re.search(p,text)
print(ma.group(0))
print(ma.groupdict())
# --------------------------------------------------------------------
# pattern to find if string contain number only
def is_integer(text):
    pat=r'^\d+$'
    mat=re.match(pat,text)
    if mat:
        return True 
    else:
        return False
print(is_integer("1234"))
# --------------------------------------------------------------------
# using search
def is_integer(text):
    pat=r'^\d+$'
    mat=re.search(pat,text)
    if mat:
        return True 
    else:
        return False
print(is_integer("1234"))

# --------------------------------------------------------------------
# find pattern and replace 
p='(?P<year>\d{4})(?P<month>\d{2})(?P<date>\d{2})'
text='start is 20210331 end in 20210401'
replacep=r'\g<month>-\g<date>-\g<year>'
print(text)
new_t=re.sub(p,replacep,text)
print(new_t)
# --------------------------------------------------------------------
# Split
p=r','
text='1,2,3,4,5'
print(re.split(p,text))
# --------------------------------------------------------------------
# Single char pattern 

print(re.findall('(?i)A','this is a great test'))
# case insensitive

# for negation use [^]
print(re.findall('[^aeiou]','this is a great test'))
print(re.findall('a|e|i|o|u','this is a great test'))
print(re.findall('[s-v]','this is a great test'))
# --------------------------------------------------------------------

# anchor

print(re.findall(r'\bis\b',' this is a sample'))
# completed word above
# startof line 
print(re.findall(r'(?m)^apple','''apple is a sample
apple another '''))   multiline 

# --------------------------------------------------------------------

# char classes 


# \w \d \D


# Quantifier
# + {2}
# [a-z][0-9] - to match one char followed bynum
# [a-z][0-9]* - to match more number
# for 1 or mere
# +
