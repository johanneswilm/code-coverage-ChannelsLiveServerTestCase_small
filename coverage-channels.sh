coverage erase

COVERAGE_PROCESS_START=./.coveragerc coverage run --source='.' manage.py test --tag=channels-live-server-test-case --parallel --noinput

coverage combine

coverage html