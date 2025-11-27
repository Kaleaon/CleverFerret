.class public Lcom/vladsch/flexmark/ext/tables/TableBlock;
.super Lcom/vladsch/flexmark/util/ast/Block;
.source "TableBlock.java"


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 14
    invoke-direct {p0}, Lcom/vladsch/flexmark/util/ast/Block;-><init>()V

    return-void
.end method

.method public constructor <init>(Lcom/vladsch/flexmark/util/ast/BlockContent;)V
    .locals 0

    .line 30
    invoke-direct {p0, p1}, Lcom/vladsch/flexmark/util/ast/Block;-><init>(Lcom/vladsch/flexmark/util/ast/BlockContent;)V

    return-void
.end method

.method public constructor <init>(Lcom/vladsch/flexmark/util/sequence/BasedSequence;)V
    .locals 0

    .line 18
    invoke-direct {p0, p1}, Lcom/vladsch/flexmark/util/ast/Block;-><init>(Lcom/vladsch/flexmark/util/sequence/BasedSequence;)V

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

    .line 22
    invoke-direct {p0, p1, p2}, Lcom/vladsch/flexmark/util/ast/Block;-><init>(Lcom/vladsch/flexmark/util/sequence/BasedSequence;Ljava/util/List;)V

    return-void
.end method

.method public constructor <init>(Ljava/util/List;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Lcom/vladsch/flexmark/util/sequence/BasedSequence;",
            ">;)V"
        }
    .end annotation

    .line 26
    invoke-direct {p0, p1}, Lcom/vladsch/flexmark/util/ast/Block;-><init>(Ljava/util/List;)V

    return-void
.end method


# virtual methods
.method getCaption()Lcom/vladsch/flexmark/ext/tables/TableCaption;
    .locals 2

    .line 39
    invoke-virtual {p0}, Lcom/vladsch/flexmark/ext/tables/TableBlock;->getLastChild()Lcom/vladsch/flexmark/util/ast/Node;

    move-result-object v0

    .line 40
    instance-of v1, v0, Lcom/vladsch/flexmark/ext/tables/TableCaption;

    if-eqz v1, :cond_0

    check-cast v0, Lcom/vladsch/flexmark/ext/tables/TableCaption;

    return-object v0

    :cond_0
    const/4 v0, 0x0

    return-object v0
.end method

.method public getSegments()[Lcom/vladsch/flexmark/util/sequence/BasedSequence;
    .locals 1

    const/4 v0, 0x0

    .line 35
    new-array v0, v0, [Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    return-object v0
.end method
