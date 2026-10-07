from dotenv import load_dotenv
from openai import OpenAI

load_dotenv()

client = OpenAI()
client.models.list()
chosen_model = "gpt-4o"

