.class public Lcom/vladsch/flexmark/parser/ListOptions$ItemInterrupt;
.super Ljava/lang/Object;
.source "ListOptions.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/vladsch/flexmark/parser/ListOptions;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "ItemInterrupt"
.end annotation


# instance fields
.field protected bulletItemInterruptsItemParagraph:Z

.field protected bulletItemInterruptsParagraph:Z

.field protected emptyBulletItemInterruptsItemParagraph:Z

.field protected emptyBulletItemInterruptsParagraph:Z

.field protected emptyBulletSubItemInterruptsItemParagraph:Z

.field protected emptyOrderedItemInterruptsItemParagraph:Z

.field protected emptyOrderedItemInterruptsParagraph:Z

.field protected emptyOrderedNonOneItemInterruptsItemParagraph:Z

.field protected emptyOrderedNonOneItemInterruptsParagraph:Z

.field protected emptyOrderedNonOneSubItemInterruptsItemParagraph:Z

.field protected emptyOrderedSubItemInterruptsItemParagraph:Z

.field protected orderedItemInterruptsItemParagraph:Z

.field protected orderedItemInterruptsParagraph:Z

.field protected orderedNonOneItemInterruptsItemParagraph:Z

.field protected orderedNonOneItemInterruptsParagraph:Z


# direct methods
.method public constructor <init>()V
    .locals 1

    .line 364
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const/4 v0, 0x0

    .line 365
    iput-boolean v0, p0, Lcom/vladsch/flexmark/parser/ListOptions$ItemInterrupt;->bulletItemInterruptsParagraph:Z

    .line 366
    iput-boolean v0, p0, Lcom/vladsch/flexmark/parser/ListOptions$ItemInterrupt;->orderedItemInterruptsParagraph:Z

    .line 367
    iput-boolean v0, p0, Lcom/vladsch/flexmark/parser/ListOptions$ItemInterrupt;->orderedNonOneItemInterruptsParagraph:Z

    .line 369
    iput-boolean v0, p0, Lcom/vladsch/flexmark/parser/ListOptions$ItemInterrupt;->emptyBulletItemInterruptsParagraph:Z

    .line 370
    iput-boolean v0, p0, Lcom/vladsch/flexmark/parser/ListOptions$ItemInterrupt;->emptyOrderedItemInterruptsParagraph:Z

    .line 371
    iput-boolean v0, p0, Lcom/vladsch/flexmark/parser/ListOptions$ItemInterrupt;->emptyOrderedNonOneItemInterruptsParagraph:Z

    .line 373
    iput-boolean v0, p0, Lcom/vladsch/flexmark/parser/ListOptions$ItemInterrupt;->bulletItemInterruptsItemParagraph:Z

    .line 374
    iput-boolean v0, p0, Lcom/vladsch/flexmark/parser/ListOptions$ItemInterrupt;->orderedItemInterruptsItemParagraph:Z

    .line 375
    iput-boolean v0, p0, Lcom/vladsch/flexmark/parser/ListOptions$ItemInterrupt;->orderedNonOneItemInterruptsItemParagraph:Z

    .line 377
    iput-boolean v0, p0, Lcom/vladsch/flexmark/parser/ListOptions$ItemInterrupt;->emptyBulletItemInterruptsItemParagraph:Z

    .line 378
    iput-boolean v0, p0, Lcom/vladsch/flexmark/parser/ListOptions$ItemInterrupt;->emptyOrderedItemInterruptsItemParagraph:Z

    .line 379
    iput-boolean v0, p0, Lcom/vladsch/flexmark/parser/ListOptions$ItemInterrupt;->emptyOrderedNonOneItemInterruptsItemParagraph:Z

    .line 381
    iput-boolean v0, p0, Lcom/vladsch/flexmark/parser/ListOptions$ItemInterrupt;->emptyBulletSubItemInterruptsItemParagraph:Z

    .line 382
    iput-boolean v0, p0, Lcom/vladsch/flexmark/parser/ListOptions$ItemInterrupt;->emptyOrderedSubItemInterruptsItemParagraph:Z

    .line 383
    iput-boolean v0, p0, Lcom/vladsch/flexmark/parser/ListOptions$ItemInterrupt;->emptyOrderedNonOneSubItemInterruptsItemParagraph:Z

    return-void
.end method

.method public constructor <init>(Lcom/vladsch/flexmark/parser/ListOptions$ItemInterrupt;)V
    .locals 1

    .line 430
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 431
    iget-boolean v0, p1, Lcom/vladsch/flexmark/parser/ListOptions$ItemInterrupt;->bulletItemInterruptsParagraph:Z

    iput-boolean v0, p0, Lcom/vladsch/flexmark/parser/ListOptions$ItemInterrupt;->bulletItemInterruptsParagraph:Z

    .line 432
    iget-boolean v0, p1, Lcom/vladsch/flexmark/parser/ListOptions$ItemInterrupt;->orderedItemInterruptsParagraph:Z

    iput-boolean v0, p0, Lcom/vladsch/flexmark/parser/ListOptions$ItemInterrupt;->orderedItemInterruptsParagraph:Z

    .line 433
    iget-boolean v0, p1, Lcom/vladsch/flexmark/parser/ListOptions$ItemInterrupt;->orderedNonOneItemInterruptsParagraph:Z

    iput-boolean v0, p0, Lcom/vladsch/flexmark/parser/ListOptions$ItemInterrupt;->orderedNonOneItemInterruptsParagraph:Z

    .line 435
    iget-boolean v0, p1, Lcom/vladsch/flexmark/parser/ListOptions$ItemInterrupt;->emptyBulletItemInterruptsParagraph:Z

    iput-boolean v0, p0, Lcom/vladsch/flexmark/parser/ListOptions$ItemInterrupt;->emptyBulletItemInterruptsParagraph:Z

    .line 436
    iget-boolean v0, p1, Lcom/vladsch/flexmark/parser/ListOptions$ItemInterrupt;->emptyOrderedItemInterruptsParagraph:Z

    iput-boolean v0, p0, Lcom/vladsch/flexmark/parser/ListOptions$ItemInterrupt;->emptyOrderedItemInterruptsParagraph:Z

    .line 437
    iget-boolean v0, p1, Lcom/vladsch/flexmark/parser/ListOptions$ItemInterrupt;->emptyOrderedNonOneItemInterruptsParagraph:Z

    iput-boolean v0, p0, Lcom/vladsch/flexmark/parser/ListOptions$ItemInterrupt;->emptyOrderedNonOneItemInterruptsParagraph:Z

    .line 439
    iget-boolean v0, p1, Lcom/vladsch/flexmark/parser/ListOptions$ItemInterrupt;->bulletItemInterruptsItemParagraph:Z

    iput-boolean v0, p0, Lcom/vladsch/flexmark/parser/ListOptions$ItemInterrupt;->bulletItemInterruptsItemParagraph:Z

    .line 440
    iget-boolean v0, p1, Lcom/vladsch/flexmark/parser/ListOptions$ItemInterrupt;->orderedItemInterruptsItemParagraph:Z

    iput-boolean v0, p0, Lcom/vladsch/flexmark/parser/ListOptions$ItemInterrupt;->orderedItemInterruptsItemParagraph:Z

    .line 441
    iget-boolean v0, p1, Lcom/vladsch/flexmark/parser/ListOptions$ItemInterrupt;->orderedNonOneItemInterruptsItemParagraph:Z

    iput-boolean v0, p0, Lcom/vladsch/flexmark/parser/ListOptions$ItemInterrupt;->orderedNonOneItemInterruptsItemParagraph:Z

    .line 443
    iget-boolean v0, p1, Lcom/vladsch/flexmark/parser/ListOptions$ItemInterrupt;->emptyBulletItemInterruptsItemParagraph:Z

    iput-boolean v0, p0, Lcom/vladsch/flexmark/parser/ListOptions$ItemInterrupt;->emptyBulletItemInterruptsItemParagraph:Z

    .line 444
    iget-boolean v0, p1, Lcom/vladsch/flexmark/parser/ListOptions$ItemInterrupt;->emptyOrderedItemInterruptsItemParagraph:Z

    iput-boolean v0, p0, Lcom/vladsch/flexmark/parser/ListOptions$ItemInterrupt;->emptyOrderedItemInterruptsItemParagraph:Z

    .line 445
    iget-boolean v0, p1, Lcom/vladsch/flexmark/parser/ListOptions$ItemInterrupt;->emptyOrderedNonOneItemInterruptsItemParagraph:Z

    iput-boolean v0, p0, Lcom/vladsch/flexmark/parser/ListOptions$ItemInterrupt;->emptyOrderedNonOneItemInterruptsItemParagraph:Z

    .line 447
    iget-boolean v0, p1, Lcom/vladsch/flexmark/parser/ListOptions$ItemInterrupt;->emptyBulletSubItemInterruptsItemParagraph:Z

    iput-boolean v0, p0, Lcom/vladsch/flexmark/parser/ListOptions$ItemInterrupt;->emptyBulletSubItemInterruptsItemParagraph:Z

    .line 448
    iget-boolean v0, p1, Lcom/vladsch/flexmark/parser/ListOptions$ItemInterrupt;->emptyOrderedSubItemInterruptsItemParagraph:Z

    iput-boolean v0, p0, Lcom/vladsch/flexmark/parser/ListOptions$ItemInterrupt;->emptyOrderedSubItemInterruptsItemParagraph:Z

    .line 449
    iget-boolean p1, p1, Lcom/vladsch/flexmark/parser/ListOptions$ItemInterrupt;->emptyOrderedNonOneSubItemInterruptsItemParagraph:Z

    iput-boolean p1, p0, Lcom/vladsch/flexmark/parser/ListOptions$ItemInterrupt;->emptyOrderedNonOneSubItemInterruptsItemParagraph:Z

    return-void
.end method

.method public constructor <init>(Lcom/vladsch/flexmark/util/options/DataHolder;)V
    .locals 1

    .line 386
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 387
    sget-object v0, Lcom/vladsch/flexmark/parser/Parser;->LISTS_BULLET_ITEM_INTERRUPTS_PARAGRAPH:Lcom/vladsch/flexmark/util/options/DataKey;

    invoke-virtual {v0, p1}, Lcom/vladsch/flexmark/util/options/DataKey;->getFrom(Lcom/vladsch/flexmark/util/options/DataHolder;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/Boolean;

    invoke-virtual {v0}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v0

    iput-boolean v0, p0, Lcom/vladsch/flexmark/parser/ListOptions$ItemInterrupt;->bulletItemInterruptsParagraph:Z

    .line 388
    sget-object v0, Lcom/vladsch/flexmark/parser/Parser;->LISTS_ORDERED_ITEM_INTERRUPTS_PARAGRAPH:Lcom/vladsch/flexmark/util/options/DataKey;

    invoke-virtual {v0, p1}, Lcom/vladsch/flexmark/util/options/DataKey;->getFrom(Lcom/vladsch/flexmark/util/options/DataHolder;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/Boolean;

    invoke-virtual {v0}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v0

    iput-boolean v0, p0, Lcom/vladsch/flexmark/parser/ListOptions$ItemInterrupt;->orderedItemInterruptsParagraph:Z

    .line 389
    sget-object v0, Lcom/vladsch/flexmark/parser/Parser;->LISTS_ORDERED_NON_ONE_ITEM_INTERRUPTS_PARAGRAPH:Lcom/vladsch/flexmark/util/options/DataKey;

    invoke-virtual {v0, p1}, Lcom/vladsch/flexmark/util/options/DataKey;->getFrom(Lcom/vladsch/flexmark/util/options/DataHolder;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/Boolean;

    invoke-virtual {v0}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v0

    iput-boolean v0, p0, Lcom/vladsch/flexmark/parser/ListOptions$ItemInterrupt;->orderedNonOneItemInterruptsParagraph:Z

    .line 391
    sget-object v0, Lcom/vladsch/flexmark/parser/Parser;->LISTS_EMPTY_BULLET_ITEM_INTERRUPTS_PARAGRAPH:Lcom/vladsch/flexmark/util/options/DataKey;

    invoke-virtual {v0, p1}, Lcom/vladsch/flexmark/util/options/DataKey;->getFrom(Lcom/vladsch/flexmark/util/options/DataHolder;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/Boolean;

    invoke-virtual {v0}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v0

    iput-boolean v0, p0, Lcom/vladsch/flexmark/parser/ListOptions$ItemInterrupt;->emptyBulletItemInterruptsParagraph:Z

    .line 392
    sget-object v0, Lcom/vladsch/flexmark/parser/Parser;->LISTS_EMPTY_ORDERED_ITEM_INTERRUPTS_PARAGRAPH:Lcom/vladsch/flexmark/util/options/DataKey;

    invoke-virtual {v0, p1}, Lcom/vladsch/flexmark/util/options/DataKey;->getFrom(Lcom/vladsch/flexmark/util/options/DataHolder;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/Boolean;

    invoke-virtual {v0}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v0

    iput-boolean v0, p0, Lcom/vladsch/flexmark/parser/ListOptions$ItemInterrupt;->emptyOrderedItemInterruptsParagraph:Z

    .line 393
    sget-object v0, Lcom/vladsch/flexmark/parser/Parser;->LISTS_EMPTY_ORDERED_NON_ONE_ITEM_INTERRUPTS_PARAGRAPH:Lcom/vladsch/flexmark/util/options/DataKey;

    invoke-virtual {v0, p1}, Lcom/vladsch/flexmark/util/options/DataKey;->getFrom(Lcom/vladsch/flexmark/util/options/DataHolder;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/Boolean;

    invoke-virtual {v0}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v0

    iput-boolean v0, p0, Lcom/vladsch/flexmark/parser/ListOptions$ItemInterrupt;->emptyOrderedNonOneItemInterruptsParagraph:Z

    .line 395
    sget-object v0, Lcom/vladsch/flexmark/parser/Parser;->LISTS_BULLET_ITEM_INTERRUPTS_ITEM_PARAGRAPH:Lcom/vladsch/flexmark/util/options/DataKey;

    invoke-virtual {v0, p1}, Lcom/vladsch/flexmark/util/options/DataKey;->getFrom(Lcom/vladsch/flexmark/util/options/DataHolder;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/Boolean;

    invoke-virtual {v0}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v0

    iput-boolean v0, p0, Lcom/vladsch/flexmark/parser/ListOptions$ItemInterrupt;->bulletItemInterruptsItemParagraph:Z

    .line 396
    sget-object v0, Lcom/vladsch/flexmark/parser/Parser;->LISTS_ORDERED_ITEM_INTERRUPTS_ITEM_PARAGRAPH:Lcom/vladsch/flexmark/util/options/DataKey;

    invoke-virtual {v0, p1}, Lcom/vladsch/flexmark/util/options/DataKey;->getFrom(Lcom/vladsch/flexmark/util/options/DataHolder;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/Boolean;

    invoke-virtual {v0}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v0

    iput-boolean v0, p0, Lcom/vladsch/flexmark/parser/ListOptions$ItemInterrupt;->orderedItemInterruptsItemParagraph:Z

    .line 397
    sget-object v0, Lcom/vladsch/flexmark/parser/Parser;->LISTS_ORDERED_NON_ONE_ITEM_INTERRUPTS_ITEM_PARAGRAPH:Lcom/vladsch/flexmark/util/options/DataKey;

    invoke-virtual {v0, p1}, Lcom/vladsch/flexmark/util/options/DataKey;->getFrom(Lcom/vladsch/flexmark/util/options/DataHolder;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/Boolean;

    invoke-virtual {v0}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v0

    iput-boolean v0, p0, Lcom/vladsch/flexmark/parser/ListOptions$ItemInterrupt;->orderedNonOneItemInterruptsItemParagraph:Z

    .line 399
    sget-object v0, Lcom/vladsch/flexmark/parser/Parser;->LISTS_EMPTY_BULLET_ITEM_INTERRUPTS_ITEM_PARAGRAPH:Lcom/vladsch/flexmark/util/options/DataKey;

    invoke-virtual {v0, p1}, Lcom/vladsch/flexmark/util/options/DataKey;->getFrom(Lcom/vladsch/flexmark/util/options/DataHolder;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/Boolean;

    invoke-virtual {v0}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v0

    iput-boolean v0, p0, Lcom/vladsch/flexmark/parser/ListOptions$ItemInterrupt;->emptyBulletItemInterruptsItemParagraph:Z

    .line 400
    sget-object v0, Lcom/vladsch/flexmark/parser/Parser;->LISTS_EMPTY_ORDERED_ITEM_INTERRUPTS_ITEM_PARAGRAPH:Lcom/vladsch/flexmark/util/options/DataKey;

    invoke-virtual {v0, p1}, Lcom/vladsch/flexmark/util/options/DataKey;->getFrom(Lcom/vladsch/flexmark/util/options/DataHolder;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/Boolean;

    invoke-virtual {v0}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v0

    iput-boolean v0, p0, Lcom/vladsch/flexmark/parser/ListOptions$ItemInterrupt;->emptyOrderedItemInterruptsItemParagraph:Z

    .line 401
    sget-object v0, Lcom/vladsch/flexmark/parser/Parser;->LISTS_EMPTY_ORDERED_NON_ONE_ITEM_INTERRUPTS_ITEM_PARAGRAPH:Lcom/vladsch/flexmark/util/options/DataKey;

    invoke-virtual {v0, p1}, Lcom/vladsch/flexmark/util/options/DataKey;->getFrom(Lcom/vladsch/flexmark/util/options/DataHolder;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/Boolean;

    invoke-virtual {v0}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v0

    iput-boolean v0, p0, Lcom/vladsch/flexmark/parser/ListOptions$ItemInterrupt;->emptyOrderedNonOneItemInterruptsItemParagraph:Z

    .line 403
    sget-object v0, Lcom/vladsch/flexmark/parser/Parser;->LISTS_EMPTY_BULLET_SUB_ITEM_INTERRUPTS_ITEM_PARAGRAPH:Lcom/vladsch/flexmark/util/options/DataKey;

    invoke-virtual {v0, p1}, Lcom/vladsch/flexmark/util/options/DataKey;->getFrom(Lcom/vladsch/flexmark/util/options/DataHolder;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/Boolean;

    invoke-virtual {v0}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v0

    iput-boolean v0, p0, Lcom/vladsch/flexmark/parser/ListOptions$ItemInterrupt;->emptyBulletSubItemInterruptsItemParagraph:Z

    .line 404
    sget-object v0, Lcom/vladsch/flexmark/parser/Parser;->LISTS_EMPTY_ORDERED_SUB_ITEM_INTERRUPTS_ITEM_PARAGRAPH:Lcom/vladsch/flexmark/util/options/DataKey;

    invoke-virtual {v0, p1}, Lcom/vladsch/flexmark/util/options/DataKey;->getFrom(Lcom/vladsch/flexmark/util/options/DataHolder;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/Boolean;

    invoke-virtual {v0}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v0

    iput-boolean v0, p0, Lcom/vladsch/flexmark/parser/ListOptions$ItemInterrupt;->emptyOrderedSubItemInterruptsItemParagraph:Z

    .line 405
    sget-object v0, Lcom/vladsch/flexmark/parser/Parser;->LISTS_EMPTY_ORDERED_NON_ONE_SUB_ITEM_INTERRUPTS_ITEM_PARAGRAPH:Lcom/vladsch/flexmark/util/options/DataKey;

    invoke-virtual {v0, p1}, Lcom/vladsch/flexmark/util/options/DataKey;->getFrom(Lcom/vladsch/flexmark/util/options/DataHolder;)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Ljava/lang/Boolean;

    invoke-virtual {p1}, Ljava/lang/Boolean;->booleanValue()Z

    move-result p1

    iput-boolean p1, p0, Lcom/vladsch/flexmark/parser/ListOptions$ItemInterrupt;->emptyOrderedNonOneSubItemInterruptsItemParagraph:Z

    return-void
.end method


# virtual methods
.method public canInterrupt(ZZZZ)Z
    .locals 2

    const/4 v0, 0x1

    const/4 v1, 0x0

    if-eqz p1, :cond_b

    if-eqz p2, :cond_5

    if-eqz p4, :cond_2

    .line 456
    iget-boolean p1, p0, Lcom/vladsch/flexmark/parser/ListOptions$ItemInterrupt;->orderedItemInterruptsItemParagraph:Z

    if-eqz p1, :cond_1

    if-eqz p3, :cond_0

    iget-boolean p1, p0, Lcom/vladsch/flexmark/parser/ListOptions$ItemInterrupt;->emptyOrderedItemInterruptsItemParagraph:Z

    if-eqz p1, :cond_1

    :cond_0
    return v0

    :cond_1
    return v1

    .line 458
    :cond_2
    iget-boolean p1, p0, Lcom/vladsch/flexmark/parser/ListOptions$ItemInterrupt;->orderedItemInterruptsParagraph:Z

    if-eqz p1, :cond_4

    if-eqz p3, :cond_3

    iget-boolean p1, p0, Lcom/vladsch/flexmark/parser/ListOptions$ItemInterrupt;->emptyOrderedItemInterruptsParagraph:Z

    if-eqz p1, :cond_4

    :cond_3
    return v0

    :cond_4
    return v1

    :cond_5
    if-eqz p4, :cond_8

    .line 462
    iget-boolean p1, p0, Lcom/vladsch/flexmark/parser/ListOptions$ItemInterrupt;->orderedNonOneItemInterruptsItemParagraph:Z

    if-eqz p1, :cond_7

    if-eqz p3, :cond_6

    iget-boolean p1, p0, Lcom/vladsch/flexmark/parser/ListOptions$ItemInterrupt;->emptyOrderedNonOneItemInterruptsItemParagraph:Z

    if-eqz p1, :cond_7

    :cond_6
    return v0

    :cond_7
    return v1

    .line 464
    :cond_8
    iget-boolean p1, p0, Lcom/vladsch/flexmark/parser/ListOptions$ItemInterrupt;->orderedNonOneItemInterruptsParagraph:Z

    if-eqz p1, :cond_a

    if-eqz p3, :cond_9

    iget-boolean p1, p0, Lcom/vladsch/flexmark/parser/ListOptions$ItemInterrupt;->emptyOrderedNonOneItemInterruptsParagraph:Z

    if-eqz p1, :cond_a

    :cond_9
    return v0

    :cond_a
    return v1

    :cond_b
    if-eqz p4, :cond_e

    .line 469
    iget-boolean p1, p0, Lcom/vladsch/flexmark/parser/ListOptions$ItemInterrupt;->bulletItemInterruptsItemParagraph:Z

    if-eqz p1, :cond_d

    if-eqz p3, :cond_c

    iget-boolean p1, p0, Lcom/vladsch/flexmark/parser/ListOptions$ItemInterrupt;->emptyBulletItemInterruptsItemParagraph:Z

    if-eqz p1, :cond_d

    :cond_c
    return v0

    :cond_d
    return v1

    .line 471
    :cond_e
    iget-boolean p1, p0, Lcom/vladsch/flexmark/parser/ListOptions$ItemInterrupt;->bulletItemInterruptsParagraph:Z

    if-eqz p1, :cond_10

    if-eqz p3, :cond_f

    iget-boolean p1, p0, Lcom/vladsch/flexmark/parser/ListOptions$ItemInterrupt;->emptyBulletItemInterruptsParagraph:Z

    if-eqz p1, :cond_10

    :cond_f
    return v0

    :cond_10
    return v1
.end method

.method public canStartSubList(ZZZ)Z
    .locals 2

    const/4 v0, 0x1

    const/4 v1, 0x0

    if-eqz p1, :cond_3

    .line 478
    iget-boolean p1, p0, Lcom/vladsch/flexmark/parser/ListOptions$ItemInterrupt;->orderedItemInterruptsItemParagraph:Z

    if-eqz p1, :cond_2

    if-eqz p3, :cond_0

    iget-boolean p1, p0, Lcom/vladsch/flexmark/parser/ListOptions$ItemInterrupt;->emptyOrderedSubItemInterruptsItemParagraph:Z

    if-eqz p1, :cond_2

    iget-boolean p1, p0, Lcom/vladsch/flexmark/parser/ListOptions$ItemInterrupt;->emptyOrderedItemInterruptsItemParagraph:Z

    if-eqz p1, :cond_2

    :cond_0
    if-nez p2, :cond_1

    iget-boolean p1, p0, Lcom/vladsch/flexmark/parser/ListOptions$ItemInterrupt;->orderedNonOneItemInterruptsItemParagraph:Z

    if-eqz p1, :cond_2

    if-eqz p3, :cond_1

    iget-boolean p1, p0, Lcom/vladsch/flexmark/parser/ListOptions$ItemInterrupt;->emptyOrderedNonOneSubItemInterruptsItemParagraph:Z

    if-eqz p1, :cond_2

    iget-boolean p1, p0, Lcom/vladsch/flexmark/parser/ListOptions$ItemInterrupt;->emptyOrderedNonOneItemInterruptsItemParagraph:Z

    if-eqz p1, :cond_2

    :cond_1
    return v0

    :cond_2
    return v1

    .line 482
    :cond_3
    iget-boolean p1, p0, Lcom/vladsch/flexmark/parser/ListOptions$ItemInterrupt;->bulletItemInterruptsItemParagraph:Z

    if-eqz p1, :cond_5

    if-eqz p3, :cond_4

    iget-boolean p1, p0, Lcom/vladsch/flexmark/parser/ListOptions$ItemInterrupt;->emptyBulletSubItemInterruptsItemParagraph:Z

    if-eqz p1, :cond_5

    iget-boolean p1, p0, Lcom/vladsch/flexmark/parser/ListOptions$ItemInterrupt;->emptyBulletItemInterruptsItemParagraph:Z

    if-eqz p1, :cond_5

    :cond_4
    return v0

    :cond_5
    return v1
.end method

.method public equals(Ljava/lang/Object;)Z
    .locals 4

    const/4 v0, 0x1

    if-ne p0, p1, :cond_0

    return v0

    .line 489
    :cond_0
    instance-of v1, p1, Lcom/vladsch/flexmark/parser/ListOptions$ItemInterrupt;

    const/4 v2, 0x0

    if-nez v1, :cond_1

    return v2

    .line 491
    :cond_1
    check-cast p1, Lcom/vladsch/flexmark/parser/ListOptions$ItemInterrupt;

    .line 493
    iget-boolean v1, p0, Lcom/vladsch/flexmark/parser/ListOptions$ItemInterrupt;->bulletItemInterruptsParagraph:Z

    iget-boolean v3, p1, Lcom/vladsch/flexmark/parser/ListOptions$ItemInterrupt;->bulletItemInterruptsParagraph:Z

    if-eq v1, v3, :cond_2

    return v2

    .line 494
    :cond_2
    iget-boolean v1, p0, Lcom/vladsch/flexmark/parser/ListOptions$ItemInterrupt;->orderedItemInterruptsParagraph:Z

    iget-boolean v3, p1, Lcom/vladsch/flexmark/parser/ListOptions$ItemInterrupt;->orderedItemInterruptsParagraph:Z

    if-eq v1, v3, :cond_3

    return v2

    .line 495
    :cond_3
    iget-boolean v1, p0, Lcom/vladsch/flexmark/parser/ListOptions$ItemInterrupt;->orderedNonOneItemInterruptsParagraph:Z

    iget-boolean v3, p1, Lcom/vladsch/flexmark/parser/ListOptions$ItemInterrupt;->orderedNonOneItemInterruptsParagraph:Z

    if-eq v1, v3, :cond_4

    return v2

    .line 496
    :cond_4
    iget-boolean v1, p0, Lcom/vladsch/flexmark/parser/ListOptions$ItemInterrupt;->emptyBulletItemInterruptsParagraph:Z

    iget-boolean v3, p1, Lcom/vladsch/flexmark/parser/ListOptions$ItemInterrupt;->emptyBulletItemInterruptsParagraph:Z

    if-eq v1, v3, :cond_5

    return v2

    .line 497
    :cond_5
    iget-boolean v1, p0, Lcom/vladsch/flexmark/parser/ListOptions$ItemInterrupt;->emptyOrderedItemInterruptsParagraph:Z

    iget-boolean v3, p1, Lcom/vladsch/flexmark/parser/ListOptions$ItemInterrupt;->emptyOrderedItemInterruptsParagraph:Z

    if-eq v1, v3, :cond_6

    return v2

    .line 498
    :cond_6
    iget-boolean v1, p0, Lcom/vladsch/flexmark/parser/ListOptions$ItemInterrupt;->emptyOrderedNonOneItemInterruptsParagraph:Z

    iget-boolean v3, p1, Lcom/vladsch/flexmark/parser/ListOptions$ItemInterrupt;->emptyOrderedNonOneItemInterruptsParagraph:Z

    if-eq v1, v3, :cond_7

    return v2

    .line 499
    :cond_7
    iget-boolean v1, p0, Lcom/vladsch/flexmark/parser/ListOptions$ItemInterrupt;->bulletItemInterruptsItemParagraph:Z

    iget-boolean v3, p1, Lcom/vladsch/flexmark/parser/ListOptions$ItemInterrupt;->bulletItemInterruptsItemParagraph:Z

    if-eq v1, v3, :cond_8

    return v2

    .line 500
    :cond_8
    iget-boolean v1, p0, Lcom/vladsch/flexmark/parser/ListOptions$ItemInterrupt;->orderedItemInterruptsItemParagraph:Z

    iget-boolean v3, p1, Lcom/vladsch/flexmark/parser/ListOptions$ItemInterrupt;->orderedItemInterruptsItemParagraph:Z

    if-eq v1, v3, :cond_9

    return v2

    .line 501
    :cond_9
    iget-boolean v1, p0, Lcom/vladsch/flexmark/parser/ListOptions$ItemInterrupt;->orderedNonOneItemInterruptsItemParagraph:Z

    iget-boolean v3, p1, Lcom/vladsch/flexmark/parser/ListOptions$ItemInterrupt;->orderedNonOneItemInterruptsItemParagraph:Z

    if-eq v1, v3, :cond_a

    return v2

    .line 502
    :cond_a
    iget-boolean v1, p0, Lcom/vladsch/flexmark/parser/ListOptions$ItemInterrupt;->emptyBulletItemInterruptsItemParagraph:Z

    iget-boolean v3, p1, Lcom/vladsch/flexmark/parser/ListOptions$ItemInterrupt;->emptyBulletItemInterruptsItemParagraph:Z

    if-eq v1, v3, :cond_b

    return v2

    .line 503
    :cond_b
    iget-boolean v1, p0, Lcom/vladsch/flexmark/parser/ListOptions$ItemInterrupt;->emptyOrderedItemInterruptsItemParagraph:Z

    iget-boolean v3, p1, Lcom/vladsch/flexmark/parser/ListOptions$ItemInterrupt;->emptyOrderedItemInterruptsItemParagraph:Z

    if-eq v1, v3, :cond_c

    return v2

    .line 504
    :cond_c
    iget-boolean v1, p0, Lcom/vladsch/flexmark/parser/ListOptions$ItemInterrupt;->emptyOrderedNonOneItemInterruptsItemParagraph:Z

    iget-boolean v3, p1, Lcom/vladsch/flexmark/parser/ListOptions$ItemInterrupt;->emptyOrderedNonOneItemInterruptsItemParagraph:Z

    if-eq v1, v3, :cond_d

    return v2

    .line 505
    :cond_d
    iget-boolean v1, p0, Lcom/vladsch/flexmark/parser/ListOptions$ItemInterrupt;->emptyBulletSubItemInterruptsItemParagraph:Z

    iget-boolean v3, p1, Lcom/vladsch/flexmark/parser/ListOptions$ItemInterrupt;->emptyBulletSubItemInterruptsItemParagraph:Z

    if-eq v1, v3, :cond_e

    return v2

    .line 506
    :cond_e
    iget-boolean v1, p0, Lcom/vladsch/flexmark/parser/ListOptions$ItemInterrupt;->emptyOrderedSubItemInterruptsItemParagraph:Z

    iget-boolean v3, p1, Lcom/vladsch/flexmark/parser/ListOptions$ItemInterrupt;->emptyOrderedSubItemInterruptsItemParagraph:Z

    if-eq v1, v3, :cond_f

    return v2

    .line 507
    :cond_f
    iget-boolean v1, p0, Lcom/vladsch/flexmark/parser/ListOptions$ItemInterrupt;->emptyOrderedNonOneSubItemInterruptsItemParagraph:Z

    iget-boolean p1, p1, Lcom/vladsch/flexmark/parser/ListOptions$ItemInterrupt;->emptyOrderedNonOneSubItemInterruptsItemParagraph:Z

    if-ne v1, p1, :cond_10

    return v0

    :cond_10
    return v2
.end method

.method public hashCode()I
    .locals 2

    .line 512
    iget-boolean v0, p0, Lcom/vladsch/flexmark/parser/ListOptions$ItemInterrupt;->bulletItemInterruptsParagraph:Z

    mul-int/lit8 v0, v0, 0x1f

    .line 513
    iget-boolean v1, p0, Lcom/vladsch/flexmark/parser/ListOptions$ItemInterrupt;->orderedItemInterruptsParagraph:Z

    add-int/2addr v0, v1

    mul-int/lit8 v0, v0, 0x1f

    .line 514
    iget-boolean v1, p0, Lcom/vladsch/flexmark/parser/ListOptions$ItemInterrupt;->orderedNonOneItemInterruptsParagraph:Z

    add-int/2addr v0, v1

    mul-int/lit8 v0, v0, 0x1f

    .line 515
    iget-boolean v1, p0, Lcom/vladsch/flexmark/parser/ListOptions$ItemInterrupt;->emptyBulletItemInterruptsParagraph:Z

    add-int/2addr v0, v1

    mul-int/lit8 v0, v0, 0x1f

    .line 516
    iget-boolean v1, p0, Lcom/vladsch/flexmark/parser/ListOptions$ItemInterrupt;->emptyOrderedItemInterruptsParagraph:Z

    add-int/2addr v0, v1

    mul-int/lit8 v0, v0, 0x1f

    .line 517
    iget-boolean v1, p0, Lcom/vladsch/flexmark/parser/ListOptions$ItemInterrupt;->emptyOrderedNonOneItemInterruptsParagraph:Z

    add-int/2addr v0, v1

    mul-int/lit8 v0, v0, 0x1f

    .line 518
    iget-boolean v1, p0, Lcom/vladsch/flexmark/parser/ListOptions$ItemInterrupt;->bulletItemInterruptsItemParagraph:Z

    add-int/2addr v0, v1

    mul-int/lit8 v0, v0, 0x1f

    .line 519
    iget-boolean v1, p0, Lcom/vladsch/flexmark/parser/ListOptions$ItemInterrupt;->orderedItemInterruptsItemParagraph:Z

    add-int/2addr v0, v1

    mul-int/lit8 v0, v0, 0x1f

    .line 520
    iget-boolean v1, p0, Lcom/vladsch/flexmark/parser/ListOptions$ItemInterrupt;->orderedNonOneItemInterruptsItemParagraph:Z

    add-int/2addr v0, v1

    mul-int/lit8 v0, v0, 0x1f

    .line 521
    iget-boolean v1, p0, Lcom/vladsch/flexmark/parser/ListOptions$ItemInterrupt;->emptyBulletItemInterruptsItemParagraph:Z

    add-int/2addr v0, v1

    mul-int/lit8 v0, v0, 0x1f

    .line 522
    iget-boolean v1, p0, Lcom/vladsch/flexmark/parser/ListOptions$ItemInterrupt;->emptyOrderedItemInterruptsItemParagraph:Z

    add-int/2addr v0, v1

    mul-int/lit8 v0, v0, 0x1f

    .line 523
    iget-boolean v1, p0, Lcom/vladsch/flexmark/parser/ListOptions$ItemInterrupt;->emptyOrderedNonOneItemInterruptsItemParagraph:Z

    add-int/2addr v0, v1

    mul-int/lit8 v0, v0, 0x1f

    .line 524
    iget-boolean v1, p0, Lcom/vladsch/flexmark/parser/ListOptions$ItemInterrupt;->emptyBulletSubItemInterruptsItemParagraph:Z

    add-int/2addr v0, v1

    mul-int/lit8 v0, v0, 0x1f

    .line 525
    iget-boolean v1, p0, Lcom/vladsch/flexmark/parser/ListOptions$ItemInterrupt;->emptyOrderedSubItemInterruptsItemParagraph:Z

    add-int/2addr v0, v1

    mul-int/lit8 v0, v0, 0x1f

    .line 526
    iget-boolean v1, p0, Lcom/vladsch/flexmark/parser/ListOptions$ItemInterrupt;->emptyOrderedNonOneSubItemInterruptsItemParagraph:Z

    add-int/2addr v0, v1

    return v0
.end method

.method public setIn(Lcom/vladsch/flexmark/util/options/MutableDataHolder;)V
    .locals 2

    .line 409
    sget-object v0, Lcom/vladsch/flexmark/parser/Parser;->LISTS_BULLET_ITEM_INTERRUPTS_PARAGRAPH:Lcom/vladsch/flexmark/util/options/DataKey;

    iget-boolean v1, p0, Lcom/vladsch/flexmark/parser/ListOptions$ItemInterrupt;->bulletItemInterruptsParagraph:Z

    invoke-static {v1}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v1

    invoke-interface {p1, v0, v1}, Lcom/vladsch/flexmark/util/options/MutableDataHolder;->set(Lcom/vladsch/flexmark/util/options/DataKey;Ljava/lang/Object;)Lcom/vladsch/flexmark/util/options/MutableDataHolder;

    .line 410
    sget-object v0, Lcom/vladsch/flexmark/parser/Parser;->LISTS_ORDERED_ITEM_INTERRUPTS_PARAGRAPH:Lcom/vladsch/flexmark/util/options/DataKey;

    iget-boolean v1, p0, Lcom/vladsch/flexmark/parser/ListOptions$ItemInterrupt;->orderedItemInterruptsParagraph:Z

    invoke-static {v1}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v1

    invoke-interface {p1, v0, v1}, Lcom/vladsch/flexmark/util/options/MutableDataHolder;->set(Lcom/vladsch/flexmark/util/options/DataKey;Ljava/lang/Object;)Lcom/vladsch/flexmark/util/options/MutableDataHolder;

    .line 411
    sget-object v0, Lcom/vladsch/flexmark/parser/Parser;->LISTS_ORDERED_NON_ONE_ITEM_INTERRUPTS_PARAGRAPH:Lcom/vladsch/flexmark/util/options/DataKey;

    iget-boolean v1, p0, Lcom/vladsch/flexmark/parser/ListOptions$ItemInterrupt;->orderedNonOneItemInterruptsParagraph:Z

    invoke-static {v1}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v1

    invoke-interface {p1, v0, v1}, Lcom/vladsch/flexmark/util/options/MutableDataHolder;->set(Lcom/vladsch/flexmark/util/options/DataKey;Ljava/lang/Object;)Lcom/vladsch/flexmark/util/options/MutableDataHolder;

    .line 413
    sget-object v0, Lcom/vladsch/flexmark/parser/Parser;->LISTS_EMPTY_BULLET_ITEM_INTERRUPTS_PARAGRAPH:Lcom/vladsch/flexmark/util/options/DataKey;

    iget-boolean v1, p0, Lcom/vladsch/flexmark/parser/ListOptions$ItemInterrupt;->emptyBulletItemInterruptsParagraph:Z

    invoke-static {v1}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v1

    invoke-interface {p1, v0, v1}, Lcom/vladsch/flexmark/util/options/MutableDataHolder;->set(Lcom/vladsch/flexmark/util/options/DataKey;Ljava/lang/Object;)Lcom/vladsch/flexmark/util/options/MutableDataHolder;

    .line 414
    sget-object v0, Lcom/vladsch/flexmark/parser/Parser;->LISTS_EMPTY_ORDERED_ITEM_INTERRUPTS_PARAGRAPH:Lcom/vladsch/flexmark/util/options/DataKey;

    iget-boolean v1, p0, Lcom/vladsch/flexmark/parser/ListOptions$ItemInterrupt;->emptyOrderedItemInterruptsParagraph:Z

    invoke-static {v1}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v1

    invoke-interface {p1, v0, v1}, Lcom/vladsch/flexmark/util/options/MutableDataHolder;->set(Lcom/vladsch/flexmark/util/options/DataKey;Ljava/lang/Object;)Lcom/vladsch/flexmark/util/options/MutableDataHolder;

    .line 415
    sget-object v0, Lcom/vladsch/flexmark/parser/Parser;->LISTS_EMPTY_ORDERED_NON_ONE_ITEM_INTERRUPTS_PARAGRAPH:Lcom/vladsch/flexmark/util/options/DataKey;

    iget-boolean v1, p0, Lcom/vladsch/flexmark/parser/ListOptions$ItemInterrupt;->emptyOrderedNonOneItemInterruptsParagraph:Z

    invoke-static {v1}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v1

    invoke-interface {p1, v0, v1}, Lcom/vladsch/flexmark/util/options/MutableDataHolder;->set(Lcom/vladsch/flexmark/util/options/DataKey;Ljava/lang/Object;)Lcom/vladsch/flexmark/util/options/MutableDataHolder;

    .line 417
    sget-object v0, Lcom/vladsch/flexmark/parser/Parser;->LISTS_BULLET_ITEM_INTERRUPTS_ITEM_PARAGRAPH:Lcom/vladsch/flexmark/util/options/DataKey;

    iget-boolean v1, p0, Lcom/vladsch/flexmark/parser/ListOptions$ItemInterrupt;->bulletItemInterruptsItemParagraph:Z

    invoke-static {v1}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v1

    invoke-interface {p1, v0, v1}, Lcom/vladsch/flexmark/util/options/MutableDataHolder;->set(Lcom/vladsch/flexmark/util/options/DataKey;Ljava/lang/Object;)Lcom/vladsch/flexmark/util/options/MutableDataHolder;

    .line 418
    sget-object v0, Lcom/vladsch/flexmark/parser/Parser;->LISTS_ORDERED_ITEM_INTERRUPTS_ITEM_PARAGRAPH:Lcom/vladsch/flexmark/util/options/DataKey;

    iget-boolean v1, p0, Lcom/vladsch/flexmark/parser/ListOptions$ItemInterrupt;->orderedItemInterruptsItemParagraph:Z

    invoke-static {v1}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v1

    invoke-interface {p1, v0, v1}, Lcom/vladsch/flexmark/util/options/MutableDataHolder;->set(Lcom/vladsch/flexmark/util/options/DataKey;Ljava/lang/Object;)Lcom/vladsch/flexmark/util/options/MutableDataHolder;

    .line 419
    sget-object v0, Lcom/vladsch/flexmark/parser/Parser;->LISTS_ORDERED_NON_ONE_ITEM_INTERRUPTS_ITEM_PARAGRAPH:Lcom/vladsch/flexmark/util/options/DataKey;

    iget-boolean v1, p0, Lcom/vladsch/flexmark/parser/ListOptions$ItemInterrupt;->orderedNonOneItemInterruptsItemParagraph:Z

    invoke-static {v1}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v1

    invoke-interface {p1, v0, v1}, Lcom/vladsch/flexmark/util/options/MutableDataHolder;->set(Lcom/vladsch/flexmark/util/options/DataKey;Ljava/lang/Object;)Lcom/vladsch/flexmark/util/options/MutableDataHolder;

    .line 421
    sget-object v0, Lcom/vladsch/flexmark/parser/Parser;->LISTS_EMPTY_BULLET_ITEM_INTERRUPTS_ITEM_PARAGRAPH:Lcom/vladsch/flexmark/util/options/DataKey;

    iget-boolean v1, p0, Lcom/vladsch/flexmark/parser/ListOptions$ItemInterrupt;->emptyBulletItemInterruptsItemParagraph:Z

    invoke-static {v1}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v1

    invoke-interface {p1, v0, v1}, Lcom/vladsch/flexmark/util/options/MutableDataHolder;->set(Lcom/vladsch/flexmark/util/options/DataKey;Ljava/lang/Object;)Lcom/vladsch/flexmark/util/options/MutableDataHolder;

    .line 422
    sget-object v0, Lcom/vladsch/flexmark/parser/Parser;->LISTS_EMPTY_ORDERED_ITEM_INTERRUPTS_ITEM_PARAGRAPH:Lcom/vladsch/flexmark/util/options/DataKey;

    iget-boolean v1, p0, Lcom/vladsch/flexmark/parser/ListOptions$ItemInterrupt;->emptyOrderedItemInterruptsItemParagraph:Z

    invoke-static {v1}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v1

    invoke-interface {p1, v0, v1}, Lcom/vladsch/flexmark/util/options/MutableDataHolder;->set(Lcom/vladsch/flexmark/util/options/DataKey;Ljava/lang/Object;)Lcom/vladsch/flexmark/util/options/MutableDataHolder;

    .line 423
    sget-object v0, Lcom/vladsch/flexmark/parser/Parser;->LISTS_EMPTY_ORDERED_NON_ONE_ITEM_INTERRUPTS_ITEM_PARAGRAPH:Lcom/vladsch/flexmark/util/options/DataKey;

    iget-boolean v1, p0, Lcom/vladsch/flexmark/parser/ListOptions$ItemInterrupt;->emptyOrderedNonOneItemInterruptsItemParagraph:Z

    invoke-static {v1}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v1

    invoke-interface {p1, v0, v1}, Lcom/vladsch/flexmark/util/options/MutableDataHolder;->set(Lcom/vladsch/flexmark/util/options/DataKey;Ljava/lang/Object;)Lcom/vladsch/flexmark/util/options/MutableDataHolder;

    .line 425
    sget-object v0, Lcom/vladsch/flexmark/parser/Parser;->LISTS_EMPTY_BULLET_SUB_ITEM_INTERRUPTS_ITEM_PARAGRAPH:Lcom/vladsch/flexmark/util/options/DataKey;

    iget-boolean v1, p0, Lcom/vladsch/flexmark/parser/ListOptions$ItemInterrupt;->emptyBulletSubItemInterruptsItemParagraph:Z

    invoke-static {v1}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v1

    invoke-interface {p1, v0, v1}, Lcom/vladsch/flexmark/util/options/MutableDataHolder;->set(Lcom/vladsch/flexmark/util/options/DataKey;Ljava/lang/Object;)Lcom/vladsch/flexmark/util/options/MutableDataHolder;

    .line 426
    sget-object v0, Lcom/vladsch/flexmark/parser/Parser;->LISTS_EMPTY_ORDERED_SUB_ITEM_INTERRUPTS_ITEM_PARAGRAPH:Lcom/vladsch/flexmark/util/options/DataKey;

    iget-boolean v1, p0, Lcom/vladsch/flexmark/parser/ListOptions$ItemInterrupt;->emptyOrderedSubItemInterruptsItemParagraph:Z

    invoke-static {v1}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v1

    invoke-interface {p1, v0, v1}, Lcom/vladsch/flexmark/util/options/MutableDataHolder;->set(Lcom/vladsch/flexmark/util/options/DataKey;Ljava/lang/Object;)Lcom/vladsch/flexmark/util/options/MutableDataHolder;

    .line 427
    sget-object v0, Lcom/vladsch/flexmark/parser/Parser;->LISTS_EMPTY_ORDERED_NON_ONE_SUB_ITEM_INTERRUPTS_ITEM_PARAGRAPH:Lcom/vladsch/flexmark/util/options/DataKey;

    iget-boolean v1, p0, Lcom/vladsch/flexmark/parser/ListOptions$ItemInterrupt;->emptyOrderedNonOneSubItemInterruptsItemParagraph:Z

    invoke-static {v1}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v1

    invoke-interface {p1, v0, v1}, Lcom/vladsch/flexmark/util/options/MutableDataHolder;->set(Lcom/vladsch/flexmark/util/options/DataKey;Ljava/lang/Object;)Lcom/vladsch/flexmark/util/options/MutableDataHolder;

    return-void
.end method
