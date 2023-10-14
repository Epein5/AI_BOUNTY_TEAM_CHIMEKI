from tkinter import Image
import openai
from googletrans import Translator
import requests
from bs4 import BeautifulSoup
import random
from PIL import Image, ImageDraw, ImageFont
import textwrap
import numpy as np
import json
import os

def read_api_key(filename):
    with open(filename, 'r') as config_file:
        config = json.load(config_file)
        return config["api_key"]

openai.api_key = read_api_key("config.json") # Replace this with path where your config.json file is located

def prompttext(prompt_texxt):
    prompt_text = f'Give me one paragraph of 30 words exactly of {prompt_texxt}  to post on social media .Only the content that i can copy and paste (should contain #s  at the end with some emojis). The words should be In  Nepali Script'
    return prompt_text

def get_image_form_DallE(prompt):
    print("API was called waiting for response from dall-e..................")
    response = openai.Image.create(
        prompt=prompt,
        n=1,
        size="256x256"
    )
    image_url = response['data'][0]['url']
    return image_url

def get_text_from_ChatGPT(prompt):
    print("GENERATING TEXT PLEASE WAIT FEW SECONDS THIS MAY TAKE SOME TIME.................")
    response = openai.ChatCompletion.create(
        model="gpt-3.5-turbo",
        messages=[
            {"role": "system", "content": "You are a helpful assistant."},
            {"role": "user", "content": prompt},
        ],
        max_tokens= 35 *5,
    )
    print("TEXT SUCCESSFULLY GENERATED")
    text = response.choices[0].message["content"]
    print(text)
    return text


def translate_english_to_neplaiese(got_message):
    print("TRANSLATING TEXT TO NEPALI...............")
    # got_message = "Celebrating the vibrant festival of lights,Tihar! May this auspicious occasion bring positivity joy to all. Wishing everyone a sparkling and memorable celebration! ✨🪔 #GaiTihar #FestivalOfLights"
    to_translate_message = got_message.split("#")[0]
    not_to_translate_message = got_message.split("#")[1:]
    translator = Translator()
    out = translator.translate(to_translate_message, dest='ne').text
    final_message = out
    for i in not_to_translate_message:
        final_message = final_message + "#" + i
    print(final_message)
    return final_message

def scrape_image_data(promptword):
    url = f'https://www.123rf.com/stock-photo/{promptword}.html'
    #https://www.123rf.com/stock-photo/dashain.html
    # print(url)
    html = requests.get (url)
    soup = BeautifulSoup(html.content, 'html.parser')
    random_number = random.randint(1, 3)
    a_name =soup.find_all(class_="ImageThumbnail__image ImageThumbnail__image--beta")[1]
    a_name = str(a_name)
    a = a_name.split('src=')[1]
    # print(a)
    img_src = a.split('''"''')[1]
    # print(img_src)

    response = requests.get(img_src)
    if response.status_code == 200:
        with open(f'DB/OutputImage/{promptword}.jpg', 'wb') as f:
            savedurl = f'DB/OutputImage/{promptword}.jpg'
            f.write(response.content)
            print(f"Image saved as {promptword}.jpg")
    

    else:
        print("Failed to download the image.")
    # print(savedurl)
    return savedurl

def determine_text_color(bg_color):
    brightness = np.mean(bg_color)
    
    if brightness > 128:
        return (0, 0, 0)  # Black
    else:
        return (255, 255, 255)  # White

def add_text_to_image(img_url, text, promptword):
    image = Image.open(img_url)
    image_width, image_height = image.size
    draw = ImageDraw.Draw(image)
    font = ImageFont.truetype("nepali_font.otf", 15) 
    text_position = (10, 10) 
    bg_color = image.getpixel(text_position)
    text_color = determine_text_color(bg_color)
    max_width = image_width
    wrapped_text = textwrap.fill(text, width=max_width/10)
    draw.text(text_position, wrapped_text, fill=text_color, font=font)
    image.save(f'DB/FinalImage/{promptword}.jpg')
    print(f"Final image saved at: DB/FinalImage/{promptword}.jpg")
    return f'DB/FinalImage/{promptword}.jpg'


def generatepost(prompttextt):
    scraped_image_path = scrape_image_data(prompttextt)
    text = get_text_from_ChatGPT(prompttext(prompttextt))
    text_without_hastag = text.split("#")[0]
    # nepali_text_without_hastag = translate_english_to_neplaiese(text_without_hastag)
    # print("....")
    # nepali_text = translate_english_to_neplaiese(text)
    final_image_path = add_text_to_image(scraped_image_path, text_without_hastag,prompttextt)

    return final_image_path,text,prompttextt

def saveGeneratedPostToLocalDatabse(text):
    a = generatepost(text)
    image_path = a[0]
    prompttext = a[1]
    image_name = a[2]
    image = Image.open(image_path)
    # txt = text
    os.makedirs(f'DB/POST/{image_name}',exist_ok=True)
    # os.mkdir('DB/POST/Tihar/Tihar.txt',exist_ok=True)
    image = Image.open(image_path)
    image.save(f"DB/POST/{image_name}/{image_name}.jpg")
    with open(f'DB/POST/{image_name}/{image_name}.txt', 'a',encoding="utf-8") as source_file:
        source_file.write(prompttext)
        
        

if __name__ == '__main__':
    # generatepost("MahaShivaratri")
    saveGeneratedPostToLocalDatabse("BuddhaJayanti")