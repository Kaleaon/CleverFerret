.class public Lcom/vladsch/flexmark/parser/core/ThematicBreakParser;
.super Lcom/vladsch/flexmark/parser/block/AbstractBlockParser;
.source "ThematicBreakParser.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/vladsch/flexmark/parser/core/ThematicBreakParser$ThematicBreakOptions;,
        Lcom/vladsch/flexmark/parser/core/ThematicBreakParser$BlockFactory;,
        Lcom/vladsch/flexmark/parser/core/ThematicBreakParser$Factory;
    }
.end annotation


# static fields
.field private static PATTERN:Ljava/util/regex/Pattern;


# instance fields
.field private final block:Lcom/vladsch/flexmark/ast/ThematicBreak;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 17
    const-string v0, "^(?:(?:\\*[ \t]*){3,}|(?:_[ \t]*){3,}|(?:-[ \t]*){3,})[ \t]*$"

    invoke-static {v0}, Ljava/util/regex/Pattern;->compile(Ljava/lang/String;)Ljava/util/regex/Pattern;

    move-result-object v0

    sput-object v0, Lcom/vladsch/flexmark/parser/core/ThematicBreakParser;->PATTERN:Ljava/util/regex/Pattern;

    return-void
.end method

.method public constructor <init>(Lcom/vladsch/flexmark/util/sequence/BasedSequence;)V
    .locals 1

    .line 21
    invoke-direct {p0}, Lcom/vladsch/flexmark/parser/block/AbstractBlockParser;-><init>()V

    .line 19
    new-instance v0, Lcom/vladsch/flexmark/ast/ThematicBreak;

    invoke-direct {v0}, Lcom/vladsch/flexmark/ast/ThematicBreak;-><init>()V

    iput-object v0, p0, Lcom/vladsch/flexmark/parser/core/ThematicBreakParser;->block:Lcom/vladsch/flexmark/ast/ThematicBreak;

    .line 22
    invoke-virtual {v0, p1}, Lcom/vladsch/flexmark/ast/ThematicBreak;->setChars(Lcom/vladsch/flexmark/util/sequence/BasedSequence;)V

    return-void
.end method

.method static synthetic access$100()Ljava/util/regex/Pattern;
    .locals 1

    .line 15
    sget-object v0, Lcom/vladsch/flexmark/parser/core/ThematicBreakParser;->PATTERN:Ljava/util/regex/Pattern;

    return-object v0
.end method


# virtual methods
.method public closeBlock(Lcom/vladsch/flexmark/parser/block/ParserState;)V
    .locals 0

    .line 32
    iget-object p1, p0, Lcom/vladsch/flexmark/parser/core/ThematicBreakParser;->block:Lcom/vladsch/flexmark/ast/ThematicBreak;

    invoke-virtual {p1}, Lcom/vladsch/flexmark/ast/ThematicBreak;->setCharsFromContent()V

    return-void
.end method

.method public getBlock()Lcom/vladsch/flexmark/util/ast/Block;
    .locals 1

    .line 27
    iget-object v0, p0, Lcom/vladsch/flexmark/parser/core/ThematicBreakParser;->block:Lcom/vladsch/flexmark/ast/ThematicBreak;

    return-object v0
.end method

.method public tryContinue(Lcom/vladsch/flexmark/parser/block/ParserState;)Lcom/vladsch/flexmark/parser/block/BlockContinue;
    .locals 0

    .line 38
    invoke-static {}, Lcom/vladsch/flexmark/parser/block/BlockContinue;->none()Lcom/vladsch/flexmark/parser/block/BlockContinue;

    move-result-object p1

    return-object p1
.end method
