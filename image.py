# from PIL import Image, ImageDraw, ImageFont

# # Open an image file
# image = Image.open("mahashivaratri.jpg")

# # Create a drawing object
# draw = ImageDraw.Draw(image)

# # Define the text and font
# text = "  May the festive of lights bestow upon us #GaiTihar #FestivalOfLights"
# font = ImageFont.truetype("arial.ttf", 15)  # Change the font and size as needed

# # Define the position where you want to add the text
# text_position = (10, 10)  # (x, y)

# # Define the text color
# text_color = (0, 0, 0)  # White color in RGB

# # Add the text to the image
# draw.text(text_position, text, fill=text_color, font=font)

# # Save or display the modified image
# image.save("output_image.jpg")  # Save the modified image to a file
# image.show()  # Display the modified image

from PIL import Image, ImageDraw, ImageFont
import textwrap

# Open an image file
image = Image.open("mahashivaratri.jpg")

# Create a drawing object
draw = ImageDraw.Draw(image)

# Define the text and font
text = "उज्यालोको जीवन्त चाड तिहार मनाइँदै ! यो शुभ अवसरले सबैमा सकारात्मक आनन्द ल्याओस् । सबैलाई एक चमकदार र अविस्मरणीय उत्सवको शुभकामना! "
font = ImageFont.truetype("nepali_font.otf", 15)  # Change the font and size as needed

# Define the position where you want to add the text
text_position = (10, 10)  # (x, y)

# Define the text color
text_color = (0, 0, 0)  # White color in RGB

# Define the maximum width for text
# image_width, _ = image.size

# max_width = image_width - text_position[0]  # Adjust to fit your image width

# Wrap the text to fit within the specified width
wrapped_text = textwrap.fill(text, width=20)  # Adjust width as needed

# Add the wrapped text to the image
draw.text(text_position, wrapped_text, fill=text_color, font=font)

# Save or display the modified image
image.save("output_image.jpg")  # Save the modified image to a file
image.show()  # Display the modified image
