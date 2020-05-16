
# Kursa4

Kursa4 API

## Indices

* [Authorized only](#authorized-only)

  * [Add an artist to the subscriptions list](#1-add-an-artist-to-the-subscriptions-list)
  * [Delete an artist from the subscriptions list](#2-delete-an-artist-from-the-subscriptions-list)
  * [Get a subscriptions list](#3-get-a-subscriptions-list)

* [Public](#public)

  * [Login](#1-login)
  * [Registration](#2-registration)
  * [Releases](#3-releases)
  * [Search](#4-search)
  * [Tracks](#5-tracks)


--------


## Authorized only
Methods available only to authorized users



### 1. Add an artist to the subscriptions list


Add an artist to the subscriptions list


***Endpoint:***

```bash
Method: GET
Type: 
URL: https://{{base_url}}/{{version}}/addsub/:artist
```



***URL variables:***

| Key | Value | Description |
| --- | ------|-------------|
| artist |  | Artist |



***More example Requests/Responses:***


##### I. Example Request: Add an artist to the subscriptions list



***Query:***

| Key | Value | Description |
| --- | ------|-------------|
| artist | %D0%A1%D0%B5%D0%BA%D1%82%D0%BE%D1%80%20%D0%93%D0%B0%D0%B7%D0%B0 | Artist |



##### I. Example Response: Add an artist to the subscriptions list
```js
{
    "status": "ok"
}
```


***Status Code:*** 200

<br>



### 2. Delete an artist from the subscriptions list


Delete an artist from the subscriptions list


***Endpoint:***

```bash
Method: GET
Type: 
URL: https://{{base_url}}/{{version}}/delsub/:artist
```



***URL variables:***

| Key | Value | Description |
| --- | ------|-------------|
| artist |  | Artist |



***More example Requests/Responses:***


##### I. Example Request: Delete an artist from the subscriptions list



***Query:***

| Key | Value | Description |
| --- | ------|-------------|
| artist | %D0%A1%D0%B5%D0%BA%D1%82%D0%BE%D1%80%20%D0%93%D0%B0%D0%B7%D0%B0 | Artist |



##### I. Example Response: Delete an artist from the subscriptions list
```js
{
    "status": "ok"
}
```


***Status Code:*** 200

<br>



### 3. Get a subscriptions list


Get a subscriptions list


***Endpoint:***

```bash
Method: GET
Type: 
URL: https://{{base_url}}/{{version}}/getsubs
```



***More example Requests/Responses:***


##### I. Example Request: Get a subscriptions list



##### I. Example Response: Get a subscriptions list
```js
{
    "results": [
        "Сектор Газа"
    ]
}
```


***Status Code:*** 200

<br>



## Public
Methods available without authorization



### 1. Login


Returns authorization token


***Endpoint:***

```bash
Method: GET
Type: 
URL: https://{{base_url}}/{{version}}/login/:username/:password
```



***URL variables:***

| Key | Value | Description |
| --- | ------|-------------|
| username |  | Username |
| password |  | Password |



***More example Requests/Responses:***


##### I. Example Request: Login



***Query:***

| Key | Value | Description |
| --- | ------|-------------|
| username | Test | Username |
| password | test | Password |



##### I. Example Response: Login
```js
{
    "token": "eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJ1c2VyIjoiVGVzdCIsImlkIjozfQ.wddbV5NirNkktUhXdbYTTOUME0hUYObVNSDE94XQ1YU"
}
```


***Status Code:*** 200

<br>



### 2. Registration


Create a new account


***Endpoint:***

```bash
Method: GET
Type: 
URL: 
```



***More example Requests/Responses:***


##### I. Example Request: Registration



***Query:***

| Key | Value | Description |
| --- | ------|-------------|
| username | Test | Username |
| password | test | Password |



##### I. Example Response: Registration
```js
{
    "status": "ok"
}
```


***Status Code:*** 200

<br>



### 3. Releases


Get all the artist's releases


***Endpoint:***

```bash
Method: GET
Type: 
URL: https://{{base_url}}/{{version}}/releases/:artist
```



***URL variables:***

| Key | Value | Description |
| --- | ------|-------------|
| artist |  | Artist |



***More example Requests/Responses:***


##### I. Example Request: Releases



***Query:***

| Key | Value | Description |
| --- | ------|-------------|
| artist | Сектор Газа | Artist |



##### I. Example Response: Releases
```js
{
    "results": [
        {
            "date": "2015-11-13",
            "title": "Вой на луну: лучшее и неизданное"
        },
        {
            "date": "2015-11-13",
            "title": "Вой на Луну - Лучшее и неизданное (Deluxe Version)"
        },
        {
            "date": "2003",
            "title": "Баллады 2"
        },
        {
            "date": "2002-10-09",
            "title": "Избранное III"
        },
        {
            "date": "2000-10-19",
            "title": "Восставший из Ада"
        },
        {
            "date": "1999-11",
            "title": "Extasy"
        },
        {
            "date": "1999",
            "title": "Extasy 2"
        },
        {
            "date": "1998-06",
            "title": "Баллады"
        },
        {
            "date": "1997",
            "title": "Сектор газа"
        },
        {
            "date": "1997",
            "title": "Кащей Бессмертный"
        },
        {
            "date": "1997",
            "title": "Ядрёна вошь"
        },
        {
            "date": "1997",
            "title": "Колхозный панк"
        },
        {
            "date": "1997",
            "title": "Зловещие мертвецы"
        },
        {
            "date": "1997",
            "title": "Гуляй, мужик!"
        },
        {
            "date": "1997",
            "title": "Танцы после порева"
        },
        {
            "date": "1997",
            "title": "Нажми на газ"
        },
        {
            "date": "1997",
            "title": "Газовая атака"
        },
        {
            "date": "1997",
            "title": "Наркологический университет миллионов"
        },
        {
            "date": "1997",
            "title": "Ночь перед Рождеством"
        },
        {
            "date": "1996-03",
            "title": "Газовая атака"
        },
        {
            "date": "1996",
            "title": "Избранное II"
        },
        {
            "date": "1996",
            "title": "Избранное I"
        },
        {
            "date": "1995",
            "title": "Сектор газа"
        },
        {
            "date": "1994-06",
            "title": "Кащей Бессмертный"
        },
        {
            "date": "1994",
            "title": "Танцы после порева"
        },
        {
            "date": "1994",
            "title": "Зловещие Мертвецы"
        },
        {
            "date": "1993",
            "title": "Нажми на газ"
        },
        {
            "date": "1993",
            "title": "Сектор газа"
        },
        {
            "date": "1992",
            "title": "Гуляй, мужик!"
        },
        {
            "date": "1991",
            "title": "Ночь перед Рождеством"
        },
        {
            "date": "1991",
            "title": "Колхозный панк"
        },
        {
            "date": "1990",
            "title": "Ядрёна вошь"
        },
        {
            "date": "1990",
            "title": "Зловещие мертвецы"
        },
        {
            "date": "1989",
            "title": "Сектор газа"
        }
    ]
}
```


***Status Code:*** 200

<br>



### 4. Search


Artists search


***Endpoint:***

```bash
Method: GET
Type: 
URL: https://{{base_url}}/{{version}}/search/:query
```



***URL variables:***

| Key | Value | Description |
| --- | ------|-------------|
| query |  | Search query |



***More example Requests/Responses:***


##### I. Example Request: Search



***Query:***

| Key | Value | Description |
| --- | ------|-------------|
| query | Сектор | Search query |



##### I. Example Response: Search
```js
{
    "results": [
        "Сектор Газа",
        "Сектор Газовой Атаки",
        "Регина Спектор",
        "Ex-Сектор газа",
        "Экс Сектор Газа",
        "БИТЫЙ СЕКТОР",
        "Экс-Сектор Газа",
        "\"Сектор газа\"",
        "Сектор газа - лирика",
        "Сектор газа [vkhp.net]",
        "Западный Сектор",
        "Юрий Хой и группа Сектор Газа",
        "9 сектор",
        "Сектор Газа (11)",
        "Сектор Газа и Dram and Bass",
        "сектор газа - голубой",
        "Сектор газа - Атаман",
        "Сектор Газа (8)",
        "Пара-докс (экс Сектор газа)",
        "♬ Сектор Газа",
        "Сектор газа на татарском",
        "Сектор Газа feat. DJ $EK+0R",
        "Западный Сектор Ft. Змей",
        "Сектор Газа & DJ $EK+0R",
        "Правий сектор",
        "ех Сектор газа",
        "Ария, Король и Шут (КиШ), Кипелов, Пикник, Алиса, Louna, Слот, КняZZ, Lumen, Otto Dix, Черный Обелиск, Эпидемия, Ленинград, Сплин, Ляпис Трубецкой, Сектор Газа, Rammstein, System Of A Down, Психея, Amatory, Jane Air, Stigmata, Noize MC, ИНКВИЗИТОР",
        "Ария, Король и Шут (КиШ), Кипелов, Пикник, Алиса, Louna, Слот, КняZZ, Lumen, Otto Dix, Черный Обелиск, Эпидемия, Ленинград, Сплин, Ляпис Трубецкой, Сектор Газа, Rammstein, System Of A Down, Психея, Amatory, Stigmata вдохновили ИНКВИЗИТОР на этот трек",
        "Сектор Газа (Sektor Gaza)",
        "SaAnVi vs Сектор газа"
    ]
}
```


***Status Code:*** 200

<br>



### 5. Tracks


Get tracklist from a specific album


***Endpoint:***

```bash
Method: GET
Type: 
URL: https://{{base_url}}/{{version}}/tracks/:artist/:album
```



***URL variables:***

| Key | Value | Description |
| --- | ------|-------------|
| artist |  | Artist |
| album |  | Album |



***More example Requests/Responses:***


##### I. Example Request: Tracks



***Query:***

| Key | Value | Description |
| --- | ------|-------------|
| artist | %D0%A1%D0%B5%D0%BA%D1%82%D0%BE%D1%80%20%D0%93%D0%B0%D0%B7%D0%B0 |  |
| album | %D0%91%D0%B0%D0%BB%D0%BB%D0%B0%D0%B4%D1%8B%202 |  |



##### I. Example Response: Tracks
```js
{
    "results": [
        "Девушка",
        "Дурак",
        "Свидание",
        "Демобилизация",
        "Когда помрешь",
        "Я устал",
        "Любовь раскумаренная",
        "Любовь загробная",
        "Ночь страха",
        "Сожженная ведьма"
    ]
}
```


***Status Code:*** 200

<br>



***Available Variables:***

| Key | Value | Type |
| --- | ------|-------------|
| base_url | курсач.писос.рф | string |
| version | 1.0 | string |
| AUTH_TOKEN |  | string |



---
[Back to top](#kursa4)
> Made with &#9829; by [thedevsaddam](https://github.com/thedevsaddam) | Generated at: 2020-05-16 19:18:49 by [docgen](https://github.com/thedevsaddam/docgen)
