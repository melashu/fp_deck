# FP Deck
<a name="readme-top"></a>


# 📗 Table of Contents

- [FP Deck](#fp-deck)
- [📗 Table of Contents](#-table-of-contents)
- [📖 FP Deck ](#fp-deck)
  - [Demo Video](#demo-video)
  - [Tech Stack ](#tech-stack)
  - [💻 Getting Started ](#getting-started)
    - [Prerequisites](#prerequisites)
    - [Setup](#setup)
    - [Usage](#usage)
    - [Run tests](#run-tests)
- [Feature Improvement](#feature-improvement)

# 📖 FP Deck <a name="fp-deck"></a>

I built FP Deck based on the Figma design, but I have added some features like dark theme support, user authentication, and responsiveness. 

## Demo Video <a name="demo-video"></a>

- [Video](https://www.awesomescreenshot.com/video/25970515?key=267e0407ca8dca2decf16178b55eb68b)

## Tech Stack <a name="tech-stack"></a>
My development of FP Deck involved these technologies.
 - Ruby on Rails (as the backend framework)
 - PostgreSQL (for the database)
 - CSS and Tailwind CSS (for styling the webpage)
 - Stimulus (to write custom frontend logic)
 - Turbo (to display changes without page refresh)
 - ViewComponent (to create reusable view components)
 - RSpec and Capybara (for testing)

## Geting started <a name="getting-started"></a>
### Prerequisites <a name="prerequisites"></a>
To run this project you need to have 
- Ruby version 3.2.2
- Rails 7
- Installed postgres

### Setup <a name="setup"></a>

**Open your terminal and clone this repository to your desired folder**

``` 
git clone https://github.com/melashu/fp_deck.git
```

Then 

`cd fp_deck` and run `bundle install`

Next change your database configration setting, to do so put your username and password

### Usage <a name="usage"> </a>

After running `bundle install` and changing your database configuration run the following command

```
rails db:create db:migrate db:seed
```

After runing the above command successfully, run the server using

`bin/dev` or `rails s`

when the server is running successfully, open the page and login to the system

use the following email and password to login to the system 

```
 Email: erkan@fundingpips.com
 Password: 12345678
```
or 

```
 Email: mathijs@fundingpips.com
 Password: 12345678

```

You can also sign up using the signup form.

### Run test  <a name="run-tests"> </a>

In this project I have only write feature spec, so to run the test use the following command

```
rspec spec/features
```
### Feature Improvement <a name="features-improvement"></a>

In the feature I would like to add the following features

- Just like status(we can dynamically add status), I would like to make user type and phase dynamic 
- Implementing global search 
- Improving design for pagination 
- Implementing exporting data (to csv, xml or json)














