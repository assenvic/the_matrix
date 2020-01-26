# Overview
API online application example, using Grape, Swagger, GrapeEntity  
Follwing best practices for api versioning, rails, rspec

## Workflow
i splited the implementation into 3 main stages, so it's easier to review every PR as a single standalone testable code, trying to simulate my normal day to day workflow

1. [Project Scaffolding infra and dockorizing](https://github.com/assenvic/the_matrix/commit/780e5631d2815580a3d108cf94a2ebf23221f61e)
2. [Add Route Model with concerns and Unit tests](https://github.com/assenvic/the_matrix/pull/9)
3. [Add GET/POST endpoint for routing with testcases](https://github.com/assenvic/the_matrix/pull/10)

# Test Case Coverage
![Test Case Coverage](https://i.ibb.co/dbdF7Dj/Screenshot-2020-01-26-at-12-24-50.png "Test Coverage")

# API Documentation
![API Documentation](https://i.ibb.co/DDdcJ7z/Screenshot-2020-01-26-at-12-25-39.png "API Documentation")

## Setup
the `the_matrix` project is dockorized so you can just run

    - customize `.env` or leave it as default
    $ docker-compose up --build


### Database Configuration
```
    $ docker-compose exec the_matrix rails db:setup
    $ docker-compose exec the_matrix rails db:migrate
```

### Start Rails Server
```
 $ docker-compose up --build   
```

### Random Data
i added factories route model so you can easily generate fake data
Example:

```
    $ docker-compose exec the_matrix rails console
    > FactoryBot.create(:route)
```

### Documentation 
* This project Documented using Swagger-UI you can check the full Documentation at the following Link after running up the server
* [the_matrix Documentation](http://localhost:3000/api/the_matrix/docs)
