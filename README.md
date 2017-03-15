# FizzBuzz-api

An API to retrieve [FizzBuzz](https://en.wikipedia.org/wiki/Fizz_buzz) numbers.

> Fizz buzz is a group word game for children to teach them about division.[1] Players take turns to count incrementally, replacing any number divisible by three with the word "fizz", and any number divisible by five with the word "buzz".

## A single endpoint

    /api/numbers

### Optional query parameters

  - `limit` (*integer*), the amount of items to retrieve (min: 1, max: 200, default: 100)
  - `offset` (*integer*), the amount of items to skip (min: 1, max: 100 billions, default: 1)

### Examples

#### Successful requests

  - http://fibuzzapi.herokuapp.com/api/numbers
  - http://fibuzzapi.herokuapp.com/api/numbers?limit=100&offset=500
  - http://fibuzzapi.herokuapp.com/api/numbers?offset=150&limit=3

        {
          "numbers": [
            {
              "id": 150,
              "value": "FizzBuzz"
            },
            {
              "id": 151,
              "value": 151
            },
            {
              "id": 152,
              "value": 152
            }
          ]
        }

#### Erroneous requests

  - http://fibuzzapi.herokuapp.com/api/numbers?limit=1000

        {
          "error": {
            "title": "Limit exceeded",
            "status": 400,
            "code": 1,
            "detail": "The limit of items per page can't be more than 200."
          }
        }

  - http://fibuzzapi.herokuapp.com/api/numbers?offset=200000000000

        {
          "error": {
            "title": "Offset exceeded",
            "status": 400,
            "code": 2,
            "detail": "The offset can't be more than 100 billion (100000000000)."
          }
        }

  - http://fibuzzapi.herokuapp.com/api/numbers?offset=99999999950&limit=100

        {
          "error": {
            "title": "Boundaries exceeded",
            "status": 400,
            "code": 3,
            "detail": "This offset with this limit would exceed 100 billion."
          }
        }
