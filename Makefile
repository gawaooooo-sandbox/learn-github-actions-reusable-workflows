# OS detection
UNAME_S := $(shell uname -s)
ifeq ($(UNAME_S),Darwin)
    SED_INPLACE := sed -i ''
else
    SED_INPLACE := sed -i
endif

DOCS_DIR := ./docs
WORKFLOWS_DIR := ./.github/workflows
ACTDOCS_IMAGE := ghcr.io/tmknom/actdocs

# 処理対象のファイルリスト（_internal から始まるファイルを除外）
WORKFLOW_FILES := $(shell find $(WORKFLOWS_DIR) -name '*.yml' -not -name '_internal*')
DOC_FILES := $(patsubst $(WORKFLOWS_DIR)/%.yml,$(DOCS_DIR)/%.md,$(WORKFLOW_FILES))

.PHONY: docs
docs: create_docs_dir generate_docs remove_pre_tags ## generate docs for all workflows

.PHONY: create_docs_dir
create_docs_dir:
	mkdir -p $(DOCS_DIR)

.PHONY: generate_docs
generate_docs: create_docs_dir
	@echo "Generating all docs"
	@for workflow in $(WORKFLOW_FILES); do \
		output="$(DOCS_DIR)/$$(basename $$workflow .yml).md"; \
		echo "Generating docs for $$workflow"; \
		docker run --rm -v "$$(pwd):/work" -w "/work" \
		$(ACTDOCS_IMAGE) inject --omit --file=$$output $$workflow; \
	done

.PHONY: remove_pre_tags
remove_pre_tags:
	@echo "Removing <pre> tags"
	@for file in $(DOC_FILES); do \
		$(SED_INPLACE) 's/<pre>//g; s/<\/pre>//g' $$file; \
	done

.PHONY: list
list: ## List all workflow files and their corresponding doc files
	@echo "Workflow files:"
	@echo $(WORKFLOW_FILES) | tr ' ' '\n'
	@echo "\nDoc files:"
	@echo $(DOC_FILES) | tr ' ' '\n'

.PHONY: doc
doc: create_docs_dir generate_single_doc remove_single_pre_tags ## Generate doc for a specific workflow. Usage: make doc WORKFLOW=<workflow-name>
	@echo "Document generation and conversion complete for $(WORKFLOW)"

.PHONY: generate_single_doc
generate_single_doc:
	@if [ -z "$(WORKFLOW)" ]; then \
		echo "Error: WORKFLOW is not set. Usage: make doc WORKFLOW=<workflow-name>"; \
		exit 1; \
	fi
	@if [ ! -f "$(WORKFLOWS_DIR)/$(WORKFLOW).yml" ]; then \
		echo "Error: $(WORKFLOW).yml not found"; \
		exit 1; \
	fi
	@echo "Generating doc for $(WORKFLOW)"
	@docker run --rm -v "$$(pwd):/work" -w "/work" \
	$(ACTDOCS_IMAGE) inject --omit --file=$(DOCS_DIR)/$(WORKFLOW).md $(WORKFLOWS_DIR)/$(WORKFLOW).yml

.PHONY: remove_single_pre_tags
remove_single_pre_tags:
	@echo "Removing <pre> tags for $(WORKFLOW)"
	@$(SED_INPLACE) 's/<pre>//g; s/<\/pre>//g' $(DOCS_DIR)/$(WORKFLOW).md
