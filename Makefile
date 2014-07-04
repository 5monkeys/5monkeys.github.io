.PHONY: css

serve:
	bundle exec jekyll serve --watch

css:
	sass --watch sass:css
