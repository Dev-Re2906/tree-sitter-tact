package tree_sitter_tact_test

import (
	"testing"

	tree_sitter "github.com/tree-sitter/go-tree-sitter"
	tree_sitter_tact "github.com/tact-lang/tree-sitter-tact/bindings/go"
)

func TestCanLoadGrammar(t *testing.T) {
	language := tree_sitter.NewLanguage(tree_sitter_tact.Language())
	if language == nil {
		t.Errorf("Error loading Tact grammar")
	}
}
