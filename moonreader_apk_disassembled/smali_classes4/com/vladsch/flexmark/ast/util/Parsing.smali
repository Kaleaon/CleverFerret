.class public Lcom/vladsch/flexmark/ast/util/Parsing;
.super Ljava/lang/Object;
.source "Parsing.java"


# static fields
.field public static final INTELLIJ_DUMMY_IDENTIFIER:Ljava/lang/String; = "\u001f"

.field public static final INTELLIJ_DUMMY_IDENTIFIER_CHAR:C = '\u001f'


# instance fields
.field public final ADDITIONAL_CHARS:Ljava/lang/String;

.field public final ASCII_CLOSE_PUNCTUATION:Ljava/lang/String;

.field public final ASCII_OPEN_PUNCTUATION:Ljava/lang/String;

.field public final ASCII_PUNCTUATION:Ljava/lang/String;

.field public final ATTRIBUTE:Ljava/lang/String;

.field public final ATTRIBUTENAME:Ljava/lang/String;

.field public final ATTRIBUTEVALUE:Ljava/lang/String;

.field public final ATTRIBUTEVALUESPEC:Ljava/lang/String;

.field public final AUTOLINK:Ljava/util/regex/Pattern;

.field public final CDATA:Ljava/lang/String;

.field public final CLOSETAG:Ljava/lang/String;

.field public final CODE_BLOCK_INDENT:I

.field public final DECLARATION:Ljava/lang/String;

.field public final DOUBLEQUOTEDVALUE:Ljava/lang/String;

.field public final EMAIL_AUTOLINK:Ljava/util/regex/Pattern;

.field public final ENTITY:Ljava/lang/String;

.field public final ENTITY_HERE:Ljava/util/regex/Pattern;

.field public final EOL:Ljava/lang/String;

.field public final ESCAPABLE:Ljava/util/regex/Pattern;

.field public final ESCAPED_CHAR:Ljava/lang/String;

.field public final EXCLUDED_0_TO_SPACE:Ljava/lang/String;

.field public final FINAL_SPACE:Ljava/util/regex/Pattern;

.field public final HTMLCOMMENT:Ljava/lang/String;

.field public final HTMLTAG:Ljava/lang/String;

.field public final HTML_TAG:Ljava/util/regex/Pattern;

.field public final INVALID_LINK_CHARS:Ljava/lang/String;

.field public final IN_BRACES_W_SP:Ljava/lang/String;

.field public final IN_MATCHED_PARENS_NOSP:Ljava/lang/String;

.field public final IN_MATCHED_PARENS_W_SP:Ljava/lang/String;

.field public final IN_PARENS_NOSP:Ljava/lang/String;

.field public final IN_PARENS_W_SP:Ljava/lang/String;

.field public final LINE_END:Ljava/util/regex/Pattern;

.field public final LINK_DESTINATION:Ljava/util/regex/Pattern;

.field public final LINK_DESTINATION_ANGLES:Ljava/util/regex/Pattern;

.field public final LINK_DESTINATION_MATCHED_PARENS:Ljava/util/regex/Pattern;

.field public final LINK_LABEL:Ljava/util/regex/Pattern;

.field public final LINK_TITLE:Ljava/util/regex/Pattern;

.field public final LINK_TITLE_STRING:Ljava/lang/String;

.field public final LIST_ITEM_MARKER:Ljava/util/regex/Pattern;

.field public final OPENTAG:Ljava/lang/String;

.field public final PROCESSINGINSTRUCTION:Ljava/lang/String;

.field public final PUNCTUATION:Ljava/util/regex/Pattern;

.field public final PUNCTUATION_CLOSE:Ljava/util/regex/Pattern;

.field public final PUNCTUATION_CLOSE_ONLY:Ljava/util/regex/Pattern;

.field public final PUNCTUATION_ONLY:Ljava/util/regex/Pattern;

.field public final PUNCTUATION_OPEN:Ljava/util/regex/Pattern;

.field public final PUNCTUATION_OPEN_ONLY:Ljava/util/regex/Pattern;

.field public final REG_CHAR:Ljava/lang/String;

.field public final REG_CHAR_PARENS:Ljava/lang/String;

.field public final REG_CHAR_SP:Ljava/lang/String;

.field public final REG_CHAR_SP_PARENS:Ljava/lang/String;

.field public final REST_OF_LINE:Ljava/util/regex/Pattern;

.field public final SINGLEQUOTEDVALUE:Ljava/lang/String;

.field public final SP:Ljava/util/regex/Pattern;

.field public final SPNI:Ljava/util/regex/Pattern;

.field public final SPNL:Ljava/util/regex/Pattern;

.field public final SPNL_URL:Ljava/util/regex/Pattern;

.field public final TAGNAME:Ljava/lang/String;

.field public final TICKS:Ljava/util/regex/Pattern;

.field public final TICKS_HERE:Ljava/util/regex/Pattern;

.field public final UNICODE_WHITESPACE_CHAR:Ljava/util/regex/Pattern;

.field public final UNQUOTEDVALUE:Ljava/lang/String;

.field public final WHITESPACE:Ljava/util/regex/Pattern;

.field public final WWW_AUTOLINK:Ljava/util/regex/Pattern;

.field public final htmlForTranslator:Z

.field public final intellijDummyIdentifier:Z

.field public final options:Lcom/vladsch/flexmark/util/options/DataHolder;

.field public final translationHtmlInlineTagPattern:Ljava/lang/String;


# direct methods
.method public constructor <init>(Lcom/vladsch/flexmark/util/options/DataHolder;)V
    .locals 23

    move-object/from16 v0, p0

    move-object/from16 v1, p1

    .line 94
    invoke-direct {v0}, Ljava/lang/Object;-><init>()V

    .line 95
    iput-object v1, v0, Lcom/vladsch/flexmark/ast/util/Parsing;->options:Lcom/vladsch/flexmark/util/options/DataHolder;

    .line 96
    sget-object v2, Lcom/vladsch/flexmark/parser/Parser;->INTELLIJ_DUMMY_IDENTIFIER:Lcom/vladsch/flexmark/util/options/DataKey;

    invoke-virtual {v2, v1}, Lcom/vladsch/flexmark/util/options/DataKey;->getFrom(Lcom/vladsch/flexmark/util/options/DataHolder;)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/lang/Boolean;

    invoke-virtual {v2}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v2

    iput-boolean v2, v0, Lcom/vladsch/flexmark/ast/util/Parsing;->intellijDummyIdentifier:Z

    .line 97
    sget-object v2, Lcom/vladsch/flexmark/parser/Parser;->HTML_FOR_TRANSLATOR:Lcom/vladsch/flexmark/util/options/DataKey;

    invoke-virtual {v2, v1}, Lcom/vladsch/flexmark/util/options/DataKey;->getFrom(Lcom/vladsch/flexmark/util/options/DataHolder;)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/lang/Boolean;

    invoke-virtual {v2}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v2

    iput-boolean v2, v0, Lcom/vladsch/flexmark/ast/util/Parsing;->htmlForTranslator:Z

    .line 98
    sget-object v3, Lcom/vladsch/flexmark/parser/Parser;->TRANSLATION_HTML_INLINE_TAG_PATTERN:Lcom/vladsch/flexmark/util/options/DataKey;

    invoke-virtual {v3, v1}, Lcom/vladsch/flexmark/util/options/DataKey;->getFrom(Lcom/vladsch/flexmark/util/options/DataHolder;)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/lang/String;

    iput-object v3, v0, Lcom/vladsch/flexmark/ast/util/Parsing;->translationHtmlInlineTagPattern:Ljava/lang/String;

    .line 100
    const-string v4, "(?:\r\n|\r|\n)"

    iput-object v4, v0, Lcom/vladsch/flexmark/ast/util/Parsing;->EOL:Ljava/lang/String;

    .line 101
    invoke-virtual {v0}, Lcom/vladsch/flexmark/ast/util/Parsing;->ADDITIONAL_CHARS()Ljava/lang/String;

    move-result-object v5

    iput-object v5, v0, Lcom/vladsch/flexmark/ast/util/Parsing;->ADDITIONAL_CHARS:Ljava/lang/String;

    .line 102
    invoke-virtual {v0}, Lcom/vladsch/flexmark/ast/util/Parsing;->EXCLUDED_0_TO_SPACE()Ljava/lang/String;

    move-result-object v6

    iput-object v6, v0, Lcom/vladsch/flexmark/ast/util/Parsing;->EXCLUDED_0_TO_SPACE:Ljava/lang/String;

    .line 104
    const-string v7, "\\\\[!\"#$%&\'()*+,./:;<=>?@\\[\\\\\\]^_`{|}~-]"

    iput-object v7, v0, Lcom/vladsch/flexmark/ast/util/Parsing;->ESCAPED_CHAR:Ljava/lang/String;

    .line 105
    new-instance v8, Ljava/lang/StringBuilder;

    const-string v9, "^\\[(?:[^\\\\\\[\\]]|"

    invoke-direct {v8, v9}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v8, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v9, "|\\\\){0,999}\\]"

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v8}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v8

    .line 106
    invoke-static {v8}, Ljava/util/regex/Pattern;->compile(Ljava/lang/String;)Ljava/util/regex/Pattern;

    move-result-object v8

    iput-object v8, v0, Lcom/vladsch/flexmark/ast/util/Parsing;->LINK_LABEL:Ljava/util/regex/Pattern;

    .line 107
    sget-object v8, Lcom/vladsch/flexmark/parser/Parser;->SPACE_IN_LINK_URLS:Lcom/vladsch/flexmark/util/options/DataKey;

    invoke-virtual {v8, v1}, Lcom/vladsch/flexmark/util/options/DataKey;->getFrom(Lcom/vladsch/flexmark/util/options/DataHolder;)Ljava/lang/Object;

    move-result-object v8

    check-cast v8, Ljava/lang/Boolean;

    invoke-virtual {v8}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v8

    const-string v9, "^(?:[<](?:[^<> \\t\\n\\\\\\x00]|"

    if-eqz v8, :cond_0

    new-instance v8, Ljava/lang/StringBuilder;

    invoke-direct {v8, v9}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v8, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v9, "|\\\\| (?![\"]))*[>])"

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v8}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v8

    .line 108
    invoke-static {v8}, Ljava/util/regex/Pattern;->compile(Ljava/lang/String;)Ljava/util/regex/Pattern;

    move-result-object v8

    goto :goto_0

    :cond_0
    new-instance v8, Ljava/lang/StringBuilder;

    invoke-direct {v8, v9}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v8, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v9, "|\\\\)*[>])"

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v8}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v8

    .line 109
    invoke-static {v8}, Ljava/util/regex/Pattern;->compile(Ljava/lang/String;)Ljava/util/regex/Pattern;

    move-result-object v8

    :goto_0
    iput-object v8, v0, Lcom/vladsch/flexmark/ast/util/Parsing;->LINK_DESTINATION_ANGLES:Ljava/util/regex/Pattern;

    .line 110
    new-instance v8, Ljava/lang/StringBuilder;

    const-string v9, "(?:\"("

    invoke-direct {v8, v9}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v8, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v9, "|[^\"\\x00])*\"|\'("

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v8, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v9, "|[^\'\\x00])*\'|\\(("

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v8, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v9, "|[^)\\x00])*\\))"

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v8}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v8

    iput-object v8, v0, Lcom/vladsch/flexmark/ast/util/Parsing;->LINK_TITLE_STRING:Ljava/lang/String;

    .line 115
    new-instance v9, Ljava/lang/StringBuilder;

    const-string v10, "^"

    invoke-direct {v9, v10}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v9, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v9}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v8

    invoke-static {v8}, Ljava/util/regex/Pattern;->compile(Ljava/lang/String;)Ljava/util/regex/Pattern;

    move-result-object v8

    iput-object v8, v0, Lcom/vladsch/flexmark/ast/util/Parsing;->LINK_TITLE:Ljava/util/regex/Pattern;

    .line 116
    new-instance v8, Ljava/lang/StringBuilder;

    const-string v9, "[^\\\\()"

    invoke-direct {v8, v9}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v8, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v11, "]"

    invoke-virtual {v8, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v8}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v8

    iput-object v8, v0, Lcom/vladsch/flexmark/ast/util/Parsing;->REG_CHAR:Ljava/lang/String;

    .line 117
    new-instance v12, Ljava/lang/StringBuilder;

    const-string v13, "[^\\\\"

    invoke-direct {v12, v13}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v12, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v12, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v12}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v12

    iput-object v12, v0, Lcom/vladsch/flexmark/ast/util/Parsing;->REG_CHAR_PARENS:Ljava/lang/String;

    .line 118
    new-instance v12, Ljava/lang/StringBuilder;

    invoke-direct {v12, v9}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v12, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v9, "]| (?!\")"

    invoke-virtual {v12, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v12}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v12

    iput-object v12, v0, Lcom/vladsch/flexmark/ast/util/Parsing;->REG_CHAR_SP:Ljava/lang/String;

    .line 119
    new-instance v14, Ljava/lang/StringBuilder;

    invoke-direct {v14, v13}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v14, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v14, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v14}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v9

    iput-object v9, v0, Lcom/vladsch/flexmark/ast/util/Parsing;->REG_CHAR_SP_PARENS:Ljava/lang/String;

    .line 120
    new-instance v9, Ljava/lang/StringBuilder;

    const-string v13, "\\(("

    invoke-direct {v9, v13}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v9, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const/16 v14, 0x7c

    invoke-virtual {v9, v14}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    invoke-virtual {v9, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v15, ")*\\)"

    invoke-virtual {v9, v15}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v9}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v9

    iput-object v9, v0, Lcom/vladsch/flexmark/ast/util/Parsing;->IN_PARENS_NOSP:Ljava/lang/String;

    .line 121
    new-instance v14, Ljava/lang/StringBuilder;

    invoke-direct {v14, v13}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v14, v12}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move/from16 v17, v2

    const/16 v2, 0x7c

    invoke-virtual {v14, v2}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    invoke-virtual {v14, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v14, v15}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v14}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v14

    iput-object v14, v0, Lcom/vladsch/flexmark/ast/util/Parsing;->IN_PARENS_W_SP:Ljava/lang/String;

    .line 122
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2, v13}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v2, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-object/from16 v18, v9

    const/16 v9, 0x7c

    invoke-virtual {v2, v9}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    invoke-virtual {v2, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2, v15}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    iput-object v2, v0, Lcom/vladsch/flexmark/ast/util/Parsing;->IN_MATCHED_PARENS_NOSP:Ljava/lang/String;

    .line 123
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2, v13}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v2, v12}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2, v9}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    invoke-virtual {v2, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2, v15}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    iput-object v2, v0, Lcom/vladsch/flexmark/ast/util/Parsing;->IN_MATCHED_PARENS_W_SP:Ljava/lang/String;

    .line 124
    new-instance v2, Ljava/lang/StringBuilder;

    const-string v9, "\\{\\{(?:[^{}\\\\"

    invoke-direct {v2, v9}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v2, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v9, "]| |\t)*\\}\\}"

    invoke-virtual {v2, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    iput-object v2, v0, Lcom/vladsch/flexmark/ast/util/Parsing;->IN_BRACES_W_SP:Ljava/lang/String;

    .line 125
    new-instance v9, Ljava/lang/StringBuilder;

    const-string v13, "^(?:"

    invoke-direct {v9, v13}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    sget-object v15, Lcom/vladsch/flexmark/parser/Parser;->PARSE_JEKYLL_MACROS_IN_URLS:Lcom/vladsch/flexmark/util/options/DataKey;

    .line 126
    invoke-virtual {v15, v1}, Lcom/vladsch/flexmark/util/options/DataKey;->getFrom(Lcom/vladsch/flexmark/util/options/DataHolder;)Ljava/lang/Object;

    move-result-object v15

    check-cast v15, Ljava/lang/Boolean;

    invoke-virtual {v15}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v15

    const-string v16, ""

    move-object/from16 v19, v14

    const-string v14, "|"

    if-eqz v15, :cond_1

    new-instance v15, Ljava/lang/StringBuilder;

    invoke-direct {v15}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v15, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v15, v14}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v15}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v15

    goto :goto_1

    :cond_1
    move-object/from16 v15, v16

    :goto_1
    invoke-virtual {v9, v15}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    sget-object v15, Lcom/vladsch/flexmark/parser/Parser;->SPACE_IN_LINK_URLS:Lcom/vladsch/flexmark/util/options/DataKey;

    .line 127
    invoke-virtual {v15, v1}, Lcom/vladsch/flexmark/util/options/DataKey;->getFrom(Lcom/vladsch/flexmark/util/options/DataHolder;)Ljava/lang/Object;

    move-result-object v15

    check-cast v15, Ljava/lang/Boolean;

    invoke-virtual {v15}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v15

    move/from16 v20, v15

    const-string v15, ")+|"

    move-object/from16 v21, v3

    const-string v3, "+|"

    move-object/from16 v22, v4

    const-string v4, "(?:"

    if-eqz v20, :cond_2

    move-object/from16 v20, v6

    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6, v4}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v6, v12}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v6, v15}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    goto :goto_2

    :cond_2
    move-object/from16 v20, v6

    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v6, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v6, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    :goto_2
    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v9, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v9, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v6, "|\\\\|"

    invoke-virtual {v9, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    sget-object v6, Lcom/vladsch/flexmark/parser/Parser;->SPACE_IN_LINK_URLS:Lcom/vladsch/flexmark/util/options/DataKey;

    .line 128
    invoke-virtual {v6, v1}, Lcom/vladsch/flexmark/util/options/DataKey;->getFrom(Lcom/vladsch/flexmark/util/options/DataHolder;)Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Ljava/lang/Boolean;

    invoke-virtual {v6}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v6

    if-eqz v6, :cond_3

    move-object/from16 v6, v19

    goto :goto_3

    :cond_3
    move-object/from16 v6, v18

    :goto_3
    invoke-virtual {v9, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v6, ")*"

    invoke-virtual {v9, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v9}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    .line 125
    invoke-static {v6}, Ljava/util/regex/Pattern;->compile(Ljava/lang/String;)Ljava/util/regex/Pattern;

    move-result-object v6

    iput-object v6, v0, Lcom/vladsch/flexmark/ast/util/Parsing;->LINK_DESTINATION:Ljava/util/regex/Pattern;

    .line 129
    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6, v13}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    sget-object v9, Lcom/vladsch/flexmark/parser/Parser;->PARSE_JEKYLL_MACROS_IN_URLS:Lcom/vladsch/flexmark/util/options/DataKey;

    .line 130
    invoke-virtual {v9, v1}, Lcom/vladsch/flexmark/util/options/DataKey;->getFrom(Lcom/vladsch/flexmark/util/options/DataHolder;)Ljava/lang/Object;

    move-result-object v9

    check-cast v9, Ljava/lang/Boolean;

    invoke-virtual {v9}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v9

    if-eqz v9, :cond_4

    new-instance v9, Ljava/lang/StringBuilder;

    invoke-direct {v9}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v9, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v9, v14}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v9}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    goto :goto_4

    :cond_4
    move-object/from16 v2, v16

    :goto_4
    invoke-virtual {v6, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    sget-object v2, Lcom/vladsch/flexmark/parser/Parser;->SPACE_IN_LINK_URLS:Lcom/vladsch/flexmark/util/options/DataKey;

    .line 131
    invoke-virtual {v2, v1}, Lcom/vladsch/flexmark/util/options/DataKey;->getFrom(Lcom/vladsch/flexmark/util/options/DataHolder;)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/lang/Boolean;

    invoke-virtual {v2}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v2

    if-eqz v2, :cond_5

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2, v4}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v2, v12}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2, v15}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    goto :goto_5

    :cond_5
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v2, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    :goto_5
    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v6, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v2, "|\\\\|\\(|\\))*"

    invoke-virtual {v6, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    .line 129
    invoke-static {v2}, Ljava/util/regex/Pattern;->compile(Ljava/lang/String;)Ljava/util/regex/Pattern;

    move-result-object v2

    iput-object v2, v0, Lcom/vladsch/flexmark/ast/util/Parsing;->LINK_DESTINATION_MATCHED_PARENS:Ljava/util/regex/Pattern;

    .line 133
    const-string v2, "<!---->|<!--(?:-?[^>-])(?:-?[^-])*-->"

    iput-object v2, v0, Lcom/vladsch/flexmark/ast/util/Parsing;->HTMLCOMMENT:Ljava/lang/String;

    .line 134
    const-string v3, "[<][?].*?[?][>]"

    iput-object v3, v0, Lcom/vladsch/flexmark/ast/util/Parsing;->PROCESSINGINSTRUCTION:Ljava/lang/String;

    .line 135
    new-instance v6, Ljava/lang/StringBuilder;

    const-string v7, "<![A-Z"

    invoke-direct {v6, v7}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v6, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v7, "]+\\s+[^>]*>"

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    iput-object v6, v0, Lcom/vladsch/flexmark/ast/util/Parsing;->DECLARATION:Ljava/lang/String;

    .line 136
    const-string v7, "<!\\[CDATA\\[[\\s\\S]*?\\]\\]>"

    iput-object v7, v0, Lcom/vladsch/flexmark/ast/util/Parsing;->CDATA:Ljava/lang/String;

    .line 137
    new-instance v8, Ljava/lang/StringBuilder;

    const-string v9, "&(?:#x[a-f0-9"

    invoke-direct {v8, v9}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v8, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v9, "]{1,8}|#[0-9]{1,8}|[a-z"

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v8, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v9, "][a-z0-9"

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v8, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v9, "]{1,31});"

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v8}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v8

    iput-object v8, v0, Lcom/vladsch/flexmark/ast/util/Parsing;->ENTITY:Ljava/lang/String;

    .line 139
    new-instance v9, Ljava/lang/StringBuilder;

    invoke-direct {v9, v10}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v9, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v9}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v8

    const/4 v9, 0x2

    invoke-static {v8, v9}, Ljava/util/regex/Pattern;->compile(Ljava/lang/String;I)Ljava/util/regex/Pattern;

    move-result-object v8

    iput-object v8, v0, Lcom/vladsch/flexmark/ast/util/Parsing;->ENTITY_HERE:Ljava/util/regex/Pattern;

    .line 140
    const-string v8, "\'!\"#\\$%&\\*\\+,\\-\\./:;=\\?@\\\\\\^_`\\|~"

    iput-object v8, v0, Lcom/vladsch/flexmark/ast/util/Parsing;->ASCII_PUNCTUATION:Ljava/lang/String;

    .line 141
    const-string v12, "\\(<\\[\\{"

    iput-object v12, v0, Lcom/vladsch/flexmark/ast/util/Parsing;->ASCII_OPEN_PUNCTUATION:Ljava/lang/String;

    .line 142
    const-string v13, "\\)>\\]\\}"

    iput-object v13, v0, Lcom/vladsch/flexmark/ast/util/Parsing;->ASCII_CLOSE_PUNCTUATION:Ljava/lang/String;

    .line 143
    new-instance v15, Ljava/lang/StringBuilder;

    const-string v9, "^["

    invoke-direct {v15, v9}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v15, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v15, v12}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v15, v13}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v1, "\\p{Pc}\\p{Pd}\\p{Pe}\\p{Pf}\\p{Pi}\\p{Po}\\p{Ps}]"

    invoke-virtual {v15, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v15}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v1}, Ljava/util/regex/Pattern;->compile(Ljava/lang/String;)Ljava/util/regex/Pattern;

    move-result-object v1

    iput-object v1, v0, Lcom/vladsch/flexmark/ast/util/Parsing;->PUNCTUATION:Ljava/util/regex/Pattern;

    .line 145
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1, v9}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v1, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1, v12}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v15, "]|[\\p{Pc}\\p{Pd}\\p{Pe}\\p{Pf}\\p{Pi}\\p{Po}\\p{Ps}]&&[^"

    invoke-virtual {v1, v15}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1, v13}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v1}, Ljava/util/regex/Pattern;->compile(Ljava/lang/String;)Ljava/util/regex/Pattern;

    move-result-object v1

    iput-object v1, v0, Lcom/vladsch/flexmark/ast/util/Parsing;->PUNCTUATION_OPEN:Ljava/util/regex/Pattern;

    .line 147
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1, v9}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v1, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1, v13}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1, v15}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1, v12}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v1}, Ljava/util/regex/Pattern;->compile(Ljava/lang/String;)Ljava/util/regex/Pattern;

    move-result-object v1

    iput-object v1, v0, Lcom/vladsch/flexmark/ast/util/Parsing;->PUNCTUATION_CLOSE:Ljava/util/regex/Pattern;

    .line 149
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1, v9}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v1, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v8, "\\p{Pc}\\p{Pd}\\p{Pe}\\p{Pf}\\p{Pi}\\p{Po}\\p{Ps}]&&[^"

    invoke-virtual {v1, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1, v12}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1, v13}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v1}, Ljava/util/regex/Pattern;->compile(Ljava/lang/String;)Ljava/util/regex/Pattern;

    move-result-object v1

    iput-object v1, v0, Lcom/vladsch/flexmark/ast/util/Parsing;->PUNCTUATION_ONLY:Ljava/util/regex/Pattern;

    .line 151
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1, v9}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v1, v12}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v1}, Ljava/util/regex/Pattern;->compile(Ljava/lang/String;)Ljava/util/regex/Pattern;

    move-result-object v1

    iput-object v1, v0, Lcom/vladsch/flexmark/ast/util/Parsing;->PUNCTUATION_OPEN_ONLY:Ljava/util/regex/Pattern;

    .line 153
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1, v9}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v1, v13}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v1}, Ljava/util/regex/Pattern;->compile(Ljava/lang/String;)Ljava/util/regex/Pattern;

    move-result-object v1

    iput-object v1, v0, Lcom/vladsch/flexmark/ast/util/Parsing;->PUNCTUATION_CLOSE_ONLY:Ljava/util/regex/Pattern;

    .line 157
    const-string v1, "^[!\"#$%&\'()*+,./:;<=>?@\\[\\\\\\]^_`{|}~-]"

    invoke-static {v1}, Ljava/util/regex/Pattern;->compile(Ljava/lang/String;)Ljava/util/regex/Pattern;

    move-result-object v1

    iput-object v1, v0, Lcom/vladsch/flexmark/ast/util/Parsing;->ESCAPABLE:Ljava/util/regex/Pattern;

    .line 158
    const-string v1, "`+"

    invoke-static {v1}, Ljava/util/regex/Pattern;->compile(Ljava/lang/String;)Ljava/util/regex/Pattern;

    move-result-object v1

    iput-object v1, v0, Lcom/vladsch/flexmark/ast/util/Parsing;->TICKS:Ljava/util/regex/Pattern;

    .line 159
    const-string v1, "^`+"

    invoke-static {v1}, Ljava/util/regex/Pattern;->compile(Ljava/lang/String;)Ljava/util/regex/Pattern;

    move-result-object v1

    iput-object v1, v0, Lcom/vladsch/flexmark/ast/util/Parsing;->TICKS_HERE:Ljava/util/regex/Pattern;

    .line 160
    new-instance v1, Ljava/lang/StringBuilder;

    const-string v8, "^<([a-zA-Z0-9"

    invoke-direct {v1, v8}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v1, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v8, ".!#$%&\'*+/=?^_`{|}~-]+@[a-zA-Z0-9"

    invoke-virtual {v1, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v8, "](?:[a-zA-Z0-9"

    invoke-virtual {v1, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v9, "-]{0,61}[a-zA-Z0-9"

    invoke-virtual {v1, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v11, "])?(?:\\.[a-zA-Z0-9"

    invoke-virtual {v1, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v8, "])?)*)>"

    invoke-virtual {v1, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v1}, Ljava/util/regex/Pattern;->compile(Ljava/lang/String;)Ljava/util/regex/Pattern;

    move-result-object v1

    iput-object v1, v0, Lcom/vladsch/flexmark/ast/util/Parsing;->EMAIL_AUTOLINK:Ljava/util/regex/Pattern;

    .line 162
    new-instance v1, Ljava/lang/StringBuilder;

    const-string v8, "^<[a-zA-Z][a-zA-Z0-9"

    invoke-direct {v1, v8}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v1, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v8, ".+-]{1,31}:[^<>"

    invoke-virtual {v1, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-object/from16 v8, v20

    invoke-virtual {v1, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v9, "]*>"

    invoke-virtual {v1, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v1}, Ljava/util/regex/Pattern;->compile(Ljava/lang/String;)Ljava/util/regex/Pattern;

    move-result-object v1

    iput-object v1, v0, Lcom/vladsch/flexmark/ast/util/Parsing;->AUTOLINK:Ljava/util/regex/Pattern;

    .line 165
    new-instance v1, Ljava/lang/StringBuilder;

    const-string v9, "^<(?:w"

    invoke-direct {v1, v9}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v1, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v9, "?){3,3}\\.[^<>"

    invoke-virtual {v1, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v9, "]*>"

    invoke-virtual {v1, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v1}, Ljava/util/regex/Pattern;->compile(Ljava/lang/String;)Ljava/util/regex/Pattern;

    move-result-object v1

    iput-object v1, v0, Lcom/vladsch/flexmark/ast/util/Parsing;->WWW_AUTOLINK:Ljava/util/regex/Pattern;

    .line 168
    new-instance v1, Ljava/lang/StringBuilder;

    const-string v9, "^(?:[ \t])*(?:"

    invoke-direct {v1, v9}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    move-object/from16 v9, v22

    invoke-virtual {v1, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v11, "(?:[ \t])*)?"

    invoke-virtual {v1, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v1}, Ljava/util/regex/Pattern;->compile(Ljava/lang/String;)Ljava/util/regex/Pattern;

    move-result-object v1

    iput-object v1, v0, Lcom/vladsch/flexmark/ast/util/Parsing;->SPNL:Ljava/util/regex/Pattern;

    .line 169
    new-instance v1, Ljava/lang/StringBuilder;

    const-string v11, "^(?:[ \t])*"

    invoke-direct {v1, v11}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v1, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v1}, Ljava/util/regex/Pattern;->compile(Ljava/lang/String;)Ljava/util/regex/Pattern;

    move-result-object v1

    iput-object v1, v0, Lcom/vladsch/flexmark/ast/util/Parsing;->SPNL_URL:Ljava/util/regex/Pattern;

    .line 170
    const-string v1, "^ {0,3}"

    invoke-static {v1}, Ljava/util/regex/Pattern;->compile(Ljava/lang/String;)Ljava/util/regex/Pattern;

    move-result-object v1

    iput-object v1, v0, Lcom/vladsch/flexmark/ast/util/Parsing;->SPNI:Ljava/util/regex/Pattern;

    .line 171
    const-string v1, "^(?:[ \t])*"

    invoke-static {v1}, Ljava/util/regex/Pattern;->compile(Ljava/lang/String;)Ljava/util/regex/Pattern;

    move-result-object v1

    iput-object v1, v0, Lcom/vladsch/flexmark/ast/util/Parsing;->SP:Ljava/util/regex/Pattern;

    .line 172
    new-instance v1, Ljava/lang/StringBuilder;

    const-string v11, "^.*"

    invoke-direct {v1, v11}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v1, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v1}, Ljava/util/regex/Pattern;->compile(Ljava/lang/String;)Ljava/util/regex/Pattern;

    move-result-object v1

    iput-object v1, v0, Lcom/vladsch/flexmark/ast/util/Parsing;->REST_OF_LINE:Ljava/util/regex/Pattern;

    .line 173
    const-string v1, "^[\\p{Zs}\t\r\n\u000c]"

    invoke-static {v1}, Ljava/util/regex/Pattern;->compile(Ljava/lang/String;)Ljava/util/regex/Pattern;

    move-result-object v1

    iput-object v1, v0, Lcom/vladsch/flexmark/ast/util/Parsing;->UNICODE_WHITESPACE_CHAR:Ljava/util/regex/Pattern;

    .line 174
    const-string v1, "\\s+"

    invoke-static {v1}, Ljava/util/regex/Pattern;->compile(Ljava/lang/String;)Ljava/util/regex/Pattern;

    move-result-object v1

    iput-object v1, v0, Lcom/vladsch/flexmark/ast/util/Parsing;->WHITESPACE:Ljava/util/regex/Pattern;

    .line 175
    const-string v1, " *$"

    invoke-static {v1}, Ljava/util/regex/Pattern;->compile(Ljava/lang/String;)Ljava/util/regex/Pattern;

    move-result-object v1

    iput-object v1, v0, Lcom/vladsch/flexmark/ast/util/Parsing;->FINAL_SPACE:Ljava/util/regex/Pattern;

    .line 176
    new-instance v1, Ljava/lang/StringBuilder;

    const-string v11, "^[ \t]*(?:"

    invoke-direct {v1, v11}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v1, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v9, "|$)"

    invoke-virtual {v1, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v1}, Ljava/util/regex/Pattern;->compile(Ljava/lang/String;)Ljava/util/regex/Pattern;

    move-result-object v1

    iput-object v1, v0, Lcom/vladsch/flexmark/ast/util/Parsing;->LINE_END:Ljava/util/regex/Pattern;

    .line 177
    new-instance v1, Ljava/lang/StringBuilder;

    const-string v9, "[A-Za-z"

    invoke-direct {v1, v9}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v1, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v9, "][A-Za-z0-9"

    invoke-virtual {v1, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v9, "-]*"

    invoke-virtual {v1, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    iput-object v1, v0, Lcom/vladsch/flexmark/ast/util/Parsing;->TAGNAME:Ljava/lang/String;

    .line 178
    new-instance v9, Ljava/lang/StringBuilder;

    const-string v11, "[a-zA-Z"

    invoke-direct {v9, v11}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v9, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v11, "_:][a-zA-Z0-9"

    invoke-virtual {v9, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v9, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v5, ":._-]*"

    invoke-virtual {v9, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v9}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    iput-object v5, v0, Lcom/vladsch/flexmark/ast/util/Parsing;->ATTRIBUTENAME:Ljava/lang/String;

    .line 179
    new-instance v9, Ljava/lang/StringBuilder;

    const-string v11, "[^\"\'=<>{}`"

    invoke-direct {v9, v11}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v9, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v8, "]+"

    invoke-virtual {v9, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v9}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v8

    iput-object v8, v0, Lcom/vladsch/flexmark/ast/util/Parsing;->UNQUOTEDVALUE:Ljava/lang/String;

    .line 180
    const-string v9, "\'[^\']*\'"

    iput-object v9, v0, Lcom/vladsch/flexmark/ast/util/Parsing;->SINGLEQUOTEDVALUE:Ljava/lang/String;

    .line 181
    const-string v11, "\"[^\"]*\""

    iput-object v11, v0, Lcom/vladsch/flexmark/ast/util/Parsing;->DOUBLEQUOTEDVALUE:Ljava/lang/String;

    .line 182
    new-instance v12, Ljava/lang/StringBuilder;

    invoke-direct {v12, v4}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v12, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v12, v14}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v12, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v12, v14}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v12, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v8, ")"

    invoke-virtual {v12, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v12}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v9

    iput-object v9, v0, Lcom/vladsch/flexmark/ast/util/Parsing;->ATTRIBUTEVALUE:Ljava/lang/String;

    .line 184
    new-instance v11, Ljava/lang/StringBuilder;

    const-string v12, "(?:\\s*=\\s*"

    invoke-direct {v11, v12}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v11, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v11, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v11}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v9

    iput-object v9, v0, Lcom/vladsch/flexmark/ast/util/Parsing;->ATTRIBUTEVALUESPEC:Ljava/lang/String;

    .line 185
    new-instance v11, Ljava/lang/StringBuilder;

    const-string v12, "(?:\\s+"

    invoke-direct {v11, v12}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v11, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v11, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v5, "?)"

    invoke-virtual {v11, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v11}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    iput-object v5, v0, Lcom/vladsch/flexmark/ast/util/Parsing;->ATTRIBUTE:Ljava/lang/String;

    .line 187
    new-instance v9, Ljava/lang/StringBuilder;

    const-string v11, "<"

    invoke-direct {v9, v11}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v9, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v9, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v5, "*\\s*/?>"

    invoke-virtual {v9, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v9}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    iput-object v5, v0, Lcom/vladsch/flexmark/ast/util/Parsing;->OPENTAG:Ljava/lang/String;

    .line 188
    new-instance v9, Ljava/lang/StringBuilder;

    const-string v11, "</"

    invoke-direct {v9, v11}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v9, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v1, "\\s*[>]"

    invoke-virtual {v9, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v9}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    iput-object v1, v0, Lcom/vladsch/flexmark/ast/util/Parsing;->CLOSETAG:Ljava/lang/String;

    .line 189
    new-instance v9, Ljava/lang/StringBuilder;

    invoke-direct {v9, v4}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v9, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v9, v14}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v9, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v9, v14}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v9, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v9, v14}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v9, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v9, v14}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v9, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v9, v14}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v9, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    if-eqz v17, :cond_6

    new-instance v1, Ljava/lang/StringBuilder;

    const-string v2, "|<(?:"

    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    move-object/from16 v3, v21

    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v2, ")>|</(?:"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v2, ")>"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v16

    :cond_6
    move-object/from16 v1, v16

    invoke-virtual {v9, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v9, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v9}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    iput-object v1, v0, Lcom/vladsch/flexmark/ast/util/Parsing;->HTMLTAG:Ljava/lang/String;

    .line 192
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2, v10}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v2, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    const/4 v2, 0x2

    invoke-static {v1, v2}, Ljava/util/regex/Pattern;->compile(Ljava/lang/String;I)Ljava/util/regex/Pattern;

    move-result-object v1

    iput-object v1, v0, Lcom/vladsch/flexmark/ast/util/Parsing;->HTML_TAG:Ljava/util/regex/Pattern;

    .line 194
    sget-object v1, Lcom/vladsch/flexmark/parser/Parser;->LISTS_ITEM_PREFIX_CHARS:Lcom/vladsch/flexmark/util/options/DataKey;

    move-object/from16 v2, p1

    invoke-virtual {v1, v2}, Lcom/vladsch/flexmark/util/options/DataKey;->getFrom(Lcom/vladsch/flexmark/util/options/DataHolder;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/String;

    .line 195
    sget-object v3, Lcom/vladsch/flexmark/parser/Parser;->LISTS_ITEM_MARKER_SPACE:Lcom/vladsch/flexmark/util/options/DataKey;

    invoke-virtual {v3, v2}, Lcom/vladsch/flexmark/util/options/DataKey;->getFrom(Lcom/vladsch/flexmark/util/options/DataHolder;)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/lang/Boolean;

    invoke-virtual {v3}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v3

    const-string v4, "^([\\Q"

    if-eqz v3, :cond_8

    .line 196
    sget-object v3, Lcom/vladsch/flexmark/parser/Parser;->LISTS_ORDERED_ITEM_DOT_ONLY:Lcom/vladsch/flexmark/util/options/DataKey;

    invoke-virtual {v3, v2}, Lcom/vladsch/flexmark/util/options/DataKey;->getFrom(Lcom/vladsch/flexmark/util/options/DataHolder;)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/lang/Boolean;

    invoke-virtual {v3}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v3

    if-eqz v3, :cond_7

    .line 197
    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3, v4}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v3, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v1, "\\E])(?=[ \t])|^(\\d{1,9})([.])(?=[ \t])"

    invoke-virtual {v3, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v1}, Ljava/util/regex/Pattern;->compile(Ljava/lang/String;)Ljava/util/regex/Pattern;

    move-result-object v1

    iput-object v1, v0, Lcom/vladsch/flexmark/ast/util/Parsing;->LIST_ITEM_MARKER:Ljava/util/regex/Pattern;

    goto :goto_6

    .line 199
    :cond_7
    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3, v4}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v3, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v1, "\\E])(?=[ \t])|^(\\d{1,9})([.)])(?=[ \t])"

    invoke-virtual {v3, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v1}, Ljava/util/regex/Pattern;->compile(Ljava/lang/String;)Ljava/util/regex/Pattern;

    move-result-object v1

    iput-object v1, v0, Lcom/vladsch/flexmark/ast/util/Parsing;->LIST_ITEM_MARKER:Ljava/util/regex/Pattern;

    goto :goto_6

    .line 202
    :cond_8
    sget-object v3, Lcom/vladsch/flexmark/parser/Parser;->LISTS_ORDERED_ITEM_DOT_ONLY:Lcom/vladsch/flexmark/util/options/DataKey;

    invoke-virtual {v3, v2}, Lcom/vladsch/flexmark/util/options/DataKey;->getFrom(Lcom/vladsch/flexmark/util/options/DataHolder;)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/lang/Boolean;

    invoke-virtual {v3}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v3

    if-eqz v3, :cond_9

    .line 203
    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3, v4}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v3, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v1, "\\E])(?= |\t|$)|^(\\d{1,9})([.])(?= |\t|$)"

    invoke-virtual {v3, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v1}, Ljava/util/regex/Pattern;->compile(Ljava/lang/String;)Ljava/util/regex/Pattern;

    move-result-object v1

    iput-object v1, v0, Lcom/vladsch/flexmark/ast/util/Parsing;->LIST_ITEM_MARKER:Ljava/util/regex/Pattern;

    goto :goto_6

    .line 205
    :cond_9
    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3, v4}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v3, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v1, "\\E])(?= |\t|$)|^(\\d{1,9})([.)])(?= |\t|$)"

    invoke-virtual {v3, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v1}, Ljava/util/regex/Pattern;->compile(Ljava/lang/String;)Ljava/util/regex/Pattern;

    move-result-object v1

    iput-object v1, v0, Lcom/vladsch/flexmark/ast/util/Parsing;->LIST_ITEM_MARKER:Ljava/util/regex/Pattern;

    .line 210
    :goto_6
    sget-object v1, Lcom/vladsch/flexmark/parser/Parser;->CODE_BLOCK_INDENT:Lcom/vladsch/flexmark/util/options/DataKey;

    invoke-virtual {v1, v2}, Lcom/vladsch/flexmark/util/options/DataKey;->getFrom(Lcom/vladsch/flexmark/util/options/DataHolder;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/Integer;

    invoke-virtual {v1}, Ljava/lang/Integer;->intValue()I

    move-result v1

    iput v1, v0, Lcom/vladsch/flexmark/ast/util/Parsing;->CODE_BLOCK_INDENT:I

    .line 213
    const-string v1, " \t"

    iput-object v1, v0, Lcom/vladsch/flexmark/ast/util/Parsing;->INVALID_LINK_CHARS:Ljava/lang/String;

    return-void
.end method

.method public static columnsToNextTabStop(I)I
    .locals 0

    .line 230
    rem-int/lit8 p0, p0, 0x4

    rsub-int/lit8 p0, p0, 0x4

    return p0
.end method

.method public static findLineBreak(Ljava/lang/CharSequence;I)I
    .locals 2

    .line 234
    :goto_0
    invoke-interface {p0}, Ljava/lang/CharSequence;->length()I

    move-result v0

    if-ge p1, v0, :cond_1

    .line 235
    invoke-interface {p0, p1}, Ljava/lang/CharSequence;->charAt(I)C

    move-result v0

    const/16 v1, 0xa

    if-eq v0, v1, :cond_0

    const/16 v1, 0xd

    if-eq v0, v1, :cond_0

    add-int/lit8 p1, p1, 0x1

    goto :goto_0

    :cond_0
    return p1

    :cond_1
    const/4 p0, -0x1

    return p0
.end method

.method private static findNonSpace(Ljava/lang/CharSequence;I)I
    .locals 2

    .line 265
    :goto_0
    invoke-interface {p0}, Ljava/lang/CharSequence;->length()I

    move-result v0

    if-ge p1, v0, :cond_1

    .line 266
    invoke-interface {p0, p1}, Ljava/lang/CharSequence;->charAt(I)C

    move-result v0

    const/16 v1, 0x20

    if-eq v0, v1, :cond_0

    packed-switch v0, :pswitch_data_0

    return p1

    :cond_0
    :pswitch_0
    add-int/lit8 p1, p1, 0x1

    goto :goto_0

    :cond_1
    const/4 p0, -0x1

    return p0

    nop

    :pswitch_data_0
    .packed-switch 0x9
        :pswitch_0
        :pswitch_0
        :pswitch_0
        :pswitch_0
        :pswitch_0
    .end packed-switch
.end method

.method public static isBlank(Ljava/lang/CharSequence;)Z
    .locals 2

    const/4 v0, 0x0

    .line 245
    invoke-static {p0, v0}, Lcom/vladsch/flexmark/ast/util/Parsing;->findNonSpace(Ljava/lang/CharSequence;I)I

    move-result p0

    const/4 v1, -0x1

    if-ne p0, v1, :cond_0

    const/4 p0, 0x1

    return p0

    :cond_0
    return v0
.end method

.method public static isLetter(Ljava/lang/CharSequence;I)Z
    .locals 0

    .line 249
    invoke-static {p0, p1}, Ljava/lang/Character;->codePointAt(Ljava/lang/CharSequence;I)I

    move-result p0

    .line 250
    invoke-static {p0}, Ljava/lang/Character;->isLetter(I)Z

    move-result p0

    return p0
.end method

.method public static isSpaceOrTab(Ljava/lang/CharSequence;I)Z
    .locals 1

    .line 254
    invoke-interface {p0}, Ljava/lang/CharSequence;->length()I

    move-result v0

    if-ge p1, v0, :cond_1

    .line 255
    invoke-interface {p0, p1}, Ljava/lang/CharSequence;->charAt(I)C

    move-result p0

    const/16 p1, 0x9

    if-eq p0, p1, :cond_0

    const/16 p1, 0x20

    if-eq p0, p1, :cond_0

    goto :goto_0

    :cond_0
    const/4 p0, 0x1

    return p0

    :cond_1
    :goto_0
    const/4 p0, 0x0

    return p0
.end method


# virtual methods
.method public ADDITIONAL_CHARS()Ljava/lang/String;
    .locals 1

    .line 221
    iget-boolean v0, p0, Lcom/vladsch/flexmark/ast/util/Parsing;->intellijDummyIdentifier:Z

    if-eqz v0, :cond_0

    const-string v0, "\u001f"

    return-object v0

    :cond_0
    const-string v0, ""

    return-object v0
.end method

.method public ADDITIONAL_CHARS_SET(Ljava/lang/String;)Ljava/lang/String;
    .locals 2

    .line 225
    iget-boolean v0, p0, Lcom/vladsch/flexmark/ast/util/Parsing;->intellijDummyIdentifier:Z

    if-eqz v0, :cond_0

    new-instance v0, Ljava/lang/StringBuilder;

    const-string v1, "[\u001f]"

    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    return-object p1

    :cond_0
    const-string p1, ""

    return-object p1
.end method

.method public EXCLUDED_0_TO_SPACE()Ljava/lang/String;
    .locals 1

    .line 217
    iget-boolean v0, p0, Lcom/vladsch/flexmark/ast/util/Parsing;->intellijDummyIdentifier:Z

    if-eqz v0, :cond_0

    const-string v0, "\u0000-\u001e "

    return-object v0

    :cond_0
    const-string v0, "\u0000- "

    return-object v0
.end method
