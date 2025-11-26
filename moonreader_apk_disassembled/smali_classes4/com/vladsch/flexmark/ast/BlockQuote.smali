.class public Lcom/vladsch/flexmark/ast/BlockQuote;
.super Lcom/vladsch/flexmark/util/ast/Block;
.source "BlockQuote.java"

# interfaces
.implements Lcom/vladsch/flexmark/util/ast/KeepTrailingBlankLineContainer;


# instance fields
.field private openingMarker:Lcom/vladsch/flexmark/util/sequence/BasedSequence;


# direct methods
.method public constructor <init>()V
    .locals 1

    .line 23
    invoke-direct {p0}, Lcom/vladsch/flexmark/util/ast/Block;-><init>()V

    .line 11
    sget-object v0, Lcom/vladsch/flexmark/util/sequence/BasedSequence;->NULL:Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    iput-object v0, p0, Lcom/vladsch/flexmark/ast/BlockQuote;->openingMarker:Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    return-void
.end method

.method public constructor <init>(Lcom/vladsch/flexmark/util/ast/BlockContent;)V
    .locals 0

    .line 35
    invoke-direct {p0, p1}, Lcom/vladsch/flexmark/util/ast/Block;-><init>(Lcom/vladsch/flexmark/util/ast/BlockContent;)V

    .line 11
    sget-object p1, Lcom/vladsch/flexmark/util/sequence/BasedSequence;->NULL:Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    iput-object p1, p0, Lcom/vladsch/flexmark/ast/BlockQuote;->openingMarker:Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    return-void
.end method

.method public constructor <init>(Lcom/vladsch/flexmark/util/sequence/BasedSequence;)V
    .locals 0

    .line 27
    invoke-direct {p0, p1}, Lcom/vladsch/flexmark/util/ast/Block;-><init>(Lcom/vladsch/flexmark/util/sequence/BasedSequence;)V

    .line 11
    sget-object p1, Lcom/vladsch/flexmark/util/sequence/BasedSequence;->NULL:Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    iput-object p1, p0, Lcom/vladsch/flexmark/ast/BlockQuote;->openingMarker:Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    return-void
.end method

.method public constructor <init>(Lcom/vladsch/flexmark/util/sequence/BasedSequence;Ljava/util/List;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/vladsch/flexmark/util/sequence/BasedSequence;",
            "Ljava/util/List<",
            "Lcom/vladsch/flexmark/util/sequence/BasedSequence;",
            ">;)V"
        }
    .end annotation

    .line 31
    invoke-direct {p0, p1, p2}, Lcom/vladsch/flexmark/util/ast/Block;-><init>(Lcom/vladsch/flexmark/util/sequence/BasedSequence;Ljava/util/List;)V

    .line 11
    sget-object p1, Lcom/vladsch/flexmark/util/sequence/BasedSequence;->NULL:Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    iput-object p1, p0, Lcom/vladsch/flexmark/ast/BlockQuote;->openingMarker:Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    return-void
.end method


# virtual methods
.method public getAstExtra(Ljava/lang/StringBuilder;)V
    .locals 2

    .line 15
    iget-object v0, p0, Lcom/vladsch/flexmark/ast/BlockQuote;->openingMarker:Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    const-string v1, "marker"

    invoke-static {p1, v0, v1}, Lcom/vladsch/flexmark/ast/BlockQuote;->segmentSpanChars(Ljava/lang/StringBuilder;Lcom/vladsch/flexmark/util/sequence/BasedSequence;Ljava/lang/String;)V

    return-void
.end method

.method public getOpeningMarker()Lcom/vladsch/flexmark/util/sequence/BasedSequence;
    .locals 1

    .line 39
    iget-object v0, p0, Lcom/vladsch/flexmark/ast/BlockQuote;->openingMarker:Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    return-object v0
.end method

.method public getSegments()[Lcom/vladsch/flexmark/util/sequence/BasedSequence;
    .locals 3

    const/4 v0, 0x1

    .line 20
    new-array v0, v0, [Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    const/4 v1, 0x0

    iget-object v2, p0, Lcom/vladsch/flexmark/ast/BlockQuote;->openingMarker:Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    aput-object v2, v0, v1

    return-object v0
.end method

.method public setOpeningMarker(Lcom/vladsch/flexmark/util/sequence/BasedSequence;)V
    .locals 0

    .line 43
    iput-object p1, p0, Lcom/vladsch/flexmark/ast/BlockQuote;->openingMarker:Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    return-void
.end method
