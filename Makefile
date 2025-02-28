all: draft-ietf-rfc9280-updates.txt draft-ietf-rfc9280-updates.html

.PRECIOUS: %.xml

%.txt: %.xml
	xml2rfc $< --text

%.html: %.xml
	xml2rfc $< --html

%.xml: %.mkd
	kramdown-rfc $< >$@.new
	mv $@.new $@
