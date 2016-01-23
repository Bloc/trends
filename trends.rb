# Index of all repos
For each page of repos in GitHubs index
  Fetch the next page of repos
  Update or create a repo listing in our Index

# Update repo data
# Name
# HTML URL
# API URL
# created_at
# languages
# Organization
# Owner
For each repo in our Index
  Update the repo data


# UI
#   - Public Repos by Year Created
#   - Programming Language Popularity by Year
#   - Organizations With Most OS Repos
#   - Most Popular Repositories


1. New Rails Project
2. Background job to pull in GitHub data
3. UI/Charts to visualize the data

Schema

Repositories
  - Name
  - HTML URL
  - API URL
  - Created
  - Languages (has_many)
  - Organization (string)
  - Owner
