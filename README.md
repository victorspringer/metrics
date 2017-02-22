# ZionMetrics

To start your Phoenix app:

  * Install dependencies with `mix deps.get`
  * Create and migrate your database with `mix ecto.create && mix ecto.migrate`
  * Start Phoenix endpoint with `mix phoenix.server`

Now you can visit [`localhost:4000`](http://localhost:4000) from your browser.

Ready to run in production? Please [check our deployment guides](http://www.phoenixframework.org/docs/deployment).

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