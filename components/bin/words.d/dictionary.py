#! /bin/python

import sys
from bs4 import BeautifulSoup
from urllib2 import urlopen

base_url="https://www.ahdictionary.com/word/search.html?q="
word=sys.argv[1]
website=base_url+word

html=urlopen(website).read()
soup=BeautifulSoup(html,"lxml")
table=soup.find("table")

print table
