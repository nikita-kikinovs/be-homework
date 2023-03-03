## What the application does
- Fetches hotel data in cities using openstreetmap.org data
- Stores hotel data locally
- Allows to search through simple hotel data locally

## Hints
- Base code is not good, provided tests aren't good either
- We encourage to modify existing tests and write a new ones

## Improvements needed
- Improve search speed, warmup doesn't need to happen on every search (see failing test, discuss with engineers)
- New feature: Allow to search through hotels in a specific city (see failing test)
- New feature: Allow to add "Coat of arms"(Ģērbonis) image url to City and expose it in search results
- Please refactor code to your liking (e.g. too much logic in the controller)

# What is done (develop branch)
#### 1. Implemented City model for better OOP approach
#### 2. Added City creation seeds
#### 3. Moved Hotel fetching from a controller to a rake task
#### 4. Added model relations and validations
#### 5. Added scope to Hotel model for searching by hotel name
#### 6. Created methods that return specific City or Hotel data and a method that returns data of a Hotel collection
#### 7. Refactored existing tests and added new ones


## What's inside container

### App was created using
```
rails new . --api
```

### To start application locally, run this inside container
```
bundle && bundle exec rails s -b 0.0.0.0
```

### Run tests
```
bundle && bundle exec rspec
```
