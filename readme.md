# Jekyll posts in your personal agenda

This gem provides a generator for [Jekyll](https://jekyllrb.com/) to turn posts into a RFC 5545 compliant `ics` file using the [icalendar](https://github.com/icalendar/icalendar) library. This allows you to generate a feed that you can subscribe to with your calendar application. You can view compatible posts straight in your agenda. 

## Features

todo

## Installation

todo

## Development

Assuming that you have [Rake](https://ruby.github.io/rake/) and [Ruby](https://www.ruby-lang.org/en/) installed then you can use the following command to build the gem and install it locally:

```bash
rake install
```

You can then reference the gem in the `Gemfile` of a local [Jekyll](https://jekyllrb.com/) project. Install and/or update the gems of your project. You can verify the project is referring to your build by typing `bundle show jekyll-icalendar-feed`. The directory should the contents of the `.gem` file that you build and installed earlier.

## Technologies

- [Ruby](https://www.ruby-lang.org/en/)
- [Rake](https://ruby.github.io/rake/): Used for automating local development

### Ruby gems

- [Jekyll](https://jekyllrb.com/)
- [iCalendar](https://github.com/icalendar/icalendar)

## References

- [iCalendar (RFC 5545)](https://www.rfc-editor.org/rfc/rfc5545)
- [jCal (RFC 7265)](https://www.rfc-editor.org/rfc/rfc7265)
- [iCalendar validator](https://icalendar.org/validator.html#results)

### Related Jekyll plugins

- [Atom (RSS-like) feed](https://github.com/jekyll/jekyll-feed)
