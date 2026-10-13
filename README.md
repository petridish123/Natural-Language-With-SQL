# Natural Language With SQL
This is a project to use chat gpt api and sql database and be able to query the database using the gpt prompt


# Setup

# Reading the code

# How it works

- At first, the sql is set up
- Data is input to the database
- NLP query
- Convert prompt into sql

# Examples
found in examples.txt
# Results

## What did work
Listed in examples.txt

## What didn't work
### Question 1
List the three horses that have raced the most with each other

Response:
According to the data, the three horses that have raced the most with each other would be those that appeared together in 8 races. Unfortunately, the specific horse names are not provided in the results. If you have access to the full dataset, you can identify these horses by counting the number of races they participated in together to find those that raced in 8 events.

### Question 2
What is the fastest horse?

Response did not contain sql

## Different techniques
Supplying the ai with examples.txt did not significantly improve the sampling since it was able to infer all the information it needed from the schema. Zero shot worked just as well as single-domain.