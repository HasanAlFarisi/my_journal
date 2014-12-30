# Options
Delayed::Worker.destroy_failed_jobs = true
Delayed::Worker.sleep_delay = 2
Delayed::Worker.max_attempts = 2
Delayed::Worker.max_run_time = 2.hour
Delayed::Worker.delay_jobs = !Rails.env.test?