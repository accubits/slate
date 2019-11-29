---
title: API Reference

language_tabs: # must be one of https://git.io/vQNgJ
  - php

toc_footers:
  - 

includes:
  - errors

search: true
---
# Introduction

Payment Corner (Switzerland) Ltd is an open foreign exchange platform that enables customers to create their own products that need Forex capabilities into their systems, apps and workflows.


Customers connect to Payment Corner platform via organized HTTP-based <a href="https://en.wikipedia.org/wiki/Representational_state_transfer"> REST</a> APIs that use <a href="https://oauth.net/2/">OAuth 2.0.</a> standard for authorization.


Our platform is purely an API platform that you can easily and quickly integrate to your business. Our foreign exchange desk covers over 28 different currencies.


<a href="https://en.wikipedia.org/wiki/JSON">JSON</a> is returned by all APIs responses, requests and errors in order to make your life easier.


We have a sandbox environement and a production environement available. There are therefore 2 differents keys to be used for both environements as there is no switch for changing between the environements. Therefore, requests made on sandbox environement will never have any financial impact.


# Getting started

Get your sandbox key (link) within seconds to play with our APIs for free, without any limitation in terms of number of calls, transactions or volumes.

`Sandbox Base URL : http://sandboxapi.paymentcorner.com`

Get your production key (link) to connect our FX capabilities to your systems.

`Production Base URL : http://productionapi.paymentcorner.com`


# Supported currencies

Our FX platform currently supports the following 28 currencies:

Currency (ISO) | Currency | SWIFT | Local Payment
---------| -------- | --------------- | ----- | -----
AUD | Australian Dollar  | Yes | Yes
GBP | British Pound  | Yes | Yes
BGN | Bulgarian Lev  | Yes | No
CAD | Canadian Dollar  | Yes | Yes
CNY | Chinese Yuan Renminbi  | Yes | No
HRK | Croatian Kuna  |Yes | No
CZK | Czech Koruna  | Yes | Yes
AED | Emirati Dirham  | Yes | No
EUR | Euro  | Yes | Yes
HKD | Hong Kong Dollar  | Yes |	Yes
HUF | Hungarian Forint  | Yes |	Yes
ILS | Israeli Shekel  |	Yes | No
JPY | Japanese Yen  | Yes | No
MXN | Mexican Peso  | Yes |	Yes
NZD | New Zealand Dollar  | Yes | No
NOK | Norwegian Krone  | Yes | Yes
PLN | Polish Zloty | Yes |	Yes
QAR | Qatari Rial  | Yes | No
RON | Romanian New Leu  | Yes | No
RUB | Russian Ruble (Sell only)  | Yes |	No
SAR | Saudi Riyal  | Yes | No
SGD | Singapore Dollar  | Yes |	Yes
ZAR | South African Rand  |	Yes | No
SEK | Swedish Krona  | Yes | Yes
CHF | Swiss Franc  | Yes | No
THB | Thai Baht  | Yes | No
TRY | Turkish Lira  | Yes |	No
USD | United States Dollar  | Yes| Yes


# Authentication

## Login

> Request

```php
PaymentCorner\Login::login(email => test@gmail.com,
                           password => test@123)
```



> Example Response

```json
 {
     "result": {
         "auth_token": "eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJsdW1lbi1qd3QiLCJzdWIiOiJyYWh1bHNoaWJ1QGFjY3ViaXRzLmNvbSIsImlhdCI6MTU0MzQxMTkzMiwiZXhwIjoxNTQzNDE1NTMyfQ.QxtJKXE5QrOkt07H5eACp-sRK78Ew23j6SNBrv-NLrs"
     },
     "status": true,
     "code": 200
 }
```

The token allows you to proceed with 10 calls per 60 seconds and expires after 25 min of inactivity.
For security reasons, all accounts are blocked by our system after 3 wrong login and/or password attempts.

### HTTP Request

`POST BaseUrl + /login`

### Required Parameters

Parameter | In |Description
--------- | ------- | -----------
email |  json | Registered email for the account (unique identified available on request).
password | json | Password for the account (unique identified provided on request).

<!--<aside class="success">
Remember — a happy kitten is an authenticated kitten!
</aside>-->

## Logout

> Request

```php
PaymentCorner\Auth::setToken("eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJsdW1lbi1qd3QiLCJzdWIiOiJyYWh1bHNoaWJ1QGFjY3ViaXRzLmNvbSIsImlhdCI6MTU0MzQxMTkzMiwiZXhwIjoxNTQzNDE1NTMyfQ.QxtJKXE5QrOkt07H5eACp-sRK78Ew23j6SNBrv-NLrs")
```




> Example Response

```json
{
    "result": "Logged out successfully",
    "status": true,
    "code": 200
}
```

Expires the authentication token on logout or after 25 min of inactivity.

<!-- <aside class="warning">Inside HTML code blocks like this one, you can't use Markdown, so use <code>&lt;code&gt;</code> blocks to denote code.</aside>-->

### HTTP Request

`POST BaseUrl + /logout`

### URL Parameters

Parameter | In | Description
--------- |--------- |-----------
auth_token | header | Authentication token.


# FX transaction

## FX Transaction

> Request

```php
PaymentCorner\Auth::setToken("eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJsdW1lbi1qd3QiLCJzdWIiOiJyYWh1bHNoaWJ1QGFjY3ViaXRzLmNvbSIsImlhdCI6MTU0MzQxMTkzMiwiZXhwIjoxNTQzNDE1NTMyfQ.QxtJKXE5QrOkt07H5eACp-sRK78Ew23j6SNBrv-NLrs")
```


> Example Response

```json
 {
     "result": {
         "path": "1a776ea3-9b93-4cf8-b715-f04bddfc9bb6",
         "date_of_settlement": "2019-01-14T14:30:00+00:00",
         "fx_tx_date": "2019-01-14T00:00:00+00:00",
         "creator_contact_id": "08b45825-3ded-481d-ac93-9c22b908e10a",
         "account_id": "0f1c61be-64ca-4c93-bdd3-1b384370378e",
         "currency_pair": "EURUSD",
         "currency_to_buy": "EUR",
         "currency_to_sell": "USD",
         "amount_to_buy": "126.51",
         "amount_to_sell": "150.00",
         "side_of_fx_tx": "sell",
         "market_rate": "1.1857",
         "client_net_rate": "1.1857",
         "fx_tx_unique_id": null,
         "fx_tx_creation_date": "2019-01-14T07:36:41+00:00",
         "fx_tx_update_date": "2019-01-14T07:36:42+00:00",
         "mid_market_rate": "1.1856",
         "fx_tx_status": "Funds_to_receive",
         "ref": "20190114-VKKVTT-Cswd3711"
     },
     "status": true,
     "code": 200
 }
```

Proceed with an FX transaction (buy and sell side), get your quote and confirm the FX trade.

### HTTP Request

`POST BaseUrl + /fx-transaction`

### Required Parameters

Parameter | In |Description
--------- | ------- | -----------
auth_token | header | Authentication token.
currency_to_buy | json | ISO 4217 format (e.g. EUR).
currency_to_sell | json | ISO 4217 format (e.g. EUR).
side_of_fx_tx | json | Choose which currency to buy or sell.
amount | json | Amount of the currency to buy or sell.
fx_tx_gtc | json | General terms and conditions.
client_id  |  json | Registered contact for the account (unique identified available on request).


### Optional Parameters

Parameter | In |Description
--------- | ------- | -----------
fx_tx_date |  json |  Value date. ISO 8601 format (YYYY-MM-DD).
amount_to_buy |  json | Amount to buy.	
amount_to_sell |  json | Amount to sell.	
fx_tx_unique_id  |  json | Idempotency key.

### Response Status

Status |Description
--------- | ------- | -----------
Funds_to_receive|Funds that are related to a FX transaction and that have not reached Payment Corner settlement account(s) yet.
Funds_sent |Funds have been sent by Payment Corner to requested beneficiary.
Funds_received | Funds have been received by Payment Corner.
FX_deal_settled | The FX transaction is completed.
FX_deal_closed| the FX transaction has been cancelled.

###Market calendar and trading days and hour

Status |Description
--------- | ------- | -----------
Market calendar|You will find all open and close market days in our trading calendar.
Trading days | From Mondays 4:15am GMT to Fridays 9:45pm GMT.
Trading hours | Same day transactions' cut off time is scheduled at 9 AM GMT.


## Retrieve FX Transaction(s)

> Request

```php
PaymentCorner\Auth::setToken("eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJsdW1lbi1qd3QiLCJzdWIiOiJyYWh1bHNoaWJ1QGFjY3ViaXRzLmNvbSIsImlhdCI6MTU0MzQxMTkzMiwiZXhwIjoxNTQzNDE1NTMyfQ.QxtJKXE5QrOkt07H5eACp-sRK78Ew23j6SNBrv-NLrs")
```



> Example Response

```json
 {
     "result": {
         "conversions": [
         {
             "path": "6404a803-95e2-4e5d-9edd-548cc3d8bebe",
             "date_of_settlement": "2018-11-29T16:30:00+00:00",
             "fx_tx_date": "2018-11-29T00:00:00+00:00",
             "creator_contact_id": "f72a98bf-2d4d-421f-b5c1-425d19077002",
             "account_id": "0f1c61be-64ca-4c93-bdd3-1b384370378e",
             "currency_pair": "GBPUSD",
             "currency_to_buy": "USD",
             "currency_to_sell": "GBP",
             "amount_to_buy": "140790.00",
             "amount_to_sell": "100000.00",
             "side_of_fx_tx": "sell",
             "market_rate": "1.4079",
             "client_net_rate": "1.4079",
             "fx_tx_unique_id": "",
             "fx_tx_creation_date": "2018-11-27T06:21:46+00:00",
             "fx_tx_update_date": "2018-11-27T06:21:47+00:00",
             "mid_market_rate": "1.4080",
             "fx_tx_status": "Funds_to_receive",
             "ref": "20181127-DYLVXH-fTgm3743"
         },
         {
             "path": "e52cef26-2397-453b-9400-633567e7214b",
             "date_of_settlement": "2018-11-29T16:30:00+00:00",
             "fx_tx_date": "2018-11-29T00:00:00+00:00",
             "creator_contact_id": "f72a98bf-2d4d-421f-b5c1-425d19077002",
             "account_id": "0f1c61be-64ca-4c93-bdd3-1b384370378e",
             "currency_pair": "GBPUSD",
             "currency_to_buy": "USD",
             "currency_to_sell": "GBP",
             "amount_to_buy": "140.79",
             "amount_to_sell": "100.00",
             "side_of_fx_tx": "sell",
             "market_rate": "1.4079",
             "client_net_rate": "1.4079",
             "fx_tx_unique_id": "",
             "fx_tx_creation_date": "2018-11-27T09:38:07+00:00",
             "fx_tx_update_date": "2018-11-27T09:38:08+00:00",
             "mid_market_rate": "1.4080",
             "fx_tx_status": "Funds_to_receive",
             "ref": "20181127-DDNSDZ-YQlB9216"
         }
         ],
         "pagination": {
             "tot_nbr_entries": 2,
             "tot_nbr_pages": 1,
             "current_page": 1,
             "result_per_page": 25,
             "goto_previous_page": -1,
             "goto_next_page": 2,
             "sort_order": "created_at",
             "sort_asc_to_desc": "asc"
         }
     },
     "status": true,
     "code": 200
 }
```

Retrieve one or several FX transaction(s) based on one or several parameter(s).

### HTTP Request

`POST BaseUrl + /retrieve-fx-transaction`

### Required Parameters

Parameter | In |Description 
--------- | ------- | -----------
auth_token | header | Authentication token.
client_id  |  json | Registered contact for the account (unique identified available on request).


### Optional Parameters

Parameter | In |Description
--------- | ------- | -----------
ref |  json | Is a unique reference for each FX transaction that can be used for searching the FX transaction via the API and user interface.
fx_tx_status |  json | FX transaction status.
currency_to_buy | json | The ISO 4217 format (e.g. EUR).
currency_to_sell | json | The ISO 4217 format (e.g. EUR).
fx_tx_id | json | One or several ID(s) to retrieve one or several successfull FX transaction(s).
fx_tx_creation_date_from | json | ISO 8601 format (e.g. 2018-11-30T16:30:00+00:00). Specify a time and date (FROM) and it will return a range of conversions created during this period.
fx_tx_creation_date_last | json | ISO 8601 format (e.g. 2018-11-30T16:30:00+00:00). Specify a time and date (TO) and it will return a range of conversions created during this period.
fx_tx_update_date_from | json | ISO 8601 format (e.g. 2018-11-30T16:30:00+00:00). Specify a time and date (FROM) and it will return a range of conversions that have been updated during this period, ie if the date has changed / rolled.
fx_tx_update_date_last | json | ISO 8601 format (e.g. 2018-11-30T16:30:00+00:00). Specify a time and date (TO) and this will return a range of conversions that have been updated during this period, ie if the date has changed / rolled.
tx_date_from | json | ISO 8601 format (e.g. 2018-11-30T16:30:00+00:00).
tx_date_to | json | ISO 8601 format (e.g. 2018-11-30T16:30:00+00:00).
currency_pair | json | Two ISO 4217 format concatenated (e.g. EURCHF).
min_amount_to_buy | json | Minimum amount on buy side.
max_amount_to_buy | json | Maximum amount on buy side.
min_amount_to_sell | json | Minimum amount on sell side.
max_amount_to_sell | json | Maximum amount on sell side.
date_tx_debit_first | json | ISO 8601 format (e.g. 2018-11-30T16:30:00+00:00).
date_tx_debit_last | json | ISO 8601 format (e.g. 2018-11-30T16:30:00+00:00).
fx_tx_unique_id | json | Idempotency key for each FX transaction to prevent duplicate requests.
page_nb | json | Page number.
result_per_page | json | Number of results per page.
sort_order | json | Change the sort order.
sort_asc_to_desc | json | Sort in ascending or descending order (default: asc).

## Retrieve a FX Transaction Record

> Request

```php
PaymentCorner\Auth::setToken("eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJsdW1lbi1qd3QiLCJzdWIiOiJyYWh1bHNoaWJ1QGFjY3ViaXRzLmNvbSIsImlhdCI6MTU0MzQxMTkzMiwiZXhwIjoxNTQzNDE1NTMyfQ.QxtJKXE5QrOkt07H5eACp-sRK78Ew23j6SNBrv-NLrs")
```


> Example Response

```json
 {
     "result": {
         "path": "832d46cd-d0ec-4717-9435-cc34d587dc95",
         "date_of_settlement": "2018-11-28T16:30:00+00:00",
         "fx_tx_date": "2018-11-28T00:00:00+00:00",
         "creator_contact_id": "f72a98bf-2d4d-421f-b5c1-425d19077002",
         "account_id": "0f1c61be-64ca-4c93-bdd3-1b384370378e",
         "currency_pair": "GBPUSD",
         "currency_to_buy": "USD",
         "currency_to_sell": "GBP",
         "amount_to_buy": "1000.00",
         "amount_to_sell": "710.28",
         "side_of_fx_tx": "buy",
         "market_rate": "1.4079",
         "client_net_rate": "1.4079",
         "fx_tx_unique_id": null,
         "fx_tx_creation_date": "2018-11-26T09:00:48+00:00",
         "fx_tx_update_date": "2018-11-28T06:31:04+00:00",
         "mid_market_rate": "1.4080",
         "fx_tx_status": "FX_deal_settled",
         "ref": "20181126-KSBMRW-lTYs1399"
     },
     "status": true,
     "code": 200
 }
```

Retrieve a single FX transaction based on the unique FX transaction ID.

### HTTP Request

`POST BaseUrl + /retrieve-fx-transaction-record`

### Required Parameters

Parameter | In |Description
--------- | ------- | -----------
auth_token | header | Authentication token.
path |  json | UUID that is generated for each FX transaction and which can be used for searching.
client_id  |  json | Registered contact for the account (unique identified available on request).


## Change FX conversion value date

> Request

```php
PaymentCorner\Auth::setToken("eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJsdW1lbi1qd3QiLCJzdWIiOiJyYWh1bHNoaWJ1QGFjY3ViaXRzLmNvbSIsImlhdCI6MTU0MzQxMTkzMiwiZXhwIjoxNTQzNDE1NTMyfQ.QxtJKXE5QrOkt07H5eACp-sRK78Ew23j6SNBrv-NLrs")
```


> Example Response

```json
 {
     "result": {
         "path": "f052bc04-2635-4bf3-8cee-486e20bddecc",
         "amount": "-0.03",
         "currency": "EUR",
         "new_conversion_date": "2019-01-09T00:00:00+00:00",
         "new_date_fx_tx": "2019-01-09T14:30:00+00:00",
         "old_conversion_date": "2019-01-07T00:00:00+00:00",
         "old_settlement_date": "2019-01-07T14:30:00+00:00",
         "event_date_time": "2018-12-18T07:43:34+00:00"
     },
     "status": true,
     "code": 200
 }
```

Change FX conversion value date by using the unique FX transaction path.

### HTTP Request

`POST BaseUrl + /change-fx-conversion-value-date`

### Required Parameters

Parameter | In |Description
--------- | ------- | -----------
auth_token | header | Authentication token.
path |  json |  UUID that is generated for each FX transaction and which can be used for searching.
new_date_fx_tx |  json |  New value date.
client_id  |  json | Registered contact for the account (unique identified available on request).
 	

## Change FX Conversion Delivery Date Quotation
 
> Request

```php
PaymentCorner\Auth::setToken("eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJsdW1lbi1qd3QiLCJzdWIiOiJyYWh1bHNoaWJ1QGFjY3ViaXRzLmNvbSIsImlhdCI6MTU0MzQxMTkzMiwiZXhwIjoxNTQzNDE1NTMyfQ.QxtJKXE5QrOkt07H5eACp-sRK78Ew23j6SNBrv-NLrs")
```


> Example Response

```json
{
    "result": {
        "path": "f052bc04-2635-4bf3-8cee-486e20bddecc",
        "amount": "-0.03",
        "currency": "EUR",
        "new_conversion_date": "2019-01-14T00:00:00+00:00",
        "new_date_fx_tx": "2019-01-14T14:30:00+00:00",
        "old_conversion_date": "2019-01-09T00:00:00+00:00",
        "old_settlement_date": "2019-01-09T14:30:00+00:00",
        "event_date_time": "2018-12-18T09:00:34+00:00"
    },
    "status": true,
    "code": 200
}
```

Allows you to get the new rates in case you want to change the FX transaction settlement date.

`POST BaseUrl + /change-fx-conversion-delivery-date-quotation`

### Required Parameters

Parameter | In |Description
--------- | ------- | -----------
auth_token | header | Authentication token.
path |  json |   UUID that is generated for each FX transaction and which can be used for searching.
new_date_fx_tx |  json |  New FX transaction settlement date. 	
client_id  |  json | Registered contact for the account (unique identified available on request).


# FX rates

## FX market rate w/ mark-up

> Request

```php
PaymentCorner\Auth::setToken("eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJsdW1lbi1qd3QiLCJzdWIiOiJyYWh1bHNoaWJ1QGFjY3ViaXRzLmNvbSIsImlhdCI6MTU0MzQxMTkzMiwiZXhwIjoxNTQzNDE1NTMyfQ.QxtJKXE5QrOkt07H5eACp-sRK78Ew23j6SNBrv-NLrs")
```

> Example Response

```json
 {
     "result": {
         "settlement_cut_off_time": "2019-01-16T16:30:00Z",
         "currency_pair": "GBPUSD",
         "currency_to_buy": "USD",
         "currency_to_sell": "GBP",
         "amount_to_buy": "140.79",
         "amount_to_sell": "100.00",
         "side_of_fx_tx": "sell",
         "client_net_rate": "1.4079",
         "market_rate": "1.4079",
         "mid_market_rate": "1.4080"
     },
     "status": true,
     "code": 200
 }
```
Get the FX market rate of any currency pairs which includes your mark-up.
### HTTP Request

`POST BaseUrl + /fx-market-rate-w/mark-up`

### Required Parameters

Parameter | In |Description
--------- | ------- | -----------
auth_token | header | Authentication token.
currency_to_buy |  json | ISO 4217 format (e.g. EUR).
currency_to_sell |  json | ISO 4217 format (e.g. EUR).	
side_of_fx_tx |  json | Choose which currency to buy or sell.	
amount |  json | Amount of the fixed buy or sell currency.
client_id  |  json | Registered contact for the account (unique identified available on request).
	


###  Optional Parameters

Parameter | In |Description
--------- | ------- | -----------
|fx_tx_date|json|ISO 8601 format (YYYY-MM-DD). If not specified, we will provide the spot (+2 days) rate.


## FX Market Rate

> Request

```php
PaymentCorner\Auth::setToken("eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJsdW1lbi1qd3QiLCJzdWIiOiJyYWh1bHNoaWJ1QGFjY3ViaXRzLmNvbSIsImlhdCI6MTU0MzQxMTkzMiwiZXhwIjoxNTQzNDE1NTMyfQ.QxtJKXE5QrOkt07H5eACp-sRK78Ew23j6SNBrv-NLrs")
```


> Example Response

```json
 {
     "result": {
                   "rates": {
                       "GBPUSD": [
                           "1.407700",
                           "1.408300"
                       ]
                   },
                   "unavailable": []
               },
     "status": true,
     "code": 200
 }
```

Get the interbank rates for any currency pairs.
### HTTP Request

`POST BaseUrl + /fx-market-rate`

### Required Parameters

Parameter | In |Description
--------- | ------- | -----------
auth_token | header | Authentication token.
currency_pair |  json | Two ISO 4217 format concatenated (e.g. EURCHF).
client_id  |  json | Registered contact for the account (unique identified available on request).


#Error Codes

##High Level Error Codes

Codes  |Description
---------  | -----------
200 |Success
400 |Bad request
401 |Unauthorised/expired token 
404 |Not found
405 |Method not allowed
408 |Request timeout
412 |Precondition failed
429 |Too many requests
500 |Internal server error
503 |Service unavailable

#SDK

##Payment-Corner-SDK for PHP

###Requirements
 * PHP >= 7.0
 
###Installation
<pre>composer require accubits/payment-corner-sdk-php</pre>

The recommended way to install the Payment Corner SDK is with Composer. Composer is a dependency management tool for PHP 
that allows you to declare the dependencies your project needs and installs them into your project

````json
{
   "require": {
      "accubits/payment-corner-sdk-php": "^1.0"
   }
}
````

Alternatively, you can specify the Payment Corner SDK as a dependency in your project’s existing composer.json file:


````php
<?php

require __DIR__.'/vendor/autoload.php';
````

After installing, you need to require Composer’s autoloader:


You can find out more on how to install Composer, configure autoloading, and other
 best-practices for defining dependencies at [getcomposer.org](https://getcomposer.org/).


###Usage
> Usage Example

````````php
<?php
require __DIR__.'/vendor/autoload.php';

try{
    $paymentCorner = new PaymentCorner('user email','password','client_id',devMode);
    $transaction = new Transactions();
       $transaction->setCurrencyToBuy('USD');
       $transaction->setCurrencyToSell('GBP');
       $transaction->setAmount(150);
       $transaction->setSideOfFxTx('buy');
       $transaction->setFxTxGtc(true);
    $paymentCorner->fxTransaction($transaction);
}catch (PaymentCornerExceptions $exception){
    echo $exception->getMessage();

}

````````







	










