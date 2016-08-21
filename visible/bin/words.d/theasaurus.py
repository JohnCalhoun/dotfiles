#! /bin/python

import sys
from bs4 import BeautifulSoup
from urllib2 import urlopen

base_url="http://www.thesaurus.com/browse/"
word=sys.argv[1]
website=base_url+word+"?s=t"

html=urlopen(website).read()
soup=BeautifulSoup(html,"lxml")
table=soup.find_all("span","text")

print table
