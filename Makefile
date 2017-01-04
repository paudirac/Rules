.PHONY: test
test:
		carton exec prove -I local -I src t/Rules.t
