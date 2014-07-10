.PHONY: css serve

serve:
	bundle exec jekyll serve --watch

css:
	sass --watch sass:css
