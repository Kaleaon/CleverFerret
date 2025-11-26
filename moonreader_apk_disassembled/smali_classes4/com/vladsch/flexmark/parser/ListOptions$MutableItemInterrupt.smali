.class public Lcom/vladsch/flexmark/parser/ListOptions$MutableItemInterrupt;
.super Lcom/vladsch/flexmark/parser/ListOptions$ItemInterrupt;
.source "ListOptions.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/vladsch/flexmark/parser/ListOptions;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "MutableItemInterrupt"
.end annotation


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 533
    invoke-direct {p0}, Lcom/vladsch/flexmark/parser/ListOptions$ItemInterrupt;-><init>()V

    return-void
.end method

.method public constructor <init>(Lcom/vladsch/flexmark/parser/ListOptions$ItemInterrupt;)V
    .locals 0

    .line 540
    invoke-direct {p0, p1}, Lcom/vladsch/flexmark/parser/ListOptions$ItemInterrupt;-><init>(Lcom/vladsch/flexmark/parser/ListOptions$ItemInterrupt;)V

    return-void
.end method

.method public constructor <init>(Lcom/vladsch/flexmark/util/options/DataHolder;)V
    .locals 0

    .line 536
    invoke-direct {p0, p1}, Lcom/vladsch/flexmark/parser/ListOptions$ItemInterrupt;-><init>(Lcom/vladsch/flexmark/util/options/DataHolder;)V

    return-void
.end method


# virtual methods
.method public isBulletItemInterruptsItemParagraph()Z
    .locals 1

    .line 552
    iget-boolean v0, p0, Lcom/vladsch/flexmark/parser/ListOptions$MutableItemInterrupt;->bulletItemInterruptsItemParagraph:Z

    return v0
.end method

.method public isBulletItemInterruptsParagraph()Z
    .locals 1

    .line 544
    iget-boolean v0, p0, Lcom/vladsch/flexmark/parser/ListOptions$MutableItemInterrupt;->bulletItemInterruptsParagraph:Z

    return v0
.end method

.method public isEmptyBulletItemInterruptsItemParagraph()Z
    .locals 1

    .line 556
    iget-boolean v0, p0, Lcom/vladsch/flexmark/parser/ListOptions$MutableItemInterrupt;->emptyBulletItemInterruptsItemParagraph:Z

    return v0
.end method

.method public isEmptyBulletItemInterruptsParagraph()Z
    .locals 1

    .line 548
    iget-boolean v0, p0, Lcom/vladsch/flexmark/parser/ListOptions$MutableItemInterrupt;->emptyBulletItemInterruptsParagraph:Z

    return v0
.end method

.method public isEmptyBulletSubItemInterruptsItemParagraph()Z
    .locals 1

    .line 560
    iget-boolean v0, p0, Lcom/vladsch/flexmark/parser/ListOptions$MutableItemInterrupt;->emptyBulletSubItemInterruptsItemParagraph:Z

    return v0
.end method

.method public isEmptyOrderedItemInterruptsItemParagraph()Z
    .locals 1

    .line 557
    iget-boolean v0, p0, Lcom/vladsch/flexmark/parser/ListOptions$MutableItemInterrupt;->emptyOrderedItemInterruptsItemParagraph:Z

    return v0
.end method

.method public isEmptyOrderedItemInterruptsParagraph()Z
    .locals 1

    .line 549
    iget-boolean v0, p0, Lcom/vladsch/flexmark/parser/ListOptions$MutableItemInterrupt;->emptyOrderedItemInterruptsParagraph:Z

    return v0
.end method

.method public isEmptyOrderedNonOneItemInterruptsItemParagraph()Z
    .locals 1

    .line 558
    iget-boolean v0, p0, Lcom/vladsch/flexmark/parser/ListOptions$MutableItemInterrupt;->emptyOrderedNonOneItemInterruptsItemParagraph:Z

    return v0
.end method

.method public isEmptyOrderedNonOneItemInterruptsParagraph()Z
    .locals 1

    .line 550
    iget-boolean v0, p0, Lcom/vladsch/flexmark/parser/ListOptions$MutableItemInterrupt;->emptyOrderedNonOneItemInterruptsParagraph:Z

    return v0
.end method

.method public isEmptyOrderedNonOneSubItemInterruptsItemParagraph()Z
    .locals 1

    .line 562
    iget-boolean v0, p0, Lcom/vladsch/flexmark/parser/ListOptions$MutableItemInterrupt;->emptyOrderedNonOneSubItemInterruptsItemParagraph:Z

    return v0
.end method

.method public isEmptyOrderedSubItemInterruptsItemParagraph()Z
    .locals 1

    .line 561
    iget-boolean v0, p0, Lcom/vladsch/flexmark/parser/ListOptions$MutableItemInterrupt;->emptyOrderedSubItemInterruptsItemParagraph:Z

    return v0
.end method

.method public isOrderedItemInterruptsItemParagraph()Z
    .locals 1

    .line 553
    iget-boolean v0, p0, Lcom/vladsch/flexmark/parser/ListOptions$MutableItemInterrupt;->orderedItemInterruptsItemParagraph:Z

    return v0
.end method

.method public isOrderedItemInterruptsParagraph()Z
    .locals 1

    .line 545
    iget-boolean v0, p0, Lcom/vladsch/flexmark/parser/ListOptions$MutableItemInterrupt;->orderedItemInterruptsParagraph:Z

    return v0
.end method

.method public isOrderedNonOneItemInterruptsItemParagraph()Z
    .locals 1

    .line 554
    iget-boolean v0, p0, Lcom/vladsch/flexmark/parser/ListOptions$MutableItemInterrupt;->orderedNonOneItemInterruptsItemParagraph:Z

    return v0
.end method

.method public isOrderedNonOneItemInterruptsParagraph()Z
    .locals 1

    .line 546
    iget-boolean v0, p0, Lcom/vladsch/flexmark/parser/ListOptions$MutableItemInterrupt;->orderedNonOneItemInterruptsParagraph:Z

    return v0
.end method

.method public setBulletItemInterruptsItemParagraph(Z)Lcom/vladsch/flexmark/parser/ListOptions$MutableItemInterrupt;
    .locals 0

    .line 572
    iput-boolean p1, p0, Lcom/vladsch/flexmark/parser/ListOptions$MutableItemInterrupt;->bulletItemInterruptsItemParagraph:Z

    return-object p0
.end method

.method public setBulletItemInterruptsParagraph(Z)Lcom/vladsch/flexmark/parser/ListOptions$MutableItemInterrupt;
    .locals 0

    .line 564
    iput-boolean p1, p0, Lcom/vladsch/flexmark/parser/ListOptions$MutableItemInterrupt;->bulletItemInterruptsParagraph:Z

    return-object p0
.end method

.method public setEmptyBulletItemInterruptsItemParagraph(Z)Lcom/vladsch/flexmark/parser/ListOptions$MutableItemInterrupt;
    .locals 0

    .line 576
    iput-boolean p1, p0, Lcom/vladsch/flexmark/parser/ListOptions$MutableItemInterrupt;->emptyBulletItemInterruptsItemParagraph:Z

    return-object p0
.end method

.method public setEmptyBulletItemInterruptsParagraph(Z)Lcom/vladsch/flexmark/parser/ListOptions$MutableItemInterrupt;
    .locals 0

    .line 568
    iput-boolean p1, p0, Lcom/vladsch/flexmark/parser/ListOptions$MutableItemInterrupt;->emptyBulletItemInterruptsParagraph:Z

    return-object p0
.end method

.method public setEmptyBulletSubItemInterruptsItemParagraph(Z)Lcom/vladsch/flexmark/parser/ListOptions$MutableItemInterrupt;
    .locals 0

    .line 580
    iput-boolean p1, p0, Lcom/vladsch/flexmark/parser/ListOptions$MutableItemInterrupt;->emptyBulletSubItemInterruptsItemParagraph:Z

    return-object p0
.end method

.method public setEmptyOrderedItemInterruptsItemParagraph(Z)Lcom/vladsch/flexmark/parser/ListOptions$MutableItemInterrupt;
    .locals 0

    .line 577
    iput-boolean p1, p0, Lcom/vladsch/flexmark/parser/ListOptions$MutableItemInterrupt;->emptyOrderedItemInterruptsItemParagraph:Z

    return-object p0
.end method

.method public setEmptyOrderedItemInterruptsParagraph(Z)Lcom/vladsch/flexmark/parser/ListOptions$MutableItemInterrupt;
    .locals 0

    .line 569
    iput-boolean p1, p0, Lcom/vladsch/flexmark/parser/ListOptions$MutableItemInterrupt;->emptyOrderedItemInterruptsParagraph:Z

    return-object p0
.end method

.method public setEmptyOrderedNonOneItemInterruptsItemParagraph(Z)Lcom/vladsch/flexmark/parser/ListOptions$MutableItemInterrupt;
    .locals 0

    .line 578
    iput-boolean p1, p0, Lcom/vladsch/flexmark/parser/ListOptions$MutableItemInterrupt;->emptyOrderedNonOneItemInterruptsItemParagraph:Z

    return-object p0
.end method

.method public setEmptyOrderedNonOneItemInterruptsParagraph(Z)Lcom/vladsch/flexmark/parser/ListOptions$MutableItemInterrupt;
    .locals 0

    .line 570
    iput-boolean p1, p0, Lcom/vladsch/flexmark/parser/ListOptions$MutableItemInterrupt;->emptyOrderedNonOneItemInterruptsParagraph:Z

    return-object p0
.end method

.method public setEmptyOrderedNonOneSubItemInterruptsItemParagraph(Z)Lcom/vladsch/flexmark/parser/ListOptions$MutableItemInterrupt;
    .locals 0

    .line 582
    iput-boolean p1, p0, Lcom/vladsch/flexmark/parser/ListOptions$MutableItemInterrupt;->emptyOrderedNonOneSubItemInterruptsItemParagraph:Z

    return-object p0
.end method

.method public setEmptyOrderedSubItemInterruptsItemParagraph(Z)Lcom/vladsch/flexmark/parser/ListOptions$MutableItemInterrupt;
    .locals 0

    .line 581
    iput-boolean p1, p0, Lcom/vladsch/flexmark/parser/ListOptions$MutableItemInterrupt;->emptyOrderedSubItemInterruptsItemParagraph:Z

    return-object p0
.end method

.method public setOrderedItemInterruptsItemParagraph(Z)Lcom/vladsch/flexmark/parser/ListOptions$MutableItemInterrupt;
    .locals 0

    .line 573
    iput-boolean p1, p0, Lcom/vladsch/flexmark/parser/ListOptions$MutableItemInterrupt;->orderedItemInterruptsItemParagraph:Z

    return-object p0
.end method

.method public setOrderedItemInterruptsParagraph(Z)Lcom/vladsch/flexmark/parser/ListOptions$MutableItemInterrupt;
    .locals 0

    .line 565
    iput-boolean p1, p0, Lcom/vladsch/flexmark/parser/ListOptions$MutableItemInterrupt;->orderedItemInterruptsParagraph:Z

    return-object p0
.end method

.method public setOrderedNonOneItemInterruptsItemParagraph(Z)Lcom/vladsch/flexmark/parser/ListOptions$MutableItemInterrupt;
    .locals 0

    .line 574
    iput-boolean p1, p0, Lcom/vladsch/flexmark/parser/ListOptions$MutableItemInterrupt;->orderedNonOneItemInterruptsItemParagraph:Z

    return-object p0
.end method

.method public setOrderedNonOneItemInterruptsParagraph(Z)Lcom/vladsch/flexmark/parser/ListOptions$MutableItemInterrupt;
    .locals 0

    .line 566
    iput-boolean p1, p0, Lcom/vladsch/flexmark/parser/ListOptions$MutableItemInterrupt;->orderedNonOneItemInterruptsParagraph:Z

    return-object p0
.end method
