# ZionMetrics
[![Build Status](https://travis-ci.org/victorspringer/zionMetrics.svg?branch=master)](https://travis-ci.org/victorspringer/zionMetrics)

This is an under development API built with Elixir and Phoenix Framework.

The purpose of this API is to allow you to generate custom metrics of your web application by catching custom events of users navigation.

Feedbacks and pull requests are very welcome!

## Getting Started

First of all, you must have MySQL installed and change the database connection settings accordingly to your own configuration at `/config`.

To start the app:

  * Install dependencies with `mix deps.get`
  * Create and migrate the database with `mix ecto.create && mix ecto.migrate`
  * Start Phoenix endpoint with `mix phoenix.server`

Now you can visit [`localhost:4000`](http://localhost:4000) from your browser.

Ready to run in production? Please [check the deployment guides](http://www.phoenixframework.org/docs/deployment).

## Data insertion format
```
const xhr = new XMLHttpRequest();
xhr.open('POST', 'http://localhost:4000/events', true);
xhr.setRequestHeader('Content-Type', 'application/json');
xhr.send(JSON.stringify({
  event: {
    project:  'zion',
    version:  'dev',
    brand:    'americanas',
    source:   'teste',
    side:     'local',
    channel:  'channel',
    device:   'mobile',
    route:    '/teste',
    type:     'aggregation:click',
    value:    '1'
  }
}));
```