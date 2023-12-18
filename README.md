# code coverage reproduction

Reproduction for https://github.com/django/channels/issues/2063.

I tried also adding different concurrency options in `.coveragerc` but was unable to find a setup that made coverage get collected.

## Reproduction

Create a `virtualenv`

```
pyenv virtualenv 3.10 coverage_repro_small
pyenv activate coverage_repro_small
```

Install dependencies

```
pip install requirements.txt
playwright install
playwright install-deps chromium
```

Start database. Channels server test case does not allow an in-memory database, so we must spin up a postgres instance.
```
docker compose up -d
```

Run tests - Live server test case:

```
sh coverage-live.sh
open htmlcov/index.html
# If you navigate to `coverage_repro_small/views.py`, you should see 100% coverage.
```

Run tests - Channels server test case:

```
sh coverage-channels.sh
open htmlcov/index.html
# If you navigate to `coverage_repro_small/views.py`, you should see 50% coverage.
```

## Misc

```
python manage.py runserver 8080
```