.class public abstract Lcom/vladsch/flexmark/util/ast/Node;
.super Ljava/lang/Object;
.source "Node.java"


# static fields
.field public static final EMPTY_SEGMENTS:[Lcom/vladsch/flexmark/util/sequence/BasedSequence;

.field public static final SPLICE:Ljava/lang/String; = " \u2026 "


# instance fields
.field private chars:Lcom/vladsch/flexmark/util/sequence/BasedSequence;

.field private firstChild:Lcom/vladsch/flexmark/util/ast/Node;

.field private lastChild:Lcom/vladsch/flexmark/util/ast/Node;

.field private next:Lcom/vladsch/flexmark/util/ast/Node;

.field private parent:Lcom/vladsch/flexmark/util/ast/Node;

.field private prev:Lcom/vladsch/flexmark/util/ast/Node;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 15
    sget-object v0, Lcom/vladsch/flexmark/util/sequence/BasedSequence;->EMPTY_ARRAY:[Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    sput-object v0, Lcom/vladsch/flexmark/util/ast/Node;->EMPTY_SEGMENTS:[Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    return-void
.end method

.method public constructor <init>()V
    .locals 1

    .line 25
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const/4 v0, 0x0

    .line 18
    iput-object v0, p0, Lcom/vladsch/flexmark/util/ast/Node;->parent:Lcom/vladsch/flexmark/util/ast/Node;

    .line 19
    iput-object v0, p0, Lcom/vladsch/flexmark/util/ast/Node;->firstChild:Lcom/vladsch/flexmark/util/ast/Node;

    .line 20
    iput-object v0, p0, Lcom/vladsch/flexmark/util/ast/Node;->lastChild:Lcom/vladsch/flexmark/util/ast/Node;

    .line 21
    iput-object v0, p0, Lcom/vladsch/flexmark/util/ast/Node;->prev:Lcom/vladsch/flexmark/util/ast/Node;

    .line 22
    iput-object v0, p0, Lcom/vladsch/flexmark/util/ast/Node;->next:Lcom/vladsch/flexmark/util/ast/Node;

    .line 23
    sget-object v0, Lcom/vladsch/flexmark/util/sequence/BasedSequence;->NULL:Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    iput-object v0, p0, Lcom/vladsch/flexmark/util/ast/Node;->chars:Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    return-void
.end method

.method public constructor <init>(Lcom/vladsch/flexmark/util/sequence/BasedSequence;)V
    .locals 1

    .line 28
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const/4 v0, 0x0

    .line 18
    iput-object v0, p0, Lcom/vladsch/flexmark/util/ast/Node;->parent:Lcom/vladsch/flexmark/util/ast/Node;

    .line 19
    iput-object v0, p0, Lcom/vladsch/flexmark/util/ast/Node;->firstChild:Lcom/vladsch/flexmark/util/ast/Node;

    .line 20
    iput-object v0, p0, Lcom/vladsch/flexmark/util/ast/Node;->lastChild:Lcom/vladsch/flexmark/util/ast/Node;

    .line 21
    iput-object v0, p0, Lcom/vladsch/flexmark/util/ast/Node;->prev:Lcom/vladsch/flexmark/util/ast/Node;

    .line 22
    iput-object v0, p0, Lcom/vladsch/flexmark/util/ast/Node;->next:Lcom/vladsch/flexmark/util/ast/Node;

    .line 23
    sget-object v0, Lcom/vladsch/flexmark/util/sequence/BasedSequence;->NULL:Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    .line 29
    iput-object p1, p0, Lcom/vladsch/flexmark/util/ast/Node;->chars:Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    return-void
.end method

.method public static astChars(Ljava/lang/StringBuilder;Ljava/lang/CharSequence;Ljava/lang/String;)V
    .locals 5

    .line 451
    invoke-interface {p1}, Ljava/lang/CharSequence;->length()I

    move-result v0

    if-lez v0, :cond_1

    .line 452
    invoke-interface {p1}, Ljava/lang/CharSequence;->length()I

    move-result v0

    const/16 v1, 0xa

    const-string v2, "\""

    const-string v3, " \""

    const/16 v4, 0x20

    if-gt v0, v1, :cond_0

    .line 453
    invoke-virtual {p0, v4}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    invoke-virtual {p0, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p0, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/CharSequence;)Ljava/lang/StringBuilder;

    invoke-virtual {p0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    return-void

    .line 456
    :cond_0
    invoke-virtual {p0, v4}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    invoke-virtual {p0, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p0, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const/4 p2, 0x0

    const/4 v0, 0x5

    invoke-interface {p1, p2, v0}, Ljava/lang/CharSequence;->subSequence(II)Ljava/lang/CharSequence;

    move-result-object p2

    invoke-virtual {p0, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/CharSequence;)Ljava/lang/StringBuilder;

    const-string p2, " \u2026 "

    invoke-virtual {p0, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-interface {p1}, Ljava/lang/CharSequence;->length()I

    move-result p2

    sub-int/2addr p2, v0

    invoke-interface {p1}, Ljava/lang/CharSequence;->length()I

    move-result v0

    invoke-interface {p1, p2, v0}, Ljava/lang/CharSequence;->subSequence(II)Ljava/lang/CharSequence;

    move-result-object p1

    invoke-virtual {p0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/CharSequence;)Ljava/lang/StringBuilder;

    invoke-virtual {p0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    :cond_1
    return-void
.end method

.method public static delimitedSegmentSpan(Ljava/lang/StringBuilder;Lcom/vladsch/flexmark/util/sequence/BasedSequence;Lcom/vladsch/flexmark/util/sequence/BasedSequence;Lcom/vladsch/flexmark/util/sequence/BasedSequence;Ljava/lang/String;)V
    .locals 8

    .line 650
    invoke-interface {p1}, Lcom/vladsch/flexmark/util/sequence/BasedSequence;->getStartOffset()I

    move-result v0

    invoke-interface {p1}, Lcom/vladsch/flexmark/util/sequence/BasedSequence;->getEndOffset()I

    move-result v1

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v2, p4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v3, "Open"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {p1}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-static {p0, v0, v1, v2, p1}, Lcom/vladsch/flexmark/util/ast/Node;->segmentSpanChars(Ljava/lang/StringBuilder;IILjava/lang/String;Ljava/lang/String;)V

    .line 651
    invoke-interface {p2}, Lcom/vladsch/flexmark/util/sequence/BasedSequence;->length()I

    move-result p1

    const/16 v0, 0xa

    if-gt p1, v0, :cond_0

    .line 652
    invoke-interface {p2}, Lcom/vladsch/flexmark/util/sequence/BasedSequence;->getStartOffset()I

    move-result p1

    invoke-interface {p2}, Lcom/vladsch/flexmark/util/sequence/BasedSequence;->getEndOffset()I

    move-result v0

    invoke-interface {p2}, Lcom/vladsch/flexmark/util/sequence/BasedSequence;->toVisibleWhitespaceString()Ljava/lang/String;

    move-result-object p2

    invoke-static {p0, p1, v0, p4, p2}, Lcom/vladsch/flexmark/util/ast/Node;->segmentSpanChars(Ljava/lang/StringBuilder;IILjava/lang/String;Ljava/lang/String;)V

    move-object v1, p0

    move-object v4, p4

    goto :goto_0

    .line 655
    :cond_0
    invoke-interface {p2}, Lcom/vladsch/flexmark/util/sequence/BasedSequence;->getStartOffset()I

    move-result v2

    invoke-interface {p2}, Lcom/vladsch/flexmark/util/sequence/BasedSequence;->getEndOffset()I

    move-result v3

    const/4 p1, 0x0

    const/4 v0, 0x5

    invoke-interface {p2, p1, v0}, Lcom/vladsch/flexmark/util/sequence/BasedSequence;->subSequence(II)Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    move-result-object p1

    invoke-interface {p1}, Lcom/vladsch/flexmark/util/sequence/BasedSequence;->toVisibleWhitespaceString()Ljava/lang/String;

    move-result-object v5

    invoke-interface {p2}, Lcom/vladsch/flexmark/util/sequence/BasedSequence;->length()I

    move-result p1

    sub-int/2addr p1, v0

    invoke-interface {p2, p1}, Lcom/vladsch/flexmark/util/sequence/BasedSequence;->endSequence(I)Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    move-result-object p1

    invoke-interface {p1}, Lcom/vladsch/flexmark/util/sequence/BasedSequence;->toVisibleWhitespaceString()Ljava/lang/String;

    move-result-object v7

    const-string v6, " \u2026 "

    move-object v1, p0

    move-object v4, p4

    invoke-static/range {v1 .. v7}, Lcom/vladsch/flexmark/util/ast/Node;->segmentSpanChars(Ljava/lang/StringBuilder;IILjava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    .line 657
    :goto_0
    invoke-interface {p3}, Lcom/vladsch/flexmark/util/sequence/BasedSequence;->getStartOffset()I

    move-result p0

    invoke-interface {p3}, Lcom/vladsch/flexmark/util/sequence/BasedSequence;->getEndOffset()I

    move-result p1

    new-instance p2, Ljava/lang/StringBuilder;

    invoke-direct {p2}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {p2, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string p4, "Close"

    invoke-virtual {p2, p4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p2

    invoke-virtual {p3}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object p3

    invoke-static {v1, p0, p1, p2, p3}, Lcom/vladsch/flexmark/util/ast/Node;->segmentSpanChars(Ljava/lang/StringBuilder;IILjava/lang/String;Ljava/lang/String;)V

    return-void
.end method

.method public static delimitedSegmentSpanChars(Ljava/lang/StringBuilder;Lcom/vladsch/flexmark/util/sequence/BasedSequence;Lcom/vladsch/flexmark/util/sequence/BasedSequence;Lcom/vladsch/flexmark/util/sequence/BasedSequence;Ljava/lang/String;)V
    .locals 4

    .line 667
    invoke-interface {p1}, Lcom/vladsch/flexmark/util/sequence/BasedSequence;->isNotNull()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 668
    invoke-interface {p1}, Lcom/vladsch/flexmark/util/sequence/BasedSequence;->getStartOffset()I

    move-result v0

    invoke-interface {p1}, Lcom/vladsch/flexmark/util/sequence/BasedSequence;->getEndOffset()I

    move-result v1

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v2, p4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v3, "Open"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {p1}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-static {p0, v0, v1, v2, p1}, Lcom/vladsch/flexmark/util/ast/Node;->segmentSpanChars(Ljava/lang/StringBuilder;IILjava/lang/String;Ljava/lang/String;)V

    .line 669
    :cond_0
    invoke-interface {p2}, Lcom/vladsch/flexmark/util/sequence/BasedSequence;->isNotNull()Z

    move-result p1

    if-eqz p1, :cond_1

    .line 670
    invoke-interface {p2}, Lcom/vladsch/flexmark/util/sequence/BasedSequence;->getStartOffset()I

    move-result p1

    invoke-interface {p2}, Lcom/vladsch/flexmark/util/sequence/BasedSequence;->getEndOffset()I

    move-result v0

    invoke-interface {p2}, Lcom/vladsch/flexmark/util/sequence/BasedSequence;->toVisibleWhitespaceString()Ljava/lang/String;

    move-result-object p2

    invoke-static {p0, p1, v0, p4, p2}, Lcom/vladsch/flexmark/util/ast/Node;->segmentSpanChars(Ljava/lang/StringBuilder;IILjava/lang/String;Ljava/lang/String;)V

    .line 671
    :cond_1
    invoke-interface {p3}, Lcom/vladsch/flexmark/util/sequence/BasedSequence;->isNotNull()Z

    move-result p1

    if-eqz p1, :cond_2

    .line 672
    invoke-interface {p3}, Lcom/vladsch/flexmark/util/sequence/BasedSequence;->getStartOffset()I

    move-result p1

    invoke-interface {p3}, Lcom/vladsch/flexmark/util/sequence/BasedSequence;->getEndOffset()I

    move-result p2

    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v0, p4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string p4, "Close"

    invoke-virtual {v0, p4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p4

    invoke-virtual {p3}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object p3

    invoke-static {p0, p1, p2, p4, p3}, Lcom/vladsch/flexmark/util/ast/Node;->segmentSpanChars(Ljava/lang/StringBuilder;IILjava/lang/String;Ljava/lang/String;)V

    :cond_2
    return-void
.end method

.method private static escapeJavaString(Ljava/lang/StringBuilder;Ljava/lang/String;)V
    .locals 5

    .line 598
    invoke-virtual {p1}, Ljava/lang/String;->length()I

    move-result v0

    const/4 v1, 0x0

    const/4 v2, 0x0

    :goto_0
    if-ge v2, v0, :cond_5

    .line 600
    invoke-virtual {p1, v2}, Ljava/lang/String;->charAt(I)C

    move-result v3

    if-eqz v3, :cond_4

    const/16 v4, 0x22

    if-eq v3, v4, :cond_3

    const/16 v4, 0xc

    if-eq v3, v4, :cond_2

    const/16 v4, 0xd

    if-eq v3, v4, :cond_1

    packed-switch v3, :pswitch_data_0

    const/16 v4, 0x20

    if-ge v3, v4, :cond_0

    const/16 v4, 0x25

    .line 625
    invoke-virtual {p0, v4}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    const/4 v4, 0x1

    new-array v4, v4, [Ljava/lang/Object;

    aput-object v3, v4, v1

    const-string v3, "%02x"

    invoke-static {v3, v4}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {p0, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    goto :goto_1

    .line 627
    :cond_0
    invoke-virtual {p0, v3}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    goto :goto_1

    .line 606
    :pswitch_0
    const-string v3, "\\n"

    invoke-virtual {p0, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    goto :goto_1

    .line 612
    :pswitch_1
    const-string v3, "\\t"

    invoke-virtual {p0, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    goto :goto_1

    .line 615
    :pswitch_2
    const-string v3, "\\b"

    invoke-virtual {p0, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    goto :goto_1

    .line 609
    :cond_1
    const-string v3, "\\r"

    invoke-virtual {p0, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    goto :goto_1

    .line 618
    :cond_2
    const-string v3, "\\f"

    invoke-virtual {p0, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    goto :goto_1

    .line 603
    :cond_3
    const-string v3, "\\\""

    invoke-virtual {p0, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    goto :goto_1

    .line 621
    :cond_4
    const-string v3, "\\0"

    invoke-virtual {p0, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    :goto_1
    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    :cond_5
    return-void

    :pswitch_data_0
    .packed-switch 0x8
        :pswitch_2
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method

.method public static getLeadSegment([Lcom/vladsch/flexmark/util/sequence/BasedSequence;)Lcom/vladsch/flexmark/util/sequence/BasedSequence;
    .locals 4

    .line 468
    array-length v0, p0

    const/4 v1, 0x0

    :goto_0
    if-ge v1, v0, :cond_1

    aget-object v2, p0, v1

    if-eqz v2, :cond_0

    .line 469
    sget-object v3, Lcom/vladsch/flexmark/util/sequence/BasedSequence;->NULL:Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    if-eq v2, v3, :cond_0

    return-object v2

    :cond_0
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    .line 472
    :cond_1
    sget-object p0, Lcom/vladsch/flexmark/util/sequence/BasedSequence;->NULL:Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    return-object p0
.end method

.method public static varargs getNodeOfTypeIndex(Lcom/vladsch/flexmark/util/ast/Node;[Ljava/lang/Class;)I
    .locals 4

    .line 106
    array-length v0, p1

    const/4 v1, 0x0

    const/4 v2, 0x0

    :goto_0
    if-ge v1, v0, :cond_1

    aget-object v3, p1, v1

    .line 107
    invoke-virtual {v3, p0}, Ljava/lang/Class;->isInstance(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_0

    return v2

    :cond_0
    add-int/lit8 v2, v2, 0x1

    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    :cond_1
    const/4 p0, -0x1

    return p0
.end method

.method public static getTrailSegment([Lcom/vladsch/flexmark/util/sequence/BasedSequence;)Lcom/vladsch/flexmark/util/sequence/BasedSequence;
    .locals 3

    .line 476
    array-length v0, p0

    :goto_0
    add-int/lit8 v1, v0, -0x1

    if-lez v0, :cond_1

    .line 479
    aget-object v0, p0, v1

    if-eqz v0, :cond_0

    .line 480
    sget-object v2, Lcom/vladsch/flexmark/util/sequence/BasedSequence;->NULL:Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    if-eq v0, v2, :cond_0

    return-object v0

    :cond_0
    move v0, v1

    goto :goto_0

    .line 483
    :cond_1
    sget-object p0, Lcom/vladsch/flexmark/util/sequence/BasedSequence;->NULL:Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    return-object p0
.end method

.method public static segmentSpan(Ljava/lang/StringBuilder;IILjava/lang/String;)V
    .locals 1

    if-eqz p3, :cond_0

    .line 568
    invoke-virtual {p3}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/String;->isEmpty()Z

    move-result v0

    if-nez v0, :cond_0

    const-string v0, " "

    invoke-virtual {p0, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p0, p3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string p3, ":"

    invoke-virtual {p0, p3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 569
    :cond_0
    const-string p3, "["

    invoke-virtual {p0, p3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p0, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string p1, ", "

    invoke-virtual {p0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p0, p2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string p1, "]"

    invoke-virtual {p0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    return-void
.end method

.method public static segmentSpan(Ljava/lang/StringBuilder;Lcom/vladsch/flexmark/util/sequence/BasedSequence;Ljava/lang/String;)V
    .locals 1

    .line 635
    invoke-interface {p1}, Lcom/vladsch/flexmark/util/sequence/BasedSequence;->isNotNull()Z

    move-result v0

    if-eqz v0, :cond_0

    invoke-interface {p1}, Lcom/vladsch/flexmark/util/sequence/BasedSequence;->getStartOffset()I

    move-result v0

    invoke-interface {p1}, Lcom/vladsch/flexmark/util/sequence/BasedSequence;->getEndOffset()I

    move-result p1

    invoke-static {p0, v0, p1, p2}, Lcom/vladsch/flexmark/util/ast/Node;->segmentSpan(Ljava/lang/StringBuilder;IILjava/lang/String;)V

    :cond_0
    return-void
.end method

.method public static segmentSpanChars(Ljava/lang/StringBuilder;IILjava/lang/String;Ljava/lang/String;)V
    .locals 7

    .line 573
    const-string v5, ""

    const-string v6, ""

    move-object v0, p0

    move v1, p1

    move v2, p2

    move-object v3, p3

    move-object v4, p4

    invoke-static/range {v0 .. v6}, Lcom/vladsch/flexmark/util/ast/Node;->segmentSpanChars(Ljava/lang/StringBuilder;IILjava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    return-void
.end method

.method public static segmentSpanChars(Ljava/lang/StringBuilder;IILjava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V
    .locals 1

    if-eqz p3, :cond_0

    .line 585
    invoke-virtual {p3}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/String;->isEmpty()Z

    move-result v0

    if-nez v0, :cond_0

    const-string v0, " "

    invoke-virtual {p0, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p0, p3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string p3, ":"

    invoke-virtual {p0, p3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 586
    :cond_0
    const-string p3, "["

    invoke-virtual {p0, p3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p0, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string p1, ", "

    invoke-virtual {p0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p0, p2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 587
    invoke-virtual {p4}, Ljava/lang/String;->isEmpty()Z

    move-result p1

    if-eqz p1, :cond_1

    invoke-virtual {p6}, Ljava/lang/String;->isEmpty()Z

    move-result p1

    if-nez p1, :cond_2

    .line 588
    :cond_1
    const-string p1, ", \""

    invoke-virtual {p0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 589
    invoke-static {p0, p4}, Lcom/vladsch/flexmark/util/ast/Node;->escapeJavaString(Ljava/lang/StringBuilder;Ljava/lang/String;)V

    .line 590
    invoke-virtual {p0, p5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 591
    invoke-static {p0, p6}, Lcom/vladsch/flexmark/util/ast/Node;->escapeJavaString(Ljava/lang/StringBuilder;Ljava/lang/String;)V

    .line 592
    const-string p1, "\""

    invoke-virtual {p0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 594
    :cond_2
    const-string p1, "]"

    invoke-virtual {p0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    return-void
.end method

.method public static segmentSpanChars(Ljava/lang/StringBuilder;Lcom/vladsch/flexmark/util/sequence/BasedSequence;Ljava/lang/String;)V
    .locals 2

    .line 639
    invoke-interface {p1}, Lcom/vladsch/flexmark/util/sequence/BasedSequence;->isNotNull()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 640
    invoke-interface {p1}, Lcom/vladsch/flexmark/util/sequence/BasedSequence;->getStartOffset()I

    move-result v0

    invoke-interface {p1}, Lcom/vladsch/flexmark/util/sequence/BasedSequence;->getEndOffset()I

    move-result v1

    invoke-virtual {p1}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-static {p0, v0, v1, p2, p1}, Lcom/vladsch/flexmark/util/ast/Node;->segmentSpanChars(Ljava/lang/StringBuilder;IILjava/lang/String;Ljava/lang/String;)V

    :cond_0
    return-void
.end method

.method public static varargs spanningChars([Lcom/vladsch/flexmark/util/sequence/BasedSequence;)Lcom/vladsch/flexmark/util/sequence/BasedSequence;
    .locals 8

    .line 491
    array-length v0, p0

    const v1, 0x7fffffff

    const/4 v2, -0x1

    const/4 v3, 0x0

    const/4 v4, 0x0

    move-object v4, v3

    const/4 v5, 0x0

    :goto_0
    if-ge v5, v0, :cond_2

    aget-object v6, p0, v5

    if-eqz v6, :cond_1

    .line 492
    sget-object v7, Lcom/vladsch/flexmark/util/sequence/BasedSequence;->NULL:Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    if-eq v6, v7, :cond_1

    .line 493
    invoke-interface {v6}, Lcom/vladsch/flexmark/util/sequence/BasedSequence;->getStartOffset()I

    move-result v7

    if-le v1, v7, :cond_0

    .line 494
    invoke-interface {v6}, Lcom/vladsch/flexmark/util/sequence/BasedSequence;->getStartOffset()I

    move-result v1

    move-object v3, v6

    .line 498
    :cond_0
    invoke-interface {v6}, Lcom/vladsch/flexmark/util/sequence/BasedSequence;->getEndOffset()I

    move-result v7

    if-gt v2, v7, :cond_1

    .line 499
    invoke-interface {v6}, Lcom/vladsch/flexmark/util/sequence/BasedSequence;->getEndOffset()I

    move-result v2

    move-object v4, v6

    :cond_1
    add-int/lit8 v5, v5, 0x1

    goto :goto_0

    :cond_2
    if-eqz v3, :cond_3

    if-eqz v4, :cond_3

    .line 506
    invoke-interface {v3}, Lcom/vladsch/flexmark/util/sequence/BasedSequence;->getStartOffset()I

    move-result p0

    invoke-interface {v4}, Lcom/vladsch/flexmark/util/sequence/BasedSequence;->getEndOffset()I

    move-result v0

    invoke-interface {v3, p0, v0}, Lcom/vladsch/flexmark/util/sequence/BasedSequence;->baseSubSequence(II)Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    move-result-object p0

    return-object p0

    .line 508
    :cond_3
    sget-object p0, Lcom/vladsch/flexmark/util/sequence/BasedSequence;->NULL:Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    return-object p0
.end method

.method public static toSegmentSpan(Lcom/vladsch/flexmark/util/sequence/BasedSequence;Ljava/lang/String;)Ljava/lang/String;
    .locals 1

    .line 719
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 720
    invoke-static {v0, p0, p1}, Lcom/vladsch/flexmark/util/ast/Node;->segmentSpan(Ljava/lang/StringBuilder;Lcom/vladsch/flexmark/util/sequence/BasedSequence;Ljava/lang/String;)V

    .line 721
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method


# virtual methods
.method public appendChain(Lcom/vladsch/flexmark/util/ast/Node;)V
    .locals 1

    :goto_0
    if-eqz p1, :cond_0

    .line 865
    iget-object v0, p1, Lcom/vladsch/flexmark/util/ast/Node;->next:Lcom/vladsch/flexmark/util/ast/Node;

    .line 866
    invoke-virtual {p0, p1}, Lcom/vladsch/flexmark/util/ast/Node;->appendChild(Lcom/vladsch/flexmark/util/ast/Node;)V

    move-object p1, v0

    goto :goto_0

    :cond_0
    return-void
.end method

.method public appendChild(Lcom/vladsch/flexmark/util/ast/Node;)V
    .locals 1

    .line 361
    invoke-virtual {p1}, Lcom/vladsch/flexmark/util/ast/Node;->unlink()V

    .line 362
    invoke-virtual {p1, p0}, Lcom/vladsch/flexmark/util/ast/Node;->setParent(Lcom/vladsch/flexmark/util/ast/Node;)V

    .line 363
    iget-object v0, p0, Lcom/vladsch/flexmark/util/ast/Node;->lastChild:Lcom/vladsch/flexmark/util/ast/Node;

    if-eqz v0, :cond_0

    .line 364
    iput-object p1, v0, Lcom/vladsch/flexmark/util/ast/Node;->next:Lcom/vladsch/flexmark/util/ast/Node;

    .line 365
    iput-object v0, p1, Lcom/vladsch/flexmark/util/ast/Node;->prev:Lcom/vladsch/flexmark/util/ast/Node;

    .line 366
    iput-object p1, p0, Lcom/vladsch/flexmark/util/ast/Node;->lastChild:Lcom/vladsch/flexmark/util/ast/Node;

    return-void

    .line 368
    :cond_0
    iput-object p1, p0, Lcom/vladsch/flexmark/util/ast/Node;->firstChild:Lcom/vladsch/flexmark/util/ast/Node;

    .line 369
    iput-object p1, p0, Lcom/vladsch/flexmark/util/ast/Node;->lastChild:Lcom/vladsch/flexmark/util/ast/Node;

    return-void
.end method

.method public astExtraChars(Ljava/lang/StringBuilder;)V
    .locals 8

    .line 440
    invoke-virtual {p0}, Lcom/vladsch/flexmark/util/ast/Node;->getChars()Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    move-result-object v0

    invoke-interface {v0}, Lcom/vladsch/flexmark/util/sequence/BasedSequence;->length()I

    move-result v0

    if-lez v0, :cond_1

    .line 441
    invoke-virtual {p0}, Lcom/vladsch/flexmark/util/ast/Node;->getChars()Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    move-result-object v0

    invoke-interface {v0}, Lcom/vladsch/flexmark/util/sequence/BasedSequence;->length()I

    move-result v0

    const/16 v1, 0xa

    if-gt v0, v1, :cond_0

    .line 442
    invoke-virtual {p0}, Lcom/vladsch/flexmark/util/ast/Node;->getChars()Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    move-result-object v0

    const-string v1, "chars"

    invoke-static {p1, v0, v1}, Lcom/vladsch/flexmark/util/ast/Node;->segmentSpanChars(Ljava/lang/StringBuilder;Lcom/vladsch/flexmark/util/sequence/BasedSequence;Ljava/lang/String;)V

    return-void

    .line 445
    :cond_0
    invoke-virtual {p0}, Lcom/vladsch/flexmark/util/ast/Node;->getChars()Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    move-result-object v0

    invoke-interface {v0}, Lcom/vladsch/flexmark/util/sequence/BasedSequence;->getStartOffset()I

    move-result v2

    invoke-virtual {p0}, Lcom/vladsch/flexmark/util/ast/Node;->getChars()Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    move-result-object v0

    invoke-interface {v0}, Lcom/vladsch/flexmark/util/sequence/BasedSequence;->getEndOffset()I

    move-result v3

    invoke-virtual {p0}, Lcom/vladsch/flexmark/util/ast/Node;->getChars()Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    move-result-object v0

    const/4 v1, 0x0

    const/4 v4, 0x5

    invoke-interface {v0, v1, v4}, Lcom/vladsch/flexmark/util/sequence/BasedSequence;->subSequence(II)Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    move-result-object v0

    invoke-interface {v0}, Lcom/vladsch/flexmark/util/sequence/BasedSequence;->toVisibleWhitespaceString()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {p0}, Lcom/vladsch/flexmark/util/ast/Node;->getChars()Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    move-result-object v0

    invoke-virtual {p0}, Lcom/vladsch/flexmark/util/ast/Node;->getChars()Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    move-result-object v1

    invoke-interface {v1}, Lcom/vladsch/flexmark/util/sequence/BasedSequence;->length()I

    move-result v1

    sub-int/2addr v1, v4

    invoke-interface {v0, v1}, Lcom/vladsch/flexmark/util/sequence/BasedSequence;->subSequence(I)Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    move-result-object v0

    invoke-interface {v0}, Lcom/vladsch/flexmark/util/sequence/BasedSequence;->toVisibleWhitespaceString()Ljava/lang/String;

    move-result-object v7

    const-string v4, "chars"

    const-string v6, " \u2026 "

    move-object v1, p1

    invoke-static/range {v1 .. v7}, Lcom/vladsch/flexmark/util/ast/Node;->segmentSpanChars(Ljava/lang/StringBuilder;IILjava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    :cond_1
    return-void
.end method

.method public astString(Ljava/lang/StringBuilder;Z)V
    .locals 1

    .line 707
    invoke-virtual {p0}, Lcom/vladsch/flexmark/util/ast/Node;->getNodeName()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 708
    const-string v0, "["

    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p0}, Lcom/vladsch/flexmark/util/ast/Node;->getStartOffset()I

    move-result v0

    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v0, ", "

    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p0}, Lcom/vladsch/flexmark/util/ast/Node;->getEndOffset()I

    move-result v0

    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v0, "]"

    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    if-eqz p2, :cond_0

    .line 709
    invoke-virtual {p0, p1}, Lcom/vladsch/flexmark/util/ast/Node;->getAstExtra(Ljava/lang/StringBuilder;)V

    :cond_0
    return-void
.end method

.method public varargs countAncestorsOfType([Ljava/lang/Class;)I
    .locals 6

    .line 44
    invoke-virtual {p0}, Lcom/vladsch/flexmark/util/ast/Node;->getParent()Lcom/vladsch/flexmark/util/ast/Node;

    move-result-object v0

    const/4 v1, 0x0

    const/4 v2, 0x0

    :goto_0
    if-eqz v0, :cond_2

    .line 47
    array-length v3, p1

    const/4 v4, 0x0

    :goto_1
    if-ge v4, v3, :cond_1

    aget-object v5, p1, v4

    .line 48
    invoke-virtual {v5, v0}, Ljava/lang/Class;->isInstance(Ljava/lang/Object;)Z

    move-result v5

    if-eqz v5, :cond_0

    add-int/lit8 v2, v2, 0x1

    goto :goto_2

    :cond_0
    add-int/lit8 v4, v4, 0x1

    goto :goto_1

    .line 53
    :cond_1
    :goto_2
    invoke-virtual {v0}, Lcom/vladsch/flexmark/util/ast/Node;->getParent()Lcom/vladsch/flexmark/util/ast/Node;

    move-result-object v0

    goto :goto_0

    :cond_2
    return v2
.end method

.method public varargs countDirectAncestorsOfType(Ljava/lang/Class;[Ljava/lang/Class;)I
    .locals 7

    .line 59
    invoke-virtual {p0}, Lcom/vladsch/flexmark/util/ast/Node;->getParent()Lcom/vladsch/flexmark/util/ast/Node;

    move-result-object v0

    const/4 v1, 0x0

    const/4 v2, 0x0

    :goto_0
    if-eqz v0, :cond_4

    .line 63
    array-length v3, p2

    const/4 v4, 0x0

    :goto_1
    if-ge v4, v3, :cond_2

    aget-object v5, p2, v4

    .line 64
    invoke-virtual {v5, v0}, Ljava/lang/Class;->isInstance(Ljava/lang/Object;)Z

    move-result v5

    const/4 v6, 0x1

    if-eqz v5, :cond_0

    add-int/lit8 v2, v2, 0x1

    goto :goto_2

    :cond_0
    if-eqz p1, :cond_1

    .line 69
    invoke-virtual {p1, v0}, Ljava/lang/Class;->isInstance(Ljava/lang/Object;)Z

    move-result v5

    if-eqz v5, :cond_1

    goto :goto_2

    :cond_1
    add-int/lit8 v4, v4, 0x1

    goto :goto_1

    :cond_2
    const/4 v6, 0x0

    :goto_2
    if-nez v6, :cond_3

    return v2

    .line 77
    :cond_3
    invoke-virtual {v0}, Lcom/vladsch/flexmark/util/ast/Node;->getParent()Lcom/vladsch/flexmark/util/ast/Node;

    move-result-object v0

    goto :goto_0

    :cond_4
    return v2
.end method

.method protected deNullify(Lcom/vladsch/flexmark/util/sequence/BasedSequence;)Lcom/vladsch/flexmark/util/sequence/BasedSequence;
    .locals 0

    if-nez p1, :cond_0

    .line 564
    sget-object p1, Lcom/vladsch/flexmark/util/sequence/BasedSequence;->NULL:Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    :cond_0
    return-object p1
.end method

.method public extractChainTo(Lcom/vladsch/flexmark/util/ast/Node;)V
    .locals 2

    move-object v0, p0

    .line 252
    :goto_0
    invoke-virtual {v0}, Lcom/vladsch/flexmark/util/ast/Node;->getNext()Lcom/vladsch/flexmark/util/ast/Node;

    move-result-object v1

    .line 253
    invoke-virtual {p1, v0}, Lcom/vladsch/flexmark/util/ast/Node;->appendChild(Lcom/vladsch/flexmark/util/ast/Node;)V

    .line 255
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v0

    invoke-virtual {v0, v1}, Ljava/lang/Class;->isInstance(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_0

    return-void

    :cond_0
    move-object v0, v1

    goto :goto_0
.end method

.method public extractToFirstInChain(Lcom/vladsch/flexmark/util/ast/Node;)V
    .locals 1

    .line 246
    invoke-virtual {p0}, Lcom/vladsch/flexmark/util/ast/Node;->getFirstInChain()Lcom/vladsch/flexmark/util/ast/Node;

    move-result-object v0

    invoke-virtual {v0, p1}, Lcom/vladsch/flexmark/util/ast/Node;->extractChainTo(Lcom/vladsch/flexmark/util/ast/Node;)V

    return-void
.end method

.method public varargs getAncestorOfType([Ljava/lang/Class;)Lcom/vladsch/flexmark/util/ast/Node;
    .locals 4

    .line 33
    invoke-virtual {p0}, Lcom/vladsch/flexmark/util/ast/Node;->getParent()Lcom/vladsch/flexmark/util/ast/Node;

    move-result-object v0

    :goto_0
    if-eqz v0, :cond_2

    .line 35
    array-length v1, p1

    const/4 v2, 0x0

    :goto_1
    if-ge v2, v1, :cond_1

    aget-object v3, p1, v2

    .line 36
    invoke-virtual {v3, v0}, Ljava/lang/Class;->isInstance(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_0

    return-object v0

    :cond_0
    add-int/lit8 v2, v2, 0x1

    goto :goto_1

    .line 38
    :cond_1
    invoke-virtual {v0}, Lcom/vladsch/flexmark/util/ast/Node;->getParent()Lcom/vladsch/flexmark/util/ast/Node;

    move-result-object v0

    goto :goto_0

    :cond_2
    const/4 p1, 0x0

    return-object p1
.end method

.method public getAstExtra(Ljava/lang/StringBuilder;)V
    .locals 0

    return-void
.end method

.method public getBlankLineSibling()Lcom/vladsch/flexmark/util/ast/Node;
    .locals 8

    .line 777
    iget-object v0, p0, Lcom/vladsch/flexmark/util/ast/Node;->parent:Lcom/vladsch/flexmark/util/ast/Node;

    move-object v1, p0

    move-object v2, v1

    .line 781
    :goto_0
    iget-object v3, v0, Lcom/vladsch/flexmark/util/ast/Node;->parent:Lcom/vladsch/flexmark/util/ast/Node;

    if-eqz v3, :cond_2

    const/4 v4, 0x1

    .line 782
    new-array v4, v4, [Ljava/lang/Class;

    const-class v5, Lcom/vladsch/flexmark/util/ast/BlankLine;

    const/4 v6, 0x0

    aput-object v5, v4, v6

    invoke-virtual {v3, v4}, Lcom/vladsch/flexmark/util/ast/Node;->getLastChildAnyNot([Ljava/lang/Class;)Lcom/vladsch/flexmark/util/ast/Node;

    move-result-object v3

    if-ne v0, v3, :cond_2

    .line 786
    instance-of v2, v0, Lcom/vladsch/flexmark/util/ast/BlankLineContainer;

    if-eqz v2, :cond_0

    move-object v2, v0

    goto :goto_1

    :cond_0
    move-object v2, v1

    .line 790
    :goto_1
    iget-object v0, v0, Lcom/vladsch/flexmark/util/ast/Node;->parent:Lcom/vladsch/flexmark/util/ast/Node;

    if-nez v0, :cond_1

    return-object v1

    :cond_1
    move-object v7, v2

    move-object v2, v1

    move-object v1, v7

    goto :goto_0

    :cond_2
    return-object v2
.end method

.method public getChars()Lcom/vladsch/flexmark/util/sequence/BasedSequence;
    .locals 1

    .line 179
    iget-object v0, p0, Lcom/vladsch/flexmark/util/ast/Node;->chars:Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    return-object v0
.end method

.method public getCharsFromSegments()Lcom/vladsch/flexmark/util/sequence/BasedSequence;
    .locals 1

    .line 845
    invoke-virtual {p0}, Lcom/vladsch/flexmark/util/ast/Node;->getSegmentsForChars()[Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    move-result-object v0

    invoke-static {v0}, Ljava/util/Arrays;->asList([Ljava/lang/Object;)Ljava/util/List;

    move-result-object v0

    invoke-static {v0}, Lcom/vladsch/flexmark/util/sequence/SegmentedSequence;->of(Ljava/util/List;)Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    move-result-object v0

    return-object v0
.end method

.method public getChildChars()Lcom/vladsch/flexmark/util/sequence/BasedSequence;
    .locals 3

    .line 725
    iget-object v0, p0, Lcom/vladsch/flexmark/util/ast/Node;->firstChild:Lcom/vladsch/flexmark/util/ast/Node;

    if-eqz v0, :cond_1

    iget-object v1, p0, Lcom/vladsch/flexmark/util/ast/Node;->lastChild:Lcom/vladsch/flexmark/util/ast/Node;

    if-nez v1, :cond_0

    goto :goto_0

    .line 729
    :cond_0
    invoke-virtual {v0}, Lcom/vladsch/flexmark/util/ast/Node;->getChars()Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    move-result-object v0

    iget-object v1, p0, Lcom/vladsch/flexmark/util/ast/Node;->firstChild:Lcom/vladsch/flexmark/util/ast/Node;

    invoke-virtual {v1}, Lcom/vladsch/flexmark/util/ast/Node;->getStartOffset()I

    move-result v1

    iget-object v2, p0, Lcom/vladsch/flexmark/util/ast/Node;->lastChild:Lcom/vladsch/flexmark/util/ast/Node;

    invoke-virtual {v2}, Lcom/vladsch/flexmark/util/ast/Node;->getEndOffset()I

    move-result v2

    invoke-interface {v0, v1, v2}, Lcom/vladsch/flexmark/util/sequence/BasedSequence;->baseSubSequence(II)Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    move-result-object v0

    return-object v0

    .line 726
    :cond_1
    :goto_0
    sget-object v0, Lcom/vladsch/flexmark/util/sequence/BasedSequence;->NULL:Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    return-object v0
.end method

.method public getChildIterator()Lcom/vladsch/flexmark/util/collection/iteration/ReversiblePeekingIterator;
    .locals 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Lcom/vladsch/flexmark/util/collection/iteration/ReversiblePeekingIterator<",
            "Lcom/vladsch/flexmark/util/ast/Node;",
            ">;"
        }
    .end annotation

    .line 164
    iget-object v0, p0, Lcom/vladsch/flexmark/util/ast/Node;->firstChild:Lcom/vladsch/flexmark/util/ast/Node;

    if-nez v0, :cond_0

    .line 165
    sget-object v0, Lcom/vladsch/flexmark/util/ast/NodeIterator;->EMPTY:Lcom/vladsch/flexmark/util/collection/iteration/ReversiblePeekingIterator;

    return-object v0

    .line 167
    :cond_0
    new-instance v0, Lcom/vladsch/flexmark/util/ast/NodeIterator;

    iget-object v1, p0, Lcom/vladsch/flexmark/util/ast/Node;->firstChild:Lcom/vladsch/flexmark/util/ast/Node;

    iget-object v2, p0, Lcom/vladsch/flexmark/util/ast/Node;->lastChild:Lcom/vladsch/flexmark/util/ast/Node;

    const/4 v3, 0x0

    invoke-direct {v0, v1, v2, v3}, Lcom/vladsch/flexmark/util/ast/NodeIterator;-><init>(Lcom/vladsch/flexmark/util/ast/Node;Lcom/vladsch/flexmark/util/ast/Node;Z)V

    return-object v0
.end method

.method public varargs getChildOfType([Ljava/lang/Class;)Lcom/vladsch/flexmark/util/ast/Node;
    .locals 4

    .line 94
    invoke-virtual {p0}, Lcom/vladsch/flexmark/util/ast/Node;->getFirstChild()Lcom/vladsch/flexmark/util/ast/Node;

    move-result-object v0

    :goto_0
    if-eqz v0, :cond_2

    .line 96
    array-length v1, p1

    const/4 v2, 0x0

    :goto_1
    if-ge v2, v1, :cond_1

    aget-object v3, p1, v2

    .line 97
    invoke-virtual {v3, v0}, Ljava/lang/Class;->isInstance(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_0

    return-object v0

    :cond_0
    add-int/lit8 v2, v2, 0x1

    goto :goto_1

    .line 99
    :cond_1
    invoke-virtual {v0}, Lcom/vladsch/flexmark/util/ast/Node;->getNext()Lcom/vladsch/flexmark/util/ast/Node;

    move-result-object v0

    goto :goto_0

    :cond_2
    const/4 p1, 0x0

    return-object p1
.end method

.method public getChildren()Lcom/vladsch/flexmark/util/collection/iteration/ReversiblePeekingIterable;
    .locals 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Lcom/vladsch/flexmark/util/collection/iteration/ReversiblePeekingIterable<",
            "Lcom/vladsch/flexmark/util/ast/Node;",
            ">;"
        }
    .end annotation

    .line 136
    iget-object v0, p0, Lcom/vladsch/flexmark/util/ast/Node;->firstChild:Lcom/vladsch/flexmark/util/ast/Node;

    if-nez v0, :cond_0

    .line 137
    sget-object v0, Lcom/vladsch/flexmark/util/ast/NodeIterable;->EMPTY:Lcom/vladsch/flexmark/util/collection/iteration/ReversiblePeekingIterable;

    return-object v0

    .line 139
    :cond_0
    new-instance v0, Lcom/vladsch/flexmark/util/ast/NodeIterable;

    iget-object v1, p0, Lcom/vladsch/flexmark/util/ast/Node;->firstChild:Lcom/vladsch/flexmark/util/ast/Node;

    iget-object v2, p0, Lcom/vladsch/flexmark/util/ast/Node;->lastChild:Lcom/vladsch/flexmark/util/ast/Node;

    const/4 v3, 0x0

    invoke-direct {v0, v1, v2, v3}, Lcom/vladsch/flexmark/util/ast/NodeIterable;-><init>(Lcom/vladsch/flexmark/util/ast/Node;Lcom/vladsch/flexmark/util/ast/Node;Z)V

    return-object v0
.end method

.method public getDescendants()Lcom/vladsch/flexmark/util/collection/iteration/ReversiblePeekingIterable;
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Lcom/vladsch/flexmark/util/collection/iteration/ReversiblePeekingIterable<",
            "Lcom/vladsch/flexmark/util/ast/Node;",
            ">;"
        }
    .end annotation

    .line 150
    iget-object v0, p0, Lcom/vladsch/flexmark/util/ast/Node;->firstChild:Lcom/vladsch/flexmark/util/ast/Node;

    if-nez v0, :cond_0

    .line 151
    sget-object v0, Lcom/vladsch/flexmark/util/ast/NodeIterable;->EMPTY:Lcom/vladsch/flexmark/util/collection/iteration/ReversiblePeekingIterable;

    return-object v0

    .line 153
    :cond_0
    new-instance v0, Lcom/vladsch/flexmark/util/ast/DescendantNodeIterable;

    invoke-virtual {p0}, Lcom/vladsch/flexmark/util/ast/Node;->getChildren()Lcom/vladsch/flexmark/util/collection/iteration/ReversiblePeekingIterable;

    move-result-object v1

    invoke-direct {v0, v1}, Lcom/vladsch/flexmark/util/ast/DescendantNodeIterable;-><init>(Lcom/vladsch/flexmark/util/collection/iteration/ReversiblePeekingIterable;)V

    return-object v0
.end method

.method public getDocument()Lcom/vladsch/flexmark/util/ast/Document;
    .locals 2

    move-object v0, p0

    :goto_0
    if-eqz v0, :cond_0

    .line 208
    instance-of v1, v0, Lcom/vladsch/flexmark/util/ast/Document;

    if-nez v1, :cond_0

    .line 209
    invoke-virtual {v0}, Lcom/vladsch/flexmark/util/ast/Node;->getParent()Lcom/vladsch/flexmark/util/ast/Node;

    move-result-object v0

    goto :goto_0

    .line 212
    :cond_0
    check-cast v0, Lcom/vladsch/flexmark/util/ast/Document;

    return-object v0
.end method

.method public getEndLineNumber()I
    .locals 2

    .line 822
    iget-object v0, p0, Lcom/vladsch/flexmark/util/ast/Node;->chars:Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    invoke-interface {v0}, Lcom/vladsch/flexmark/util/sequence/BasedSequence;->getEndOffset()I

    move-result v0

    .line 823
    invoke-virtual {p0}, Lcom/vladsch/flexmark/util/ast/Node;->getDocument()Lcom/vladsch/flexmark/util/ast/Document;

    move-result-object v1

    if-lez v0, :cond_0

    add-int/lit8 v0, v0, -0x1

    :cond_0
    invoke-virtual {v1, v0}, Lcom/vladsch/flexmark/util/ast/Document;->getLineNumber(I)I

    move-result v0

    return v0
.end method

.method public getEndOffset()I
    .locals 1

    .line 234
    iget-object v0, p0, Lcom/vladsch/flexmark/util/ast/Node;->chars:Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    if-nez v0, :cond_0

    const/4 v0, 0x0

    return v0

    :cond_0
    invoke-interface {v0}, Lcom/vladsch/flexmark/util/sequence/BasedSequence;->getEndOffset()I

    move-result v0

    return v0
.end method

.method public getExactChildChars()Lcom/vladsch/flexmark/util/sequence/BasedSequence;
    .locals 5

    .line 733
    iget-object v0, p0, Lcom/vladsch/flexmark/util/ast/Node;->firstChild:Lcom/vladsch/flexmark/util/ast/Node;

    if-eqz v0, :cond_a

    iget-object v0, p0, Lcom/vladsch/flexmark/util/ast/Node;->lastChild:Lcom/vladsch/flexmark/util/ast/Node;

    if-nez v0, :cond_0

    goto/16 :goto_2

    .line 740
    :cond_0
    invoke-virtual {p0}, Lcom/vladsch/flexmark/util/ast/Node;->getFirstChild()Lcom/vladsch/flexmark/util/ast/Node;

    move-result-object v0

    const/4 v1, 0x0

    move-object v2, v1

    move-object v1, v0

    :goto_0
    if-eqz v0, :cond_6

    .line 745
    invoke-virtual {v0}, Lcom/vladsch/flexmark/util/ast/Node;->getChars()Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    move-result-object v3

    instance-of v3, v3, Lcom/vladsch/flexmark/util/sequence/SegmentedSequence;

    if-nez v3, :cond_1

    invoke-virtual {v0}, Lcom/vladsch/flexmark/util/ast/Node;->getChars()Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    move-result-object v3

    instance-of v3, v3, Lcom/vladsch/flexmark/util/sequence/PrefixedSubSequence;

    if-eqz v3, :cond_5

    :cond_1
    if-nez v2, :cond_2

    .line 747
    new-instance v2, Ljava/util/ArrayList;

    invoke-direct {v2}, Ljava/util/ArrayList;-><init>()V

    :cond_2
    if-eq v1, v0, :cond_4

    .line 750
    invoke-virtual {v0}, Lcom/vladsch/flexmark/util/ast/Node;->getPrevious()Lcom/vladsch/flexmark/util/ast/Node;

    move-result-object v3

    if-ne v1, v3, :cond_3

    .line 751
    invoke-virtual {v1}, Lcom/vladsch/flexmark/util/ast/Node;->getChars()Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    move-result-object v1

    invoke-virtual {v2, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto :goto_1

    .line 753
    :cond_3
    invoke-virtual {v1}, Lcom/vladsch/flexmark/util/ast/Node;->getChars()Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    move-result-object v3

    invoke-virtual {v1}, Lcom/vladsch/flexmark/util/ast/Node;->getStartOffset()I

    move-result v1

    invoke-virtual {v0}, Lcom/vladsch/flexmark/util/ast/Node;->getPrevious()Lcom/vladsch/flexmark/util/ast/Node;

    move-result-object v4

    invoke-virtual {v4}, Lcom/vladsch/flexmark/util/ast/Node;->getEndOffset()I

    move-result v4

    invoke-interface {v3, v1, v4}, Lcom/vladsch/flexmark/util/sequence/BasedSequence;->baseSubSequence(II)Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    move-result-object v1

    invoke-virtual {v2, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 756
    :cond_4
    :goto_1
    invoke-virtual {v0}, Lcom/vladsch/flexmark/util/ast/Node;->getChars()Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    move-result-object v1

    invoke-virtual {v2, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 757
    invoke-virtual {v0}, Lcom/vladsch/flexmark/util/ast/Node;->getNext()Lcom/vladsch/flexmark/util/ast/Node;

    move-result-object v1

    .line 759
    :cond_5
    invoke-virtual {v0}, Lcom/vladsch/flexmark/util/ast/Node;->getNext()Lcom/vladsch/flexmark/util/ast/Node;

    move-result-object v0

    goto :goto_0

    :cond_6
    if-eqz v2, :cond_9

    .line 763
    invoke-virtual {p0}, Lcom/vladsch/flexmark/util/ast/Node;->getLastChild()Lcom/vladsch/flexmark/util/ast/Node;

    move-result-object v0

    if-eqz v1, :cond_7

    .line 766
    invoke-virtual {v1}, Lcom/vladsch/flexmark/util/ast/Node;->getChars()Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    move-result-object v3

    invoke-virtual {v1}, Lcom/vladsch/flexmark/util/ast/Node;->getStartOffset()I

    move-result v1

    invoke-virtual {v0}, Lcom/vladsch/flexmark/util/ast/Node;->getEndOffset()I

    move-result v0

    invoke-interface {v3, v1, v0}, Lcom/vladsch/flexmark/util/sequence/BasedSequence;->baseSubSequence(II)Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    move-result-object v0

    invoke-virtual {v2, v0}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 769
    :cond_7
    invoke-virtual {v2}, Ljava/util/ArrayList;->size()I

    move-result v0

    const/4 v1, 0x1

    if-ne v0, v1, :cond_8

    const/4 v0, 0x0

    invoke-virtual {v2, v0}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    return-object v0

    :cond_8
    invoke-static {v2}, Lcom/vladsch/flexmark/util/sequence/SegmentedSequence;->of(Ljava/util/List;)Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    move-result-object v0

    return-object v0

    .line 771
    :cond_9
    iget-object v0, p0, Lcom/vladsch/flexmark/util/ast/Node;->firstChild:Lcom/vladsch/flexmark/util/ast/Node;

    invoke-virtual {v0}, Lcom/vladsch/flexmark/util/ast/Node;->getChars()Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    move-result-object v0

    iget-object v1, p0, Lcom/vladsch/flexmark/util/ast/Node;->firstChild:Lcom/vladsch/flexmark/util/ast/Node;

    invoke-virtual {v1}, Lcom/vladsch/flexmark/util/ast/Node;->getStartOffset()I

    move-result v1

    iget-object v2, p0, Lcom/vladsch/flexmark/util/ast/Node;->lastChild:Lcom/vladsch/flexmark/util/ast/Node;

    invoke-virtual {v2}, Lcom/vladsch/flexmark/util/ast/Node;->getEndOffset()I

    move-result v2

    invoke-interface {v0, v1, v2}, Lcom/vladsch/flexmark/util/sequence/BasedSequence;->baseSubSequence(II)Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    move-result-object v0

    return-object v0

    .line 734
    :cond_a
    :goto_2
    sget-object v0, Lcom/vladsch/flexmark/util/sequence/BasedSequence;->NULL:Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    return-object v0
.end method

.method public getFirstChild()Lcom/vladsch/flexmark/util/ast/Node;
    .locals 1

    .line 305
    iget-object v0, p0, Lcom/vladsch/flexmark/util/ast/Node;->firstChild:Lcom/vladsch/flexmark/util/ast/Node;

    return-object v0
.end method

.method public varargs getFirstChildAny([Ljava/lang/Class;)Lcom/vladsch/flexmark/util/ast/Node;
    .locals 3

    .line 319
    iget-object v0, p0, Lcom/vladsch/flexmark/util/ast/Node;->firstChild:Lcom/vladsch/flexmark/util/ast/Node;

    .line 320
    array-length v1, p1

    if-lez v1, :cond_0

    :goto_0
    if-eqz v0, :cond_0

    .line 321
    invoke-static {v0, p1}, Lcom/vladsch/flexmark/util/ast/Node;->getNodeOfTypeIndex(Lcom/vladsch/flexmark/util/ast/Node;[Ljava/lang/Class;)I

    move-result v1

    const/4 v2, -0x1

    if-ne v1, v2, :cond_0

    .line 322
    iget-object v0, v0, Lcom/vladsch/flexmark/util/ast/Node;->next:Lcom/vladsch/flexmark/util/ast/Node;

    goto :goto_0

    :cond_0
    return-object v0
.end method

.method public varargs getFirstChildAnyNot([Ljava/lang/Class;)Lcom/vladsch/flexmark/util/ast/Node;
    .locals 3

    .line 309
    iget-object v0, p0, Lcom/vladsch/flexmark/util/ast/Node;->firstChild:Lcom/vladsch/flexmark/util/ast/Node;

    .line 310
    array-length v1, p1

    if-lez v1, :cond_0

    :goto_0
    if-eqz v0, :cond_0

    .line 311
    invoke-static {v0, p1}, Lcom/vladsch/flexmark/util/ast/Node;->getNodeOfTypeIndex(Lcom/vladsch/flexmark/util/ast/Node;[Ljava/lang/Class;)I

    move-result v1

    const/4 v2, -0x1

    if-eq v1, v2, :cond_0

    .line 312
    iget-object v0, v0, Lcom/vladsch/flexmark/util/ast/Node;->next:Lcom/vladsch/flexmark/util/ast/Node;

    goto :goto_0

    :cond_0
    return-object v0
.end method

.method public getFirstInChain()Lcom/vladsch/flexmark/util/ast/Node;
    .locals 3

    move-object v0, p0

    .line 260
    :goto_0
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v1

    invoke-virtual {v0}, Lcom/vladsch/flexmark/util/ast/Node;->getPrevious()Lcom/vladsch/flexmark/util/ast/Node;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/Class;->isInstance(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_0

    invoke-virtual {v0}, Lcom/vladsch/flexmark/util/ast/Node;->getPrevious()Lcom/vladsch/flexmark/util/ast/Node;

    move-result-object v0

    goto :goto_0

    :cond_0
    return-object v0
.end method

.method public getLastBlankLineChild()Lcom/vladsch/flexmark/util/ast/Node;
    .locals 1

    const/4 v0, 0x0

    return-object v0
.end method

.method public getLastChild()Lcom/vladsch/flexmark/util/ast/Node;
    .locals 1

    .line 329
    iget-object v0, p0, Lcom/vladsch/flexmark/util/ast/Node;->lastChild:Lcom/vladsch/flexmark/util/ast/Node;

    return-object v0
.end method

.method public varargs getLastChildAny([Ljava/lang/Class;)Lcom/vladsch/flexmark/util/ast/Node;
    .locals 3

    .line 343
    iget-object v0, p0, Lcom/vladsch/flexmark/util/ast/Node;->lastChild:Lcom/vladsch/flexmark/util/ast/Node;

    .line 344
    array-length v1, p1

    if-lez v1, :cond_0

    :goto_0
    if-eqz v0, :cond_0

    .line 345
    invoke-static {v0, p1}, Lcom/vladsch/flexmark/util/ast/Node;->getNodeOfTypeIndex(Lcom/vladsch/flexmark/util/ast/Node;[Ljava/lang/Class;)I

    move-result v1

    const/4 v2, -0x1

    if-ne v1, v2, :cond_0

    .line 346
    iget-object v0, v0, Lcom/vladsch/flexmark/util/ast/Node;->prev:Lcom/vladsch/flexmark/util/ast/Node;

    goto :goto_0

    :cond_0
    return-object v0
.end method

.method public varargs getLastChildAnyNot([Ljava/lang/Class;)Lcom/vladsch/flexmark/util/ast/Node;
    .locals 3

    .line 333
    iget-object v0, p0, Lcom/vladsch/flexmark/util/ast/Node;->lastChild:Lcom/vladsch/flexmark/util/ast/Node;

    .line 334
    array-length v1, p1

    if-lez v1, :cond_0

    :goto_0
    if-eqz v0, :cond_0

    .line 335
    invoke-static {v0, p1}, Lcom/vladsch/flexmark/util/ast/Node;->getNodeOfTypeIndex(Lcom/vladsch/flexmark/util/ast/Node;[Ljava/lang/Class;)I

    move-result v1

    const/4 v2, -0x1

    if-eq v1, v2, :cond_0

    .line 336
    iget-object v0, v0, Lcom/vladsch/flexmark/util/ast/Node;->prev:Lcom/vladsch/flexmark/util/ast/Node;

    goto :goto_0

    :cond_0
    return-object v0
.end method

.method public getLastInChain()Lcom/vladsch/flexmark/util/ast/Node;
    .locals 3

    move-object v0, p0

    .line 225
    :goto_0
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v1

    invoke-virtual {v0}, Lcom/vladsch/flexmark/util/ast/Node;->getNext()Lcom/vladsch/flexmark/util/ast/Node;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/Class;->isInstance(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_0

    invoke-virtual {v0}, Lcom/vladsch/flexmark/util/ast/Node;->getNext()Lcom/vladsch/flexmark/util/ast/Node;

    move-result-object v0

    goto :goto_0

    :cond_0
    return-object v0
.end method

.method public getLineNumber()I
    .locals 1

    .line 814
    invoke-virtual {p0}, Lcom/vladsch/flexmark/util/ast/Node;->getStartLineNumber()I

    move-result v0

    return v0
.end method

.method public getNext()Lcom/vladsch/flexmark/util/ast/Node;
    .locals 1

    .line 220
    iget-object v0, p0, Lcom/vladsch/flexmark/util/ast/Node;->next:Lcom/vladsch/flexmark/util/ast/Node;

    return-object v0
.end method

.method public varargs getNextAny([Ljava/lang/Class;)Lcom/vladsch/flexmark/util/ast/Node;
    .locals 3

    .line 295
    iget-object v0, p0, Lcom/vladsch/flexmark/util/ast/Node;->next:Lcom/vladsch/flexmark/util/ast/Node;

    .line 296
    array-length v1, p1

    if-lez v1, :cond_0

    :goto_0
    if-eqz v0, :cond_0

    .line 297
    invoke-static {v0, p1}, Lcom/vladsch/flexmark/util/ast/Node;->getNodeOfTypeIndex(Lcom/vladsch/flexmark/util/ast/Node;[Ljava/lang/Class;)I

    move-result v1

    const/4 v2, -0x1

    if-ne v1, v2, :cond_0

    .line 298
    iget-object v0, v0, Lcom/vladsch/flexmark/util/ast/Node;->next:Lcom/vladsch/flexmark/util/ast/Node;

    goto :goto_0

    :cond_0
    return-object v0
.end method

.method public varargs getNextAnyNot([Ljava/lang/Class;)Lcom/vladsch/flexmark/util/ast/Node;
    .locals 3

    .line 285
    iget-object v0, p0, Lcom/vladsch/flexmark/util/ast/Node;->next:Lcom/vladsch/flexmark/util/ast/Node;

    .line 286
    array-length v1, p1

    if-lez v1, :cond_0

    :goto_0
    if-eqz v0, :cond_0

    .line 287
    invoke-static {v0, p1}, Lcom/vladsch/flexmark/util/ast/Node;->getNodeOfTypeIndex(Lcom/vladsch/flexmark/util/ast/Node;[Ljava/lang/Class;)I

    move-result v1

    const/4 v2, -0x1

    if-eq v1, v2, :cond_0

    .line 288
    iget-object v0, v0, Lcom/vladsch/flexmark/util/ast/Node;->next:Lcom/vladsch/flexmark/util/ast/Node;

    goto :goto_0

    :cond_0
    return-object v0
.end method

.method public getNodeName()Ljava/lang/String;
    .locals 2

    .line 703
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/Class;->getPackage()Ljava/lang/Package;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/Package;->getName()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/String;->length()I

    move-result v1

    add-int/lit8 v1, v1, 0x1

    invoke-virtual {v0, v1}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public varargs getNodeOfTypeIndex([Ljava/lang/Class;)I
    .locals 0

    .line 123
    invoke-static {p0, p1}, Lcom/vladsch/flexmark/util/ast/Node;->getNodeOfTypeIndex(Lcom/vladsch/flexmark/util/ast/Node;[Ljava/lang/Class;)I

    move-result p1

    return p1
.end method

.method public getOldestAncestorOfTypeAfter(Ljava/lang/Class;Ljava/lang/Class;)Lcom/vladsch/flexmark/util/ast/Node;
    .locals 3

    .line 83
    invoke-virtual {p0}, Lcom/vladsch/flexmark/util/ast/Node;->getParent()Lcom/vladsch/flexmark/util/ast/Node;

    move-result-object v0

    const/4 v1, 0x0

    :goto_0
    if-eqz v0, :cond_2

    .line 86
    invoke-virtual {p1, v0}, Ljava/lang/Class;->isInstance(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_0

    move-object v1, v0

    goto :goto_1

    .line 87
    :cond_0
    invoke-virtual {p2, v0}, Ljava/lang/Class;->isInstance(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_1

    goto :goto_2

    .line 88
    :cond_1
    :goto_1
    invoke-virtual {v0}, Lcom/vladsch/flexmark/util/ast/Node;->getParent()Lcom/vladsch/flexmark/util/ast/Node;

    move-result-object v0

    goto :goto_0

    :cond_2
    :goto_2
    return-object v1
.end method

.method public getParent()Lcom/vladsch/flexmark/util/ast/Node;
    .locals 1

    .line 353
    iget-object v0, p0, Lcom/vladsch/flexmark/util/ast/Node;->parent:Lcom/vladsch/flexmark/util/ast/Node;

    return-object v0
.end method

.method public getPrevious()Lcom/vladsch/flexmark/util/ast/Node;
    .locals 1

    .line 242
    iget-object v0, p0, Lcom/vladsch/flexmark/util/ast/Node;->prev:Lcom/vladsch/flexmark/util/ast/Node;

    return-object v0
.end method

.method public varargs getPreviousAny([Ljava/lang/Class;)Lcom/vladsch/flexmark/util/ast/Node;
    .locals 3

    .line 275
    iget-object v0, p0, Lcom/vladsch/flexmark/util/ast/Node;->prev:Lcom/vladsch/flexmark/util/ast/Node;

    .line 276
    array-length v1, p1

    if-lez v1, :cond_0

    :goto_0
    if-eqz v0, :cond_0

    .line 277
    invoke-static {v0, p1}, Lcom/vladsch/flexmark/util/ast/Node;->getNodeOfTypeIndex(Lcom/vladsch/flexmark/util/ast/Node;[Ljava/lang/Class;)I

    move-result v1

    const/4 v2, -0x1

    if-ne v1, v2, :cond_0

    .line 278
    iget-object v0, v0, Lcom/vladsch/flexmark/util/ast/Node;->prev:Lcom/vladsch/flexmark/util/ast/Node;

    goto :goto_0

    :cond_0
    return-object v0
.end method

.method public varargs getPreviousAnyNot([Ljava/lang/Class;)Lcom/vladsch/flexmark/util/ast/Node;
    .locals 3

    .line 265
    iget-object v0, p0, Lcom/vladsch/flexmark/util/ast/Node;->prev:Lcom/vladsch/flexmark/util/ast/Node;

    .line 266
    array-length v1, p1

    if-lez v1, :cond_0

    :goto_0
    if-eqz v0, :cond_0

    .line 267
    invoke-static {v0, p1}, Lcom/vladsch/flexmark/util/ast/Node;->getNodeOfTypeIndex(Lcom/vladsch/flexmark/util/ast/Node;[Ljava/lang/Class;)I

    move-result v1

    const/4 v2, -0x1

    if-eq v1, v2, :cond_0

    .line 268
    iget-object v0, v0, Lcom/vladsch/flexmark/util/ast/Node;->prev:Lcom/vladsch/flexmark/util/ast/Node;

    goto :goto_0

    :cond_0
    return-object v0
.end method

.method public getReversedChildIterator()Lcom/vladsch/flexmark/util/collection/iteration/ReversiblePeekingIterator;
    .locals 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Lcom/vladsch/flexmark/util/collection/iteration/ReversiblePeekingIterator<",
            "Lcom/vladsch/flexmark/util/ast/Node;",
            ">;"
        }
    .end annotation

    .line 171
    iget-object v0, p0, Lcom/vladsch/flexmark/util/ast/Node;->firstChild:Lcom/vladsch/flexmark/util/ast/Node;

    if-nez v0, :cond_0

    .line 172
    sget-object v0, Lcom/vladsch/flexmark/util/ast/NodeIterator;->EMPTY:Lcom/vladsch/flexmark/util/collection/iteration/ReversiblePeekingIterator;

    return-object v0

    .line 174
    :cond_0
    new-instance v0, Lcom/vladsch/flexmark/util/ast/NodeIterator;

    iget-object v1, p0, Lcom/vladsch/flexmark/util/ast/Node;->firstChild:Lcom/vladsch/flexmark/util/ast/Node;

    iget-object v2, p0, Lcom/vladsch/flexmark/util/ast/Node;->lastChild:Lcom/vladsch/flexmark/util/ast/Node;

    const/4 v3, 0x1

    invoke-direct {v0, v1, v2, v3}, Lcom/vladsch/flexmark/util/ast/NodeIterator;-><init>(Lcom/vladsch/flexmark/util/ast/Node;Lcom/vladsch/flexmark/util/ast/Node;Z)V

    return-object v0
.end method

.method public getReversedChildren()Lcom/vladsch/flexmark/util/collection/iteration/ReversiblePeekingIterable;
    .locals 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Lcom/vladsch/flexmark/util/collection/iteration/ReversiblePeekingIterable<",
            "Lcom/vladsch/flexmark/util/ast/Node;",
            ">;"
        }
    .end annotation

    .line 143
    iget-object v0, p0, Lcom/vladsch/flexmark/util/ast/Node;->firstChild:Lcom/vladsch/flexmark/util/ast/Node;

    if-nez v0, :cond_0

    .line 144
    sget-object v0, Lcom/vladsch/flexmark/util/ast/NodeIterable;->EMPTY:Lcom/vladsch/flexmark/util/collection/iteration/ReversiblePeekingIterable;

    return-object v0

    .line 146
    :cond_0
    new-instance v0, Lcom/vladsch/flexmark/util/ast/NodeIterable;

    iget-object v1, p0, Lcom/vladsch/flexmark/util/ast/Node;->firstChild:Lcom/vladsch/flexmark/util/ast/Node;

    iget-object v2, p0, Lcom/vladsch/flexmark/util/ast/Node;->lastChild:Lcom/vladsch/flexmark/util/ast/Node;

    const/4 v3, 0x1

    invoke-direct {v0, v1, v2, v3}, Lcom/vladsch/flexmark/util/ast/NodeIterable;-><init>(Lcom/vladsch/flexmark/util/ast/Node;Lcom/vladsch/flexmark/util/ast/Node;Z)V

    return-object v0
.end method

.method public getReversedDescendants()Lcom/vladsch/flexmark/util/collection/iteration/ReversiblePeekingIterable;
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Lcom/vladsch/flexmark/util/collection/iteration/ReversiblePeekingIterable<",
            "Lcom/vladsch/flexmark/util/ast/Node;",
            ">;"
        }
    .end annotation

    .line 157
    iget-object v0, p0, Lcom/vladsch/flexmark/util/ast/Node;->firstChild:Lcom/vladsch/flexmark/util/ast/Node;

    if-nez v0, :cond_0

    .line 158
    sget-object v0, Lcom/vladsch/flexmark/util/ast/NodeIterable;->EMPTY:Lcom/vladsch/flexmark/util/collection/iteration/ReversiblePeekingIterable;

    return-object v0

    .line 160
    :cond_0
    new-instance v0, Lcom/vladsch/flexmark/util/ast/DescendantNodeIterable;

    invoke-virtual {p0}, Lcom/vladsch/flexmark/util/ast/Node;->getReversedChildren()Lcom/vladsch/flexmark/util/collection/iteration/ReversiblePeekingIterable;

    move-result-object v1

    invoke-direct {v0, v1}, Lcom/vladsch/flexmark/util/ast/DescendantNodeIterable;-><init>(Lcom/vladsch/flexmark/util/collection/iteration/ReversiblePeekingIterable;)V

    return-object v0
.end method

.method public abstract getSegments()[Lcom/vladsch/flexmark/util/sequence/BasedSequence;
.end method

.method public getSegmentsForChars()[Lcom/vladsch/flexmark/util/sequence/BasedSequence;
    .locals 1

    .line 834
    invoke-virtual {p0}, Lcom/vladsch/flexmark/util/ast/Node;->getSegments()[Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    move-result-object v0

    return-object v0
.end method

.method public getStartLineNumber()I
    .locals 2

    .line 818
    invoke-virtual {p0}, Lcom/vladsch/flexmark/util/ast/Node;->getDocument()Lcom/vladsch/flexmark/util/ast/Document;

    move-result-object v0

    iget-object v1, p0, Lcom/vladsch/flexmark/util/ast/Node;->chars:Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    invoke-interface {v1}, Lcom/vladsch/flexmark/util/sequence/BasedSequence;->getStartOffset()I

    move-result v1

    invoke-virtual {v0, v1}, Lcom/vladsch/flexmark/util/ast/Document;->getLineNumber(I)I

    move-result v0

    return v0
.end method

.method public getStartOffset()I
    .locals 1

    .line 230
    iget-object v0, p0, Lcom/vladsch/flexmark/util/ast/Node;->chars:Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    if-nez v0, :cond_0

    const/4 v0, 0x0

    return v0

    :cond_0
    invoke-interface {v0}, Lcom/vladsch/flexmark/util/sequence/BasedSequence;->getStartOffset()I

    move-result v0

    return v0
.end method

.method public getTextLength()I
    .locals 1

    .line 238
    iget-object v0, p0, Lcom/vladsch/flexmark/util/ast/Node;->chars:Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    if-nez v0, :cond_0

    const/4 v0, 0x0

    return v0

    :cond_0
    invoke-interface {v0}, Lcom/vladsch/flexmark/util/sequence/BasedSequence;->length()I

    move-result v0

    return v0
.end method

.method public hasChildren()Z
    .locals 1

    .line 192
    iget-object v0, p0, Lcom/vladsch/flexmark/util/ast/Node;->firstChild:Lcom/vladsch/flexmark/util/ast/Node;

    if-eqz v0, :cond_0

    const/4 v0, 0x1

    return v0

    :cond_0
    const/4 v0, 0x0

    return v0
.end method

.method public hasOrMoreChildren(I)Z
    .locals 4

    .line 196
    iget-object v0, p0, Lcom/vladsch/flexmark/util/ast/Node;->firstChild:Lcom/vladsch/flexmark/util/ast/Node;

    const/4 v1, 0x0

    if-eqz v0, :cond_1

    .line 198
    invoke-virtual {p0}, Lcom/vladsch/flexmark/util/ast/Node;->getChildren()Lcom/vladsch/flexmark/util/collection/iteration/ReversiblePeekingIterable;

    move-result-object v0

    invoke-interface {v0}, Lcom/vladsch/flexmark/util/collection/iteration/ReversiblePeekingIterable;->iterator()Lcom/vladsch/flexmark/util/collection/iteration/ReversiblePeekingIterator;

    move-result-object v0

    const/4 v2, 0x0

    :cond_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_1

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lcom/vladsch/flexmark/util/ast/Node;

    const/4 v3, 0x1

    add-int/2addr v2, v3

    if-lt v2, p1, :cond_0

    return v3

    :cond_1
    return v1
.end method

.method public insertAfter(Lcom/vladsch/flexmark/util/ast/Node;)V
    .locals 2

    .line 403
    invoke-virtual {p1}, Lcom/vladsch/flexmark/util/ast/Node;->unlink()V

    .line 404
    iget-object v0, p0, Lcom/vladsch/flexmark/util/ast/Node;->next:Lcom/vladsch/flexmark/util/ast/Node;

    iput-object v0, p1, Lcom/vladsch/flexmark/util/ast/Node;->next:Lcom/vladsch/flexmark/util/ast/Node;

    if-eqz v0, :cond_0

    .line 406
    iput-object p1, v0, Lcom/vladsch/flexmark/util/ast/Node;->prev:Lcom/vladsch/flexmark/util/ast/Node;

    .line 408
    :cond_0
    iput-object p0, p1, Lcom/vladsch/flexmark/util/ast/Node;->prev:Lcom/vladsch/flexmark/util/ast/Node;

    .line 409
    iput-object p1, p0, Lcom/vladsch/flexmark/util/ast/Node;->next:Lcom/vladsch/flexmark/util/ast/Node;

    .line 410
    iget-object v0, p0, Lcom/vladsch/flexmark/util/ast/Node;->parent:Lcom/vladsch/flexmark/util/ast/Node;

    iput-object v0, p1, Lcom/vladsch/flexmark/util/ast/Node;->parent:Lcom/vladsch/flexmark/util/ast/Node;

    .line 411
    iget-object v1, p1, Lcom/vladsch/flexmark/util/ast/Node;->next:Lcom/vladsch/flexmark/util/ast/Node;

    if-nez v1, :cond_1

    .line 412
    iput-object p1, v0, Lcom/vladsch/flexmark/util/ast/Node;->lastChild:Lcom/vladsch/flexmark/util/ast/Node;

    :cond_1
    return-void
.end method

.method public insertBefore(Lcom/vladsch/flexmark/util/ast/Node;)V
    .locals 2

    .line 417
    invoke-virtual {p1}, Lcom/vladsch/flexmark/util/ast/Node;->unlink()V

    .line 418
    iget-object v0, p0, Lcom/vladsch/flexmark/util/ast/Node;->prev:Lcom/vladsch/flexmark/util/ast/Node;

    iput-object v0, p1, Lcom/vladsch/flexmark/util/ast/Node;->prev:Lcom/vladsch/flexmark/util/ast/Node;

    if-eqz v0, :cond_0

    .line 420
    iput-object p1, v0, Lcom/vladsch/flexmark/util/ast/Node;->next:Lcom/vladsch/flexmark/util/ast/Node;

    .line 422
    :cond_0
    iput-object p0, p1, Lcom/vladsch/flexmark/util/ast/Node;->next:Lcom/vladsch/flexmark/util/ast/Node;

    .line 423
    iput-object p1, p0, Lcom/vladsch/flexmark/util/ast/Node;->prev:Lcom/vladsch/flexmark/util/ast/Node;

    .line 424
    iget-object v0, p0, Lcom/vladsch/flexmark/util/ast/Node;->parent:Lcom/vladsch/flexmark/util/ast/Node;

    iput-object v0, p1, Lcom/vladsch/flexmark/util/ast/Node;->parent:Lcom/vladsch/flexmark/util/ast/Node;

    .line 425
    iget-object v1, p1, Lcom/vladsch/flexmark/util/ast/Node;->prev:Lcom/vladsch/flexmark/util/ast/Node;

    if-nez v1, :cond_1

    .line 426
    iput-object p1, v0, Lcom/vladsch/flexmark/util/ast/Node;->firstChild:Lcom/vladsch/flexmark/util/ast/Node;

    :cond_1
    return-void
.end method

.method public insertChainAfter(Lcom/vladsch/flexmark/util/ast/Node;)V
    .locals 2

    move-object v0, p0

    :goto_0
    if-eqz p1, :cond_0

    .line 880
    iget-object v1, p1, Lcom/vladsch/flexmark/util/ast/Node;->next:Lcom/vladsch/flexmark/util/ast/Node;

    .line 881
    invoke-virtual {v0, p1}, Lcom/vladsch/flexmark/util/ast/Node;->insertAfter(Lcom/vladsch/flexmark/util/ast/Node;)V

    move-object v0, p1

    move-object p1, v1

    goto :goto_0

    :cond_0
    return-void
.end method

.method public insertChainBefore(Lcom/vladsch/flexmark/util/ast/Node;)V
    .locals 1

    :goto_0
    if-eqz p1, :cond_0

    .line 896
    iget-object v0, p1, Lcom/vladsch/flexmark/util/ast/Node;->next:Lcom/vladsch/flexmark/util/ast/Node;

    .line 897
    invoke-virtual {p0, p1}, Lcom/vladsch/flexmark/util/ast/Node;->insertBefore(Lcom/vladsch/flexmark/util/ast/Node;)V

    move-object p1, v0

    goto :goto_0

    :cond_0
    return-void
.end method

.method public varargs isOrDescendantOfType([Ljava/lang/Class;)Z
    .locals 3

    move-object v0, p0

    :goto_0
    if-eqz v0, :cond_1

    .line 116
    invoke-virtual {v0, p1}, Lcom/vladsch/flexmark/util/ast/Node;->getNodeOfTypeIndex([Ljava/lang/Class;)I

    move-result v1

    const/4 v2, -0x1

    if-eq v1, v2, :cond_0

    const/4 p1, 0x1

    return p1

    .line 117
    :cond_0
    invoke-virtual {v0}, Lcom/vladsch/flexmark/util/ast/Node;->getParent()Lcom/vladsch/flexmark/util/ast/Node;

    move-result-object v0

    goto :goto_0

    :cond_1
    const/4 p1, 0x0

    return p1
.end method

.method public moveTrailingBlankLines()V
    .locals 3

    .line 798
    invoke-virtual {p0}, Lcom/vladsch/flexmark/util/ast/Node;->getLastChild()Lcom/vladsch/flexmark/util/ast/Node;

    move-result-object v0

    .line 799
    instance-of v1, v0, Lcom/vladsch/flexmark/util/ast/BlankLine;

    if-eqz v1, :cond_1

    .line 800
    invoke-virtual {p0}, Lcom/vladsch/flexmark/util/ast/Node;->getBlankLineSibling()Lcom/vladsch/flexmark/util/ast/Node;

    move-result-object v1

    .line 801
    invoke-virtual {v0}, Lcom/vladsch/flexmark/util/ast/Node;->getFirstInChain()Lcom/vladsch/flexmark/util/ast/Node;

    move-result-object v0

    .line 802
    invoke-virtual {v1, v0}, Lcom/vladsch/flexmark/util/ast/Node;->insertChainAfter(Lcom/vladsch/flexmark/util/ast/Node;)V

    move-object v0, p0

    .line 806
    :cond_0
    invoke-virtual {v0}, Lcom/vladsch/flexmark/util/ast/Node;->setCharsFromContentOnly()V

    .line 807
    iget-object v0, v0, Lcom/vladsch/flexmark/util/ast/Node;->parent:Lcom/vladsch/flexmark/util/ast/Node;

    .line 809
    invoke-virtual {v1}, Lcom/vladsch/flexmark/util/ast/Node;->getParent()Lcom/vladsch/flexmark/util/ast/Node;

    move-result-object v2

    if-ne v0, v2, :cond_0

    :cond_1
    return-void
.end method

.method public prependChild(Lcom/vladsch/flexmark/util/ast/Node;)V
    .locals 1

    .line 374
    invoke-virtual {p1}, Lcom/vladsch/flexmark/util/ast/Node;->unlink()V

    .line 375
    invoke-virtual {p1, p0}, Lcom/vladsch/flexmark/util/ast/Node;->setParent(Lcom/vladsch/flexmark/util/ast/Node;)V

    .line 376
    iget-object v0, p0, Lcom/vladsch/flexmark/util/ast/Node;->firstChild:Lcom/vladsch/flexmark/util/ast/Node;

    if-eqz v0, :cond_0

    .line 377
    iput-object p1, v0, Lcom/vladsch/flexmark/util/ast/Node;->prev:Lcom/vladsch/flexmark/util/ast/Node;

    .line 378
    iput-object v0, p1, Lcom/vladsch/flexmark/util/ast/Node;->next:Lcom/vladsch/flexmark/util/ast/Node;

    .line 379
    iput-object p1, p0, Lcom/vladsch/flexmark/util/ast/Node;->firstChild:Lcom/vladsch/flexmark/util/ast/Node;

    return-void

    .line 381
    :cond_0
    iput-object p1, p0, Lcom/vladsch/flexmark/util/ast/Node;->firstChild:Lcom/vladsch/flexmark/util/ast/Node;

    .line 382
    iput-object p1, p0, Lcom/vladsch/flexmark/util/ast/Node;->lastChild:Lcom/vladsch/flexmark/util/ast/Node;

    return-void
.end method

.method public removeChildren()V
    .locals 2

    .line 183
    iget-object v0, p0, Lcom/vladsch/flexmark/util/ast/Node;->firstChild:Lcom/vladsch/flexmark/util/ast/Node;

    :goto_0
    if-eqz v0, :cond_0

    .line 185
    invoke-virtual {v0}, Lcom/vladsch/flexmark/util/ast/Node;->getNext()Lcom/vladsch/flexmark/util/ast/Node;

    move-result-object v1

    .line 186
    invoke-virtual {v0}, Lcom/vladsch/flexmark/util/ast/Node;->unlink()V

    move-object v0, v1

    goto :goto_0

    :cond_0
    return-void
.end method

.method public setChars(Lcom/vladsch/flexmark/util/sequence/BasedSequence;)V
    .locals 0

    if-nez p1, :cond_0

    .line 216
    sget-object p1, Lcom/vladsch/flexmark/util/sequence/BasedSequence;->NULL:Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    :cond_0
    iput-object p1, p0, Lcom/vladsch/flexmark/util/ast/Node;->chars:Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    return-void
.end method

.method public setCharsFromContent()V
    .locals 8

    .line 518
    invoke-virtual {p0}, Lcom/vladsch/flexmark/util/ast/Node;->getSegments()[Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    move-result-object v0

    .line 521
    array-length v1, v0

    const/4 v2, 0x1

    const/4 v3, 0x0

    const/4 v4, 0x2

    if-lez v1, :cond_2

    .line 522
    invoke-static {v0}, Lcom/vladsch/flexmark/util/ast/Node;->getLeadSegment([Lcom/vladsch/flexmark/util/sequence/BasedSequence;)Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    move-result-object v1

    .line 523
    invoke-static {v0}, Lcom/vladsch/flexmark/util/ast/Node;->getTrailSegment([Lcom/vladsch/flexmark/util/sequence/BasedSequence;)Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    move-result-object v0

    .line 525
    iget-object v5, p0, Lcom/vladsch/flexmark/util/ast/Node;->firstChild:Lcom/vladsch/flexmark/util/ast/Node;

    if-eqz v5, :cond_1

    iget-object v6, p0, Lcom/vladsch/flexmark/util/ast/Node;->lastChild:Lcom/vladsch/flexmark/util/ast/Node;

    if-nez v6, :cond_0

    goto :goto_0

    :cond_0
    const/4 v7, 0x4

    .line 533
    new-array v7, v7, [Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    aput-object v1, v7, v3

    aput-object v0, v7, v2

    iget-object v0, v5, Lcom/vladsch/flexmark/util/ast/Node;->chars:Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    aput-object v0, v7, v4

    const/4 v0, 0x3

    iget-object v1, v6, Lcom/vladsch/flexmark/util/ast/Node;->chars:Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    aput-object v1, v7, v0

    .line 540
    invoke-static {v7}, Lcom/vladsch/flexmark/util/ast/Node;->spanningChars([Lcom/vladsch/flexmark/util/sequence/BasedSequence;)Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    move-result-object v0

    goto :goto_1

    .line 526
    :cond_1
    :goto_0
    new-array v4, v4, [Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    aput-object v1, v4, v3

    aput-object v0, v4, v2

    .line 531
    invoke-static {v4}, Lcom/vladsch/flexmark/util/ast/Node;->spanningChars([Lcom/vladsch/flexmark/util/sequence/BasedSequence;)Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    move-result-object v0

    goto :goto_1

    .line 542
    :cond_2
    iget-object v0, p0, Lcom/vladsch/flexmark/util/ast/Node;->firstChild:Lcom/vladsch/flexmark/util/ast/Node;

    if-eqz v0, :cond_3

    iget-object v1, p0, Lcom/vladsch/flexmark/util/ast/Node;->lastChild:Lcom/vladsch/flexmark/util/ast/Node;

    if-eqz v1, :cond_3

    .line 543
    new-array v4, v4, [Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    iget-object v0, v0, Lcom/vladsch/flexmark/util/ast/Node;->chars:Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    aput-object v0, v4, v3

    iget-object v0, v1, Lcom/vladsch/flexmark/util/ast/Node;->chars:Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    aput-object v0, v4, v2

    .line 548
    invoke-static {v4}, Lcom/vladsch/flexmark/util/ast/Node;->spanningChars([Lcom/vladsch/flexmark/util/sequence/BasedSequence;)Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    move-result-object v0

    goto :goto_1

    :cond_3
    const/4 v0, 0x0

    :goto_1
    if-eqz v0, :cond_5

    .line 553
    iget-object v1, p0, Lcom/vladsch/flexmark/util/ast/Node;->chars:Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    invoke-interface {v1}, Lcom/vladsch/flexmark/util/sequence/BasedSequence;->isNull()Z

    move-result v1

    if-eqz v1, :cond_4

    .line 554
    invoke-virtual {p0, v0}, Lcom/vladsch/flexmark/util/ast/Node;->setChars(Lcom/vladsch/flexmark/util/sequence/BasedSequence;)V

    return-void

    .line 556
    :cond_4
    iget-object v1, p0, Lcom/vladsch/flexmark/util/ast/Node;->chars:Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    invoke-interface {v1}, Lcom/vladsch/flexmark/util/sequence/BasedSequence;->getStartOffset()I

    move-result v1

    invoke-interface {v0}, Lcom/vladsch/flexmark/util/sequence/BasedSequence;->getStartOffset()I

    move-result v2

    filled-new-array {v2}, [I

    move-result-object v2

    invoke-static {v1, v2}, Lcom/vladsch/flexmark/util/Utils;->min(I[I)I

    move-result v1

    .line 557
    iget-object v2, p0, Lcom/vladsch/flexmark/util/ast/Node;->chars:Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    invoke-interface {v2}, Lcom/vladsch/flexmark/util/sequence/BasedSequence;->getEndOffset()I

    move-result v2

    invoke-interface {v0}, Lcom/vladsch/flexmark/util/sequence/BasedSequence;->getEndOffset()I

    move-result v0

    filled-new-array {v0}, [I

    move-result-object v0

    invoke-static {v2, v0}, Lcom/vladsch/flexmark/util/Utils;->max(I[I)I

    move-result v0

    .line 558
    iget-object v2, p0, Lcom/vladsch/flexmark/util/ast/Node;->chars:Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    invoke-interface {v2, v1, v0}, Lcom/vladsch/flexmark/util/sequence/BasedSequence;->baseSubSequence(II)Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    move-result-object v0

    invoke-virtual {p0, v0}, Lcom/vladsch/flexmark/util/ast/Node;->setChars(Lcom/vladsch/flexmark/util/sequence/BasedSequence;)V

    :cond_5
    return-void
.end method

.method public setCharsFromContentOnly()V
    .locals 1

    .line 513
    sget-object v0, Lcom/vladsch/flexmark/util/sequence/SubSequence;->NULL:Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    iput-object v0, p0, Lcom/vladsch/flexmark/util/ast/Node;->chars:Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    .line 514
    invoke-virtual {p0}, Lcom/vladsch/flexmark/util/ast/Node;->setCharsFromContent()V

    return-void
.end method

.method public setCharsFromSegments()V
    .locals 1

    .line 854
    invoke-virtual {p0}, Lcom/vladsch/flexmark/util/ast/Node;->getCharsFromSegments()Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    move-result-object v0

    invoke-virtual {p0, v0}, Lcom/vladsch/flexmark/util/ast/Node;->setChars(Lcom/vladsch/flexmark/util/sequence/BasedSequence;)V

    return-void
.end method

.method protected setParent(Lcom/vladsch/flexmark/util/ast/Node;)V
    .locals 0

    .line 357
    iput-object p1, p0, Lcom/vladsch/flexmark/util/ast/Node;->parent:Lcom/vladsch/flexmark/util/ast/Node;

    return-void
.end method

.method public takeChildren(Lcom/vladsch/flexmark/util/ast/Node;)V
    .locals 3

    .line 676
    iget-object v0, p1, Lcom/vladsch/flexmark/util/ast/Node;->firstChild:Lcom/vladsch/flexmark/util/ast/Node;

    if-eqz v0, :cond_2

    .line 678
    iget-object v1, p1, Lcom/vladsch/flexmark/util/ast/Node;->lastChild:Lcom/vladsch/flexmark/util/ast/Node;

    if-eq v1, v0, :cond_1

    const/4 v2, 0x0

    .line 681
    iput-object v2, p1, Lcom/vladsch/flexmark/util/ast/Node;->firstChild:Lcom/vladsch/flexmark/util/ast/Node;

    .line 682
    iput-object v2, p1, Lcom/vladsch/flexmark/util/ast/Node;->lastChild:Lcom/vladsch/flexmark/util/ast/Node;

    .line 684
    iput-object p0, v0, Lcom/vladsch/flexmark/util/ast/Node;->parent:Lcom/vladsch/flexmark/util/ast/Node;

    .line 685
    iput-object p0, v1, Lcom/vladsch/flexmark/util/ast/Node;->parent:Lcom/vladsch/flexmark/util/ast/Node;

    .line 687
    iget-object p1, p0, Lcom/vladsch/flexmark/util/ast/Node;->lastChild:Lcom/vladsch/flexmark/util/ast/Node;

    if-eqz p1, :cond_0

    .line 688
    iput-object v0, p1, Lcom/vladsch/flexmark/util/ast/Node;->next:Lcom/vladsch/flexmark/util/ast/Node;

    .line 689
    iput-object p1, v0, Lcom/vladsch/flexmark/util/ast/Node;->prev:Lcom/vladsch/flexmark/util/ast/Node;

    goto :goto_0

    .line 691
    :cond_0
    iput-object v0, p0, Lcom/vladsch/flexmark/util/ast/Node;->firstChild:Lcom/vladsch/flexmark/util/ast/Node;

    .line 694
    :goto_0
    iput-object v1, p0, Lcom/vladsch/flexmark/util/ast/Node;->lastChild:Lcom/vladsch/flexmark/util/ast/Node;

    return-void

    .line 697
    :cond_1
    invoke-virtual {p0, v0}, Lcom/vladsch/flexmark/util/ast/Node;->appendChild(Lcom/vladsch/flexmark/util/ast/Node;)V

    :cond_2
    return-void
.end method

.method public toAstString(Z)Ljava/lang/String;
    .locals 1

    .line 713
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 714
    invoke-virtual {p0, v0, p1}, Lcom/vladsch/flexmark/util/ast/Node;->astString(Ljava/lang/StringBuilder;Z)V

    .line 715
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    return-object p1
.end method

.method public toString()Ljava/lang/String;
    .locals 2

    .line 432
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/Class;->getSimpleName()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v1, "{"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p0}, Lcom/vladsch/flexmark/util/ast/Node;->toStringAttributes()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v1, "}"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method protected toStringAttributes()Ljava/lang/String;
    .locals 1

    .line 462
    const-string v0, ""

    return-object v0
.end method

.method public unlink()V
    .locals 3

    .line 387
    iget-object v0, p0, Lcom/vladsch/flexmark/util/ast/Node;->prev:Lcom/vladsch/flexmark/util/ast/Node;

    if-eqz v0, :cond_0

    .line 388
    iget-object v1, p0, Lcom/vladsch/flexmark/util/ast/Node;->next:Lcom/vladsch/flexmark/util/ast/Node;

    iput-object v1, v0, Lcom/vladsch/flexmark/util/ast/Node;->next:Lcom/vladsch/flexmark/util/ast/Node;

    goto :goto_0

    .line 389
    :cond_0
    iget-object v1, p0, Lcom/vladsch/flexmark/util/ast/Node;->parent:Lcom/vladsch/flexmark/util/ast/Node;

    if-eqz v1, :cond_1

    .line 390
    iget-object v2, p0, Lcom/vladsch/flexmark/util/ast/Node;->next:Lcom/vladsch/flexmark/util/ast/Node;

    iput-object v2, v1, Lcom/vladsch/flexmark/util/ast/Node;->firstChild:Lcom/vladsch/flexmark/util/ast/Node;

    .line 392
    :cond_1
    :goto_0
    iget-object v1, p0, Lcom/vladsch/flexmark/util/ast/Node;->next:Lcom/vladsch/flexmark/util/ast/Node;

    if-eqz v1, :cond_2

    .line 393
    iput-object v0, v1, Lcom/vladsch/flexmark/util/ast/Node;->prev:Lcom/vladsch/flexmark/util/ast/Node;

    goto :goto_1

    .line 394
    :cond_2
    iget-object v1, p0, Lcom/vladsch/flexmark/util/ast/Node;->parent:Lcom/vladsch/flexmark/util/ast/Node;

    if-eqz v1, :cond_3

    .line 395
    iput-object v0, v1, Lcom/vladsch/flexmark/util/ast/Node;->lastChild:Lcom/vladsch/flexmark/util/ast/Node;

    :cond_3
    :goto_1
    const/4 v0, 0x0

    .line 397
    iput-object v0, p0, Lcom/vladsch/flexmark/util/ast/Node;->parent:Lcom/vladsch/flexmark/util/ast/Node;

    .line 398
    iput-object v0, p0, Lcom/vladsch/flexmark/util/ast/Node;->next:Lcom/vladsch/flexmark/util/ast/Node;

    .line 399
    iput-object v0, p0, Lcom/vladsch/flexmark/util/ast/Node;->prev:Lcom/vladsch/flexmark/util/ast/Node;

    return-void
.end method
