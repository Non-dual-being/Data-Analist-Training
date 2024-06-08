from bs4 import BeautifulSoup
import requests

url = "https://www.scrapethissite.com/pages/forms/"

page = requests.get(url)

pagehtml = BeautifulSoup(page.text, 'html')
