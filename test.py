import openai
from googletrans import Translator


openai.api_key = 'afssfiqwfwefebgsg39wehger9grghw0wefwe-sgdffbgdfbd ' # enter your own API key here from openai

def prompttext(prompt_texxt):
    prompt_text = f'Just Give me one paragraph of 25 words of {prompt_texxt}  to post on social media . (should contain #s ONLY at the end with some emojis.).Just the content that i can copy and paste'
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
        max_tokens= 27 *5,
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

def scrape_image_data():
    pass

if __name__ == '__main__':
    translate_english_to_neplaiese(get_text_from_ChatGPT(prompttext("Dashain")))