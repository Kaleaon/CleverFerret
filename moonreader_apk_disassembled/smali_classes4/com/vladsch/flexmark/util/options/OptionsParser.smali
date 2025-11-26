.class public Lcom/vladsch/flexmark/util/options/OptionsParser;
.super Ljava/lang/Object;
.source "OptionsParser.java"

# interfaces
.implements Lcom/vladsch/flexmark/util/options/OptionParser;


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "<T:",
        "Ljava/lang/Object;",
        ">",
        "Ljava/lang/Object;",
        "Lcom/vladsch/flexmark/util/options/OptionParser<",
        "TT;>;"
    }
.end annotation


# static fields
.field public static final KEY_OPTION_0_DOES_NOT_MATCH:Ljava/lang/String; = "options.parser.option.unknown"

.field public static final KEY_OPTION_0_IS_AMBIGUOUS:Ljava/lang/String; = "options.parser.option.ambiguous"

.field public static final OPTION_0_DOES_NOT_MATCH:Ljava/lang/String; = "Option {0} does not match any of: "

.field public static final OPTION_0_IS_AMBIGUOUS:Ljava/lang/String; = "Option {0} matches: "


# instance fields
.field private final myOptionDelimiter:C

.field private final myOptionName:Ljava/lang/String;

.field private final myOptionValueDelimiter:C

.field private final myParsableOptions:[Lcom/vladsch/flexmark/util/options/OptionParser;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "[",
            "Lcom/vladsch/flexmark/util/options/OptionParser<",
            "TT;>;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>(Ljava/lang/String;[Lcom/vladsch/flexmark/util/options/OptionParser;CC)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "[",
            "Lcom/vladsch/flexmark/util/options/OptionParser<",
            "TT;>;CC)V"
        }
    .end annotation

    .line 21
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 22
    iput-object p1, p0, Lcom/vladsch/flexmark/util/options/OptionsParser;->myOptionName:Ljava/lang/String;

    .line 23
    iput-object p2, p0, Lcom/vladsch/flexmark/util/options/OptionsParser;->myParsableOptions:[Lcom/vladsch/flexmark/util/options/OptionParser;

    .line 24
    iput-char p3, p0, Lcom/vladsch/flexmark/util/options/OptionsParser;->myOptionDelimiter:C

    .line 25
    iput-char p4, p0, Lcom/vladsch/flexmark/util/options/OptionsParser;->myOptionValueDelimiter:C

    return-void
.end method


# virtual methods
.method public appendOptionNames(Lcom/vladsch/flexmark/util/DelimitedBuilder;)V
    .locals 4

    .line 90
    iget-object v0, p0, Lcom/vladsch/flexmark/util/options/OptionsParser;->myParsableOptions:[Lcom/vladsch/flexmark/util/options/OptionParser;

    array-length v1, v0

    const/4 v2, 0x0

    :goto_0
    if-ge v2, v1, :cond_0

    aget-object v3, v0, v2

    .line 91
    invoke-interface {v3}, Lcom/vladsch/flexmark/util/options/OptionParser;->getOptionName()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {p1, v3}, Lcom/vladsch/flexmark/util/DelimitedBuilder;->append(Ljava/lang/String;)Lcom/vladsch/flexmark/util/DelimitedBuilder;

    move-result-object v3

    invoke-virtual {v3}, Lcom/vladsch/flexmark/util/DelimitedBuilder;->mark()Lcom/vladsch/flexmark/util/DelimitedBuilder;

    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    :cond_0
    return-void
.end method

.method public getOptionName()Ljava/lang/String;
    .locals 1

    .line 30
    iget-object v0, p0, Lcom/vladsch/flexmark/util/options/OptionsParser;->myOptionName:Ljava/lang/String;

    return-object v0
.end method

.method public getOptionText(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/String;
    .locals 6
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TT;TT;)",
            "Ljava/lang/String;"
        }
    .end annotation

    .line 97
    new-instance v0, Lcom/vladsch/flexmark/util/DelimitedBuilder;

    iget-char v1, p0, Lcom/vladsch/flexmark/util/options/OptionsParser;->myOptionDelimiter:C

    invoke-static {v1}, Ljava/lang/String;->valueOf(C)Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Lcom/vladsch/flexmark/util/DelimitedBuilder;-><init>(Ljava/lang/String;)V

    .line 98
    iget-object v1, p0, Lcom/vladsch/flexmark/util/options/OptionsParser;->myParsableOptions:[Lcom/vladsch/flexmark/util/options/OptionParser;

    array-length v2, v1

    const/4 v3, 0x0

    :goto_0
    if-ge v3, v2, :cond_1

    aget-object v4, v1, v3

    .line 99
    invoke-interface {v4, p1, p2}, Lcom/vladsch/flexmark/util/options/OptionParser;->getOptionText(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v4

    .line 100
    invoke-virtual {v4}, Ljava/lang/String;->isEmpty()Z

    move-result v5

    if-nez v5, :cond_0

    invoke-virtual {v0, v4}, Lcom/vladsch/flexmark/util/DelimitedBuilder;->append(Ljava/lang/String;)Lcom/vladsch/flexmark/util/DelimitedBuilder;

    move-result-object v4

    invoke-virtual {v4}, Lcom/vladsch/flexmark/util/DelimitedBuilder;->mark()Lcom/vladsch/flexmark/util/DelimitedBuilder;

    :cond_0
    add-int/lit8 v3, v3, 0x1

    goto :goto_0

    .line 102
    :cond_1
    invoke-virtual {v0}, Lcom/vladsch/flexmark/util/DelimitedBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    return-object p1
.end method

.method public parseOption(Lcom/vladsch/flexmark/util/sequence/BasedSequence;Ljava/lang/Object;Lcom/vladsch/flexmark/util/options/MessageProvider;)Lcom/vladsch/flexmark/util/Pair;
    .locals 20
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/vladsch/flexmark/util/sequence/BasedSequence;",
            "TT;",
            "Lcom/vladsch/flexmark/util/options/MessageProvider;",
            ")",
            "Lcom/vladsch/flexmark/util/Pair<",
            "TT;",
            "Ljava/util/List<",
            "Lcom/vladsch/flexmark/util/options/ParsedOption<",
            "TT;>;>;>;"
        }
    .end annotation

    move-object/from16 v2, p0

    .line 36
    iget-char v0, v2, Lcom/vladsch/flexmark/util/options/OptionsParser;->myOptionDelimiter:C

    const/4 v1, 0x6

    const/4 v6, 0x0

    move-object/from16 v3, p1

    invoke-interface {v3, v0, v6, v1}, Lcom/vladsch/flexmark/util/sequence/BasedSequence;->split(CII)[Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    move-result-object v7

    if-nez p3, :cond_0

    .line 38
    sget-object v0, Lcom/vladsch/flexmark/util/options/MessageProvider;->DEFAULT:Lcom/vladsch/flexmark/util/options/MessageProvider;

    move-object v8, v0

    goto :goto_0

    :cond_0
    move-object/from16 v8, p3

    .line 39
    :goto_0
    new-instance v9, Ljava/util/ArrayList;

    array-length v0, v7

    invoke-direct {v9, v0}, Ljava/util/ArrayList;-><init>(I)V

    .line 41
    array-length v10, v7

    move-object/from16 v0, p2

    const/4 v11, 0x0

    :goto_1
    if-ge v11, v10, :cond_a

    aget-object v1, v7, v11

    .line 45
    iget-char v3, v2, Lcom/vladsch/flexmark/util/options/OptionsParser;->myOptionValueDelimiter:C

    const/4 v4, 0x2

    const/4 v5, 0x4

    invoke-interface {v1, v3, v4, v5}, Lcom/vladsch/flexmark/util/sequence/BasedSequence;->split(CII)[Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    move-result-object v3

    .line 46
    array-length v4, v3

    if-nez v4, :cond_1

    const/16 v18, 0x0

    goto/16 :goto_7

    .line 47
    :cond_1
    aget-object v4, v3, v6

    .line 48
    array-length v5, v3

    const/4 v12, 0x1

    if-le v5, v12, :cond_2

    aget-object v3, v3, v12

    goto :goto_2

    :cond_2
    invoke-interface {v4}, Lcom/vladsch/flexmark/util/sequence/BasedSequence;->length()I

    move-result v3

    invoke-interface {v4}, Lcom/vladsch/flexmark/util/sequence/BasedSequence;->length()I

    move-result v5

    invoke-interface {v4, v3, v5}, Lcom/vladsch/flexmark/util/sequence/BasedSequence;->subSequence(II)Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    move-result-object v3

    .line 50
    :goto_2
    iget-object v5, v2, Lcom/vladsch/flexmark/util/options/OptionsParser;->myParsableOptions:[Lcom/vladsch/flexmark/util/options/OptionParser;

    array-length v13, v5

    const/4 v15, 0x0

    const/16 v16, 0x0

    const/16 v17, 0x0

    const/16 v18, 0x0

    :goto_3
    const-string v6, ", "

    if-ge v15, v13, :cond_7

    aget-object v19, v5, v15

    .line 51
    invoke-interface/range {v19 .. v19}, Lcom/vladsch/flexmark/util/options/OptionParser;->getOptionName()Ljava/lang/String;

    move-result-object v14

    invoke-virtual {v4}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v12

    invoke-virtual {v14, v12}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v12

    if-eqz v12, :cond_3

    move-object/from16 p3, v1

    move-object/from16 v1, v19

    const/4 v14, 0x0

    goto :goto_6

    .line 56
    :cond_3
    invoke-interface/range {v19 .. v19}, Lcom/vladsch/flexmark/util/options/OptionParser;->getOptionName()Ljava/lang/String;

    move-result-object v12

    invoke-virtual {v4}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v14

    invoke-virtual {v12, v14}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v12

    if-eqz v12, :cond_6

    if-nez v16, :cond_4

    move-object/from16 p3, v1

    move-object/from16 v16, v19

    goto :goto_5

    :cond_4
    if-nez v17, :cond_5

    .line 61
    new-instance v12, Lcom/vladsch/flexmark/util/DelimitedBuilder;

    invoke-direct {v12, v6}, Lcom/vladsch/flexmark/util/DelimitedBuilder;-><init>(Ljava/lang/String;)V

    const/4 v6, 0x1

    .line 62
    new-array v14, v6, [Ljava/lang/Object;

    aput-object v4, v14, v18

    const-string v6, "options.parser.option.ambiguous"

    move-object/from16 p3, v1

    const-string v1, "Option {0} matches: "

    invoke-interface {v8, v6, v1, v14}, Lcom/vladsch/flexmark/util/options/MessageProvider;->message(Ljava/lang/String;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v12, v1}, Lcom/vladsch/flexmark/util/DelimitedBuilder;->append(Ljava/lang/String;)Lcom/vladsch/flexmark/util/DelimitedBuilder;

    .line 63
    invoke-interface/range {v16 .. v16}, Lcom/vladsch/flexmark/util/options/OptionParser;->getOptionName()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v12, v1}, Lcom/vladsch/flexmark/util/DelimitedBuilder;->append(Ljava/lang/String;)Lcom/vladsch/flexmark/util/DelimitedBuilder;

    move-result-object v1

    invoke-virtual {v1}, Lcom/vladsch/flexmark/util/DelimitedBuilder;->mark()Lcom/vladsch/flexmark/util/DelimitedBuilder;

    goto :goto_4

    :cond_5
    move-object/from16 p3, v1

    move-object/from16 v12, v17

    .line 65
    :goto_4
    invoke-interface/range {v19 .. v19}, Lcom/vladsch/flexmark/util/options/OptionParser;->getOptionName()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v12, v1}, Lcom/vladsch/flexmark/util/DelimitedBuilder;->append(Ljava/lang/String;)Lcom/vladsch/flexmark/util/DelimitedBuilder;

    move-result-object v1

    invoke-virtual {v1}, Lcom/vladsch/flexmark/util/DelimitedBuilder;->mark()Lcom/vladsch/flexmark/util/DelimitedBuilder;

    move-object/from16 v17, v12

    goto :goto_5

    :cond_6
    move-object/from16 p3, v1

    :goto_5
    add-int/lit8 v15, v15, 0x1

    move-object/from16 v1, p3

    const/4 v12, 0x1

    goto :goto_3

    :cond_7
    move-object/from16 p3, v1

    move-object/from16 v1, v16

    move-object/from16 v14, v17

    :goto_6
    if-eqz v1, :cond_9

    if-nez v14, :cond_8

    .line 73
    invoke-interface {v1, v3, v0, v8}, Lcom/vladsch/flexmark/util/options/OptionParser;->parseOption(Lcom/vladsch/flexmark/util/sequence/BasedSequence;Ljava/lang/Object;Lcom/vladsch/flexmark/util/options/MessageProvider;)Lcom/vladsch/flexmark/util/Pair;

    move-result-object v0

    .line 74
    invoke-virtual {v0}, Lcom/vladsch/flexmark/util/Pair;->getFirst()Ljava/lang/Object;

    move-result-object v6

    move-object v1, v0

    .line 75
    new-instance v0, Lcom/vladsch/flexmark/util/options/ParsedOption;

    sget-object v3, Lcom/vladsch/flexmark/util/options/ParsedOptionStatus;->VALID:Lcom/vladsch/flexmark/util/options/ParsedOptionStatus;

    invoke-virtual {v1}, Lcom/vladsch/flexmark/util/Pair;->getSecond()Ljava/lang/Object;

    move-result-object v1

    move-object v5, v1

    check-cast v5, Ljava/util/List;

    const/4 v4, 0x0

    move-object/from16 v1, p3

    invoke-direct/range {v0 .. v5}, Lcom/vladsch/flexmark/util/options/ParsedOption;-><init>(Lcom/vladsch/flexmark/util/sequence/BasedSequence;Lcom/vladsch/flexmark/util/options/OptionParser;Lcom/vladsch/flexmark/util/options/ParsedOptionStatus;Ljava/util/List;Ljava/util/List;)V

    invoke-interface {v9, v0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    move-object v0, v6

    goto :goto_7

    :cond_8
    move-object/from16 v1, p3

    .line 77
    new-instance v3, Lcom/vladsch/flexmark/util/options/ParsedOption;

    sget-object v5, Lcom/vladsch/flexmark/util/options/ParsedOptionStatus;->ERROR:Lcom/vladsch/flexmark/util/options/ParsedOptionStatus;

    new-instance v6, Lcom/vladsch/flexmark/util/options/ParserMessage;

    sget-object v12, Lcom/vladsch/flexmark/util/options/ParsedOptionStatus;->ERROR:Lcom/vladsch/flexmark/util/options/ParsedOptionStatus;

    invoke-virtual {v14}, Lcom/vladsch/flexmark/util/DelimitedBuilder;->toString()Ljava/lang/String;

    move-result-object v13

    invoke-direct {v6, v4, v12, v13}, Lcom/vladsch/flexmark/util/options/ParserMessage;-><init>(Lcom/vladsch/flexmark/util/sequence/BasedSequence;Lcom/vladsch/flexmark/util/options/ParsedOptionStatus;Ljava/lang/String;)V

    invoke-direct {v3, v1, v2, v5, v6}, Lcom/vladsch/flexmark/util/options/ParsedOption;-><init>(Lcom/vladsch/flexmark/util/sequence/BasedSequence;Lcom/vladsch/flexmark/util/options/OptionParser;Lcom/vladsch/flexmark/util/options/ParsedOptionStatus;Lcom/vladsch/flexmark/util/options/ParserMessage;)V

    invoke-interface {v9, v3}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    goto :goto_7

    :cond_9
    move-object/from16 v1, p3

    .line 80
    new-instance v3, Lcom/vladsch/flexmark/util/DelimitedBuilder;

    invoke-direct {v3, v6}, Lcom/vladsch/flexmark/util/DelimitedBuilder;-><init>(Ljava/lang/String;)V

    const/4 v6, 0x1

    .line 81
    new-array v5, v6, [Ljava/lang/Object;

    aput-object v4, v5, v18

    const-string v6, "options.parser.option.unknown"

    const-string v12, "Option {0} does not match any of: "

    invoke-interface {v8, v6, v12, v5}, Lcom/vladsch/flexmark/util/options/MessageProvider;->message(Ljava/lang/String;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v3, v5}, Lcom/vladsch/flexmark/util/DelimitedBuilder;->append(Ljava/lang/String;)Lcom/vladsch/flexmark/util/DelimitedBuilder;

    .line 82
    invoke-virtual {v2, v3}, Lcom/vladsch/flexmark/util/options/OptionsParser;->appendOptionNames(Lcom/vladsch/flexmark/util/DelimitedBuilder;)V

    .line 83
    new-instance v5, Lcom/vladsch/flexmark/util/options/ParsedOption;

    sget-object v6, Lcom/vladsch/flexmark/util/options/ParsedOptionStatus;->ERROR:Lcom/vladsch/flexmark/util/options/ParsedOptionStatus;

    new-instance v12, Lcom/vladsch/flexmark/util/options/ParserMessage;

    sget-object v13, Lcom/vladsch/flexmark/util/options/ParsedOptionStatus;->ERROR:Lcom/vladsch/flexmark/util/options/ParsedOptionStatus;

    invoke-virtual {v3}, Lcom/vladsch/flexmark/util/DelimitedBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-direct {v12, v4, v13, v3}, Lcom/vladsch/flexmark/util/options/ParserMessage;-><init>(Lcom/vladsch/flexmark/util/sequence/BasedSequence;Lcom/vladsch/flexmark/util/options/ParsedOptionStatus;Ljava/lang/String;)V

    invoke-direct {v5, v1, v2, v6, v12}, Lcom/vladsch/flexmark/util/options/ParsedOption;-><init>(Lcom/vladsch/flexmark/util/sequence/BasedSequence;Lcom/vladsch/flexmark/util/options/OptionParser;Lcom/vladsch/flexmark/util/options/ParsedOptionStatus;Lcom/vladsch/flexmark/util/options/ParserMessage;)V

    invoke-interface {v9, v5}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    :goto_7
    add-int/lit8 v11, v11, 0x1

    const/4 v6, 0x0

    goto/16 :goto_1

    .line 86
    :cond_a
    new-instance v1, Lcom/vladsch/flexmark/util/Pair;

    invoke-direct {v1, v0, v9}, Lcom/vladsch/flexmark/util/Pair;-><init>(Ljava/lang/Object;Ljava/lang/Object;)V

    return-object v1
.end method
