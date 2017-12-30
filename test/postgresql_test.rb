require_relative "test_helper"

class TestPostgresql < Minitest::Test
  include TestGroupdate

  def conn
    @@conn ||=
      begin
        conn = PG.connect(dbname: "groupdate_test")
        conn.query File.read("uninstall_postgresql.sql")
        conn.query File.read("postgresql.sql")
        conn.query "SET time zone 'UTC'"
        conn.type_map_for_results = PG::BasicTypeMapForResults.new(conn)
        conn.query <<-SQL
CREATE OR REPLACE FUNCTION gd_time_zone()
  RETURNS text AS
$$
  SELECT 'America/Los_Angeles';
$$
  LANGUAGE SQL IMMUTABLE;
        SQL

        conn.query <<-SQL
CREATE OR REPLACE FUNCTION gd_week_start()
  RETURNS int AS
$$
  SELECT 0;
$$
  LANGUAGE SQL IMMUTABLE;
        SQL
        conn
      end
  end

  def assert_result(function, expected, time_str, time_zone = false)
    tz_str = time_zone ? ", 'America/Los_Angeles'" : ""
    assert_sql expected, "SELECT #{function}('#{time_str}'::timestamp#{tz_str})"
    assert_sql expected, "SELECT #{function}('#{time_str}'::timestamptz#{tz_str})"
  end

end
