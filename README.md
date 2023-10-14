# AI BOUNTY CHALLENGE: Content Creator Bot

Welcome to our AI BOUNTY CHALLENGE project - *छिमेकी: तपाईंको सामाजिक संवादक*! This project combines web scraping, machine translation, and image processing to dynamically generate images with Nepali text. The bot scrapes images from a specified website, generates and translates the content to Nepali using OpenAI API, and then combines the image and translated text to create visually appealing content.

<div align="center">
    <div style="display: inline-block; text-align: center;">
        <img src="https://github.com/zeus0911/AI_BOUNTY_TEAM_CHIMEKI/assets/112919863/c033dc53-32d5-46fc-8c8e-215019286c56" width="300" alt="Original Image">
        <br>
        <strong>Original Image</strong>
    </div>
    <div style="display: inline-block; text-align: center;">
        <img src="https://github.com/zeus0911/AI_BOUNTY_TEAM_CHIMEKI/assets/112919863/cb5fca6e-2b0e-4a47-9095-e2d41989a74d" width="300" alt="Content Captioned Image">
        <br>
        <strong>Content Captioned Image</strong>
    </div>

<div style="display: inline-block; text-align: center;">
        <img src="https://github.com/zeus0911/AI_BOUNTY_TEAM_CHIMEKI/assets/112919863/de478e0d-03bc-4e94-962d-67f9705d3fa7" width="300" alt="Content Captioned Image">
        <br>
        <strong>Content Captioned Image</strong>
    </div>
</div>
## Generated Contents Sample

- *बुद्ध जयन्ती:* बुद्ध जयन्तीको हार्दिक मंगलमय शुभकामना! 🙏🌸🕊️ चन्द्रमा र सूर्यले सम्मान गर्छन्, उत्सव र सुखको नेपाली भूमिमा बुद्धको आविर्भावलाई अनन्त श्रद्धांजली!🌟✨🌼 #बुद्धज

- *Birthday:* जन्मदिनको शुभकामना आयुष! यो वर्ष तपाईंको सपना पूरा हुने र आनन्दबट भरिएको हुने कामना गर्दछु। 🎉🎂🎁 #HappyBirthdayAayush #आयुषको_जन्मदिनजन्मदिनको शुभकामना, आयुष जी! आशा छ कि तपाईंको आजको दिन हर्षित र दिव्य महसुस गरिरहेको हुनेछ। धेरै धेरै शुभकामना! 💐🎉🎂 #HappyBirthdayAayush #जन्मदिनकोशुभकामना

- *महाशिवरात्रि:* महाशिवरात्रि हाम्रो आत्मिक आध्यात्मिकता र प्रेमको पर्व हो। पवित्र र ध्यानका यो दिनमा, शिवको आशीर्वाद प्राप्त गरौं। 🕉️💫 #महाशिवरात्रि #शिवरात्रि #नेपाल

## Features

- *Web Scraping:* The bot dynamically scrapes images from a specified website.
- *Machine Translation:* Utilizes OpenAI API to generate content and then translates scraped content to Nepali.
- *Image Processing:* Combines translated text with images to create image-based content.
- *Instagram Clone:* Includes a Flutter-based Instagram clone for deploying and sharing the created content.

## Prerequisites

Before running the bot, ensure you have the following installed/configured:

- Python 3.x
- Flutter 3.x
- OpenAI API Key
- Flutter SDK for mobile app deployment

## Setup Instructions

1. *Clone the Repository:*
   ```bash
   git clone https://github.com/your-username/ai-bounty-challenge.git


2. *Create a new virtual enviroment and install Dependencies*
    - Create a virtual enviroment(recommended)
        ```bash
        python -m venv venv
        source venv/bin/activate  # On Windows, use 'venv\Scripts\activate'
    - Install the required dependencies from requirements.txt:
        ```bash
        Install the required dependencies from requirements.txt:
    Note: You may need to install dependencies one by one due to version conflicts.


 3. *Set up Web_and_Hosting dir*
    - Create a JSON file named config.json in the "Web_and_Hosting" directory.
    - Add your OpenAPI key as a dictionary with the key named "api_key" in config.json.
    - In app.py, on line 58, specify the path to your root directory.
    - Delete all files within the "FinalImage," "OutputImage," and "POST" directories in "Web_and_Hosting/DB/".

4. *Set up your flutetr application*
    - Navigate to the root directory of your Flutter application:
       ```bash
       cd path/to/your/flutter/app
    - Fetch Flutter project dependencies:
        ```bash
        flutter pub get
    - Run your flutter application
      ```bash
       flutter run
    
5. *Run the project*
    - Return to the "Web_and_Hosting" directory:
       ```bash
       cd path/to/ai-bounty-challenge/Web_and_Hosting
    - Start the Python server for your project:
        ```bash
        python app.py
   

Now you should be able to see your changes reflected in your Flutter application.
