.class public Lcom/vladsch/flexmark/ast/BulletListItem;
.super Lcom/vladsch/flexmark/ast/ListItem;
.source "BulletListItem.java"


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 10
    invoke-direct {p0}, Lcom/vladsch/flexmark/ast/ListItem;-><init>()V

    return-void
.end method

.method public constructor <init>(Lcom/vladsch/flexmark/util/ast/BlockContent;)V
    .locals 0

    .line 22
    invoke-direct {p0, p1}, Lcom/vladsch/flexmark/ast/ListItem;-><init>(Lcom/vladsch/flexmark/util/ast/BlockContent;)V

    return-void
.end method

.method public constructor <init>(Lcom/vladsch/flexmark/util/sequence/BasedSequence;)V
    .locals 0

    .line 14
    invoke-direct {p0, p1}, Lcom/vladsch/flexmark/ast/ListItem;-><init>(Lcom/vladsch/flexmark/util/sequence/BasedSequence;)V

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

    .line 18
    invoke-direct {p0, p1, p2}, Lcom/vladsch/flexmark/ast/ListItem;-><init>(Lcom/vladsch/flexmark/util/sequence/BasedSequence;Ljava/util/List;)V

    return-void
.end method
