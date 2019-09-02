# Decidim::BudgetsEnhanced

Enhanced Budget component .

[![CircleCI](https://circleci.com/gh/OpenSourcePolitics/decidim-module-budgets_enhanced.svg?style=svg)](https://circleci.com/gh/OpenSourcePolitics/decidim-module-budgets_enhanced)
[![Maintainability](https://api.codeclimate.com/v1/badges/687f9793705a36d62366/maintainability)](https://codeclimate.com/github/OpenSourcePolitics/decidim-module-budgets_enhanced/maintainability)
[![Test Coverage](https://api.codeclimate.com/v1/badges/687f9793705a36d62366/test_coverage)](https://codeclimate.com/github/OpenSourcePolitics/decidim-module-budgets_enhanced/test_coverage)
[![Crowdin](https://badges.crowdin.net/budgets-enhanced/localized.svg)](https://crowdin.com/project/budgets-enhanced)

## Usage

BudgetsEnhanced will be available as a Component for a Participatory
Space.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'decidim-budgets_enhanced'
```

And then execute:

```bash
$ bundle
$ bundle exec rake decidim_budgets_enhanced:install:migrations
$ bundle exec rake db:migrate
```

## Uninstall

Remove this line from your application's Gemfile:

```ruby
gem 'decidim-budgets_enhanced'
```

And then execute:

```bash
$ bundle
$ bundle exec rake db:migrate SCOPE=decidim_budgets_enhanced VERSION=0
```

## Contributing

See [Decidim](https://github.com/decidim/decidim).

## License

This engine is distributed under the GNU AFFERO GENERAL PUBLIC LICENSE.
