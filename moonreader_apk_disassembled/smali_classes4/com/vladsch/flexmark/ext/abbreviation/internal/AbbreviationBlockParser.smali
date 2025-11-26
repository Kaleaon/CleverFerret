.class public Lcom/vladsch/flexmark/ext/abbreviation/internal/AbbreviationBlockParser;
.super Lcom/vladsch/flexmark/parser/block/AbstractBlockParser;
.source "AbbreviationBlockParser.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/vladsch/flexmark/ext/abbreviation/internal/AbbreviationBlockParser$BlockFactory;,
        Lcom/vladsch/flexmark/ext/abbreviation/internal/AbbreviationBlockParser$Factory;
    }
.end annotation


# static fields
.field private static ABBREVIATION_BLOCK:Ljava/util/regex/Pattern;


# instance fields
.field private final block:Lcom/vladsch/flexmark/ext/abbreviation/AbbreviationBlock;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 16
    const-string v0, "^\\*\\[\\s*.*\\s*\\]:"

    invoke-static {v0}, Ljava/util/regex/Pattern;->compile(Ljava/lang/String;)Ljava/util/regex/Pattern;

    move-result-object v0

    sput-object v0, Lcom/vladsch/flexmark/ext/abbreviation/internal/AbbreviationBlockParser;->ABBREVIATION_BLOCK:Ljava/util/regex/Pattern;

    return-void
.end method

.method public constructor <init>()V
    .locals 1

    .line 15
    invoke-direct {p0}, Lcom/vladsch/flexmark/parser/block/AbstractBlockParser;-><init>()V

    .line 18
    new-instance v0, Lcom/vladsch/flexmark/ext/abbreviation/AbbreviationBlock;

    invoke-direct {v0}, Lcom/vladsch/flexmark/ext/abbreviation/AbbreviationBlock;-><init>()V

    iput-object v0, p0, Lcom/vladsch/flexmark/ext/abbreviation/internal/AbbreviationBlockParser;->block:Lcom/vladsch/flexmark/ext/abbreviation/AbbreviationBlock;

    return-void
.end method

.method static synthetic access$100()Ljava/util/regex/Pattern;
    .locals 1

    .line 15
    sget-object v0, Lcom/vladsch/flexmark/ext/abbreviation/internal/AbbreviationBlockParser;->ABBREVIATION_BLOCK:Ljava/util/regex/Pattern;

    return-object v0
.end method

.method static synthetic access$200(Lcom/vladsch/flexmark/ext/abbreviation/internal/AbbreviationBlockParser;)Lcom/vladsch/flexmark/ext/abbreviation/AbbreviationBlock;
    .locals 0

    .line 15
    iget-object p0, p0, Lcom/vladsch/flexmark/ext/abbreviation/internal/AbbreviationBlockParser;->block:Lcom/vladsch/flexmark/ext/abbreviation/AbbreviationBlock;

    return-object p0
.end method


# virtual methods
.method public addLine(Lcom/vladsch/flexmark/parser/block/ParserState;Lcom/vladsch/flexmark/util/sequence/BasedSequence;)V
    .locals 0

    .line 32
    new-instance p1, Ljava/lang/IllegalStateException;

    const-string p2, "Abbreviation Blocks hold a single line"

    invoke-direct {p1, p2}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw p1
.end method

.method public closeBlock(Lcom/vladsch/flexmark/parser/block/ParserState;)V
    .locals 2

    .line 38
    invoke-interface {p1}, Lcom/vladsch/flexmark/parser/block/ParserState;->getProperties()Lcom/vladsch/flexmark/util/options/MutableDataHolder;

    move-result-object p1

    sget-object v0, Lcom/vladsch/flexmark/ext/abbreviation/AbbreviationExtension;->ABBREVIATIONS:Lcom/vladsch/flexmark/util/options/DataKey;

    invoke-interface {p1, v0}, Lcom/vladsch/flexmark/util/options/MutableDataHolder;->get(Lcom/vladsch/flexmark/util/options/DataKey;)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Lcom/vladsch/flexmark/ext/abbreviation/internal/AbbreviationRepository;

    .line 39
    iget-object v0, p0, Lcom/vladsch/flexmark/ext/abbreviation/internal/AbbreviationBlockParser;->block:Lcom/vladsch/flexmark/ext/abbreviation/AbbreviationBlock;

    invoke-virtual {v0}, Lcom/vladsch/flexmark/ext/abbreviation/AbbreviationBlock;->getText()Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    move-result-object v0

    invoke-virtual {p1, v0}, Lcom/vladsch/flexmark/ext/abbreviation/internal/AbbreviationRepository;->normalizeKey(Ljava/lang/CharSequence;)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/String;->toString()Ljava/lang/String;

    move-result-object v0

    iget-object v1, p0, Lcom/vladsch/flexmark/ext/abbreviation/internal/AbbreviationBlockParser;->block:Lcom/vladsch/flexmark/ext/abbreviation/AbbreviationBlock;

    invoke-virtual {p1, v0, v1}, Lcom/vladsch/flexmark/ext/abbreviation/internal/AbbreviationRepository;->put(Ljava/lang/String;Ljava/lang/Object;)Ljava/lang/Object;

    return-void
.end method

.method public getBlock()Lcom/vladsch/flexmark/util/ast/Block;
    .locals 1

    .line 22
    iget-object v0, p0, Lcom/vladsch/flexmark/ext/abbreviation/internal/AbbreviationBlockParser;->block:Lcom/vladsch/flexmark/ext/abbreviation/AbbreviationBlock;

    return-object v0
.end method

.method public isContainer()Z
    .locals 1

    const/4 v0, 0x1

    return v0
.end method

.method public parseInlines(Lcom/vladsch/flexmark/parser/InlineParser;)V
    .locals 0

    return-void
.end method

.method public tryContinue(Lcom/vladsch/flexmark/parser/block/ParserState;)Lcom/vladsch/flexmark/parser/block/BlockContinue;
    .locals 0

    .line 27
    invoke-static {}, Lcom/vladsch/flexmark/parser/block/BlockContinue;->none()Lcom/vladsch/flexmark/parser/block/BlockContinue;

    move-result-object p1

    return-object p1
.end method
