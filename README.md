<a name="readme-top"></a>

<div align="center">
  <h1><b>YouPayment | Budget App</b></h1>
  <img src="app/assets/images/app-logo.png" width="200px" height="200px">
</div>

<!-- TABLE OF CONTENTS -->

# 📗 Table of Contents

- [📗 Table of Contents](#-table-of-contents)
- [YouPayment App ](#youpayment-app-)
  - [🛠 Built With ](#-built-with-)
    - [Tech Stack ](#tech-stack-)
    - [Key Features ](#key-features-)
  - [💻 Getting Started ](#-getting-started-)
    - [Prerequisites](#prerequisites)
    - [Setup](#setup)
    - [Install](#install)
    - [Usage](#usage)
    - [Run linters](#run-linters)
    - [Run tests](#run-tests)
  - [👥 Authors ](#-authors-)
  - [🔭 Future Features ](#-future-features-)
  - [🤝 Contributing ](#-contributing-)
  - [⭐️ Show your support ](#️-show-your-support-)
  - [🙏 Acknowledgments ](#-acknowledgments-)
  - [📝 License ](#-license-)

---

<!-- PROJECT DESCRIPTION -->

# YouPayment App <a name="about-project"></a>

**"YouPayment App"** YouPayment is a mobile budget app built with Rails 7 and PostgreSQL. It allows the user to record all their expense transactions and classify them by categories. This helps the user to keep effective, private and secure control of all the information on their expenses, and thus be able to make better decisions about money management.

**YouPayment** is easy to use and navigate. Users can create categories (with a name and icon) and payment transactions in minutes by selecting at least one category and entering a description and amount. The app then automatically categorizes expenses and tracks spending over time.

**YouPayment** is the perfect budget app for anyone who wants to take control of their finances. It is easy to use and offers a variety of features to help users manage their budget successfully.

---

## 🛠 Built With <a name="built-with"></a>

### Tech Stack <a name="tech-stack"></a>

<details>
  <summary>Backend</summary>
  <ul>
    <li><a href="https://guides.rubyonrails.org/">Ruby on Rails (v7.0.8)</a></li>
    <li><a href="https://www.postgresql.org/docs/">PostgreSQL</a></li>
  </ul>
</details>

<details>
  <summary>Frontend</summary>
  <ul>
    <li><a href="https://www.w3schools.com/html/">HTML5</a></li>
    <li><a href="https://www.w3schools.com/css/">CSS</a></li>
    <li><a href="https://www.rubyguides.com/2018/11/ruby-erb-haml-slim/">ERB template</a></li>
  </ul>
</details>

<!-- Features -->

### Key Features <a name="key-features"></a>

<ul>
  <li>Ruby on Rails framework</li>
  <li>
    Use Linters to check code quality
    <ul>
      <li>Rubocop</li>
      <li>Stylelint</li>
    </ul>
  </li>
  <li>MVC architectural/design pattern</li>
  <li>Data persistent in PostgreSQL</li>
  <li>Test the application with rspec and capybara gems</li>
  <li>Authentication system build with devise gem</li>
  <li>Follow Microverse's list of best practices</li>
</ul>

<p align="right">(<a href="#readme-top">back to top</a>)</p>

---

<!-- GETTING STARTED -->

## 💻 Getting Started <a name="getting-started"></a>

To get a local copy up and running, follow these steps.

### Prerequisites

In order to run this project you need:

<ul>
    <li><p>A code editor (we recommend Visual Studio Code)</p></li>
</ul>

<ul>
    <li><p>Git and a GitHub account</p></li>
</ul>

### Setup

Clone this repository to your desired folder by using this 👇️ command :

```
git clone https://github.com/NitBravoA92/budget-app.git
```

### Install

Go to the project directory:

```
 cd budget-app
```

Before to run the program, verify that you have Ruby on Rails installed on your OS running the following command:

```
 rails --version
```

It should show you the version of ruby on rails ​​installed. If this does not happen and only an error message is displayed, then you should either verify your installation or install Ruby on Rails from scratch.

[Download and Install Ruby on Rails](https://guides.rubyonrails.org/getting_started.html)

Once you have verified that you have Ruby on Rails installed, run the following command to install the necessary gems:

```
 bundle install
```

After installing the gems, run the following command to create the database:

```
 rails db:create
```

Then run the following command to migrate the database:

```
 rails db:migrate
```

### Usage

Run the following command inside the project folder to start the application:

```
 rails s
```

This will start the application on your local server. You can now open your browser and go to http://localhost:3000/ to see the application running.

### Run linters

To verify that the ruby and CSS code is written without errors and meets good practice standards, run the following command inside the project folder:

- **ruby linter:**
```
 rubocop
```

- **CSS linter:**
```
 stylelint "**/*.{css,scss}"
```

### Run tests

To execute the tests, run the following command inside the project folder:

```
 rspec
```

<p align="right">(<a href="#readme-top">back to top</a>)</p>

---

<!-- AUTHORS -->

## 👥 Authors <a name="authors"></a>

👤 **Nitcelis Bravo**

- GitHub: [Nitcelis Bravo](https://github.com/NitBravoA92)
- Twitter: [@softwareDevOne](https://twitter.com/softwareDevOne)
- LinkedIn: [Nitcelis Bravo Alcala](https://www.linkedin.com/in/nitcelis-bravo-alcala-b65340158)

<p align="right">(<a href="#readme-top">back to top</a>)</p>

---

<!-- FUTURE FEATURES -->

## 🔭 Future Features <a name="future-features"></a>

Upcoming improvements:

- [ ] Add Forms to create a new category and payment
- [ ] Add the functionality to list categories and payments
- [ ] Add the integration tests using capybara gem
- [ ] Create the CSS styles for the app

<p align="right">(<a href="#readme-top">back to top</a>)</p>

---

<!-- CONTRIBUTING -->

## 🤝 Contributing <a name="contributing"></a>

Contributions, issues, and feature requests are welcome!

Feel free to check the [issues page](https://github.com/NitBravoA92/budget-app/issues).

<p align="right">(<a href="#readme-top">back to top</a>)</p>

---

<!-- SUPPORT -->

## ⭐️ Show your support <a name="support"></a>

If you like this project and know someone who might find it helpful, please share it.
Or give it a **star** ⭐️ if you like this project!

<p align="right">(<a href="#readme-top">back to top</a>)</p>

---

<!-- ACKNOWLEDGEMENTS -->

## 🙏 Acknowledgments <a name="acknowledgements"></a>

I thank Microverse for this fantastic opportunity, and the code reviewers for their advice and time.

<p align="right">(<a href="#readme-top">back to top</a>)</p>

---

<!-- LICENSE -->

## 📝 License <a name="license"></a>

This project is [MIT](./LICENSE) licensed.

<p align="right">(<a href="#readme-top">back to top</a>)</p>

---
