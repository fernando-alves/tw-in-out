install: check.postgres
	@bundle
	@pg_ctl -D /usr/local/var/postgres -l logfile start
	@bundle exec rake db:setup
	@pg_ctl -D /usr/local/var/postgres stop -s -m fast

run:
	foreman start -f Procfile.dev

check.postgres:
	@which pg_ctl > /dev/null || \
	(echo '\n> Please install PostgreSQL!\n' && false)
