
# Kursa4

Kursa4 API

## Indices

* [Authorized only](#authorized-only)

  * [Add an artist to the subscriptions list](#1-add-an-artist-to-the-subscriptions-list)
  * [Delete an artist from the subscriptions list](#2-delete-an-artist-from-the-subscriptions-list)
  * [Get a subscriptions list](#3-get-a-subscriptions-list)
  * [Get my releases](#4-get-my-releases)

* [Public](#public)

  * [Login](#1-login)
  * [Registration](#2-registration)
  * [Releases](#3-releases)
  * [Search](#4-search)
  * [Tracks](#5-tracks)


--------


## Authorized only
Methods available only to authorized users

To access them, add an HTTP header with the name "Token" that contains the token received during the [authorization process](#1-login)



### 1. Add an artist to the subscriptions list


Add an artist to the subscriptions list


***Endpoint:***

```bash
Method: GET
Type: 
URL: {{base_url}}/{{version}}/addsub/:artist
```



***URL variables:***

| Key | Value | Description |
| --- | ------|-------------|
| artist | %D0%A5%D1%83%D0%B9%20%D0%97%D0%B0%D0%B1%D0%B5%D0%B9 | Artist |



***More example Requests/Responses:***


##### I. Example Request: Add an artist to the subscriptions list



***Query:***

| Key | Value | Description |
| --- | ------|-------------|
| artist | Сектор Газа | Artist |



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
URL: {{base_url}}/{{version}}/delsub/:artist
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
| artist | Сектор Газа | Artist |



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
URL: {{base_url}}/{{version}}/getsubs
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



### 4. Get my releases


Get my releases


***Endpoint:***

```bash
Method: GET
Type: 
URL: {{base_url}}/{{version}}/myreleases
```



***More example Requests/Responses:***


##### I. Example Request: Get my releases



##### I. Example Response: Get my releases
```js
{
    "results": [
        {
            "date": "2015-11-13",
            "title": "Вой на луну: лучшее и неизданное",
            "cover": {
                "large": "http://coverartarchive.org/release/ae006d2c-2f14-4555-af61-b87b7d84bc78/15295938633-500.jpg",
                "small": "http://coverartarchive.org/release/ae006d2c-2f14-4555-af61-b87b7d84bc78/15295938633-250.jpg",
                "full": "http://coverartarchive.org/release/ae006d2c-2f14-4555-af61-b87b7d84bc78/15295938633.jpg"
            },
            "artist": "Сектор газа"
        },
        {
            "date": "2015-11-13",
            "title": "Вой на Луну - Лучшее и неизданное (Deluxe Version)",
            "cover": {
                "large": "http://coverartarchive.org/release/de9bfb0f-d986-4f1c-88d1-cf4311484c61/12178977761-500.jpg",
                "small": "http://coverartarchive.org/release/de9bfb0f-d986-4f1c-88d1-cf4311484c61/12178977761-250.jpg",
                "full": "http://coverartarchive.org/release/de9bfb0f-d986-4f1c-88d1-cf4311484c61/12178977761.jpg"
            },
            "artist": "Сектор газа"
        },
        {
            "date": "2003",
            "title": "Баллады 2",
            "cover": {
                "250": "http://coverartarchive.org/release/bfc5f2c5-c7e4-4d70-805e-cf1a619c1f3b/20245354616-250.jpg",
                "500": "http://coverartarchive.org/release/bfc5f2c5-c7e4-4d70-805e-cf1a619c1f3b/20245354616-500.jpg",
                "1200": "http://coverartarchive.org/release/bfc5f2c5-c7e4-4d70-805e-cf1a619c1f3b/20245354616-1200.jpg",
                "large": "http://coverartarchive.org/release/bfc5f2c5-c7e4-4d70-805e-cf1a619c1f3b/20245354616-500.jpg",
                "small": "http://coverartarchive.org/release/bfc5f2c5-c7e4-4d70-805e-cf1a619c1f3b/20245354616-250.jpg",
                "full": "http://coverartarchive.org/release/bfc5f2c5-c7e4-4d70-805e-cf1a619c1f3b/20245354616.jpg"
            },
            "artist": "Сектор газа"
        },
        {
            "date": "2002-10-09",
            "title": "Избранное III",
            "cover": {
                "large": "http://coverartarchive.org/release/41fdde73-8dde-49c4-b524-3d6b7ae10781/15979709772-500.jpg",
                "small": "http://coverartarchive.org/release/41fdde73-8dde-49c4-b524-3d6b7ae10781/15979709772-250.jpg",
                "full": "http://coverartarchive.org/release/41fdde73-8dde-49c4-b524-3d6b7ae10781/15979709772.jpg"
            },
            "artist": "Сектор газа"
        },
        {
            "date": "2000-10-19",
            "title": "Восставший из Ада",
            "cover": {
                "large": "http://coverartarchive.org/release/170249ba-e82f-4526-aa83-0a630714d703/3504171882-500.jpg",
                "small": "http://coverartarchive.org/release/170249ba-e82f-4526-aa83-0a630714d703/3504171882-250.jpg",
                "full": "http://coverartarchive.org/release/170249ba-e82f-4526-aa83-0a630714d703/3504171882.jpg"
            },
            "artist": "Сектор газа"
        },
        {
            "date": "2000-10-19",
            "title": "Восставший из Ада",
            "cover": null,
            "artist": "Сектор газа"
        },
        {
            "date": "1999-11",
            "title": "Extasy",
            "cover": {
                "large": "http://coverartarchive.org/release/5638d587-109a-4483-b19c-1fe12b050d76/7645934768-500.jpg",
                "small": "http://coverartarchive.org/release/5638d587-109a-4483-b19c-1fe12b050d76/7645934768-250.jpg",
                "full": "http://coverartarchive.org/release/5638d587-109a-4483-b19c-1fe12b050d76/7645934768.png"
            },
            "artist": "Сектор газа"
        },
        {
            "date": "1999",
            "title": "Extasy 2",
            "cover": null,
            "artist": "Сектор газа"
        },
        {
            "date": "1998-06",
            "title": "Баллады",
            "cover": null,
            "artist": "Сектор газа"
        },
        {
            "date": "1997",
            "title": "Сектор газа",
            "cover": {
                "large": "http://coverartarchive.org/release/10498f30-85f7-445a-a387-09f81704fca6/3504165698-500.jpg",
                "small": "http://coverartarchive.org/release/10498f30-85f7-445a-a387-09f81704fca6/3504165698-250.jpg",
                "full": "http://coverartarchive.org/release/10498f30-85f7-445a-a387-09f81704fca6/3504165698.jpg"
            },
            "artist": "Сектор газа"
        },
        {
            "date": "1997",
            "title": "Кащей Бессмертный",
            "cover": null,
            "artist": "Сектор газа"
        },
        {
            "date": "1997",
            "title": "Ядрёна вошь",
            "cover": {
                "large": "http://coverartarchive.org/release/45d30fcb-793e-441a-a57b-226956a58ee4/1418299922-500.jpg",
                "small": "http://coverartarchive.org/release/45d30fcb-793e-441a-a57b-226956a58ee4/1418299922-250.jpg",
                "full": "http://coverartarchive.org/release/45d30fcb-793e-441a-a57b-226956a58ee4/1418299922.jpg"
            },
            "artist": "Сектор газа"
        },
        {
            "date": "1997",
            "title": "Наркологический университет миллионов",
            "cover": {
                "large": "http://coverartarchive.org/release/5d923d08-926a-48d0-aad0-efe4d469af4e/3504160980-500.jpg",
                "small": "http://coverartarchive.org/release/5d923d08-926a-48d0-aad0-efe4d469af4e/3504160980-250.jpg",
                "full": "http://coverartarchive.org/release/5d923d08-926a-48d0-aad0-efe4d469af4e/3504160980.jpg"
            },
            "artist": "Сектор газа"
        },
        {
            "date": "1997",
            "title": "Колхозный панк",
            "cover": {
                "large": "http://coverartarchive.org/release/63f81496-832b-4f27-842d-dfef63f41c45/3504099238-500.jpg",
                "small": "http://coverartarchive.org/release/63f81496-832b-4f27-842d-dfef63f41c45/3504099238-250.jpg",
                "full": "http://coverartarchive.org/release/63f81496-832b-4f27-842d-dfef63f41c45/3504099238.jpg"
            },
            "artist": "Сектор газа"
        },
        {
            "date": "1997",
            "title": "Зловещие мертвецы",
            "cover": {
                "large": "http://coverartarchive.org/release/6fafb401-86f6-4aaa-8cdb-a470b161403e/3504093029-500.jpg",
                "small": "http://coverartarchive.org/release/6fafb401-86f6-4aaa-8cdb-a470b161403e/3504093029-250.jpg",
                "full": "http://coverartarchive.org/release/6fafb401-86f6-4aaa-8cdb-a470b161403e/3504093029.jpg"
            },
            "artist": "Сектор газа"
        },
        {
            "date": "1997",
            "title": "Гуляй, мужик!",
            "cover": {
                "large": "http://coverartarchive.org/release/7a7ee2c4-1b17-47fa-acac-53f72c4061b5/3504179622-500.jpg",
                "small": "http://coverartarchive.org/release/7a7ee2c4-1b17-47fa-acac-53f72c4061b5/3504179622-250.jpg",
                "full": "http://coverartarchive.org/release/7a7ee2c4-1b17-47fa-acac-53f72c4061b5/3504179622.jpg"
            },
            "artist": "Сектор газа"
        },
        {
            "date": "1997",
            "title": "Танцы после порева",
            "cover": {
                "large": "http://coverartarchive.org/release/a25b8f10-398d-4388-8f14-7b2a86390b12/3504151821-500.jpg",
                "small": "http://coverartarchive.org/release/a25b8f10-398d-4388-8f14-7b2a86390b12/3504151821-250.jpg",
                "full": "http://coverartarchive.org/release/a25b8f10-398d-4388-8f14-7b2a86390b12/3504151821.jpg"
            },
            "artist": "Сектор газа"
        },
        {
            "date": "1997",
            "title": "Наркологический университет миллионов",
            "cover": null,
            "artist": "Сектор газа"
        },
        {
            "date": "1997",
            "title": "Нажми на газ",
            "cover": {
                "large": "http://coverartarchive.org/release/c97a7576-f163-4bcd-b7ef-945747b9de3c/3504115927-500.jpg",
                "small": "http://coverartarchive.org/release/c97a7576-f163-4bcd-b7ef-945747b9de3c/3504115927-250.jpg",
                "full": "http://coverartarchive.org/release/c97a7576-f163-4bcd-b7ef-945747b9de3c/3504115927.jpg"
            },
            "artist": "Сектор газа"
        },
        {
            "date": "1997",
            "title": "Газовая атака",
            "cover": {
                "large": "http://coverartarchive.org/release/d9214d91-4baa-4e53-beb8-02ea8ed7c7ae/3504156496-500.jpg",
                "small": "http://coverartarchive.org/release/d9214d91-4baa-4e53-beb8-02ea8ed7c7ae/3504156496-250.jpg",
                "full": "http://coverartarchive.org/release/d9214d91-4baa-4e53-beb8-02ea8ed7c7ae/3504156496.jpg"
            },
            "artist": "Сектор газа"
        },
        {
            "date": "1997",
            "title": "Наркологический университет миллионов",
            "cover": {
                "large": "http://coverartarchive.org/release/e9395251-4ab5-404f-9484-cff82389a959/7647535242-500.jpg",
                "small": "http://coverartarchive.org/release/e9395251-4ab5-404f-9484-cff82389a959/7647535242-250.jpg",
                "full": "http://coverartarchive.org/release/e9395251-4ab5-404f-9484-cff82389a959/7647535242.jpg"
            },
            "artist": "Сектор газа"
        },
        {
            "date": "1997",
            "title": "Ночь перед Рождеством",
            "cover": {
                "large": "http://coverartarchive.org/release/f2ab5e91-df54-49b3-bedc-f0b5823401dc/3504105307-500.jpg",
                "small": "http://coverartarchive.org/release/f2ab5e91-df54-49b3-bedc-f0b5823401dc/3504105307-250.jpg",
                "full": "http://coverartarchive.org/release/f2ab5e91-df54-49b3-bedc-f0b5823401dc/3504105307.jpg"
            },
            "artist": "Сектор газа"
        },
        {
            "date": "1996-03",
            "title": "Газовая атака",
            "cover": {
                "small": "http://coverartarchive.org/release/d854dd34-d5a5-49b5-83bc-6c17a354112e/7646928612-250.jpg",
                "large": "http://coverartarchive.org/release/d854dd34-d5a5-49b5-83bc-6c17a354112e/7646928612-500.jpg",
                "full": "http://coverartarchive.org/release/d854dd34-d5a5-49b5-83bc-6c17a354112e/7646928612.jpg"
            },
            "artist": "Сектор газа"
        },
        {
            "date": "1996",
            "title": "Избранное II",
            "cover": {
                "large": "http://coverartarchive.org/release/7da3036c-9745-473b-8628-57d355cfd00e/15979705285-500.jpg",
                "small": "http://coverartarchive.org/release/7da3036c-9745-473b-8628-57d355cfd00e/15979705285-250.jpg",
                "full": "http://coverartarchive.org/release/7da3036c-9745-473b-8628-57d355cfd00e/15979705285.jpg"
            },
            "artist": "Сектор газа"
        },
        {
            "date": "1996",
            "title": "Избранное I",
            "cover": {
                "250": "http://coverartarchive.org/release/b0bcd26d-cdd8-4e01-bb87-82609bc0f426/20245412772-250.jpg",
                "500": "http://coverartarchive.org/release/b0bcd26d-cdd8-4e01-bb87-82609bc0f426/20245412772-500.jpg",
                "1200": "http://coverartarchive.org/release/b0bcd26d-cdd8-4e01-bb87-82609bc0f426/20245412772-1200.jpg",
                "large": "http://coverartarchive.org/release/b0bcd26d-cdd8-4e01-bb87-82609bc0f426/20245412772-500.jpg",
                "small": "http://coverartarchive.org/release/b0bcd26d-cdd8-4e01-bb87-82609bc0f426/20245412772-250.jpg",
                "full": "http://coverartarchive.org/release/b0bcd26d-cdd8-4e01-bb87-82609bc0f426/20245412772.jpg"
            },
            "artist": "Сектор газа"
        },
        {
            "date": "1995",
            "title": "Сектор газа",
            "cover": null,
            "artist": "Сектор газа"
        },
        {
            "date": "1994-06",
            "title": "Кащей Бессмертный",
            "cover": {
                "small": "http://coverartarchive.org/release/10d528b6-1519-40e9-b055-b8c986df6241/7651539119-250.jpg",
                "large": "http://coverartarchive.org/release/10d528b6-1519-40e9-b055-b8c986df6241/7651539119-500.jpg",
                "full": "http://coverartarchive.org/release/10d528b6-1519-40e9-b055-b8c986df6241/7651539119.jpg"
            },
            "artist": "Сектор газа"
        },
        {
            "date": "1994-06",
            "title": "Кащей Бессмертный",
            "cover": {
                "large": "http://coverartarchive.org/release/23d7bcde-a45c-4554-acf1-d9bc76dd8ef8/3504124023-500.jpg",
                "small": "http://coverartarchive.org/release/23d7bcde-a45c-4554-acf1-d9bc76dd8ef8/3504124023-250.jpg",
                "full": "http://coverartarchive.org/release/23d7bcde-a45c-4554-acf1-d9bc76dd8ef8/3504124023.jpg"
            },
            "artist": "Сектор газа"
        },
        {
            "date": "1994",
            "title": "Танцы после порева",
            "cover": {
                "large": "http://coverartarchive.org/release/89b81057-0dc5-4d3c-bfed-d6ef65c8a391/7647767608-500.jpg",
                "small": "http://coverartarchive.org/release/89b81057-0dc5-4d3c-bfed-d6ef65c8a391/7647767608-250.jpg",
                "full": "http://coverartarchive.org/release/89b81057-0dc5-4d3c-bfed-d6ef65c8a391/7647767608.jpg"
            },
            "artist": "Сектор газа"
        },
        {
            "date": "1994",
            "title": "Зловещие Мертвецы",
            "cover": {
                "small": "http://coverartarchive.org/release/f6ba9ea3-c006-47a4-9791-cf0419af3f0c/16016969807-250.jpg",
                "large": "http://coverartarchive.org/release/f6ba9ea3-c006-47a4-9791-cf0419af3f0c/16016969807-500.jpg",
                "full": "http://coverartarchive.org/release/f6ba9ea3-c006-47a4-9791-cf0419af3f0c/16016969807.png"
            },
            "artist": "Сектор газа"
        },
        {
            "date": "1993",
            "title": "Нажми на газ",
            "cover": {
                "large": "http://coverartarchive.org/release/1d3cafa0-9d84-4619-ae02-5525fd6200ba/7647174259-500.jpg",
                "small": "http://coverartarchive.org/release/1d3cafa0-9d84-4619-ae02-5525fd6200ba/7647174259-250.jpg",
                "full": "http://coverartarchive.org/release/1d3cafa0-9d84-4619-ae02-5525fd6200ba/7647174259.jpg"
            },
            "artist": "Сектор газа"
        },
        {
            "date": "1993",
            "title": "Сектор газа",
            "cover": {
                "large": "http://coverartarchive.org/release/6bdd3773-eb43-4d53-82da-3ff771b1254d/7647722228-500.jpg",
                "small": "http://coverartarchive.org/release/6bdd3773-eb43-4d53-82da-3ff771b1254d/7647722228-250.jpg",
                "full": "http://coverartarchive.org/release/6bdd3773-eb43-4d53-82da-3ff771b1254d/7647722228.jpg"
            },
            "artist": "Сектор газа"
        },
        {
            "date": "1993",
            "title": "Сектор газа",
            "cover": null,
            "artist": "Сектор газа"
        },
        {
            "date": "1992",
            "title": "Гуляй, мужик!",
            "cover": {
                "large": "http://coverartarchive.org/release/5f96ecac-be24-426d-8c1b-d52ba550a47e/7646962946-500.jpg",
                "small": "http://coverartarchive.org/release/5f96ecac-be24-426d-8c1b-d52ba550a47e/7646962946-250.jpg",
                "full": "http://coverartarchive.org/release/5f96ecac-be24-426d-8c1b-d52ba550a47e/7646962946.jpg"
            },
            "artist": "Сектор газа"
        },
        {
            "date": "1991",
            "title": "Ночь перед Рождеством",
            "cover": {
                "large": "http://coverartarchive.org/release/7c9c1eb7-5c58-4689-8f2e-207222b6e454/4110901291-500.jpg",
                "small": "http://coverartarchive.org/release/7c9c1eb7-5c58-4689-8f2e-207222b6e454/4110901291-250.jpg",
                "full": "http://coverartarchive.org/release/7c9c1eb7-5c58-4689-8f2e-207222b6e454/4110901291.jpg"
            },
            "artist": "Сектор газа"
        },
        {
            "date": "1991",
            "title": "Колхозный панк",
            "cover": {
                "large": "http://coverartarchive.org/release/9a6e5594-f511-42ec-ba7e-8a7147bd06f9/7647115671-500.jpg",
                "small": "http://coverartarchive.org/release/9a6e5594-f511-42ec-ba7e-8a7147bd06f9/7647115671-250.jpg",
                "full": "http://coverartarchive.org/release/9a6e5594-f511-42ec-ba7e-8a7147bd06f9/7647115671.jpg"
            },
            "artist": "Сектор газа"
        },
        {
            "date": "1990",
            "title": "Ядрёна вошь",
            "cover": {
                "large": "http://coverartarchive.org/release/9d1529c9-4a42-4252-b125-6885bf456d83/7647820842-500.jpg",
                "small": "http://coverartarchive.org/release/9d1529c9-4a42-4252-b125-6885bf456d83/7647820842-250.jpg",
                "full": "http://coverartarchive.org/release/9d1529c9-4a42-4252-b125-6885bf456d83/7647820842.jpg"
            },
            "artist": "Сектор газа"
        },
        {
            "date": "1990",
            "title": "Зловещие мертвецы",
            "cover": {
                "large": "http://coverartarchive.org/release/e93e026a-16d6-4461-9280-07f477cc5bf4/7647051857-500.jpg",
                "small": "http://coverartarchive.org/release/e93e026a-16d6-4461-9280-07f477cc5bf4/7647051857-250.jpg",
                "full": "http://coverartarchive.org/release/e93e026a-16d6-4461-9280-07f477cc5bf4/7647051857.jpg"
            },
            "artist": "Сектор газа"
        },
        {
            "date": "1989",
            "title": "Сектор газа",
            "cover": null,
            "artist": "Сектор газа"
        }
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
URL: {{base_url}}/{{version}}/login/:username/:password
```



***URL variables:***

| Key | Value | Description |
| --- | ------|-------------|
| username | Test | Username |
| password | test | Password |



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
URL: {{base_url}}/{{version}}/register/:username/:password
```



***URL variables:***

| Key | Value | Description |
| --- | ------|-------------|
| username | | Username |
| password | | Password |



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
    "token": "eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJ1c2VyIjoiVGVzdDEiLCJpZCI6N30.ZWwnJiBG0KVQVEfW2NjOUbY0kqWiSa9tGBrJt5vmmYM"
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
URL: {{base_url}}/{{version}}/releases/:artist
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
URL: {{base_url}}/{{version}}/search/:query
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
URL: {{base_url}}/{{version}}/tracks/:artist/:album
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
| artist | Сектор Газа | Artist |
| album | Баллады 2 | Album |



##### I. Example Response: Tracks
```js
{
    "title": "Баллады 2",
    "artist": "Сектор Газа",
    "date": "2003",
    "cover": {
        "250": "https://coverartarchive.org/release/bfc5f2c5-c7e4-4d70-805e-cf1a619c1f3b/20245354616-250.jpg",
        "500": "https://coverartarchive.org/release/bfc5f2c5-c7e4-4d70-805e-cf1a619c1f3b/20245354616-500.jpg",
        "1200": "https://coverartarchive.org/release/bfc5f2c5-c7e4-4d70-805e-cf1a619c1f3b/20245354616-1200.jpg",
        "large": "https://coverartarchive.org/release/bfc5f2c5-c7e4-4d70-805e-cf1a619c1f3b/20245354616-500.jpg",
        "small": "https://coverartarchive.org/release/bfc5f2c5-c7e4-4d70-805e-cf1a619c1f3b/20245354616-250.jpg",
        "full": "https://coverartarchive.org/release/bfc5f2c5-c7e4-4d70-805e-cf1a619c1f3b/20245354616.jpg"
    },
    "tracks": [
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
| base_url | https://курсач.писос.рф | string |
| version | 1.0 | string |
| AUTH_TOKEN |  | string |



---
[Back to top](#kursa4)
> Made with &#9829; by [thedevsaddam](https://github.com/thedevsaddam) | Generated at: 2020-06-11 22:23:31 by [docgen](https://github.com/thedevsaddam/docgen)
