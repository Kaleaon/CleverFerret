.class Lcom/vladsch/flexmark/parser/internal/DocumentParser$ParagraphPreProcessorCache;
.super Lcom/vladsch/flexmark/util/collection/ItemFactoryMap;
.source "DocumentParser.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/vladsch/flexmark/parser/internal/DocumentParser;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0xa
    name = "ParagraphPreProcessorCache"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/vladsch/flexmark/util/collection/ItemFactoryMap<",
        "Lcom/vladsch/flexmark/parser/block/ParagraphPreProcessor;",
        "Lcom/vladsch/flexmark/parser/block/ParserState;",
        ">;"
    }
.end annotation


# direct methods
.method constructor <init>(Lcom/vladsch/flexmark/parser/block/ParserState;)V
    .locals 0

    .line 1041
    invoke-direct {p0, p1}, Lcom/vladsch/flexmark/util/collection/ItemFactoryMap;-><init>(Ljava/lang/Object;)V

    return-void
.end method

.method public constructor <init>(Lcom/vladsch/flexmark/parser/block/ParserState;I)V
    .locals 0

    .line 1045
    invoke-direct {p0, p1, p2}, Lcom/vladsch/flexmark/util/collection/ItemFactoryMap;-><init>(Ljava/lang/Object;I)V

    return-void
.end method
