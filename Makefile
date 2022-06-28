# SPDX-License-Identifier: MIT
KEN_ALL_ZIP = ken_all.zip
JIGYOSYO_ZIP = jigyosyo.zip

KEN_ALL = KEN_ALL.CSV
JIGYOSYO = JIGYOSYO.CSV

.PHONY: all
all: $(KEN_ALL) $(JIGYOSYO)

.PHONY: clean
clean:
	-$(RM) $(KEN_ALL_ZIP) $(JIGYOSYO_ZIP)

.PHONY: update
update: clean
	$(MAKE) all

$(KEN_ALL_ZIP):
	curl -sO https://www.post.japanpost.jp/zipcode/dl/kogaki/zip/ken_all.zip

$(KEN_ALL): $(KEN_ALL_ZIP)
	unzip -o -q $<

$(JIGYOSYO_ZIP):
	curl -sO https://www.post.japanpost.jp/zipcode/dl/jigyosyo/zip/jigyosyo.zip

$(JIGYOSYO): $(JIGYOSYO_ZIP)
	unzip -o -q $<
