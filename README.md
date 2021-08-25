# Minesweeper

Minesweeper provide information  board game via a REST API.

## Links

* [API](https://api-test-minesweeper.herokuapp.com)

## Requirements

- Ruby 2.7+.
- PostgreSQL 1.2+.

## Installation

```sh
bundle install
```

## Development

Migration:

```sh
rails db:migration
```

Start the web server:

```sh
rails server
```

Show routes:

```sh
bundle exec rails routes
```


Run all tests:

```sh
bundle exec rspec
```

# Documentation

## Get game
GET /games/:id

Example:

GET /games/1

```sh
{
    "id": 2,
    "num_row": 3,
    "num_column": 3,
    "num_mine": 3,
    "is_active": true,
    "positions": [
        {
            "id": 26,
            "x": 0,
            "y": 0,
            "has_mine": false,
            "state": "covered",
            "value": 1
        },
        {
            "id": 27,
            "x": 0,
            "y": 1,
            "has_mine": true,
            "state": "covered",
            "value": 0
        },
        {
            "id": 28,
            "x": 0,
            "y": 2,
            "has_mine": true,
            "state": "covered",
            "value": 1
        },
        {
            "id": 29,
            "x": 1,
            "y": 0,
            "has_mine": false,
            "state": "covered",
            "value": 3
        },
        {
            "id": 30,
            "x": 1,
            "y": 1,
            "has_mine": false,
            "state": "covered",
            "value": 4
        },
        {
            "id": 31,
            "x": 1,
            "y": 2,
            "has_mine": false,
            "state": "covered",
            "value": 2
        },
        {
            "id": 32,
            "x": 2,
            "y": 0,
            "has_mine": false,
            "state": "covered",
            "value": 1
        },
        {
            "id": 33,
            "x": 2,
            "y": 1,
            "has_mine": true,
            "state": "covered",
            "value": 0
        },
        {
            "id": 34,
            "x": 2,
            "y": 2,
            "has_mine": false,
            "state": "covered",
            "value": 1
        }
    ]
}
```

## POST game
POST /games

Request optional
default 9
```sh
{
    "num_row": 3,
    "num_column": 3,
    "num_mine" : 3
}
```
Result

```sh
{
    "id": 2,
    "num_row": 3,
    "num_column": 3,
    "num_mine": 3,
    "is_active": true,
    "positions": [
        {
            "id": 26,
            "x": 0,
            "y": 0,
            "has_mine": false,
            "state": "covered",
            "value": 1
        },
        {
            "id": 27,
            "x": 0,
            "y": 1,
            "has_mine": true,
            "state": "covered",
            "value": 0
        },
        {
            "id": 28,
            "x": 0,
            "y": 2,
            "has_mine": true,
            "state": "covered",
            "value": 1
        },
        {
            "id": 29,
            "x": 1,
            "y": 0,
            "has_mine": false,
            "state": "covered",
            "value": 3
        },
        {
            "id": 30,
            "x": 1,
            "y": 1,
            "has_mine": false,
            "state": "covered",
            "value": 4
        },
        {
            "id": 31,
            "x": 1,
            "y": 2,
            "has_mine": false,
            "state": "covered",
            "value": 2
        },
        {
            "id": 32,
            "x": 2,
            "y": 0,
            "has_mine": false,
            "state": "covered",
            "value": 1
        },
        {
            "id": 33,
            "x": 2,
            "y": 1,
            "has_mine": true,
            "state": "covered",
            "value": 0
        },
        {
            "id": 34,
            "x": 2,
            "y": 2,
            "has_mine": false,
            "state": "covered",
            "value": 1
        }
    ]
}
```

# PUT Position
PUT /games/{:id}/positions/{:id}

Request

state 
* "uncovered"
* "flagged"

```sh
{
    "state" : "uncovered"
}
```
Example:
GET /games/2/positions/26
```sh
{
    "state" : "flagged"
}
```
Result
```sh
{
    "id": 2,
    "num_row": 3,
    "num_column": 3,
    "num_mine": 3,
    "is_active": true,
    "positions": [
        {
            "id": 26,
            "x": 0,
            "y": 0,
            "has_mine": false,
            "state": "flagged",
            "value": 1
        },
        {
            "id": 27,
            "x": 0,
            "y": 1,
            "has_mine": true,
            "state": "covered",
            "value": 0
        },
        {
            "id": 28,
            "x": 0,
            "y": 2,
            "has_mine": true,
            "state": "covered",
            "value": 1
        },
        {
            "id": 29,
            "x": 1,
            "y": 0,
            "has_mine": false,
            "state": "covered",
            "value": 3
        },
        {
            "id": 30,
            "x": 1,
            "y": 1,
            "has_mine": false,
            "state": "covered",
            "value": 4
        },
        {
            "id": 31,
            "x": 1,
            "y": 2,
            "has_mine": false,
            "state": "covered",
            "value": 2
        },
        {
            "id": 32,
            "x": 2,
            "y": 0,
            "has_mine": false,
            "state": "covered",
            "value": 1
        },
        {
            "id": 33,
            "x": 2,
            "y": 1,
            "has_mine": true,
            "state": "covered",
            "value": 0
        },
        {
            "id": 34,
            "x": 2,
            "y": 2,
            "has_mine": false,
            "state": "covered",
            "value": 1
        }
    ]
}
```
