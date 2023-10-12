from PIL import Image, ImageDraw, ImageFont
import textwrap

image = Image.open("mahashivaratri.jpg")

image_width, _ = image.size

draw = ImageDraw.Draw(image)

text = "उज्यालोको जीवन्त चाड तिहार मनाइँदै ! यो शुभ अवसरले सबैमा सकारात्मक आनन्द ल्याओस् । सबैलाई एक चमकदार र अविस्मरणीय उत्सवको शुभकामना! "
font = ImageFont.truetype("nepali_font.otf", 15)  

text_position = (10, 10) 

text_color = (0, 0, 0) 

max_width = image_width

wrapped_text = textwrap.fill(text, width=max_width/10) 

draw.text(text_position, wrapped_text, fill=text_color, font=font,)

image.save("output_image.jpg")


def add_text_to_image(img_url, text):
    image = Image.open(img_url)

    image_width, _ = image.size

    draw = ImageDraw.Draw(image)

    font = ImageFont.truetype("nepali_font.otf", 15) 
    
    text_position = (10, 10) 

    text_color = (0, 0, 0) 

    max_width = image_width

    wrapped_text = textwrap.fill(text, width=max_width/10)

    draw.text(text_position, wrapped_text, fill=text_color, font=font,)

    image.save("output_image.jpg")  