FILE := expose_kappelmann
OUT  := build

.PHONY: pdf
pdf:
	latexmk -interaction=nonstopmode -outdir=$(OUT) -pdf -shell-escape -halt-on-error $(FILE)

.PHONY: watch
watch:
	latexmk -interaction=nonstopmode -outdir=$(OUT) -pdf -shell-escape -pvc -halt-on-error $(FILE)

.PHONY: start
start:
	gnome-terminal -x "bash" -c "make watch" &

.PHONY: clean
clean:
	rm -rf $(filter-out $(OUT)/$(FILE).pdf, $(wildcard $(OUT)/*))

.PHONY: purge
purge:
	rm -rf $(OUT)

.PHONY: open
open:
	xdg-open $(OUT)/$(FILE).pdf
