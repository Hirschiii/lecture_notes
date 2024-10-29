# Directories
# SRC_DIRS := physik politik seminarfach wun
SRC_DIRS := physik englisch wun deutsch how_to seminarfach informatik mathe politik
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
# AUFGABEN_SRCS := $(foreach dir, $(SRC_DIRS), $(wildcard $(SRC_BASE_DIR)/$(dir)/aufgaben/*.tex))
# AUFGABEN_SRCS := $(wildcard $(addprefix $(SRC_BASE_DIR)/, $(addsuffix /*.tex, $(SRC_DIRS)/aufgaben)))
AUFGABEN_SRCS := $(wildcard $(addprefix $(SRC_BASE_DIR)/, $(addsuffix /aufgaben/*.tex, $(SRC_DIRS))))
# AUFGABEN_SRCS := $(wildcard $(addsuffix /aufgaben/*.tex, $(PRE_SRC)/$(SRC_DIRS)))
# POSTER_SRCS := $(wildcard $(addsuffix /poster/*.tex, $(SRC_DIRS)))
# PRESENTATION_SRCS := $(wildcard $(addsuffix /presentation/*.tex, $(SRC_DIRS)))

# Generate output file names
OUTPUTS_UNDERRICHT := $(foreach dir, $(SRC_DIRS), $(OUTPUT_DIR)/$(dir)/unterricht.pdf)
OUTPUTS_WISSEN := $(foreach dir, $(SRC_DIRS), $(OUTPUT_DIR)/$(dir)/wissen.pdf)
# OUTPUTS_AUFGABEN := $(AUFGABEN_SRCS:$(SRC_BASE_DIR)/%.tex=$(OUTPUT_DIR)/%.pdf)
OUTPUTS_AUFGABEN := $(AUFGABEN_SRCS:$(SRC_BASE_DIR)/%.tex=$(OUTPUT_DIR)/%.pdf)
# OUTPUTS_POSTER := $(POSTER_SRCS:%.tex=$(OUTPUT_DIR)/%.pdf)
# OUTPUTS_PRESENTATION := $(PRESENTATION_SRCS:%.tex=$(OUTPUT_DIR)/%.pdf)

# All targets
# all: $(OUTPUTS_UNTERRICHT) $(OUTPUTS_AUFGABEN) $(OUTPUTS_POSTER) $(OUTPUTS_PRESENTATION)
# all: $(OUTPUTS_UNTERRICHT) $(OUTPUTS_AUFGABEN) 
all: $(OUTPUTS_UNDERRICHT) $(OUTPUTS_AUFGABEN) $(OUTPUTS_WISSEN)

# Rule to compile all unterricht files into a single PDF per directory
# $(TEX) --mode=$(MODE_UNTERRICHT) --subject=$(FILE_SUBJECT) --result="unterricht-$(SUBJECT)" prd_document.tex &> /dev/null

FILE_SUBJECT=$(word 2,$(subst /, ,$<))
$(OUTPUT_DIR)/%/unterricht.pdf: $(SRC_BASE_DIR)/%/unterricht/*.tex
	@echo "Rule matched for unterricht: Target=$@, Source=$<"
	$(TEX) --mode=$(MODE_UNTERRICHT) --path=$(dir $<) --arguments=subject=$(FILE_SUBJECT),title="Unterricht - $(FILE_SUBJECT)" --result="unterricht-$(FILE_SUBJECT)" prd_document.tex &> /dev/null
	@mkdir -p $(OUTPUT_DIR)/$(FILE_SUBJECT)/
	@mv unterricht-$(FILE_SUBJECT).pdf $(OUTPUT_DIR)/$(FILE_SUBJECT)/unterricht.pdf

$(OUTPUT_DIR)/%/wissen.pdf: $(SRC_BASE_DIR)/%/wissen/*.tex
	@echo "Rule matched for wissen: Target=$@, Source=$<"
	$(TEX) --mode=$(MODE_WISSEN) --path=$(dir $<) --arguments=subject=$(FILE_SUBJECT),title="Wissen - $(FILE_SUBJECT)" --result="wissen-$(FILE_SUBJECT)" prd_document.tex &> /dev/null
	@mkdir -p $(OUTPUT_DIR)/$(FILE_SUBJECT)/
	@mv wissen-$(FILE_SUBJECT).pdf $(OUTPUT_DIR)/$(FILE_SUBJECT)/wissen.pdf

# Rule to compile individual aufgaben files
# $(OUTPUTS_AUFGABEN): $(AUFGABEN_SRCS)
FILE_NAME=$(word 4,$(subst /, ,$<))
$(OUTPUT_DIR)/%.pdf: $(SRC_BASE_DIR)/%.tex
	@echo "Compiling aufgabe: Target=$@, Source=$<"
	@mkdir -p $(dir $@)
	$(TEX) --mode=$(MODE_AUFGABEN) --path=$< --arguments=subject=$(FILE_SUBJECT),title="Aufgabe - $(FILE_SUBJECT)" --result="aufgaben-$(FILE_SUBJECT)" prd_document.tex &> /dev/null
	@mv aufgaben-$(FILE_SUBJECT).pdf $(OUTPUT_DIR)/$(FILE_SUBJECT)/aufgaben/$(basename $(notdir $<)).pdf

# Rule to compile individual aufgaben, poster, and presentation files
# $(OUTPUT_DIR)/%.pdf: %.tex
# 	mkdir -p $(dir $@)
# 	$(TEX) --mode=$(MODE_$*) --result=$(notdir $@) $(PRODUCT_$*) $<

# Clean up
clean:
	context --purgeall &> /dev/null

.PHONY: all clean
