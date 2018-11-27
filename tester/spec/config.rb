# Modify these as needed

HTTP_SUCCESS = 200
HTTP_UNPROCESSABLE = 422
BASE_URL = "http://#{ENV.fetch('SOLUTION_HOST')}:3000"
RESET_DB_COMMAND = "pg_restore --clean -h #{ENV.fetch('POSTGRES_HOST')} -U #{ENV.fetch('POSTGRES_USER')} -d #{ENV.fetch('POSTGRES_DB')} /app/glexport_development.psql.dump"

YALMART_ID = 2
DOSTCO_ID = 3
