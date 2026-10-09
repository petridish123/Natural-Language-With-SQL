import sqlite3
import re

from dotenv import load_dotenv
from openai import OpenAI
from pathlib import Path
from setup_sql import setup_database


load_dotenv()

client = OpenAI()
client.models.list()
chosen_model = "gpt-4o"

setup_database()

"""
idea for the rest of the code:
    -x create a function that takes user prompt and returns the SQL query
    -x create a function that takes the SQL query and executes it on the database
    - function that cleans the gpt response to extract the SQL query
    - function that formats the SQL query results into a readable format
    -x function that creates a connection to the database and returns the connection object
"""

def generate_sql_query(prompt: str) -> str:
    response = client.chat.completions.create(
        model=chosen_model,
        messages=[
            {"role": "system", "content": "You are a helpful assistant that translates natural language into SQL queries. Do not answer any questions not related to the schema. Use the following database schema to generate SQL queries:\n\n" + Path("schema.sql").read_text()},
            {"role": "user", "content": prompt}
        ]
    )
    sql_query = response.choices[0].message.content.strip()
    return sql_query

def clean_sql_query(query:str) -> str:
    start_query = "```sql"
    end_query = "```"
    result = re.search(f"{start_query}(.*?){end_query}", query, re.DOTALL)
    if result:
        return result.group(1).strip()
    else:
        return query.strip()


def execute_sql_query(sql_query: str) -> list:
    conn = create_db_connection()
    cursor = conn.cursor()
    cursor.execute(sql_query)
    results = cursor.fetchall()
    conn.close()
    return results

def create_db_connection() -> sqlite3.Connection:
    database_name = "horses.db"
    connection = sqlite3.connect(database_name)
    connection.execute("PRAGMA foreign_keys = ON")
    return connection

def format_results(results: list, user_prompt:str) -> str:
    # send back to chat
    if not results:
        return "No results found."
    formatted_results = "\n".join([str(row) for row in results])

    response = client.chat.completions.create(
        model = chosen_model,
        messages=[
            {"role":"system", "content":"Answer the user prompt using the sql results:\n\n" + formatted_results},
            {"role":"user", "content":user_prompt}
        ]
    )
    return response.choices[0].message.content.strip()

    # return response

def main():
    user_prompt = input("Enter your query in natural language: ")
    sql_query = generate_sql_query(user_prompt)
    sql_query = clean_sql_query(sql_query)
    # print(f"Generated SQL Query: {sql_query}")
    results = execute_sql_query(sql_query)
    formatted_results = format_results(results, user_prompt)
    print(f"Query Results:\n{formatted_results}")

if __name__ == "__main__":
    main()