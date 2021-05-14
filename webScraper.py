# webScraper.py
# 14/05/2021

# Description:
# The function webScraper download all .pdf files of a web into a folder.    

# Dependencies:
# requests BeautifulSoup 

import os
import requests
from urllib.parse import urljoin
from bs4 import BeautifulSoup

url = "https://www.webWithPdfs.com/online/2021.html"
folderLocation = r'E:\webScrapingFolder'

def webScraper(url, folderLocation) :
	if not os.path.exists(folderLocation):os.mkdir(folderLocation)

	response = requests.get(url)
	soup= BeautifulSoup(response.text, "html.parser")     
	for link in soup.select("a[href$='.pdf']"):
		#Name the pdf files using the last portion of each link which are unique in this case
		fileName = os.path.join(folderLocation, link['href'].split('/')[-1])
		with open(fileName, 'wb') as f:
			f.write(requests.get(urljoin(url, link['href'])).content)
			
webScraper(url, folderLocation)