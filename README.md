## Rails 101s Practice

This project is my practice of rails 101s. I tried to reproduce rails 101s
website without reading tutorial and used some tips from rails 102 and rails
best practices.


## Difference from original rails 101s

* Use `.includes` to prevent n + 1 queries
* Add `dependent: :destroy` into `group_users` model to prevent useless entries
  exist when group or user deleted
* Restrict auto-generated routes to save memory usage
* Add db index into `group_users` and `posts` models to speed-up query
* Do `reset_counter` when adding `posts_count` into groups
* Use heroku to deploy


## Demo
[My Rails 101s Practice Hosted on Heroku.](https://calm-mesa-6313.herokuapp.com)
