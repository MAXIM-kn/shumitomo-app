wd = ["日", "月", "火", "水", "木", "金", "土"]
time = Time.now
Time::DATE_FORMATS[:datetime_jp] = time.strftime("%m/%d %H:%M (#{wd[time.wday]})")