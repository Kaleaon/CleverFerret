.class public Lcom/vladsch/flexmark/parser/core/ParagraphParser$Factory;
.super Ljava/lang/Object;
.source "ParagraphParser.java"

# interfaces
.implements Lcom/vladsch/flexmark/parser/block/BlockParserFactory;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/vladsch/flexmark/parser/core/ParagraphParser;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "Factory"
.end annotation


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 59
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public tryStart(Lcom/vladsch/flexmark/parser/block/ParserState;Lcom/vladsch/flexmark/parser/block/MatchedBlockParser;)Lcom/vladsch/flexmark/parser/block/BlockStart;
    .locals 0

    const/4 p1, 0x0

    return-object p1
.end method
