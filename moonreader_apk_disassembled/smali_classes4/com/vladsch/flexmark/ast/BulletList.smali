.class public Lcom/vladsch/flexmark/ast/BulletList;
.super Lcom/vladsch/flexmark/ast/ListBlock;
.source "BulletList.java"


# instance fields
.field private openingMarker:C


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 16
    invoke-direct {p0}, Lcom/vladsch/flexmark/ast/ListBlock;-><init>()V

    return-void
.end method

.method public constructor <init>(Lcom/vladsch/flexmark/util/ast/BlockContent;)V
    .locals 0

    .line 28
    invoke-direct {p0, p1}, Lcom/vladsch/flexmark/ast/ListBlock;-><init>(Lcom/vladsch/flexmark/util/ast/BlockContent;)V

    return-void
.end method

.method public constructor <init>(Lcom/vladsch/flexmark/util/sequence/BasedSequence;)V
    .locals 0

    .line 20
    invoke-direct {p0, p1}, Lcom/vladsch/flexmark/ast/ListBlock;-><init>(Lcom/vladsch/flexmark/util/sequence/BasedSequence;)V

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

    .line 24
    invoke-direct {p0, p1, p2}, Lcom/vladsch/flexmark/ast/ListBlock;-><init>(Lcom/vladsch/flexmark/util/sequence/BasedSequence;Ljava/util/List;)V

    return-void
.end method


# virtual methods
.method public getOpeningMarker()C
    .locals 1

    .line 32
    iget-char v0, p0, Lcom/vladsch/flexmark/ast/BulletList;->openingMarker:C

    return v0
.end method

.method public getSegments()[Lcom/vladsch/flexmark/util/sequence/BasedSequence;
    .locals 1

    .line 13
    sget-object v0, Lcom/vladsch/flexmark/ast/BulletList;->EMPTY_SEGMENTS:[Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    return-object v0
.end method

.method public setOpeningMarker(C)V
    .locals 0

    .line 36
    iput-char p1, p0, Lcom/vladsch/flexmark/ast/BulletList;->openingMarker:C

    return-void
.end method
