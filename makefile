# Directories
# SRC_DIRS := physik politik seminarfach wun
SRC_DIRS := physik englisch wun deutsch how_to seminarfach informatik mathe politik sport
SRC_BASE_DIR := notes
OUTPUT_DIR := out

# Tools and flags
TEX := context
PRODUCT_UNTERRICHT := prd_document.tex
PRODUCT_WISSEN := prd_document.tex
PRODUCT_AUFGABEN := prd_document.tex
# PRODUCT_POSTER := prd_poster.tex
# PRODUCT_PRESENTATION := prd_presentation.tex

# Modes
MODE_UNTERRICHT := multiple
MODE_WISSEN := multiple
MODE_AUFGABEN := single
MODE_POSTER := single
MODE_PRESENTATION := single

# Find all .tex files
UNTERRICHT_SRCS := $(foreach dir, $(SRC_DIRS), $(wildcard $(SRC_BASE_DIR)/$(dir)/unterricht/*.tex))
WISSEN_SRCS := $(foreach dir, $(SRC_DIRS), $(wildcard $(SRC_BASE_DIR)/$(dir)/wissen/*.tex))
AUFGABEN_SRCS1 := $(wildcard $(addprefix $(SRC_BASE_DIR)/, $(addsuffix /aufgaben/*.tex, $(SRC_DIRS))))
AUFGABEN_SRCS2 := $(wildcard $(addprefix $(SRC_BASE_DIR)/, $(addsuffix /unterricht/*.tex, $(SRC_DIRS))))
AUFGABEN_SRCS3 := $(wildcard $(addprefix $(SRC_BASE_DIR)/, $(addsuffix /wissen/*.tex, $(SRC_DIRS))))
AUFGABEN_SRCS := $(AUFGABEN_SRCS1) $(AUFGABEN_SRCS2) $(AUFGABEN_SRCS3)

# Generate output file names
OUTPUTS_UNDERRICHT := $(foreach dir, $(SRC_DIRS), $(OUTPUT_DIR)/$(dir)/unterricht.pdf)
OUTPUTS_WISSEN := $(foreach dir, $(SRC_DIRS), $(OUTPUT_DIR)/$(dir)/wissen.pdf)
OUTPUTS_AUFGABEN := $(AUFGABEN_SRCS:$(SRC_BASE_DIR)/%.tex=$(OUTPUT_DIR)/%.pdf)

# All targets
# all: $(OUTPUTS_UNDERRICHT) $(OUTPUTS_AUFGABEN) $(OUTPUTS_WISSEN)
# Aufgaben (Singles)
# all: $(OUTPUTS_AUFGABEN)

SINGLE ?= 0

# Abhängig vom Wert von SINGLE wird das all-Target definiert
ifeq ($(SINGLE), 1)
all: $(OUTPUTS_AUFGABEN)
else
all: $(OUTPUTS_UNDERRICHT) $(OUTPUTS_AUFGABEN) $(OUTPUTS_WISSEN)
endif

# Neues Target, das make erneut mit SINGLE=1 aufruft
single:
	$(MAKE) SINGLE=1

# Rule to compile all unterricht files into a single PDF per directory
# $(TEX) --mode=$(MODE_UNTERRICHT) --subject=$(FILE_SUBJECT) --result="unterricht-$(SUBJECT)" prd_document.tex

FILE_SUBJECT=$(word 2,$(subst /, ,$<))
$(OUTPUT_DIR)/%/unterricht.pdf: $(SRC_BASE_DIR)/%/unterricht/*.tex
	@echo "Rule matched for unterricht: Target=$@, Source=$<"
	$(TEX) --mode=$(MODE_UNTERRICHT) --path=$(dir $<) --arguments=subject=$(FILE_SUBJECT),title="Unterricht - $(FILE_SUBJECT)" --result="unterricht-$(FILE_SUBJECT)" prd_document.tex
	@mkdir -p $(OUTPUT_DIR)/$(FILE_SUBJECT)/
	@mv unterricht-$(FILE_SUBJECT).pdf $(OUTPUT_DIR)/$(FILE_SUBJECT)/unterricht.pdf

$(OUTPUT_DIR)/%/wissen.pdf: $(SRC_BASE_DIR)/%/wissen/*.tex
	@echo "Rule matched for wissen: Target=$@, Source=$<"
	$(TEX) --mode=$(MODE_WISSEN) --path=$(dir $<) --arguments=subject=$(FILE_SUBJECT),title="Wissen - $(FILE_SUBJECT)" --result="wissen-$(FILE_SUBJECT)" prd_document.tex
	@mkdir -p $(OUTPUT_DIR)/$(FILE_SUBJECT)/
	@mv wissen-$(FILE_SUBJECT).pdf $(OUTPUT_DIR)/$(FILE_SUBJECT)/wissen.pdf

# Rule to compile individual aufgaben files
# $(OUTPUTS_AUFGABEN): $(AUFGABEN_SRCS)
FILE_NAME=$(word 4,$(subst /, ,$<))
FILE_DIR=$(word 3,$(subst /, ,$<))
$(OUTPUT_DIR)/%.pdf: $(SRC_BASE_DIR)/%.tex
	@echo "Compiling $(FILE_DIR): Target=$@, Source=$<"
	@mkdir -p $(dir $@)
	$(TEX) --mode=$(MODE_AUFGABEN) --path=$< --arguments=subject=$(FILE_SUBJECT),title="Aufgabe - $(FILE_SUBJECT)" --result="aufgaben-$(FILE_SUBJECT)" prd_document.tex
	mv aufgaben-$(FILE_SUBJECT).pdf $(OUTPUT_DIR)/$(FILE_SUBJECT)/$(FILE_DIR)/$(basename $(notdir $<)).pdf

# Rule to compile individual aufgaben, poster, and presentation files
# $(OUTPUT_DIR)/%.pdf: %.tex
# 	mkdir -p $(dir $@)
# 	$(TEX) --mode=$(MODE_$*) --result=$(notdir $@) $(PRODUCT_$*) $<

# Clean up
clean:
	context --purgeall

.PHONY: all clean
