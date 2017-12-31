require "bundler/setup"
Bundler.require :default
require "minitest/autorun"
require "minitest/pride"
require "time"

module TestGroupdate

  # second

  def test_gd_second_end_of_second
    assert_result_time :gd_second, "2013-05-03 00:00:00 UTC", "2013-05-03 00:00:00.999"
  end

  def test_gd_second_start_of_second
    assert_result_time :gd_second, "2013-05-03 00:00:01 UTC", "2013-05-03 00:00:01.000"
  end

  # minute

  def test_gd_minute_end_of_minute
    assert_result_time :gd_minute, "2013-05-03 00:00:00 UTC", "2013-05-03 00:00:59"
  end

  def test_gd_minute_start_of_minute
    assert_result_time :gd_minute, "2013-05-03 00:01:00 UTC", "2013-05-03 00:01:00"
  end

  # hour

  def test_gd_hour_end_of_hour
    assert_result_time :gd_hour, "2013-05-03 00:00:00 UTC", "2013-05-03 00:59:59"
  end

  def test_gd_hour_start_of_hour
    assert_result_time :gd_hour, "2013-05-03 01:00:00 UTC", "2013-05-03 01:00:00"
  end

  # day

  def test_gd_day_date
    assert_date :day, "2013-05-03", "2013-05-03"
  end

  def test_gd_day_time_end_of_day
    assert_time :day, "2013-05-02", "2013-05-03 06:59:59"
  end

  def test_gd_day_time_start_of_day_time
    assert_time :day, "2013-05-03", "2013-05-03 07:00:00"
  end

  def test_gd_day_utc_end_of_day
    assert_time_utc :day, "2013-05-03", "2013-05-03 23:59:59"
  end

  def test_gd_day_utc_start_of_day
    assert_time_utc :day, "2013-05-04", "2013-05-04 00:00:00"
  end

  # week

  def test_gd_week_date_end_of_week
    assert_date :week, "2013-03-18", "2013-03-24"
  end

  def test_gd_week_date_start_of_week
    assert_date :week, "2013-03-25", "2013-03-25"
  end

  def test_gd_week_time_end_of_week
    assert_time :week, "2013-03-04", "2013-03-11 06:59:59"
  end

  def test_gd_week_time_start_of_week
    assert_time :week, "2013-03-11", "2013-03-11 07:00:00"
  end

  def test_gd_week_utc_end_of_week
    assert_time_utc :week, "2013-03-18", "2013-03-24 23:59:59"
  end

  def test_gd_week_utc_start_of_week
    assert_time_utc :week, "2013-03-25", "2013-03-25 00:00:00"
  end

  # month

  def test_gd_month_date_end_of_month
    assert_date :month, "2013-05-01", "2013-05-31"
  end

  def test_gd_month_date_start_of_month
    assert_date :month, "2013-06-01", "2013-06-01"
  end

  def test_gd_month_time_end_of_month
    assert_time :month, "2013-05-01", "2013-06-01 06:59:59"
  end

  def test_gd_month_time_start_of_month
    assert_time :month, "2013-06-01", "2013-06-01 07:00:00"
  end

  def test_gd_month_utc_end_of_month
    assert_time_utc :month, "2013-05-01", "2013-05-31 23:59:59"
  end

  def test_gd_month_utc_start_of_month
    assert_time_utc :month, "2013-06-01", "2013-06-01 00:00:00"
  end

  # year

  def test_gd_year_date_end_of_year
    assert_date :year, "2013-01-01", "2013-12-31"
  end

  def test_gd_year_date_start_of_year
    assert_date :year, "2013-01-01", "2013-01-01"
  end

  def test_gd_year_time_end_of_year
    assert_time :year, "2013-01-01", "2014-01-01 07:59:59"
  end

  def test_gd_year_time_start_of_year
    assert_time :year, "2013-01-01", "2013-01-01 08:00:00"
  end

  def test_gd_year_utc_end_of_year
    assert_time_utc :year, "2013-01-01", "2013-12-31 23:59:59"
  end

  def test_gd_year_utc_start_of_year
    assert_time_utc :year, "2013-01-01", "2013-01-01 00:00:00"
  end

  # hour of day

  def test_gd_hour_of_day_end_of_hour
    assert_time_utc :hour_of_day, 0, "2013-01-01 00:59:59", false
  end

  def test_gd_hour_of_day_start_of_hour
    assert_time_utc :hour_of_day, 1, "2013-01-01 01:00:00", false
  end

  def test_gd_hour_of_day_end_of_hour_with_time_zone
    assert_time :hour_of_day, 0, "2013-01-01 08:59:59", false
  end

  def test_gd_hour_of_day_start_of_hour_with_time_zone
    assert_time :hour_of_day, 1, "2013-01-01 09:00:00", false
  end

  # day of week

  def test_gd_day_of_week_end_of_day
    assert_time_utc :day_of_week, 2, "2013-01-01 23:59:59", false
  end

  def test_gd_day_of_week_start_of_day
    assert_time_utc :day_of_week, 3, "2013-01-02 00:00:00", false
  end

  def test_gd_day_of_week_end_of_week_with_time_zone
    assert_time :day_of_week, 2, "2013-01-02 07:59:59", false
  end

  def test_gd_day_of_week_start_of_week_with_time_zone
    assert_time :day_of_week, 3, "2013-01-02 08:00:00", false
  end

  # helpers

  def assert_result_time(function, expected_str, time_str, time_zone = false)
    assert_result function, Time.parse(expected_str), time_str, time_zone
  end

  def assert_date(function, expected, time_str)
    expected = Date.parse(expected)
    assert_sql expected, "SELECT gd_#{function}('#{time_str}'::date)"
    assert_sql expected, "SELECT gd_#{function}('#{time_str}'::date, 'America/Los_Angeles')"
    assert_sql expected, "SELECT gd_period('#{function}', '#{time_str}'::date)"
    assert_sql expected, "SELECT gd_period('#{function}', '#{time_str}'::date, 'America/Los_Angeles')"
  end

  def assert_time(function, expected, time_str, period = true)
    expected = Date.parse(expected) if expected.is_a?(String)
    assert_sql expected, "SELECT gd_#{function}('#{time_str}'::timestamp)"
    assert_sql expected, "SELECT gd_#{function}('#{time_str}'::timestamptz)"
    assert_sql expected, "SELECT gd_#{function}('#{time_str}'::timestamp, 'America/Los_Angeles')"
    assert_sql expected, "SELECT gd_#{function}('#{time_str}'::timestamptz, 'America/Los_Angeles')"
    if period
      assert_sql expected, "SELECT gd_period('#{function}', '#{time_str}'::timestamp)"
      assert_sql expected, "SELECT gd_period('#{function}', '#{time_str}'::timestamptz)"
      assert_sql expected, "SELECT gd_period('#{function}', '#{time_str}'::timestamp, 'America/Los_Angeles')"
      assert_sql expected, "SELECT gd_period('#{function}', '#{time_str}'::timestamptz, 'America/Los_Angeles')"
    end
  end

  def assert_time_utc(function, expected, time_str, period = true)
    expected = Date.parse(expected) if expected.is_a?(String)
    assert_sql expected, "SELECT gd_#{function}('#{time_str}'::timestamp, 'Etc/UTC')"
    assert_sql expected, "SELECT gd_#{function}('#{time_str}'::timestamptz, 'Etc/UTC')"
    if period
      assert_sql expected, "SELECT gd_period('#{function}', '#{time_str}'::timestamp, 'Etc/UTC')"
      assert_sql expected, "SELECT gd_period('#{function}', '#{time_str}'::timestamptz, 'Etc/UTC')"
    end
  end

  def assert_sql(expected, sql)
    assert_equal [[expected]], conn.query(sql).map(&:values)
  end

end
