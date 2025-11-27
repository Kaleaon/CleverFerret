.class public abstract Lcom/vladsch/flexmark/util/sequence/BasedSequenceImpl;
.super Ljava/lang/Object;
.source "BasedSequenceImpl.java"

# interfaces
.implements Lcom/vladsch/flexmark/util/sequence/BasedSequence;


# static fields
.field static final synthetic $assertionsDisabled:Z

.field private static EMPTY_INDICES:[I

.field private static final visibleSpacesMap:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map<",
            "Ljava/lang/Character;",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method static constructor <clinit>()V
    .locals 3

    const/4 v0, 0x0

    .line 20
    new-array v0, v0, [I

    sput-object v0, Lcom/vladsch/flexmark/util/sequence/BasedSequenceImpl;->EMPTY_INDICES:[I

    .line 23
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    .line 24
    sput-object v0, Lcom/vladsch/flexmark/util/sequence/BasedSequenceImpl;->visibleSpacesMap:Ljava/util/Map;

    const/16 v1, 0xa

    .line 25
    invoke-static {v1}, Ljava/lang/Character;->valueOf(C)Ljava/lang/Character;

    move-result-object v1

    const-string v2, "\\n"

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    const/16 v1, 0xd

    .line 26
    invoke-static {v1}, Ljava/lang/Character;->valueOf(C)Ljava/lang/Character;

    move-result-object v1

    const-string v2, "\\r"

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    const/16 v1, 0xc

    .line 27
    invoke-static {v1}, Ljava/lang/Character;->valueOf(C)Ljava/lang/Character;

    move-result-object v1

    const-string v2, "\\f"

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    const/16 v1, 0x9

    .line 28
    invoke-static {v1}, Ljava/lang/Character;->valueOf(C)Ljava/lang/Character;

    move-result-object v1

    const-string v2, "\\u2192"

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    return-void
.end method

.method public constructor <init>()V
    .locals 0

    .line 19
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static columnsToNextTabStop(I)I
    .locals 0

    .line 730
    rem-int/lit8 p0, p0, 0x4

    rsub-int/lit8 p0, p0, 0x4

    return p0
.end method

.method public static expandTo([III)[I
    .locals 1

    .line 1566
    array-length p2, p0

    if-ge p2, p1, :cond_0

    .line 1567
    new-array p1, p1, [I

    .line 1568
    array-length p2, p0

    const/4 v0, 0x0

    invoke-static {p0, v0, p1, v0, p2}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    return-object p1

    :cond_0
    return-object p0
.end method

.method public static varargs firstNonNull([Lcom/vladsch/flexmark/util/sequence/BasedSequence;)Lcom/vladsch/flexmark/util/sequence/BasedSequence;
    .locals 4

    .line 31
    array-length v0, p0

    const/4 v1, 0x0

    :goto_0
    if-ge v1, v0, :cond_1

    aget-object v2, p0, v1

    if-eqz v2, :cond_0

    .line 32
    sget-object v3, Lcom/vladsch/flexmark/util/sequence/BasedSequenceImpl;->NULL:Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    if-eq v2, v3, :cond_0

    return-object v2

    :cond_0
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    .line 35
    :cond_1
    sget-object p0, Lcom/vladsch/flexmark/util/sequence/BasedSequenceImpl;->NULL:Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    return-object p0
.end method

.method static isVisibleWhitespace(C)Z
    .locals 1

    .line 39
    sget-object v0, Lcom/vladsch/flexmark/util/sequence/BasedSequenceImpl;->visibleSpacesMap:Ljava/util/Map;

    invoke-static {p0}, Ljava/lang/Character;->valueOf(C)Ljava/lang/Character;

    move-result-object p0

    invoke-interface {v0, p0}, Ljava/util/Map;->containsKey(Ljava/lang/Object;)Z

    move-result p0

    return p0
.end method

.method public static of(Ljava/lang/CharSequence;)Lcom/vladsch/flexmark/util/sequence/BasedSequence;
    .locals 1

    .line 1711
    instance-of v0, p0, Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    if-eqz v0, :cond_0

    check-cast p0, Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    return-object p0

    .line 1712
    :cond_0
    instance-of v0, p0, Ljava/lang/String;

    if-eqz v0, :cond_1

    invoke-static {p0}, Lcom/vladsch/flexmark/util/sequence/CharSubSequence;->of(Ljava/lang/CharSequence;)Lcom/vladsch/flexmark/util/sequence/CharSubSequence;

    move-result-object p0

    return-object p0

    :cond_1
    if-eqz p0, :cond_2

    .line 1713
    invoke-static {p0}, Lcom/vladsch/flexmark/util/sequence/SubSequence;->of(Ljava/lang/CharSequence;)Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    move-result-object p0

    return-object p0

    .line 1714
    :cond_2
    sget-object p0, Lcom/vladsch/flexmark/util/sequence/BasedSequence;->NULL:Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    return-object p0
.end method

.method public static of(Ljava/lang/CharSequence;I)Lcom/vladsch/flexmark/util/sequence/BasedSequence;
    .locals 1

    .line 1718
    instance-of v0, p0, Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    if-eqz v0, :cond_0

    check-cast p0, Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    invoke-interface {p0, p1}, Lcom/vladsch/flexmark/util/sequence/BasedSequence;->subSequence(I)Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    move-result-object p0

    return-object p0

    .line 1719
    :cond_0
    instance-of v0, p0, Ljava/lang/String;

    if-eqz v0, :cond_1

    invoke-static {p0, p1}, Lcom/vladsch/flexmark/util/sequence/CharSubSequence;->of(Ljava/lang/CharSequence;I)Lcom/vladsch/flexmark/util/sequence/CharSubSequence;

    move-result-object p0

    return-object p0

    .line 1720
    :cond_1
    invoke-static {p0, p1}, Lcom/vladsch/flexmark/util/sequence/SubSequence;->of(Ljava/lang/CharSequence;I)Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    move-result-object p0

    return-object p0
.end method

.method public static of(Ljava/lang/CharSequence;II)Lcom/vladsch/flexmark/util/sequence/BasedSequence;
    .locals 1

    .line 1724
    instance-of v0, p0, Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    if-eqz v0, :cond_0

    check-cast p0, Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    invoke-interface {p0, p1, p2}, Lcom/vladsch/flexmark/util/sequence/BasedSequence;->subSequence(II)Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    move-result-object p0

    return-object p0

    .line 1725
    :cond_0
    instance-of v0, p0, Ljava/lang/String;

    if-eqz v0, :cond_1

    invoke-static {p0, p1, p2}, Lcom/vladsch/flexmark/util/sequence/CharSubSequence;->of(Ljava/lang/CharSequence;II)Lcom/vladsch/flexmark/util/sequence/CharSubSequence;

    move-result-object p0

    return-object p0

    .line 1726
    :cond_1
    invoke-static {p0, p1, p2}, Lcom/vladsch/flexmark/util/sequence/SubSequence;->of(Ljava/lang/CharSequence;II)Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    move-result-object p0

    return-object p0
.end method

.method public static truncateTo([II)[I
    .locals 2

    .line 1575
    array-length v0, p0

    if-le v0, p1, :cond_0

    .line 1576
    new-array v0, p1, [I

    const/4 v1, 0x0

    .line 1577
    invoke-static {p0, v1, v0, v1, p1}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    return-object v0

    :cond_0
    return-object p0
.end method


# virtual methods
.method public varargs append([Ljava/lang/CharSequence;)Lcom/vladsch/flexmark/util/sequence/BasedSequence;
    .locals 5

    .line 1629
    array-length v0, p1

    if-lez v0, :cond_3

    .line 1631
    array-length v0, p1

    const/4 v1, 0x0

    const/4 v2, 0x0

    const/4 v3, 0x0

    :goto_0
    if-ge v2, v0, :cond_0

    aget-object v4, p1, v2

    invoke-interface {v4}, Ljava/lang/CharSequence;->length()I

    move-result v4

    add-int/2addr v3, v4

    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    .line 1632
    :cond_0
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-virtual {p0}, Lcom/vladsch/flexmark/util/sequence/BasedSequenceImpl;->length()I

    move-result v2

    add-int/2addr v2, v3

    invoke-direct {v0, v2}, Ljava/lang/StringBuilder;-><init>(I)V

    .line 1633
    invoke-virtual {p0, v0}, Lcom/vladsch/flexmark/util/sequence/BasedSequenceImpl;->appendTo(Ljava/lang/StringBuilder;)Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    .line 1634
    array-length v2, p1

    :goto_1
    if-ge v1, v2, :cond_2

    aget-object v3, p1, v1

    .line 1635
    instance-of v4, v3, Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    if-eqz v4, :cond_1

    check-cast v3, Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    invoke-interface {v3, v0}, Lcom/vladsch/flexmark/util/sequence/BasedSequence;->appendTo(Ljava/lang/StringBuilder;)Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    goto :goto_2

    .line 1636
    :cond_1
    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/CharSequence;)Ljava/lang/StringBuilder;

    :goto_2
    add-int/lit8 v1, v1, 0x1

    goto :goto_1

    .line 1638
    :cond_2
    invoke-static {v0}, Lcom/vladsch/flexmark/util/sequence/CharSubSequence;->of(Ljava/lang/CharSequence;)Lcom/vladsch/flexmark/util/sequence/CharSubSequence;

    move-result-object p1

    return-object p1

    :cond_3
    return-object p0
.end method

.method public appendTo(Ljava/lang/StringBuilder;)Lcom/vladsch/flexmark/util/sequence/BasedSequence;
    .locals 2

    const/4 v0, 0x0

    .line 1549
    invoke-virtual {p0}, Lcom/vladsch/flexmark/util/sequence/BasedSequenceImpl;->length()I

    move-result v1

    invoke-virtual {p0, p1, v0, v1}, Lcom/vladsch/flexmark/util/sequence/BasedSequenceImpl;->appendTo(Ljava/lang/StringBuilder;II)Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    move-result-object p1

    return-object p1
.end method

.method public appendTo(Ljava/lang/StringBuilder;I)Lcom/vladsch/flexmark/util/sequence/BasedSequence;
    .locals 1

    .line 1554
    invoke-virtual {p0}, Lcom/vladsch/flexmark/util/sequence/BasedSequenceImpl;->length()I

    move-result v0

    invoke-virtual {p0, p1, p2, v0}, Lcom/vladsch/flexmark/util/sequence/BasedSequenceImpl;->appendTo(Ljava/lang/StringBuilder;II)Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    move-result-object p1

    return-object p1
.end method

.method public appendTo(Ljava/lang/StringBuilder;II)Lcom/vladsch/flexmark/util/sequence/BasedSequence;
    .locals 0

    .line 1559
    invoke-virtual {p1, p0, p2, p3}, Ljava/lang/StringBuilder;->append(Ljava/lang/CharSequence;II)Ljava/lang/StringBuilder;

    return-object p0
.end method

.method public baseSubSequence(I)Lcom/vladsch/flexmark/util/sequence/BasedSequence;
    .locals 1

    .line 1271
    invoke-virtual {p0}, Lcom/vladsch/flexmark/util/sequence/BasedSequenceImpl;->getBaseSequence()Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    move-result-object v0

    invoke-interface {v0}, Lcom/vladsch/flexmark/util/sequence/BasedSequence;->getEndOffset()I

    move-result v0

    invoke-virtual {p0, p1, v0}, Lcom/vladsch/flexmark/util/sequence/BasedSequenceImpl;->baseSubSequence(II)Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    move-result-object p1

    return-object p1
.end method

.method public compareTo(Ljava/lang/CharSequence;)I
    .locals 6

    .line 1697
    invoke-virtual {p0}, Lcom/vladsch/flexmark/util/sequence/BasedSequenceImpl;->length()I

    move-result v0

    .line 1698
    invoke-interface {p1}, Ljava/lang/CharSequence;->length()I

    move-result v1

    if-gt v0, v1, :cond_0

    move v2, v0

    goto :goto_0

    :cond_0
    move v2, v1

    :goto_0
    const/4 v3, 0x0

    :goto_1
    if-ge v3, v2, :cond_2

    .line 1701
    invoke-virtual {p0, v3}, Lcom/vladsch/flexmark/util/sequence/BasedSequenceImpl;->charAt(I)C

    move-result v4

    .line 1702
    invoke-interface {p1, v3}, Ljava/lang/CharSequence;->charAt(I)C

    move-result v5

    if-eq v4, v5, :cond_1

    sub-int/2addr v4, v5

    return v4

    :cond_1
    add-int/lit8 v3, v3, 0x1

    goto :goto_1

    :cond_2
    sub-int/2addr v0, v1

    return v0
.end method

.method public bridge synthetic compareTo(Ljava/lang/Object;)I
    .locals 0

    .line 19
    check-cast p1, Ljava/lang/CharSequence;

    invoke-virtual {p0, p1}, Lcom/vladsch/flexmark/util/sequence/BasedSequenceImpl;->compareTo(Ljava/lang/CharSequence;)I

    move-result p1

    return p1
.end method

.method public containsAllOf(Lcom/vladsch/flexmark/util/sequence/BasedSequence;)Z
    .locals 2

    .line 1393
    invoke-virtual {p0}, Lcom/vladsch/flexmark/util/sequence/BasedSequenceImpl;->getBase()Ljava/lang/Object;

    move-result-object v0

    invoke-interface {p1}, Lcom/vladsch/flexmark/util/sequence/BasedSequence;->getBase()Ljava/lang/Object;

    move-result-object v1

    if-ne v0, v1, :cond_0

    invoke-interface {p1}, Lcom/vladsch/flexmark/util/sequence/BasedSequence;->getStartOffset()I

    move-result v0

    invoke-virtual {p0}, Lcom/vladsch/flexmark/util/sequence/BasedSequenceImpl;->getStartOffset()I

    move-result v1

    if-lt v0, v1, :cond_0

    invoke-interface {p1}, Lcom/vladsch/flexmark/util/sequence/BasedSequence;->getEndOffset()I

    move-result p1

    invoke-virtual {p0}, Lcom/vladsch/flexmark/util/sequence/BasedSequenceImpl;->getEndOffset()I

    move-result v0

    if-gt p1, v0, :cond_0

    const/4 p1, 0x1

    return p1

    :cond_0
    const/4 p1, 0x0

    return p1
.end method

.method public containsSomeOf(Lcom/vladsch/flexmark/util/sequence/BasedSequence;)Z
    .locals 2

    .line 1398
    invoke-virtual {p0}, Lcom/vladsch/flexmark/util/sequence/BasedSequenceImpl;->getBase()Ljava/lang/Object;

    move-result-object v0

    invoke-interface {p1}, Lcom/vladsch/flexmark/util/sequence/BasedSequence;->getBase()Ljava/lang/Object;

    move-result-object v1

    if-ne v0, v1, :cond_0

    invoke-virtual {p0}, Lcom/vladsch/flexmark/util/sequence/BasedSequenceImpl;->getStartOffset()I

    move-result v0

    invoke-interface {p1}, Lcom/vladsch/flexmark/util/sequence/BasedSequence;->getEndOffset()I

    move-result v1

    if-ge v0, v1, :cond_0

    invoke-virtual {p0}, Lcom/vladsch/flexmark/util/sequence/BasedSequenceImpl;->getEndOffset()I

    move-result v0

    invoke-interface {p1}, Lcom/vladsch/flexmark/util/sequence/BasedSequence;->getStartOffset()I

    move-result p1

    if-le v0, p1, :cond_0

    const/4 p1, 0x1

    return p1

    :cond_0
    const/4 p1, 0x0

    return p1
.end method

.method public countChars(C)I
    .locals 0
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    .line 623
    invoke-virtual {p0, p1}, Lcom/vladsch/flexmark/util/sequence/BasedSequenceImpl;->countLeading(C)I

    move-result p1

    return p1
.end method

.method public countChars(CI)I
    .locals 0
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    .line 628
    invoke-virtual {p0, p1, p2}, Lcom/vladsch/flexmark/util/sequence/BasedSequenceImpl;->countLeading(CI)I

    move-result p1

    return p1
.end method

.method public countChars(CII)I
    .locals 0
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    .line 633
    invoke-virtual {p0, p1, p2, p3}, Lcom/vladsch/flexmark/util/sequence/BasedSequenceImpl;->countLeading(CII)I

    move-result p1

    return p1
.end method

.method public countChars(Ljava/lang/CharSequence;)I
    .locals 0
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    .line 638
    invoke-virtual {p0, p1}, Lcom/vladsch/flexmark/util/sequence/BasedSequenceImpl;->countLeading(Ljava/lang/CharSequence;)I

    move-result p1

    return p1
.end method

.method public countChars(Ljava/lang/CharSequence;I)I
    .locals 0
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    .line 642
    invoke-virtual {p0, p1, p2}, Lcom/vladsch/flexmark/util/sequence/BasedSequenceImpl;->countLeading(Ljava/lang/CharSequence;I)I

    move-result p1

    return p1
.end method

.method public countChars(Ljava/lang/CharSequence;II)I
    .locals 0
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    .line 647
    invoke-virtual {p0, p1, p2, p3}, Lcom/vladsch/flexmark/util/sequence/BasedSequenceImpl;->countLeading(Ljava/lang/CharSequence;II)I

    move-result p1

    return p1
.end method

.method public countCharsReversed(C)I
    .locals 0
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    .line 624
    invoke-virtual {p0, p1}, Lcom/vladsch/flexmark/util/sequence/BasedSequenceImpl;->countTrailing(C)I

    move-result p1

    return p1
.end method

.method public countCharsReversed(CI)I
    .locals 0
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    .line 629
    invoke-virtual {p0, p1, p2}, Lcom/vladsch/flexmark/util/sequence/BasedSequenceImpl;->countTrailing(CI)I

    move-result p1

    return p1
.end method

.method public countCharsReversed(CII)I
    .locals 0
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    .line 635
    invoke-virtual {p0, p1, p2, p3}, Lcom/vladsch/flexmark/util/sequence/BasedSequenceImpl;->countTrailing(CII)I

    move-result p1

    return p1
.end method

.method public countCharsReversed(Ljava/lang/CharSequence;)I
    .locals 0
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    .line 639
    invoke-virtual {p0, p1}, Lcom/vladsch/flexmark/util/sequence/BasedSequenceImpl;->countTrailing(Ljava/lang/CharSequence;)I

    move-result p1

    return p1
.end method

.method public countCharsReversed(Ljava/lang/CharSequence;I)I
    .locals 0
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    .line 643
    invoke-virtual {p0, p1, p2}, Lcom/vladsch/flexmark/util/sequence/BasedSequenceImpl;->countTrailing(Ljava/lang/CharSequence;I)I

    move-result p1

    return p1
.end method

.method public countCharsReversed(Ljava/lang/CharSequence;II)I
    .locals 0
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    .line 649
    invoke-virtual {p0, p1, p2, p3}, Lcom/vladsch/flexmark/util/sequence/BasedSequenceImpl;->countTrailing(Ljava/lang/CharSequence;II)I

    move-result p1

    return p1
.end method

.method public countLeading()I
    .locals 3

    const/4 v0, 0x0

    .line 703
    invoke-virtual {p0}, Lcom/vladsch/flexmark/util/sequence/BasedSequenceImpl;->length()I

    move-result v1

    const-string v2, " \t"

    invoke-virtual {p0, v2, v0, v1}, Lcom/vladsch/flexmark/util/sequence/BasedSequenceImpl;->countLeading(Ljava/lang/CharSequence;II)I

    move-result v0

    return v0
.end method

.method public countLeading(C)I
    .locals 2

    const/4 v0, 0x0

    .line 654
    invoke-virtual {p0}, Lcom/vladsch/flexmark/util/sequence/BasedSequenceImpl;->length()I

    move-result v1

    invoke-virtual {p0, p1, v0, v1}, Lcom/vladsch/flexmark/util/sequence/BasedSequenceImpl;->countLeading(CII)I

    move-result p1

    return p1
.end method

.method public countLeading(CI)I
    .locals 1

    .line 656
    invoke-virtual {p0}, Lcom/vladsch/flexmark/util/sequence/BasedSequenceImpl;->length()I

    move-result v0

    invoke-virtual {p0, p1, p2, v0}, Lcom/vladsch/flexmark/util/sequence/BasedSequenceImpl;->countLeading(CII)I

    move-result p1

    return p1
.end method

.method public countLeading(CII)I
    .locals 1

    if-gez p2, :cond_0

    const/4 p2, 0x0

    .line 669
    :cond_0
    invoke-virtual {p0}, Lcom/vladsch/flexmark/util/sequence/BasedSequenceImpl;->length()I

    move-result v0

    if-le p3, v0, :cond_1

    invoke-virtual {p0}, Lcom/vladsch/flexmark/util/sequence/BasedSequenceImpl;->length()I

    move-result p3

    :cond_1
    if-le p2, p3, :cond_2

    move p2, p3

    .line 671
    :cond_2
    invoke-virtual {p0, p1, p2, p3}, Lcom/vladsch/flexmark/util/sequence/BasedSequenceImpl;->indexOfNot(CII)I

    move-result p1

    const/4 v0, -0x1

    if-ne p1, v0, :cond_3

    sub-int/2addr p3, p2

    return p3

    :cond_3
    sub-int/2addr p1, p2

    return p1
.end method

.method public countLeading(Ljava/lang/CharSequence;)I
    .locals 2

    const/4 v0, 0x0

    .line 708
    invoke-virtual {p0}, Lcom/vladsch/flexmark/util/sequence/BasedSequenceImpl;->length()I

    move-result v1

    invoke-virtual {p0, p1, v0, v1}, Lcom/vladsch/flexmark/util/sequence/BasedSequenceImpl;->countLeading(Ljava/lang/CharSequence;II)I

    move-result p1

    return p1
.end method

.method public countLeading(Ljava/lang/CharSequence;I)I
    .locals 1

    .line 710
    invoke-virtual {p0}, Lcom/vladsch/flexmark/util/sequence/BasedSequenceImpl;->length()I

    move-result v0

    invoke-virtual {p0, p1, p2, v0}, Lcom/vladsch/flexmark/util/sequence/BasedSequenceImpl;->countLeading(Ljava/lang/CharSequence;II)I

    move-result p1

    return p1
.end method

.method public countLeading(Ljava/lang/CharSequence;II)I
    .locals 1

    if-gez p2, :cond_0

    const/4 p2, 0x0

    .line 722
    :cond_0
    invoke-virtual {p0}, Lcom/vladsch/flexmark/util/sequence/BasedSequenceImpl;->length()I

    move-result v0

    if-le p3, v0, :cond_1

    invoke-virtual {p0}, Lcom/vladsch/flexmark/util/sequence/BasedSequenceImpl;->length()I

    move-result p3

    :cond_1
    if-le p2, p3, :cond_2

    move p2, p3

    .line 724
    :cond_2
    invoke-virtual {p0, p1, p2, p3}, Lcom/vladsch/flexmark/util/sequence/BasedSequenceImpl;->indexOfAnyNot(Ljava/lang/CharSequence;II)I

    move-result p1

    const/4 v0, -0x1

    if-ne p1, v0, :cond_3

    sub-int/2addr p3, p2

    return p3

    :cond_3
    sub-int/2addr p1, p2

    return p1
.end method

.method public countLeadingColumns(ILjava/lang/CharSequence;)I
    .locals 5

    .line 736
    invoke-virtual {p0}, Lcom/vladsch/flexmark/util/sequence/BasedSequenceImpl;->length()I

    move-result v0

    const/4 v1, 0x0

    .line 737
    invoke-virtual {p0, p2, v1, v0}, Lcom/vladsch/flexmark/util/sequence/BasedSequenceImpl;->indexOfAnyNot(Ljava/lang/CharSequence;II)I

    move-result p2

    const/4 v2, -0x1

    if-ne p2, v2, :cond_0

    move v3, v0

    goto :goto_0

    :cond_0
    move v3, p2

    :goto_0
    if-ne p2, v2, :cond_1

    move p2, v0

    :cond_1
    const/16 v4, 0x9

    .line 742
    invoke-virtual {p0, v4, v1, v3}, Lcom/vladsch/flexmark/util/sequence/BasedSequenceImpl;->indexOf(CII)I

    move-result v1

    if-eq v1, v2, :cond_4

    :cond_2
    add-int v2, v1, p1

    .line 746
    invoke-static {v2}, Lcom/vladsch/flexmark/util/sequence/BasedSequenceImpl;->columnsToNextTabStop(I)I

    move-result v2

    add-int/2addr v2, v1

    add-int/2addr p1, v2

    add-int/lit8 v1, v1, 0x1

    .line 747
    invoke-virtual {p0, v4, v1}, Lcom/vladsch/flexmark/util/sequence/BasedSequenceImpl;->indexOf(CI)I

    move-result v1

    if-ltz v1, :cond_3

    if-lt v1, v0, :cond_2

    :cond_3
    add-int/2addr p2, p1

    :cond_4
    return p2
.end method

.method public countLeadingNot()I
    .locals 3

    const/4 v0, 0x0

    .line 704
    invoke-virtual {p0}, Lcom/vladsch/flexmark/util/sequence/BasedSequenceImpl;->length()I

    move-result v1

    const-string v2, " \t"

    invoke-virtual {p0, v2, v0, v1}, Lcom/vladsch/flexmark/util/sequence/BasedSequenceImpl;->countLeadingNot(Ljava/lang/CharSequence;II)I

    move-result v0

    return v0
.end method

.method public countLeadingNot(C)I
    .locals 2

    const/4 v0, 0x0

    .line 655
    invoke-virtual {p0}, Lcom/vladsch/flexmark/util/sequence/BasedSequenceImpl;->length()I

    move-result v1

    invoke-virtual {p0, p1, v0, v1}, Lcom/vladsch/flexmark/util/sequence/BasedSequenceImpl;->countLeadingNot(CII)I

    move-result p1

    return p1
.end method

.method public countLeadingNot(CI)I
    .locals 1

    .line 657
    invoke-virtual {p0}, Lcom/vladsch/flexmark/util/sequence/BasedSequenceImpl;->length()I

    move-result v0

    invoke-virtual {p0, p1, p2, v0}, Lcom/vladsch/flexmark/util/sequence/BasedSequenceImpl;->countLeadingNot(CII)I

    move-result p1

    return p1
.end method

.method public countLeadingNot(CII)I
    .locals 1

    if-gez p2, :cond_0

    const/4 p2, 0x0

    .line 687
    :cond_0
    invoke-virtual {p0}, Lcom/vladsch/flexmark/util/sequence/BasedSequenceImpl;->length()I

    move-result v0

    if-le p3, v0, :cond_1

    invoke-virtual {p0}, Lcom/vladsch/flexmark/util/sequence/BasedSequenceImpl;->length()I

    move-result p3

    :cond_1
    if-le p2, p3, :cond_2

    move p2, p3

    .line 689
    :cond_2
    invoke-virtual {p0, p1, p2, p3}, Lcom/vladsch/flexmark/util/sequence/BasedSequenceImpl;->indexOf(CII)I

    move-result p1

    const/4 v0, -0x1

    if-ne p1, v0, :cond_3

    sub-int/2addr p3, p2

    return p3

    :cond_3
    sub-int/2addr p1, p2

    return p1
.end method

.method public countLeadingNot(Ljava/lang/CharSequence;)I
    .locals 2

    const/4 v0, 0x0

    .line 709
    invoke-virtual {p0}, Lcom/vladsch/flexmark/util/sequence/BasedSequenceImpl;->length()I

    move-result v1

    invoke-virtual {p0, p1, v0, v1}, Lcom/vladsch/flexmark/util/sequence/BasedSequenceImpl;->countLeadingNot(Ljava/lang/CharSequence;II)I

    move-result p1

    return p1
.end method

.method public countLeadingNot(Ljava/lang/CharSequence;I)I
    .locals 1

    .line 711
    invoke-virtual {p0}, Lcom/vladsch/flexmark/util/sequence/BasedSequenceImpl;->length()I

    move-result v0

    invoke-virtual {p0, p1, p2, v0}, Lcom/vladsch/flexmark/util/sequence/BasedSequenceImpl;->countLeadingNot(Ljava/lang/CharSequence;II)I

    move-result p1

    return p1
.end method

.method public countLeadingNot(Ljava/lang/CharSequence;II)I
    .locals 1

    if-gez p2, :cond_0

    const/4 p2, 0x0

    .line 766
    :cond_0
    invoke-virtual {p0}, Lcom/vladsch/flexmark/util/sequence/BasedSequenceImpl;->length()I

    move-result v0

    if-le p3, v0, :cond_1

    invoke-virtual {p0}, Lcom/vladsch/flexmark/util/sequence/BasedSequenceImpl;->length()I

    move-result p3

    :cond_1
    if-le p2, p3, :cond_2

    move p2, p3

    .line 768
    :cond_2
    invoke-virtual {p0, p1, p2, p3}, Lcom/vladsch/flexmark/util/sequence/BasedSequenceImpl;->indexOfAny(Ljava/lang/CharSequence;II)I

    move-result p1

    const/4 v0, -0x1

    if-ne p1, v0, :cond_3

    sub-int/2addr p3, p2

    return p3

    :cond_3
    sub-int/2addr p1, p2

    return p1
.end method

.method public countNotChars(C)I
    .locals 0
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    .line 625
    invoke-virtual {p0, p1}, Lcom/vladsch/flexmark/util/sequence/BasedSequenceImpl;->countLeadingNot(C)I

    move-result p1

    return p1
.end method

.method public countNotChars(CI)I
    .locals 0
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    .line 630
    invoke-virtual {p0, p1, p2}, Lcom/vladsch/flexmark/util/sequence/BasedSequenceImpl;->countLeadingNot(CI)I

    move-result p1

    return p1
.end method

.method public countNotChars(CII)I
    .locals 0
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    .line 634
    invoke-virtual {p0, p1, p2, p3}, Lcom/vladsch/flexmark/util/sequence/BasedSequenceImpl;->countTrailingNot(CII)I

    move-result p1

    return p1
.end method

.method public countNotChars(Ljava/lang/CharSequence;)I
    .locals 0
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    .line 640
    invoke-virtual {p0, p1}, Lcom/vladsch/flexmark/util/sequence/BasedSequenceImpl;->countLeadingNot(Ljava/lang/CharSequence;)I

    move-result p1

    return p1
.end method

.method public countNotChars(Ljava/lang/CharSequence;I)I
    .locals 0
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    .line 644
    invoke-virtual {p0, p1, p2}, Lcom/vladsch/flexmark/util/sequence/BasedSequenceImpl;->countLeadingNot(Ljava/lang/CharSequence;I)I

    move-result p1

    return p1
.end method

.method public countNotChars(Ljava/lang/CharSequence;II)I
    .locals 0
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    .line 648
    invoke-virtual {p0, p1, p2, p3}, Lcom/vladsch/flexmark/util/sequence/BasedSequenceImpl;->countTrailingNot(Ljava/lang/CharSequence;II)I

    move-result p1

    return p1
.end method

.method public countNotCharsReversed(C)I
    .locals 0
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    .line 626
    invoke-virtual {p0, p1}, Lcom/vladsch/flexmark/util/sequence/BasedSequenceImpl;->countTrailingNot(C)I

    move-result p1

    return p1
.end method

.method public countNotCharsReversed(CI)I
    .locals 0
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    .line 631
    invoke-virtual {p0, p1, p2}, Lcom/vladsch/flexmark/util/sequence/BasedSequenceImpl;->countTrailingNot(CI)I

    move-result p1

    return p1
.end method

.method public countNotCharsReversed(CII)I
    .locals 0
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    .line 636
    invoke-virtual {p0, p1, p2, p3}, Lcom/vladsch/flexmark/util/sequence/BasedSequenceImpl;->countTrailingNot(CII)I

    move-result p1

    return p1
.end method

.method public countNotCharsReversed(Ljava/lang/CharSequence;)I
    .locals 0
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    .line 641
    invoke-virtual {p0, p1}, Lcom/vladsch/flexmark/util/sequence/BasedSequenceImpl;->countTrailingNot(Ljava/lang/CharSequence;)I

    move-result p1

    return p1
.end method

.method public countNotCharsReversed(Ljava/lang/CharSequence;I)I
    .locals 0
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    .line 645
    invoke-virtual {p0, p1, p2}, Lcom/vladsch/flexmark/util/sequence/BasedSequenceImpl;->countTrailingNot(Ljava/lang/CharSequence;I)I

    move-result p1

    return p1
.end method

.method public countNotCharsReversed(Ljava/lang/CharSequence;II)I
    .locals 0
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    .line 650
    invoke-virtual {p0, p1, p2, p3}, Lcom/vladsch/flexmark/util/sequence/BasedSequenceImpl;->countTrailingNot(Ljava/lang/CharSequence;II)I

    move-result p1

    return p1
.end method

.method public countOf()I
    .locals 3

    const/4 v0, 0x0

    .line 479
    invoke-virtual {p0}, Lcom/vladsch/flexmark/util/sequence/BasedSequenceImpl;->length()I

    move-result v1

    const-string v2, " \t"

    invoke-virtual {p0, v2, v0, v1}, Lcom/vladsch/flexmark/util/sequence/BasedSequenceImpl;->countOfAny(Ljava/lang/CharSequence;II)I

    move-result v0

    return v0
.end method

.method public countOf(C)I
    .locals 2

    const/4 v0, 0x0

    .line 474
    invoke-virtual {p0}, Lcom/vladsch/flexmark/util/sequence/BasedSequenceImpl;->length()I

    move-result v1

    invoke-virtual {p0, p1, v0, v1}, Lcom/vladsch/flexmark/util/sequence/BasedSequenceImpl;->countOf(CII)I

    move-result p1

    return p1
.end method

.method public countOf(CI)I
    .locals 1

    .line 476
    invoke-virtual {p0}, Lcom/vladsch/flexmark/util/sequence/BasedSequenceImpl;->length()I

    move-result v0

    invoke-virtual {p0, p1, p2, v0}, Lcom/vladsch/flexmark/util/sequence/BasedSequenceImpl;->countOf(CII)I

    move-result p1

    return p1
.end method

.method public countOf(CII)I
    .locals 2

    const/4 v0, 0x0

    if-gez p2, :cond_0

    const/4 p2, 0x0

    .line 490
    :cond_0
    invoke-virtual {p0}, Lcom/vladsch/flexmark/util/sequence/BasedSequenceImpl;->length()I

    move-result v1

    if-lt p3, v1, :cond_1

    invoke-virtual {p0}, Lcom/vladsch/flexmark/util/sequence/BasedSequenceImpl;->length()I

    move-result p3

    goto :goto_0

    :cond_1
    add-int/lit8 p3, p3, 0x1

    :goto_0
    add-int/lit8 v1, p3, -0x1

    if-le p3, p2, :cond_3

    .line 494
    invoke-virtual {p0, v1}, Lcom/vladsch/flexmark/util/sequence/BasedSequenceImpl;->charAt(I)C

    move-result p3

    if-ne p3, p1, :cond_2

    add-int/lit8 v0, v0, 0x1

    :cond_2
    move p3, v1

    goto :goto_0

    :cond_3
    return v0
.end method

.method public countOfAny(Ljava/lang/CharSequence;)I
    .locals 2

    const/4 v0, 0x0

    .line 481
    invoke-virtual {p0}, Lcom/vladsch/flexmark/util/sequence/BasedSequenceImpl;->length()I

    move-result v1

    invoke-virtual {p0, p1, v0, v1}, Lcom/vladsch/flexmark/util/sequence/BasedSequenceImpl;->countOfAny(Ljava/lang/CharSequence;II)I

    move-result p1

    return p1
.end method

.method public countOfAny(Ljava/lang/CharSequence;I)I
    .locals 1

    .line 483
    invoke-virtual {p0}, Lcom/vladsch/flexmark/util/sequence/BasedSequenceImpl;->length()I

    move-result v0

    invoke-virtual {p0, p1, p2, v0}, Lcom/vladsch/flexmark/util/sequence/BasedSequenceImpl;->countOfAny(Ljava/lang/CharSequence;II)I

    move-result p1

    return p1
.end method

.method public countOfAny(Ljava/lang/CharSequence;II)I
    .locals 3

    .line 502
    invoke-static {p1}, Lcom/vladsch/flexmark/util/sequence/BasedSequenceImpl;->of(Ljava/lang/CharSequence;)Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    move-result-object p1

    const/4 v0, 0x0

    if-gez p2, :cond_0

    const/4 p2, 0x0

    .line 504
    :cond_0
    invoke-virtual {p0}, Lcom/vladsch/flexmark/util/sequence/BasedSequenceImpl;->length()I

    move-result v1

    if-le p3, v1, :cond_1

    invoke-virtual {p0}, Lcom/vladsch/flexmark/util/sequence/BasedSequenceImpl;->length()I

    move-result p3

    :cond_1
    :goto_0
    if-ge p2, p3, :cond_3

    .line 507
    invoke-virtual {p0, p2}, Lcom/vladsch/flexmark/util/sequence/BasedSequenceImpl;->charAt(I)C

    move-result v1

    .line 508
    invoke-interface {p1, v1}, Lcom/vladsch/flexmark/util/sequence/BasedSequence;->indexOf(C)I

    move-result v1

    const/4 v2, -0x1

    if-eq v1, v2, :cond_2

    add-int/lit8 v0, v0, 0x1

    :cond_2
    add-int/lit8 p2, p2, 0x1

    goto :goto_0

    :cond_3
    return v0
.end method

.method public countOfAnyNot(Ljava/lang/CharSequence;)I
    .locals 2

    const/4 v0, 0x0

    .line 482
    invoke-virtual {p0}, Lcom/vladsch/flexmark/util/sequence/BasedSequenceImpl;->length()I

    move-result v1

    invoke-virtual {p0, p1, v0, v1}, Lcom/vladsch/flexmark/util/sequence/BasedSequenceImpl;->countOfAnyNot(Ljava/lang/CharSequence;II)I

    move-result p1

    return p1
.end method

.method public countOfAnyNot(Ljava/lang/CharSequence;I)I
    .locals 1

    .line 484
    invoke-virtual {p0}, Lcom/vladsch/flexmark/util/sequence/BasedSequenceImpl;->length()I

    move-result v0

    invoke-virtual {p0, p1, p2, v0}, Lcom/vladsch/flexmark/util/sequence/BasedSequenceImpl;->countOfAnyNot(Ljava/lang/CharSequence;II)I

    move-result p1

    return p1
.end method

.method public countOfAnyNot(Ljava/lang/CharSequence;II)I
    .locals 3

    .line 528
    invoke-static {p1}, Lcom/vladsch/flexmark/util/sequence/BasedSequenceImpl;->of(Ljava/lang/CharSequence;)Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    move-result-object p1

    const/4 v0, 0x0

    if-gez p2, :cond_0

    const/4 p2, 0x0

    .line 530
    :cond_0
    invoke-virtual {p0}, Lcom/vladsch/flexmark/util/sequence/BasedSequenceImpl;->length()I

    move-result v1

    if-le p3, v1, :cond_1

    invoke-virtual {p0}, Lcom/vladsch/flexmark/util/sequence/BasedSequenceImpl;->length()I

    move-result p3

    :cond_1
    :goto_0
    if-ge p2, p3, :cond_3

    .line 533
    invoke-virtual {p0, p2}, Lcom/vladsch/flexmark/util/sequence/BasedSequenceImpl;->charAt(I)C

    move-result v1

    .line 534
    invoke-interface {p1, v1}, Lcom/vladsch/flexmark/util/sequence/BasedSequence;->indexOf(C)I

    move-result v1

    const/4 v2, -0x1

    if-ne v1, v2, :cond_2

    add-int/lit8 v0, v0, 0x1

    :cond_2
    add-int/lit8 p2, p2, 0x1

    goto :goto_0

    :cond_3
    return v0
.end method

.method public countOfNot()I
    .locals 3

    const/4 v0, 0x0

    .line 480
    invoke-virtual {p0}, Lcom/vladsch/flexmark/util/sequence/BasedSequenceImpl;->length()I

    move-result v1

    const-string v2, " \t"

    invoke-virtual {p0, v2, v0, v1}, Lcom/vladsch/flexmark/util/sequence/BasedSequenceImpl;->countOfAnyNot(Ljava/lang/CharSequence;II)I

    move-result v0

    return v0
.end method

.method public countOfNot(C)I
    .locals 2

    const/4 v0, 0x0

    .line 475
    invoke-virtual {p0}, Lcom/vladsch/flexmark/util/sequence/BasedSequenceImpl;->length()I

    move-result v1

    invoke-virtual {p0, p1, v0, v1}, Lcom/vladsch/flexmark/util/sequence/BasedSequenceImpl;->countOfNot(CII)I

    move-result p1

    return p1
.end method

.method public countOfNot(CI)I
    .locals 1

    .line 477
    invoke-virtual {p0}, Lcom/vladsch/flexmark/util/sequence/BasedSequenceImpl;->length()I

    move-result v0

    invoke-virtual {p0, p1, p2, v0}, Lcom/vladsch/flexmark/util/sequence/BasedSequenceImpl;->countOfNot(CII)I

    move-result p1

    return p1
.end method

.method public countOfNot(CII)I
    .locals 2

    const/4 v0, 0x0

    if-gez p2, :cond_0

    const/4 p2, 0x0

    .line 516
    :cond_0
    invoke-virtual {p0}, Lcom/vladsch/flexmark/util/sequence/BasedSequenceImpl;->length()I

    move-result v1

    if-lt p3, v1, :cond_1

    invoke-virtual {p0}, Lcom/vladsch/flexmark/util/sequence/BasedSequenceImpl;->length()I

    move-result p3

    goto :goto_0

    :cond_1
    add-int/lit8 p3, p3, 0x1

    :goto_0
    add-int/lit8 v1, p3, -0x1

    if-le p3, p2, :cond_3

    .line 520
    invoke-virtual {p0, v1}, Lcom/vladsch/flexmark/util/sequence/BasedSequenceImpl;->charAt(I)C

    move-result p3

    if-eq p3, p1, :cond_2

    add-int/lit8 v0, v0, 0x1

    :cond_2
    move p3, v1

    goto :goto_0

    :cond_3
    return v0
.end method

.method public countTrailing()I
    .locals 3

    const/4 v0, 0x0

    .line 705
    invoke-virtual {p0}, Lcom/vladsch/flexmark/util/sequence/BasedSequenceImpl;->length()I

    move-result v1

    const-string v2, " \t"

    invoke-virtual {p0, v2, v0, v1}, Lcom/vladsch/flexmark/util/sequence/BasedSequenceImpl;->countTrailing(Ljava/lang/CharSequence;II)I

    move-result v0

    return v0
.end method

.method public countTrailing(C)I
    .locals 2

    const/4 v0, 0x0

    .line 659
    invoke-virtual {p0}, Lcom/vladsch/flexmark/util/sequence/BasedSequenceImpl;->length()I

    move-result v1

    invoke-virtual {p0, p1, v0, v1}, Lcom/vladsch/flexmark/util/sequence/BasedSequenceImpl;->countTrailing(CII)I

    move-result p1

    return p1
.end method

.method public countTrailing(CI)I
    .locals 1

    const/4 v0, 0x0

    .line 661
    invoke-virtual {p0, p1, v0, p2}, Lcom/vladsch/flexmark/util/sequence/BasedSequenceImpl;->countTrailing(CII)I

    move-result p1

    return p1
.end method

.method public countTrailing(CII)I
    .locals 1

    if-gez p2, :cond_0

    const/4 p2, 0x0

    .line 678
    :cond_0
    invoke-virtual {p0}, Lcom/vladsch/flexmark/util/sequence/BasedSequenceImpl;->length()I

    move-result v0

    if-le p3, v0, :cond_1

    invoke-virtual {p0}, Lcom/vladsch/flexmark/util/sequence/BasedSequenceImpl;->length()I

    move-result p3

    :cond_1
    if-le p2, p3, :cond_2

    move p2, p3

    .line 680
    :cond_2
    invoke-virtual {p0, p1, p2, p3}, Lcom/vladsch/flexmark/util/sequence/BasedSequenceImpl;->lastIndexOfNot(CII)I

    move-result p1

    const/4 v0, -0x1

    if-ne p1, v0, :cond_3

    sub-int/2addr p3, p2

    return p3

    :cond_3
    sub-int/2addr p3, p1

    add-int/lit8 p3, p3, -0x1

    return p3
.end method

.method public countTrailing(Ljava/lang/CharSequence;)I
    .locals 2

    const/4 v0, 0x0

    .line 713
    invoke-virtual {p0}, Lcom/vladsch/flexmark/util/sequence/BasedSequenceImpl;->length()I

    move-result v1

    invoke-virtual {p0, p1, v0, v1}, Lcom/vladsch/flexmark/util/sequence/BasedSequenceImpl;->countTrailing(Ljava/lang/CharSequence;II)I

    move-result p1

    return p1
.end method

.method public countTrailing(Ljava/lang/CharSequence;I)I
    .locals 1

    const/4 v0, 0x0

    .line 715
    invoke-virtual {p0, p1, v0, p2}, Lcom/vladsch/flexmark/util/sequence/BasedSequenceImpl;->countTrailing(Ljava/lang/CharSequence;II)I

    move-result p1

    return p1
.end method

.method public countTrailing(Ljava/lang/CharSequence;II)I
    .locals 2

    const/4 v0, 0x0

    if-gez p2, :cond_0

    const/4 p2, 0x0

    .line 757
    :cond_0
    invoke-virtual {p0}, Lcom/vladsch/flexmark/util/sequence/BasedSequenceImpl;->length()I

    move-result v1

    if-le p3, v1, :cond_1

    invoke-virtual {p0}, Lcom/vladsch/flexmark/util/sequence/BasedSequenceImpl;->length()I

    move-result p3

    :cond_1
    if-le p2, p3, :cond_2

    move p2, p3

    .line 759
    :cond_2
    invoke-virtual {p0, p1, p2, p3}, Lcom/vladsch/flexmark/util/sequence/BasedSequenceImpl;->lastIndexOfAnyNot(Ljava/lang/CharSequence;II)I

    move-result p1

    const/4 v1, -0x1

    if-ne p1, v1, :cond_3

    sub-int/2addr p3, p2

    return p3

    :cond_3
    if-gt p3, p1, :cond_4

    return v0

    :cond_4
    sub-int/2addr p3, p1

    add-int/lit8 p3, p3, -0x1

    return p3
.end method

.method public countTrailingNot()I
    .locals 3

    const/4 v0, 0x0

    .line 706
    invoke-virtual {p0}, Lcom/vladsch/flexmark/util/sequence/BasedSequenceImpl;->length()I

    move-result v1

    const-string v2, " \t"

    invoke-virtual {p0, v2, v0, v1}, Lcom/vladsch/flexmark/util/sequence/BasedSequenceImpl;->countTrailingNot(Ljava/lang/CharSequence;II)I

    move-result v0

    return v0
.end method

.method public countTrailingNot(C)I
    .locals 2

    const/4 v0, 0x0

    .line 660
    invoke-virtual {p0}, Lcom/vladsch/flexmark/util/sequence/BasedSequenceImpl;->length()I

    move-result v1

    invoke-virtual {p0, p1, v0, v1}, Lcom/vladsch/flexmark/util/sequence/BasedSequenceImpl;->countTrailingNot(CII)I

    move-result p1

    return p1
.end method

.method public countTrailingNot(CI)I
    .locals 1

    const/4 v0, 0x0

    .line 662
    invoke-virtual {p0, p1, v0, p2}, Lcom/vladsch/flexmark/util/sequence/BasedSequenceImpl;->countTrailingNot(CII)I

    move-result p1

    return p1
.end method

.method public countTrailingNot(CII)I
    .locals 1

    if-gez p2, :cond_0

    const/4 p2, 0x0

    .line 696
    :cond_0
    invoke-virtual {p0}, Lcom/vladsch/flexmark/util/sequence/BasedSequenceImpl;->length()I

    move-result v0

    if-le p3, v0, :cond_1

    invoke-virtual {p0}, Lcom/vladsch/flexmark/util/sequence/BasedSequenceImpl;->length()I

    move-result p3

    :cond_1
    if-le p2, p3, :cond_2

    move p2, p3

    .line 698
    :cond_2
    invoke-virtual {p0, p1, p2, p3}, Lcom/vladsch/flexmark/util/sequence/BasedSequenceImpl;->lastIndexOf(CII)I

    move-result p1

    const/4 v0, -0x1

    if-ne p1, v0, :cond_3

    sub-int/2addr p3, p2

    return p3

    :cond_3
    sub-int/2addr p3, p1

    add-int/lit8 p3, p3, -0x1

    return p3
.end method

.method public countTrailingNot(Ljava/lang/CharSequence;)I
    .locals 2

    const/4 v0, 0x0

    .line 714
    invoke-virtual {p0}, Lcom/vladsch/flexmark/util/sequence/BasedSequenceImpl;->length()I

    move-result v1

    invoke-virtual {p0, p1, v0, v1}, Lcom/vladsch/flexmark/util/sequence/BasedSequenceImpl;->countTrailingNot(Ljava/lang/CharSequence;II)I

    move-result p1

    return p1
.end method

.method public countTrailingNot(Ljava/lang/CharSequence;I)I
    .locals 1

    const/4 v0, 0x0

    .line 716
    invoke-virtual {p0, p1, v0, p2}, Lcom/vladsch/flexmark/util/sequence/BasedSequenceImpl;->countTrailingNot(Ljava/lang/CharSequence;II)I

    move-result p1

    return p1
.end method

.method public countTrailingNot(Ljava/lang/CharSequence;II)I
    .locals 2

    const/4 v0, 0x0

    if-gez p2, :cond_0

    const/4 p2, 0x0

    .line 775
    :cond_0
    invoke-virtual {p0}, Lcom/vladsch/flexmark/util/sequence/BasedSequenceImpl;->length()I

    move-result v1

    if-le p3, v1, :cond_1

    invoke-virtual {p0}, Lcom/vladsch/flexmark/util/sequence/BasedSequenceImpl;->length()I

    move-result p3

    :cond_1
    if-le p2, p3, :cond_2

    move p2, p3

    .line 777
    :cond_2
    invoke-virtual {p0, p1, p2, p3}, Lcom/vladsch/flexmark/util/sequence/BasedSequenceImpl;->lastIndexOfAny(Ljava/lang/CharSequence;II)I

    move-result p1

    const/4 v1, -0x1

    if-ne p1, v1, :cond_3

    sub-int/2addr p3, p2

    return p3

    :cond_3
    if-gt p3, p1, :cond_4

    return v0

    :cond_4
    sub-int/2addr p3, p1

    add-int/lit8 p3, p3, -0x1

    return p3
.end method

.method public endCharAt(I)C
    .locals 1

    if-ltz p1, :cond_1

    .line 86
    invoke-virtual {p0}, Lcom/vladsch/flexmark/util/sequence/BasedSequenceImpl;->length()I

    move-result v0

    if-lt p1, v0, :cond_0

    goto :goto_0

    .line 87
    :cond_0
    invoke-virtual {p0}, Lcom/vladsch/flexmark/util/sequence/BasedSequenceImpl;->length()I

    move-result v0

    sub-int/2addr v0, p1

    invoke-virtual {p0, v0}, Lcom/vladsch/flexmark/util/sequence/BasedSequenceImpl;->charAt(I)C

    move-result p1

    return p1

    :cond_1
    :goto_0
    const/4 p1, 0x0

    return p1
.end method

.method public endOfDelimitedBy(Ljava/lang/CharSequence;I)I
    .locals 1

    if-gez p2, :cond_0

    const/4 p2, 0x0

    goto :goto_0

    .line 566
    :cond_0
    invoke-virtual {p0}, Lcom/vladsch/flexmark/util/sequence/BasedSequenceImpl;->length()I

    move-result v0

    if-le p2, v0, :cond_1

    invoke-virtual {p0}, Lcom/vladsch/flexmark/util/sequence/BasedSequenceImpl;->length()I

    move-result p2

    .line 567
    :cond_1
    :goto_0
    invoke-virtual {p0, p1, p2}, Lcom/vladsch/flexmark/util/sequence/BasedSequenceImpl;->indexOf(Ljava/lang/CharSequence;I)I

    move-result p1

    const/4 p2, -0x1

    if-ne p1, p2, :cond_2

    .line 568
    invoke-virtual {p0}, Lcom/vladsch/flexmark/util/sequence/BasedSequenceImpl;->length()I

    move-result p1

    :cond_2
    return p1
.end method

.method public endOfDelimitedByAny(Ljava/lang/CharSequence;I)I
    .locals 1

    if-gez p2, :cond_0

    const/4 p2, 0x0

    goto :goto_0

    .line 574
    :cond_0
    invoke-virtual {p0}, Lcom/vladsch/flexmark/util/sequence/BasedSequenceImpl;->length()I

    move-result v0

    if-le p2, v0, :cond_1

    invoke-virtual {p0}, Lcom/vladsch/flexmark/util/sequence/BasedSequenceImpl;->length()I

    move-result p2

    .line 575
    :cond_1
    :goto_0
    invoke-virtual {p0, p1, p2}, Lcom/vladsch/flexmark/util/sequence/BasedSequenceImpl;->indexOfAny(Ljava/lang/CharSequence;I)I

    move-result p1

    const/4 p2, -0x1

    if-ne p1, p2, :cond_2

    .line 576
    invoke-virtual {p0}, Lcom/vladsch/flexmark/util/sequence/BasedSequenceImpl;->length()I

    move-result p1

    :cond_2
    return p1
.end method

.method public endOfDelimitedByAnyNot(Ljava/lang/CharSequence;I)I
    .locals 1

    if-gez p2, :cond_0

    const/4 p2, 0x0

    goto :goto_0

    .line 582
    :cond_0
    invoke-virtual {p0}, Lcom/vladsch/flexmark/util/sequence/BasedSequenceImpl;->length()I

    move-result v0

    if-le p2, v0, :cond_1

    invoke-virtual {p0}, Lcom/vladsch/flexmark/util/sequence/BasedSequenceImpl;->length()I

    move-result p2

    .line 583
    :cond_1
    :goto_0
    invoke-virtual {p0, p1, p2}, Lcom/vladsch/flexmark/util/sequence/BasedSequenceImpl;->indexOfAnyNot(Ljava/lang/CharSequence;I)I

    move-result p1

    const/4 p2, -0x1

    if-ne p1, p2, :cond_2

    .line 584
    invoke-virtual {p0}, Lcom/vladsch/flexmark/util/sequence/BasedSequenceImpl;->length()I

    move-result p1

    :cond_2
    return p1
.end method

.method public endOfLine(I)I
    .locals 1

    .line 589
    sget-object v0, Lcom/vladsch/flexmark/util/sequence/BasedSequenceImpl;->EOL:Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    invoke-virtual {p0, v0, p1}, Lcom/vladsch/flexmark/util/sequence/BasedSequenceImpl;->endOfDelimitedBy(Ljava/lang/CharSequence;I)I

    move-result p1

    return p1
.end method

.method public endOfLineAnyEOL(I)I
    .locals 1

    .line 594
    const-string v0, "\r\n"

    invoke-virtual {p0, v0, p1}, Lcom/vladsch/flexmark/util/sequence/BasedSequenceImpl;->endOfDelimitedByAny(Ljava/lang/CharSequence;I)I

    move-result p1

    return p1
.end method

.method public endSequence(I)Lcom/vladsch/flexmark/util/sequence/BasedSequence;
    .locals 1

    .line 74
    invoke-virtual {p0}, Lcom/vladsch/flexmark/util/sequence/BasedSequenceImpl;->length()I

    move-result v0

    if-gtz p1, :cond_0

    .line 76
    invoke-virtual {p0, v0, v0}, Lcom/vladsch/flexmark/util/sequence/BasedSequenceImpl;->subSequence(II)Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    move-result-object p1

    return-object p1

    :cond_0
    if-lt p1, v0, :cond_1

    return-object p0

    :cond_1
    sub-int p1, v0, p1

    .line 80
    invoke-virtual {p0, p1, v0}, Lcom/vladsch/flexmark/util/sequence/BasedSequenceImpl;->subSequence(II)Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    move-result-object p1

    return-object p1
.end method

.method public endSequence(II)Lcom/vladsch/flexmark/util/sequence/BasedSequence;
    .locals 2

    .line 54
    invoke-virtual {p0}, Lcom/vladsch/flexmark/util/sequence/BasedSequenceImpl;->length()I

    move-result v0

    sub-int p1, v0, p1

    sub-int p2, v0, p2

    const/4 v1, 0x0

    if-gez p1, :cond_0

    const/4 p1, 0x0

    goto :goto_0

    :cond_0
    if-le p1, v0, :cond_1

    move p1, v0

    :cond_1
    :goto_0
    if-gez p2, :cond_2

    const/4 p2, 0x0

    goto :goto_1

    :cond_2
    if-le p2, v0, :cond_3

    move p2, v0

    :cond_3
    :goto_1
    if-le p1, p2, :cond_4

    move p1, p2

    :cond_4
    if-nez p1, :cond_5

    if-ne p2, v0, :cond_5

    return-object p0

    .line 68
    :cond_5
    invoke-virtual {p0, p1, p2}, Lcom/vladsch/flexmark/util/sequence/BasedSequenceImpl;->subSequence(II)Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    move-result-object p1

    return-object p1
.end method

.method public endsWith(Ljava/lang/CharSequence;)Z
    .locals 3

    .line 1058
    invoke-virtual {p0}, Lcom/vladsch/flexmark/util/sequence/BasedSequenceImpl;->length()I

    move-result v0

    const/4 v1, 0x0

    if-lez v0, :cond_0

    invoke-virtual {p0}, Lcom/vladsch/flexmark/util/sequence/BasedSequenceImpl;->length()I

    move-result v0

    const/4 v2, 0x1

    sub-int/2addr v0, v2

    invoke-virtual {p0, p1, v0, v1}, Lcom/vladsch/flexmark/util/sequence/BasedSequenceImpl;->matchCharsReversed(Ljava/lang/CharSequence;IZ)Z

    move-result p1

    if-eqz p1, :cond_0

    return v2

    :cond_0
    return v1
.end method

.method public endsWith(Ljava/lang/CharSequence;Z)Z
    .locals 2

    .line 1118
    invoke-virtual {p0}, Lcom/vladsch/flexmark/util/sequence/BasedSequenceImpl;->length()I

    move-result v0

    if-lez v0, :cond_0

    invoke-virtual {p0}, Lcom/vladsch/flexmark/util/sequence/BasedSequenceImpl;->length()I

    move-result v0

    const/4 v1, 0x1

    sub-int/2addr v0, v1

    invoke-virtual {p0, p1, v0, p2}, Lcom/vladsch/flexmark/util/sequence/BasedSequenceImpl;->matchCharsReversed(Ljava/lang/CharSequence;IZ)Z

    move-result p1

    if-eqz p1, :cond_0

    return v1

    :cond_0
    const/4 p1, 0x0

    return p1
.end method

.method public endsWithIgnoreCase(Ljava/lang/CharSequence;)Z
    .locals 2

    .line 1088
    invoke-virtual {p0}, Lcom/vladsch/flexmark/util/sequence/BasedSequenceImpl;->length()I

    move-result v0

    if-lez v0, :cond_0

    invoke-virtual {p0}, Lcom/vladsch/flexmark/util/sequence/BasedSequenceImpl;->length()I

    move-result v0

    const/4 v1, 0x1

    sub-int/2addr v0, v1

    invoke-virtual {p0, p1, v0, v1}, Lcom/vladsch/flexmark/util/sequence/BasedSequenceImpl;->matchCharsReversed(Ljava/lang/CharSequence;IZ)Z

    move-result p1

    if-eqz p1, :cond_0

    return v1

    :cond_0
    const/4 p1, 0x0

    return p1
.end method

.method public eolLength()I
    .locals 5

    .line 895
    invoke-virtual {p0}, Lcom/vladsch/flexmark/util/sequence/BasedSequenceImpl;->length()I

    move-result v0

    add-int/lit8 v1, v0, -0x1

    if-ltz v1, :cond_1

    .line 898
    invoke-virtual {p0, v1}, Lcom/vladsch/flexmark/util/sequence/BasedSequenceImpl;->charAt(I)C

    move-result v2

    const/16 v3, 0xd

    const/16 v4, 0xa

    if-ne v2, v3, :cond_0

    add-int/lit8 v2, v0, -0x2

    if-ltz v2, :cond_2

    .line 902
    invoke-virtual {p0, v2}, Lcom/vladsch/flexmark/util/sequence/BasedSequenceImpl;->charAt(I)C

    move-result v3

    if-ne v3, v4, :cond_2

    add-int/lit8 v2, v0, -0x3

    goto :goto_0

    :cond_0
    if-ne v2, v4, :cond_1

    add-int/lit8 v2, v0, -0x2

    goto :goto_0

    :cond_1
    move v2, v1

    :cond_2
    :goto_0
    sub-int/2addr v1, v2

    return v1
.end method

.method public eolLength(I)I
    .locals 4

    .line 917
    invoke-virtual {p0}, Lcom/vladsch/flexmark/util/sequence/BasedSequenceImpl;->length()I

    move-result v0

    if-ltz p1, :cond_1

    if-ge p1, v0, :cond_1

    .line 919
    invoke-virtual {p0, p1}, Lcom/vladsch/flexmark/util/sequence/BasedSequenceImpl;->charAt(I)C

    move-result v1

    const/16 v2, 0xd

    const/16 v3, 0xa

    if-ne v1, v2, :cond_0

    add-int/lit8 v1, p1, 0x1

    if-ge v1, v0, :cond_2

    .line 923
    invoke-virtual {p0, v1}, Lcom/vladsch/flexmark/util/sequence/BasedSequenceImpl;->charAt(I)C

    move-result v0

    if-ne v0, v3, :cond_2

    add-int/lit8 v1, p1, 0x2

    goto :goto_0

    :cond_0
    if-ne v1, v3, :cond_1

    add-int/lit8 v1, p1, 0x1

    goto :goto_0

    :cond_1
    move v1, p1

    :cond_2
    :goto_0
    sub-int/2addr v1, p1

    return v1
.end method

.method public equals(Ljava/lang/Object;)Z
    .locals 3

    if-eq p0, p1, :cond_1

    const/4 v0, 0x0

    if-eqz p1, :cond_0

    .line 1682
    instance-of v1, p1, Ljava/lang/CharSequence;

    if-eqz v1, :cond_0

    check-cast p1, Ljava/lang/CharSequence;

    invoke-interface {p1}, Ljava/lang/CharSequence;->length()I

    move-result v1

    invoke-virtual {p0}, Lcom/vladsch/flexmark/util/sequence/BasedSequenceImpl;->length()I

    move-result v2

    if-ne v1, v2, :cond_0

    invoke-virtual {p0, p1, v0, v0}, Lcom/vladsch/flexmark/util/sequence/BasedSequenceImpl;->matchChars(Ljava/lang/CharSequence;IZ)Z

    move-result p1

    if-eqz p1, :cond_0

    goto :goto_0

    :cond_0
    return v0

    :cond_1
    :goto_0
    const/4 p1, 0x1

    return p1
.end method

.method public equals(Ljava/lang/Object;Z)Z
    .locals 3

    if-eq p0, p1, :cond_1

    const/4 v0, 0x0

    if-eqz p1, :cond_0

    .line 1692
    instance-of v1, p1, Ljava/lang/CharSequence;

    if-eqz v1, :cond_0

    check-cast p1, Ljava/lang/CharSequence;

    invoke-interface {p1}, Ljava/lang/CharSequence;->length()I

    move-result v1

    invoke-virtual {p0}, Lcom/vladsch/flexmark/util/sequence/BasedSequenceImpl;->length()I

    move-result v2

    if-ne v1, v2, :cond_0

    invoke-virtual {p0, p1, v0, p2}, Lcom/vladsch/flexmark/util/sequence/BasedSequenceImpl;->matchChars(Ljava/lang/CharSequence;IZ)Z

    move-result p1

    if-eqz p1, :cond_0

    goto :goto_0

    :cond_0
    return v0

    :cond_1
    :goto_0
    const/4 p1, 0x1

    return p1
.end method

.method public equalsIgnoreCase(Ljava/lang/CharSequence;)Z
    .locals 4

    const/4 v0, 0x1

    if-eq p0, p1, :cond_1

    const/4 v1, 0x0

    if-eqz p1, :cond_0

    .line 1687
    invoke-interface {p1}, Ljava/lang/CharSequence;->length()I

    move-result v2

    invoke-virtual {p0}, Lcom/vladsch/flexmark/util/sequence/BasedSequenceImpl;->length()I

    move-result v3

    if-ne v2, v3, :cond_0

    invoke-virtual {p0, p1, v1, v0}, Lcom/vladsch/flexmark/util/sequence/BasedSequenceImpl;->matchChars(Ljava/lang/CharSequence;IZ)Z

    move-result p1

    if-eqz p1, :cond_0

    goto :goto_0

    :cond_0
    return v1

    :cond_1
    :goto_0
    return v0
.end method

.method public firstChar()C
    .locals 2

    .line 141
    invoke-virtual {p0}, Lcom/vladsch/flexmark/util/sequence/BasedSequenceImpl;->isEmpty()Z

    move-result v0

    const/4 v1, 0x0

    if-eqz v0, :cond_0

    return v1

    :cond_0
    invoke-virtual {p0, v1}, Lcom/vladsch/flexmark/util/sequence/BasedSequenceImpl;->charAt(I)C

    move-result v0

    return v0
.end method

.method public getColumnAtIndex(I)I
    .locals 2

    .line 1645
    const-string v0, "\r\n"

    invoke-virtual {p0, v0, p1}, Lcom/vladsch/flexmark/util/sequence/BasedSequenceImpl;->lastIndexOfAny(Ljava/lang/CharSequence;I)I

    move-result v0

    const/4 v1, -0x1

    if-ne v0, v1, :cond_0

    const/4 v0, 0x0

    goto :goto_0

    .line 1646
    :cond_0
    invoke-virtual {p0, v0}, Lcom/vladsch/flexmark/util/sequence/BasedSequenceImpl;->eolLength(I)I

    move-result v1

    add-int/2addr v0, v1

    :goto_0
    sub-int/2addr p1, v0

    return p1
.end method

.method public getIndexRange(II)Lcom/vladsch/flexmark/util/sequence/Range;
    .locals 4

    .line 45
    invoke-virtual {p0}, Lcom/vladsch/flexmark/util/sequence/BasedSequenceImpl;->getStartOffset()I

    move-result v0

    .line 46
    invoke-virtual {p0}, Lcom/vladsch/flexmark/util/sequence/BasedSequenceImpl;->getEndOffset()I

    move-result v1

    if-gt p1, v1, :cond_0

    if-lt p2, v0, :cond_0

    sub-int/2addr p1, v0

    sub-int/2addr p2, v0

    .line 49
    invoke-static {p1, p2}, Lcom/vladsch/flexmark/util/sequence/Range;->of(II)Lcom/vladsch/flexmark/util/sequence/Range;

    move-result-object p1

    return-object p1

    .line 47
    :cond_0
    new-instance v1, Ljava/lang/IllegalArgumentException;

    new-instance v2, Ljava/lang/StringBuilder;

    const-string v3, "getIndexRange("

    invoke-direct {v2, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v2, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string p1, ", "

    invoke-virtual {v2, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2, p2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string p2, ") not in range ["

    invoke-virtual {v2, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v2, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p0}, Lcom/vladsch/flexmark/util/sequence/BasedSequenceImpl;->getEndOffset()I

    move-result p1

    invoke-virtual {v2, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string p1, "]"

    invoke-virtual {v2, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-direct {v1, p1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v1
.end method

.method public getLineColumnAtIndex(I)Lcom/vladsch/flexmark/util/Pair;
    .locals 7
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(I)",
            "Lcom/vladsch/flexmark/util/Pair<",
            "Ljava/lang/Integer;",
            "Ljava/lang/Integer;",
            ">;"
        }
    .end annotation

    .line 1651
    invoke-virtual {p0}, Lcom/vladsch/flexmark/util/sequence/BasedSequenceImpl;->length()I

    move-result v0

    if-ltz p1, :cond_4

    if-gt p1, v0, :cond_4

    const/4 v0, 0x0

    const/4 v1, 0x0

    const/4 v2, 0x0

    const/4 v3, 0x0

    const/4 v4, 0x0

    :goto_0
    if-ge v1, p1, :cond_3

    .line 1661
    invoke-virtual {p0, v1}, Lcom/vladsch/flexmark/util/sequence/BasedSequenceImpl;->charAt(I)C

    move-result v5

    const/16 v6, 0xd

    if-ne v5, v6, :cond_0

    add-int/lit8 v2, v2, 0x1

    const/4 v4, 0x1

    const/4 v3, 0x0

    goto :goto_1

    :cond_0
    const/16 v6, 0xa

    if-ne v5, v6, :cond_2

    if-nez v4, :cond_1

    add-int/lit8 v2, v2, 0x1

    :cond_1
    const/4 v3, 0x0

    const/4 v4, 0x0

    goto :goto_1

    :cond_2
    add-int/lit8 v3, v3, 0x1

    :goto_1
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    .line 1677
    :cond_3
    new-instance p1, Lcom/vladsch/flexmark/util/Pair;

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    invoke-direct {p1, v0, v1}, Lcom/vladsch/flexmark/util/Pair;-><init>(Ljava/lang/Object;Ljava/lang/Object;)V

    return-object p1

    .line 1653
    :cond_4
    new-instance v1, Ljava/lang/IllegalArgumentException;

    new-instance v2, Ljava/lang/StringBuilder;

    const-string v3, "Index: "

    invoke-direct {v2, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v2, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string p1, " out of range [0, "

    invoke-virtual {v2, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string p1, "]"

    invoke-virtual {v2, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-direct {v1, p1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v1
.end method

.method public ifNull(Lcom/vladsch/flexmark/util/sequence/BasedSequence;)Lcom/vladsch/flexmark/util/sequence/BasedSequence;
    .locals 1

    .line 960
    invoke-virtual {p0}, Lcom/vladsch/flexmark/util/sequence/BasedSequenceImpl;->isNull()Z

    move-result v0

    if-eqz v0, :cond_0

    return-object p1

    :cond_0
    return-object p0
.end method

.method public ifNullEmptyAfter(Lcom/vladsch/flexmark/util/sequence/BasedSequence;)Lcom/vladsch/flexmark/util/sequence/BasedSequence;
    .locals 2

    .line 965
    invoke-virtual {p0}, Lcom/vladsch/flexmark/util/sequence/BasedSequenceImpl;->isNull()Z

    move-result v0

    if-eqz v0, :cond_0

    invoke-interface {p1}, Lcom/vladsch/flexmark/util/sequence/BasedSequence;->length()I

    move-result v0

    invoke-interface {p1}, Lcom/vladsch/flexmark/util/sequence/BasedSequence;->length()I

    move-result v1

    invoke-interface {p1, v0, v1}, Lcom/vladsch/flexmark/util/sequence/BasedSequence;->subSequence(II)Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    move-result-object p1

    return-object p1

    :cond_0
    return-object p0
.end method

.method public ifNullEmptyBefore(Lcom/vladsch/flexmark/util/sequence/BasedSequence;)Lcom/vladsch/flexmark/util/sequence/BasedSequence;
    .locals 1

    .line 970
    invoke-virtual {p0}, Lcom/vladsch/flexmark/util/sequence/BasedSequenceImpl;->isNull()Z

    move-result v0

    if-eqz v0, :cond_0

    const/4 v0, 0x0

    invoke-interface {p1, v0, v0}, Lcom/vladsch/flexmark/util/sequence/BasedSequence;->subSequence(II)Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    move-result-object p1

    return-object p1

    :cond_0
    return-object p0
.end method

.method public indexOf(C)I
    .locals 2

    const/4 v0, 0x0

    .line 170
    invoke-virtual {p0}, Lcom/vladsch/flexmark/util/sequence/BasedSequenceImpl;->length()I

    move-result v1

    invoke-virtual {p0, p1, v0, v1}, Lcom/vladsch/flexmark/util/sequence/BasedSequenceImpl;->indexOf(CII)I

    move-result p1

    return p1
.end method

.method public indexOf(CI)I
    .locals 1

    .line 174
    invoke-virtual {p0}, Lcom/vladsch/flexmark/util/sequence/BasedSequenceImpl;->length()I

    move-result v0

    invoke-virtual {p0, p1, p2, v0}, Lcom/vladsch/flexmark/util/sequence/BasedSequenceImpl;->indexOf(CII)I

    move-result p1

    return p1
.end method

.method public indexOf(CII)I
    .locals 1

    if-gez p2, :cond_0

    const/4 p2, 0x0

    .line 183
    :cond_0
    invoke-virtual {p0}, Lcom/vladsch/flexmark/util/sequence/BasedSequenceImpl;->length()I

    move-result v0

    if-le p3, v0, :cond_1

    invoke-virtual {p0}, Lcom/vladsch/flexmark/util/sequence/BasedSequenceImpl;->length()I

    move-result p3

    :cond_1
    :goto_0
    if-ge p2, p3, :cond_3

    .line 185
    invoke-virtual {p0, p2}, Lcom/vladsch/flexmark/util/sequence/BasedSequenceImpl;->charAt(I)C

    move-result v0

    if-ne v0, p1, :cond_2

    return p2

    :cond_2
    add-int/lit8 p2, p2, 0x1

    goto :goto_0

    :cond_3
    const/4 p1, -0x1

    return p1
.end method

.method public indexOf(Ljava/lang/CharSequence;)I
    .locals 2

    const/4 v0, 0x0

    .line 145
    invoke-virtual {p0}, Lcom/vladsch/flexmark/util/sequence/BasedSequenceImpl;->length()I

    move-result v1

    invoke-virtual {p0, p1, v0, v1}, Lcom/vladsch/flexmark/util/sequence/BasedSequenceImpl;->indexOf(Ljava/lang/CharSequence;II)I

    move-result p1

    return p1
.end method

.method public indexOf(Ljava/lang/CharSequence;I)I
    .locals 1

    .line 146
    invoke-virtual {p0}, Lcom/vladsch/flexmark/util/sequence/BasedSequenceImpl;->length()I

    move-result v0

    invoke-virtual {p0, p1, p2, v0}, Lcom/vladsch/flexmark/util/sequence/BasedSequenceImpl;->indexOf(Ljava/lang/CharSequence;II)I

    move-result p1

    return p1
.end method

.method public indexOf(Ljava/lang/CharSequence;II)I
    .locals 3

    .line 151
    invoke-interface {p1}, Ljava/lang/CharSequence;->length()I

    move-result v0

    if-nez v0, :cond_0

    return p2

    .line 153
    :cond_0
    invoke-virtual {p0}, Lcom/vladsch/flexmark/util/sequence/BasedSequenceImpl;->length()I

    move-result v1

    if-le p3, v1, :cond_1

    invoke-virtual {p0}, Lcom/vladsch/flexmark/util/sequence/BasedSequenceImpl;->length()I

    move-result p3

    :cond_1
    if-ge p2, p3, :cond_5

    const/4 v1, 0x0

    .line 155
    invoke-interface {p1, v1}, Ljava/lang/CharSequence;->charAt(I)C

    move-result v1

    .line 159
    :cond_2
    invoke-virtual {p0, v1, p2}, Lcom/vladsch/flexmark/util/sequence/BasedSequenceImpl;->indexOf(CI)I

    move-result p2

    if-ltz p2, :cond_5

    add-int v2, p2, v0

    if-le v2, p3, :cond_3

    goto :goto_0

    .line 161
    :cond_3
    invoke-virtual {p0, p1, p2}, Lcom/vladsch/flexmark/util/sequence/BasedSequenceImpl;->matchChars(Ljava/lang/CharSequence;I)Z

    move-result v2

    if-eqz v2, :cond_4

    return p2

    :cond_4
    add-int/lit8 p2, p2, 0x1

    add-int v2, p2, v0

    if-lt v2, p3, :cond_2

    :cond_5
    :goto_0
    const/4 p1, -0x1

    return p1
.end method

.method public indexOfAll(Ljava/lang/CharSequence;)[I
    .locals 7

    .line 1585
    invoke-interface {p1}, Ljava/lang/CharSequence;->length()I

    move-result v0

    if-nez v0, :cond_0

    .line 1586
    sget-object p1, Lcom/vladsch/flexmark/util/sequence/BasedSequenceImpl;->EMPTY_INDICES:[I

    return-object p1

    .line 1587
    :cond_0
    invoke-virtual {p0, p1}, Lcom/vladsch/flexmark/util/sequence/BasedSequenceImpl;->indexOf(Ljava/lang/CharSequence;)I

    move-result v1

    const/4 v2, -0x1

    if-ne v1, v2, :cond_1

    .line 1588
    sget-object p1, Lcom/vladsch/flexmark/util/sequence/BasedSequenceImpl;->EMPTY_INDICES:[I

    return-object p1

    :cond_1
    const/16 v3, 0x20

    .line 1591
    new-array v4, v3, [I

    const/4 v5, 0x0

    .line 1592
    aput v1, v4, v5

    const/4 v5, 0x1

    :goto_0
    add-int/2addr v1, v0

    .line 1595
    invoke-virtual {p0, p1, v1}, Lcom/vladsch/flexmark/util/sequence/BasedSequenceImpl;->indexOf(Ljava/lang/CharSequence;I)I

    move-result v1

    if-ne v1, v2, :cond_2

    .line 1600
    invoke-static {v4, v5}, Lcom/vladsch/flexmark/util/sequence/BasedSequenceImpl;->truncateTo([II)[I

    move-result-object p1

    return-object p1

    .line 1597
    :cond_2
    array-length v6, v4

    if-ge v6, v5, :cond_3

    invoke-static {v4, v5, v3}, Lcom/vladsch/flexmark/util/sequence/BasedSequenceImpl;->expandTo([III)[I

    move-result-object v4

    :cond_3
    add-int/lit8 v6, v5, 0x1

    .line 1598
    aput v1, v4, v5

    move v5, v6

    goto :goto_0
.end method

.method public indexOfAny(CC)I
    .locals 2

    const/4 v0, 0x0

    .line 171
    invoke-virtual {p0}, Lcom/vladsch/flexmark/util/sequence/BasedSequenceImpl;->length()I

    move-result v1

    invoke-virtual {p0, p1, p2, v0, v1}, Lcom/vladsch/flexmark/util/sequence/BasedSequenceImpl;->indexOfAny(CCII)I

    move-result p1

    return p1
.end method

.method public indexOfAny(CCC)I
    .locals 6

    const/4 v4, 0x0

    .line 172
    invoke-virtual {p0}, Lcom/vladsch/flexmark/util/sequence/BasedSequenceImpl;->length()I

    move-result v5

    move-object v0, p0

    move v1, p1

    move v2, p2

    move v3, p3

    invoke-virtual/range {v0 .. v5}, Lcom/vladsch/flexmark/util/sequence/BasedSequenceImpl;->indexOfAny(CCCII)I

    move-result p1

    return p1
.end method

.method public indexOfAny(CCCI)I
    .locals 6

    .line 176
    invoke-virtual {p0}, Lcom/vladsch/flexmark/util/sequence/BasedSequenceImpl;->length()I

    move-result v5

    move-object v0, p0

    move v1, p1

    move v2, p2

    move v3, p3

    move v4, p4

    invoke-virtual/range {v0 .. v5}, Lcom/vladsch/flexmark/util/sequence/BasedSequenceImpl;->indexOfAny(CCCII)I

    move-result p1

    return p1
.end method

.method public indexOfAny(CCCII)I
    .locals 1

    if-gez p4, :cond_0

    const/4 p4, 0x0

    .line 204
    :cond_0
    invoke-virtual {p0}, Lcom/vladsch/flexmark/util/sequence/BasedSequenceImpl;->length()I

    move-result v0

    if-le p5, v0, :cond_1

    invoke-virtual {p0}, Lcom/vladsch/flexmark/util/sequence/BasedSequenceImpl;->length()I

    move-result p5

    :cond_1
    :goto_0
    if-ge p4, p5, :cond_4

    .line 206
    invoke-virtual {p0, p4}, Lcom/vladsch/flexmark/util/sequence/BasedSequenceImpl;->charAt(I)C

    move-result v0

    if-eq v0, p1, :cond_3

    if-eq v0, p2, :cond_3

    if-ne v0, p3, :cond_2

    goto :goto_1

    :cond_2
    add-int/lit8 p4, p4, 0x1

    goto :goto_0

    :cond_3
    :goto_1
    return p4

    :cond_4
    const/4 p1, -0x1

    return p1
.end method

.method public indexOfAny(CCI)I
    .locals 1

    .line 175
    invoke-virtual {p0}, Lcom/vladsch/flexmark/util/sequence/BasedSequenceImpl;->length()I

    move-result v0

    invoke-virtual {p0, p1, p2, p3, v0}, Lcom/vladsch/flexmark/util/sequence/BasedSequenceImpl;->indexOfAny(CCII)I

    move-result p1

    return p1
.end method

.method public indexOfAny(CCII)I
    .locals 1

    if-gez p3, :cond_0

    const/4 p3, 0x0

    .line 193
    :cond_0
    invoke-virtual {p0}, Lcom/vladsch/flexmark/util/sequence/BasedSequenceImpl;->length()I

    move-result v0

    if-le p4, v0, :cond_1

    invoke-virtual {p0}, Lcom/vladsch/flexmark/util/sequence/BasedSequenceImpl;->length()I

    move-result p4

    :cond_1
    :goto_0
    if-ge p3, p4, :cond_4

    .line 195
    invoke-virtual {p0, p3}, Lcom/vladsch/flexmark/util/sequence/BasedSequenceImpl;->charAt(I)C

    move-result v0

    if-eq v0, p1, :cond_3

    if-ne v0, p2, :cond_2

    goto :goto_1

    :cond_2
    add-int/lit8 p3, p3, 0x1

    goto :goto_0

    :cond_3
    :goto_1
    return p3

    :cond_4
    const/4 p1, -0x1

    return p1
.end method

.method public indexOfAny(Ljava/lang/CharSequence;)I
    .locals 2

    const/4 v0, 0x0

    .line 173
    invoke-virtual {p0}, Lcom/vladsch/flexmark/util/sequence/BasedSequenceImpl;->length()I

    move-result v1

    invoke-virtual {p0, p1, v0, v1}, Lcom/vladsch/flexmark/util/sequence/BasedSequenceImpl;->indexOfAny(Ljava/lang/CharSequence;II)I

    move-result p1

    return p1
.end method

.method public indexOfAny(Ljava/lang/CharSequence;I)I
    .locals 1

    .line 177
    invoke-virtual {p0}, Lcom/vladsch/flexmark/util/sequence/BasedSequenceImpl;->length()I

    move-result v0

    invoke-virtual {p0, p1, p2, v0}, Lcom/vladsch/flexmark/util/sequence/BasedSequenceImpl;->indexOfAny(Ljava/lang/CharSequence;II)I

    move-result p1

    return p1
.end method

.method public indexOfAny(Ljava/lang/CharSequence;II)I
    .locals 6

    .line 214
    invoke-interface {p1}, Ljava/lang/CharSequence;->length()I

    move-result v0

    if-eqz v0, :cond_7

    const/4 v1, 0x0

    const/4 v2, 0x1

    if-eq v0, v2, :cond_6

    const/4 v3, 0x2

    if-eq v0, v3, :cond_5

    const/4 v4, 0x3

    if-eq v0, v4, :cond_4

    .line 225
    invoke-static {p1}, Lcom/vladsch/flexmark/util/sequence/BasedSequenceImpl;->of(Ljava/lang/CharSequence;)Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    move-result-object p1

    if-gez p2, :cond_0

    const/4 p2, 0x0

    .line 227
    :cond_0
    invoke-virtual {p0}, Lcom/vladsch/flexmark/util/sequence/BasedSequenceImpl;->length()I

    move-result v0

    if-le p3, v0, :cond_1

    invoke-virtual {p0}, Lcom/vladsch/flexmark/util/sequence/BasedSequenceImpl;->length()I

    move-result p3

    :cond_1
    :goto_0
    const/4 v0, -0x1

    if-ge p2, p3, :cond_3

    .line 229
    invoke-virtual {p0, p2}, Lcom/vladsch/flexmark/util/sequence/BasedSequenceImpl;->charAt(I)C

    move-result v1

    .line 230
    invoke-interface {p1, v1}, Lcom/vladsch/flexmark/util/sequence/BasedSequence;->indexOf(C)I

    move-result v1

    if-eq v1, v0, :cond_2

    return p2

    :cond_2
    add-int/lit8 p2, p2, 0x1

    goto :goto_0

    :cond_3
    return v0

    .line 222
    :cond_4
    invoke-interface {p1, v1}, Ljava/lang/CharSequence;->charAt(I)C

    move-result v1

    invoke-interface {p1, v2}, Ljava/lang/CharSequence;->charAt(I)C

    move-result v2

    invoke-interface {p1, v3}, Ljava/lang/CharSequence;->charAt(I)C

    move-result v3

    move-object v0, p0

    move v4, p2

    move v5, p3

    invoke-virtual/range {v0 .. v5}, Lcom/vladsch/flexmark/util/sequence/BasedSequenceImpl;->indexOfAny(CCCII)I

    move-result p1

    return p1

    :cond_5
    move-object v0, p0

    move v4, p2

    move v5, p3

    .line 220
    invoke-interface {p1, v1}, Ljava/lang/CharSequence;->charAt(I)C

    move-result p2

    invoke-interface {p1, v2}, Ljava/lang/CharSequence;->charAt(I)C

    move-result p1

    invoke-virtual {p0, p2, p1, v4, v5}, Lcom/vladsch/flexmark/util/sequence/BasedSequenceImpl;->indexOfAny(CCII)I

    move-result p1

    return p1

    :cond_6
    move-object v0, p0

    move v4, p2

    move v5, p3

    .line 218
    invoke-interface {p1, v1}, Ljava/lang/CharSequence;->charAt(I)C

    move-result p1

    invoke-virtual {p0, p1, v4, v5}, Lcom/vladsch/flexmark/util/sequence/BasedSequenceImpl;->indexOf(CII)I

    move-result p1

    return p1

    :cond_7
    move-object v0, p0

    move v4, p2

    return v4
.end method

.method public indexOfAnyNot(CC)I
    .locals 2

    const/4 v0, 0x0

    .line 238
    invoke-virtual {p0}, Lcom/vladsch/flexmark/util/sequence/BasedSequenceImpl;->length()I

    move-result v1

    invoke-virtual {p0, p1, p2, v0, v1}, Lcom/vladsch/flexmark/util/sequence/BasedSequenceImpl;->indexOfAnyNot(CCII)I

    move-result p1

    return p1
.end method

.method public indexOfAnyNot(CCC)I
    .locals 6

    const/4 v4, 0x0

    .line 239
    invoke-virtual {p0}, Lcom/vladsch/flexmark/util/sequence/BasedSequenceImpl;->length()I

    move-result v5

    move-object v0, p0

    move v1, p1

    move v2, p2

    move v3, p3

    invoke-virtual/range {v0 .. v5}, Lcom/vladsch/flexmark/util/sequence/BasedSequenceImpl;->indexOfAnyNot(CCCII)I

    move-result p1

    return p1
.end method

.method public indexOfAnyNot(CCCI)I
    .locals 6

    .line 243
    invoke-virtual {p0}, Lcom/vladsch/flexmark/util/sequence/BasedSequenceImpl;->length()I

    move-result v5

    move-object v0, p0

    move v1, p1

    move v2, p2

    move v3, p3

    move v4, p4

    invoke-virtual/range {v0 .. v5}, Lcom/vladsch/flexmark/util/sequence/BasedSequenceImpl;->indexOfAnyNot(CCCII)I

    move-result p1

    return p1
.end method

.method public indexOfAnyNot(CCCII)I
    .locals 1

    if-gez p4, :cond_0

    const/4 p4, 0x0

    .line 271
    :cond_0
    invoke-virtual {p0}, Lcom/vladsch/flexmark/util/sequence/BasedSequenceImpl;->length()I

    move-result v0

    if-le p5, v0, :cond_1

    invoke-virtual {p0}, Lcom/vladsch/flexmark/util/sequence/BasedSequenceImpl;->length()I

    move-result p5

    :cond_1
    :goto_0
    if-ge p4, p5, :cond_3

    .line 273
    invoke-virtual {p0, p4}, Lcom/vladsch/flexmark/util/sequence/BasedSequenceImpl;->charAt(I)C

    move-result v0

    if-eq v0, p1, :cond_2

    if-eq v0, p2, :cond_2

    if-eq v0, p3, :cond_2

    return p4

    :cond_2
    add-int/lit8 p4, p4, 0x1

    goto :goto_0

    :cond_3
    const/4 p1, -0x1

    return p1
.end method

.method public indexOfAnyNot(CCI)I
    .locals 1

    .line 242
    invoke-virtual {p0}, Lcom/vladsch/flexmark/util/sequence/BasedSequenceImpl;->length()I

    move-result v0

    invoke-virtual {p0, p1, p2, p3, v0}, Lcom/vladsch/flexmark/util/sequence/BasedSequenceImpl;->indexOfAnyNot(CCII)I

    move-result p1

    return p1
.end method

.method public indexOfAnyNot(CCII)I
    .locals 1

    if-gez p3, :cond_0

    const/4 p3, 0x0

    .line 260
    :cond_0
    invoke-virtual {p0}, Lcom/vladsch/flexmark/util/sequence/BasedSequenceImpl;->length()I

    move-result v0

    if-le p4, v0, :cond_1

    invoke-virtual {p0}, Lcom/vladsch/flexmark/util/sequence/BasedSequenceImpl;->length()I

    move-result p4

    :cond_1
    :goto_0
    if-ge p3, p4, :cond_3

    .line 262
    invoke-virtual {p0, p3}, Lcom/vladsch/flexmark/util/sequence/BasedSequenceImpl;->charAt(I)C

    move-result v0

    if-eq v0, p1, :cond_2

    if-eq v0, p2, :cond_2

    return p3

    :cond_2
    add-int/lit8 p3, p3, 0x1

    goto :goto_0

    :cond_3
    const/4 p1, -0x1

    return p1
.end method

.method public indexOfAnyNot(Ljava/lang/CharSequence;)I
    .locals 2

    const/4 v0, 0x0

    .line 240
    invoke-virtual {p0}, Lcom/vladsch/flexmark/util/sequence/BasedSequenceImpl;->length()I

    move-result v1

    invoke-virtual {p0, p1, v0, v1}, Lcom/vladsch/flexmark/util/sequence/BasedSequenceImpl;->indexOfAnyNot(Ljava/lang/CharSequence;II)I

    move-result p1

    return p1
.end method

.method public indexOfAnyNot(Ljava/lang/CharSequence;I)I
    .locals 1

    .line 244
    invoke-virtual {p0}, Lcom/vladsch/flexmark/util/sequence/BasedSequenceImpl;->length()I

    move-result v0

    invoke-virtual {p0, p1, p2, v0}, Lcom/vladsch/flexmark/util/sequence/BasedSequenceImpl;->indexOfAnyNot(Ljava/lang/CharSequence;II)I

    move-result p1

    return p1
.end method

.method public indexOfAnyNot(Ljava/lang/CharSequence;II)I
    .locals 6

    .line 281
    invoke-interface {p1}, Ljava/lang/CharSequence;->length()I

    move-result v0

    if-eqz v0, :cond_7

    const/4 v1, 0x0

    const/4 v2, 0x1

    if-eq v0, v2, :cond_6

    const/4 v3, 0x2

    if-eq v0, v3, :cond_5

    const/4 v4, 0x3

    if-eq v0, v4, :cond_4

    .line 292
    invoke-static {p1}, Lcom/vladsch/flexmark/util/sequence/BasedSequenceImpl;->of(Ljava/lang/CharSequence;)Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    move-result-object p1

    if-gez p2, :cond_0

    const/4 p2, 0x0

    .line 294
    :cond_0
    invoke-virtual {p0}, Lcom/vladsch/flexmark/util/sequence/BasedSequenceImpl;->length()I

    move-result v0

    if-le p3, v0, :cond_1

    invoke-virtual {p0}, Lcom/vladsch/flexmark/util/sequence/BasedSequenceImpl;->length()I

    move-result p3

    :cond_1
    :goto_0
    const/4 v0, -0x1

    if-ge p2, p3, :cond_3

    .line 296
    invoke-virtual {p0, p2}, Lcom/vladsch/flexmark/util/sequence/BasedSequenceImpl;->charAt(I)C

    move-result v1

    .line 297
    invoke-interface {p1, v1}, Lcom/vladsch/flexmark/util/sequence/BasedSequence;->indexOf(C)I

    move-result v1

    if-ne v1, v0, :cond_2

    return p2

    :cond_2
    add-int/lit8 p2, p2, 0x1

    goto :goto_0

    :cond_3
    return v0

    .line 289
    :cond_4
    invoke-interface {p1, v1}, Ljava/lang/CharSequence;->charAt(I)C

    move-result v1

    invoke-interface {p1, v2}, Ljava/lang/CharSequence;->charAt(I)C

    move-result v2

    invoke-interface {p1, v3}, Ljava/lang/CharSequence;->charAt(I)C

    move-result v3

    move-object v0, p0

    move v4, p2

    move v5, p3

    invoke-virtual/range {v0 .. v5}, Lcom/vladsch/flexmark/util/sequence/BasedSequenceImpl;->indexOfAnyNot(CCCII)I

    move-result p1

    return p1

    :cond_5
    move-object v0, p0

    move v4, p2

    move v5, p3

    .line 287
    invoke-interface {p1, v1}, Ljava/lang/CharSequence;->charAt(I)C

    move-result p2

    invoke-interface {p1, v2}, Ljava/lang/CharSequence;->charAt(I)C

    move-result p1

    invoke-virtual {p0, p2, p1, v4, v5}, Lcom/vladsch/flexmark/util/sequence/BasedSequenceImpl;->indexOfAnyNot(CCII)I

    move-result p1

    return p1

    :cond_6
    move-object v0, p0

    move v4, p2

    move v5, p3

    .line 285
    invoke-interface {p1, v1}, Ljava/lang/CharSequence;->charAt(I)C

    move-result p1

    invoke-virtual {p0, p1, v4, v5}, Lcom/vladsch/flexmark/util/sequence/BasedSequenceImpl;->indexOfNot(CII)I

    move-result p1

    return p1

    :cond_7
    move-object v0, p0

    move v4, p2

    return v4
.end method

.method public indexOfNot(C)I
    .locals 2

    const/4 v0, 0x0

    .line 237
    invoke-virtual {p0}, Lcom/vladsch/flexmark/util/sequence/BasedSequenceImpl;->length()I

    move-result v1

    invoke-virtual {p0, p1, v0, v1}, Lcom/vladsch/flexmark/util/sequence/BasedSequenceImpl;->indexOfNot(CII)I

    move-result p1

    return p1
.end method

.method public indexOfNot(CI)I
    .locals 1

    .line 241
    invoke-virtual {p0}, Lcom/vladsch/flexmark/util/sequence/BasedSequenceImpl;->length()I

    move-result v0

    invoke-virtual {p0, p1, p2, v0}, Lcom/vladsch/flexmark/util/sequence/BasedSequenceImpl;->indexOfNot(CII)I

    move-result p1

    return p1
.end method

.method public indexOfNot(CII)I
    .locals 1

    if-gez p2, :cond_0

    const/4 p2, 0x0

    .line 250
    :cond_0
    invoke-virtual {p0}, Lcom/vladsch/flexmark/util/sequence/BasedSequenceImpl;->length()I

    move-result v0

    if-le p3, v0, :cond_1

    invoke-virtual {p0}, Lcom/vladsch/flexmark/util/sequence/BasedSequenceImpl;->length()I

    move-result p3

    :cond_1
    :goto_0
    if-ge p2, p3, :cond_3

    .line 252
    invoke-virtual {p0, p2}, Lcom/vladsch/flexmark/util/sequence/BasedSequenceImpl;->charAt(I)C

    move-result v0

    if-eq v0, p1, :cond_2

    return p2

    :cond_2
    add-int/lit8 p2, p2, 0x1

    goto :goto_0

    :cond_3
    const/4 p1, -0x1

    return p1
.end method

.method public intersect(Lcom/vladsch/flexmark/util/sequence/BasedSequence;)Lcom/vladsch/flexmark/util/sequence/BasedSequence;
    .locals 2

    .line 1403
    invoke-virtual {p0}, Lcom/vladsch/flexmark/util/sequence/BasedSequenceImpl;->getBase()Ljava/lang/Object;

    move-result-object v0

    invoke-interface {p1}, Lcom/vladsch/flexmark/util/sequence/BasedSequence;->getBase()Ljava/lang/Object;

    move-result-object v1

    if-eq v0, v1, :cond_0

    sget-object p1, Lcom/vladsch/flexmark/util/sequence/SubSequence;->NULL:Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    return-object p1

    .line 1404
    :cond_0
    invoke-interface {p1}, Lcom/vladsch/flexmark/util/sequence/BasedSequence;->getEndOffset()I

    move-result v0

    invoke-virtual {p0}, Lcom/vladsch/flexmark/util/sequence/BasedSequenceImpl;->getStartOffset()I

    move-result v1

    if-gt v0, v1, :cond_1

    const/4 p1, 0x0

    invoke-virtual {p0, p1, p1}, Lcom/vladsch/flexmark/util/sequence/BasedSequenceImpl;->subSequence(II)Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    move-result-object p1

    return-object p1

    .line 1405
    :cond_1
    invoke-interface {p1}, Lcom/vladsch/flexmark/util/sequence/BasedSequence;->getStartOffset()I

    move-result v0

    invoke-virtual {p0}, Lcom/vladsch/flexmark/util/sequence/BasedSequenceImpl;->getEndOffset()I

    move-result v1

    if-lt v0, v1, :cond_2

    invoke-virtual {p0}, Lcom/vladsch/flexmark/util/sequence/BasedSequenceImpl;->length()I

    move-result p1

    invoke-virtual {p0}, Lcom/vladsch/flexmark/util/sequence/BasedSequenceImpl;->length()I

    move-result v0

    invoke-virtual {p0, p1, v0}, Lcom/vladsch/flexmark/util/sequence/BasedSequenceImpl;->subSequence(II)Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    move-result-object p1

    return-object p1

    .line 1406
    :cond_2
    invoke-virtual {p0}, Lcom/vladsch/flexmark/util/sequence/BasedSequenceImpl;->getStartOffset()I

    move-result v0

    invoke-interface {p1}, Lcom/vladsch/flexmark/util/sequence/BasedSequence;->getStartOffset()I

    move-result v1

    filled-new-array {v1}, [I

    move-result-object v1

    invoke-static {v0, v1}, Lcom/vladsch/flexmark/util/Utils;->max(I[I)I

    move-result v0

    invoke-virtual {p0}, Lcom/vladsch/flexmark/util/sequence/BasedSequenceImpl;->getEndOffset()I

    move-result v1

    invoke-interface {p1}, Lcom/vladsch/flexmark/util/sequence/BasedSequence;->getEndOffset()I

    move-result p1

    filled-new-array {p1}, [I

    move-result-object p1

    invoke-static {v1, p1}, Lcom/vladsch/flexmark/util/Utils;->min(I[I)I

    move-result p1

    invoke-virtual {p0, v0, p1}, Lcom/vladsch/flexmark/util/sequence/BasedSequenceImpl;->baseSubSequence(II)Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    move-result-object p1

    return-object p1
.end method

.method public isBlank()Z
    .locals 3

    .line 1043
    invoke-virtual {p0}, Lcom/vladsch/flexmark/util/sequence/BasedSequenceImpl;->isEmpty()Z

    move-result v0

    if-nez v0, :cond_1

    const-string v0, " \t\r\n"

    invoke-virtual {p0}, Lcom/vladsch/flexmark/util/sequence/BasedSequenceImpl;->length()I

    move-result v1

    const/4 v2, 0x0

    invoke-virtual {p0, v0, v2, v1}, Lcom/vladsch/flexmark/util/sequence/BasedSequenceImpl;->countLeading(Ljava/lang/CharSequence;II)I

    move-result v0

    invoke-virtual {p0}, Lcom/vladsch/flexmark/util/sequence/BasedSequenceImpl;->length()I

    move-result v1

    if-ne v0, v1, :cond_0

    goto :goto_0

    :cond_0
    return v2

    :cond_1
    :goto_0
    const/4 v0, 0x1

    return v0
.end method

.method public isContinuationOf(Lcom/vladsch/flexmark/util/sequence/BasedSequence;)Z
    .locals 2

    .line 1377
    invoke-interface {p1}, Lcom/vladsch/flexmark/util/sequence/BasedSequence;->length()I

    move-result v0

    if-lez v0, :cond_0

    invoke-virtual {p0}, Lcom/vladsch/flexmark/util/sequence/BasedSequenceImpl;->length()I

    move-result v0

    if-lez v0, :cond_0

    invoke-interface {p1}, Lcom/vladsch/flexmark/util/sequence/BasedSequence;->getBase()Ljava/lang/Object;

    move-result-object v0

    invoke-virtual {p0}, Lcom/vladsch/flexmark/util/sequence/BasedSequenceImpl;->getBase()Ljava/lang/Object;

    move-result-object v1

    if-ne v0, v1, :cond_0

    invoke-interface {p1}, Lcom/vladsch/flexmark/util/sequence/BasedSequence;->getEndOffset()I

    move-result p1

    invoke-virtual {p0}, Lcom/vladsch/flexmark/util/sequence/BasedSequenceImpl;->getStartOffset()I

    move-result v0

    if-ne p1, v0, :cond_0

    const/4 p1, 0x1

    return p1

    :cond_0
    const/4 p1, 0x0

    return p1
.end method

.method public isContinuedBy(Lcom/vladsch/flexmark/util/sequence/BasedSequence;)Z
    .locals 2

    .line 1372
    invoke-interface {p1}, Lcom/vladsch/flexmark/util/sequence/BasedSequence;->length()I

    move-result v0

    if-lez v0, :cond_0

    invoke-virtual {p0}, Lcom/vladsch/flexmark/util/sequence/BasedSequenceImpl;->length()I

    move-result v0

    if-lez v0, :cond_0

    invoke-interface {p1}, Lcom/vladsch/flexmark/util/sequence/BasedSequence;->getBase()Ljava/lang/Object;

    move-result-object v0

    invoke-virtual {p0}, Lcom/vladsch/flexmark/util/sequence/BasedSequenceImpl;->getBase()Ljava/lang/Object;

    move-result-object v1

    if-ne v0, v1, :cond_0

    invoke-interface {p1}, Lcom/vladsch/flexmark/util/sequence/BasedSequence;->getStartOffset()I

    move-result p1

    invoke-virtual {p0}, Lcom/vladsch/flexmark/util/sequence/BasedSequenceImpl;->getEndOffset()I

    move-result v0

    if-ne p1, v0, :cond_0

    const/4 p1, 0x1

    return p1

    :cond_0
    const/4 p1, 0x0

    return p1
.end method

.method public isEmpty()Z
    .locals 1

    .line 1038
    invoke-virtual {p0}, Lcom/vladsch/flexmark/util/sequence/BasedSequenceImpl;->length()I

    move-result v0

    if-nez v0, :cond_0

    const/4 v0, 0x1

    return v0

    :cond_0
    const/4 v0, 0x0

    return v0
.end method

.method public isNotNull()Z
    .locals 1

    .line 1053
    sget-object v0, Lcom/vladsch/flexmark/util/sequence/BasedSequence;->NULL:Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    if-eq p0, v0, :cond_0

    const/4 v0, 0x1

    return v0

    :cond_0
    const/4 v0, 0x0

    return v0
.end method

.method public isNull()Z
    .locals 1

    .line 1048
    sget-object v0, Lcom/vladsch/flexmark/util/sequence/BasedSequence;->NULL:Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    if-ne p0, v0, :cond_0

    const/4 v0, 0x1

    return v0

    :cond_0
    const/4 v0, 0x0

    return v0
.end method

.method public lastChar()C
    .locals 1

    .line 133
    invoke-virtual {p0}, Lcom/vladsch/flexmark/util/sequence/BasedSequenceImpl;->isEmpty()Z

    move-result v0

    if-eqz v0, :cond_0

    const/4 v0, 0x0

    return v0

    :cond_0
    invoke-virtual {p0}, Lcom/vladsch/flexmark/util/sequence/BasedSequenceImpl;->length()I

    move-result v0

    add-int/lit8 v0, v0, -0x1

    invoke-virtual {p0, v0}, Lcom/vladsch/flexmark/util/sequence/BasedSequenceImpl;->charAt(I)C

    move-result v0

    return v0
.end method

.method public lastIndexOf(C)I
    .locals 2

    const/4 v0, 0x0

    .line 332
    invoke-virtual {p0}, Lcom/vladsch/flexmark/util/sequence/BasedSequenceImpl;->length()I

    move-result v1

    invoke-virtual {p0, p1, v0, v1}, Lcom/vladsch/flexmark/util/sequence/BasedSequenceImpl;->lastIndexOf(CII)I

    move-result p1

    return p1
.end method

.method public lastIndexOf(CI)I
    .locals 1

    const/4 v0, 0x0

    .line 336
    invoke-virtual {p0, p1, v0, p2}, Lcom/vladsch/flexmark/util/sequence/BasedSequenceImpl;->lastIndexOf(CII)I

    move-result p1

    return p1
.end method

.method public lastIndexOf(CII)I
    .locals 1

    if-gez p2, :cond_0

    const/4 p2, 0x0

    .line 345
    :cond_0
    invoke-virtual {p0}, Lcom/vladsch/flexmark/util/sequence/BasedSequenceImpl;->length()I

    move-result v0

    if-lt p3, v0, :cond_1

    invoke-virtual {p0}, Lcom/vladsch/flexmark/util/sequence/BasedSequenceImpl;->length()I

    move-result p3

    goto :goto_0

    :cond_1
    add-int/lit8 p3, p3, 0x1

    :goto_0
    add-int/lit8 v0, p3, -0x1

    if-le p3, p2, :cond_3

    .line 348
    invoke-virtual {p0, v0}, Lcom/vladsch/flexmark/util/sequence/BasedSequenceImpl;->charAt(I)C

    move-result p3

    if-ne p3, p1, :cond_2

    return v0

    :cond_2
    move p3, v0

    goto :goto_0

    :cond_3
    const/4 p1, -0x1

    return p1
.end method

.method public lastIndexOf(Ljava/lang/CharSequence;)I
    .locals 2

    const/4 v0, 0x0

    .line 304
    invoke-virtual {p0}, Lcom/vladsch/flexmark/util/sequence/BasedSequenceImpl;->length()I

    move-result v1

    invoke-virtual {p0, p1, v0, v1}, Lcom/vladsch/flexmark/util/sequence/BasedSequenceImpl;->lastIndexOf(Ljava/lang/CharSequence;II)I

    move-result p1

    return p1
.end method

.method public lastIndexOf(Ljava/lang/CharSequence;I)I
    .locals 1

    const/4 v0, 0x0

    .line 305
    invoke-virtual {p0, p1, v0, p2}, Lcom/vladsch/flexmark/util/sequence/BasedSequenceImpl;->lastIndexOf(Ljava/lang/CharSequence;II)I

    move-result p1

    return p1
.end method

.method public lastIndexOf(Ljava/lang/CharSequence;II)I
    .locals 5

    .line 310
    invoke-interface {p1}, Ljava/lang/CharSequence;->length()I

    move-result v0

    if-nez v0, :cond_0

    return p2

    :cond_0
    if-gez p2, :cond_1

    const/4 p2, 0x0

    .line 314
    :cond_1
    invoke-virtual {p0}, Lcom/vladsch/flexmark/util/sequence/BasedSequenceImpl;->length()I

    move-result v1

    if-lt p3, v1, :cond_2

    invoke-virtual {p0}, Lcom/vladsch/flexmark/util/sequence/BasedSequenceImpl;->length()I

    move-result p3

    :cond_2
    if-ge p2, p3, :cond_6

    add-int/lit8 v1, v0, -0x1

    .line 318
    invoke-interface {p1, v1}, Ljava/lang/CharSequence;->charAt(I)C

    move-result v1

    .line 321
    :goto_0
    invoke-virtual {p0, v1, p3}, Lcom/vladsch/flexmark/util/sequence/BasedSequenceImpl;->lastIndexOf(CI)I

    move-result p3

    add-int/lit8 v2, p3, 0x1

    add-int v3, p2, v0

    if-ge v2, v3, :cond_3

    goto :goto_1

    .line 323
    :cond_3
    invoke-virtual {p0, p1, p3}, Lcom/vladsch/flexmark/util/sequence/BasedSequenceImpl;->matchCharsReversed(Ljava/lang/CharSequence;I)Z

    move-result v4

    if-eqz v4, :cond_4

    sub-int/2addr v2, v0

    return v2

    :cond_4
    add-int/lit8 v2, p3, -0x1

    if-ge p3, v3, :cond_5

    goto :goto_1

    :cond_5
    move p3, v2

    goto :goto_0

    :cond_6
    :goto_1
    const/4 p1, -0x1

    return p1
.end method

.method public lastIndexOfAny(CC)I
    .locals 2

    const/4 v0, 0x0

    .line 333
    invoke-virtual {p0}, Lcom/vladsch/flexmark/util/sequence/BasedSequenceImpl;->length()I

    move-result v1

    invoke-virtual {p0, p1, p2, v0, v1}, Lcom/vladsch/flexmark/util/sequence/BasedSequenceImpl;->lastIndexOfAny(CCII)I

    move-result p1

    return p1
.end method

.method public lastIndexOfAny(CCC)I
    .locals 6

    const/4 v4, 0x0

    .line 334
    invoke-virtual {p0}, Lcom/vladsch/flexmark/util/sequence/BasedSequenceImpl;->length()I

    move-result v5

    move-object v0, p0

    move v1, p1

    move v2, p2

    move v3, p3

    invoke-virtual/range {v0 .. v5}, Lcom/vladsch/flexmark/util/sequence/BasedSequenceImpl;->lastIndexOfAny(CCCII)I

    move-result p1

    return p1
.end method

.method public lastIndexOfAny(CCCI)I
    .locals 6

    const/4 v4, 0x0

    move-object v0, p0

    move v1, p1

    move v2, p2

    move v3, p3

    move v5, p4

    .line 338
    invoke-virtual/range {v0 .. v5}, Lcom/vladsch/flexmark/util/sequence/BasedSequenceImpl;->lastIndexOfAny(CCCII)I

    move-result p1

    return p1
.end method

.method public lastIndexOfAny(CCCII)I
    .locals 1

    if-gez p4, :cond_0

    const/4 p4, 0x0

    .line 368
    :cond_0
    invoke-virtual {p0}, Lcom/vladsch/flexmark/util/sequence/BasedSequenceImpl;->length()I

    move-result v0

    if-lt p5, v0, :cond_1

    invoke-virtual {p0}, Lcom/vladsch/flexmark/util/sequence/BasedSequenceImpl;->length()I

    move-result p5

    goto :goto_0

    :cond_1
    add-int/lit8 p5, p5, 0x1

    :goto_0
    add-int/lit8 v0, p5, -0x1

    if-le p5, p4, :cond_4

    .line 371
    invoke-virtual {p0, v0}, Lcom/vladsch/flexmark/util/sequence/BasedSequenceImpl;->charAt(I)C

    move-result p5

    if-eq p5, p1, :cond_3

    if-eq p5, p2, :cond_3

    if-ne p5, p3, :cond_2

    goto :goto_1

    :cond_2
    move p5, v0

    goto :goto_0

    :cond_3
    :goto_1
    return v0

    :cond_4
    const/4 p1, -0x1

    return p1
.end method

.method public lastIndexOfAny(CCI)I
    .locals 1

    const/4 v0, 0x0

    .line 337
    invoke-virtual {p0, p1, p2, v0, p3}, Lcom/vladsch/flexmark/util/sequence/BasedSequenceImpl;->lastIndexOfAny(CCII)I

    move-result p1

    return p1
.end method

.method public lastIndexOfAny(CCII)I
    .locals 1

    if-gez p3, :cond_0

    const/4 p3, 0x0

    .line 356
    :cond_0
    invoke-virtual {p0}, Lcom/vladsch/flexmark/util/sequence/BasedSequenceImpl;->length()I

    move-result v0

    if-lt p4, v0, :cond_1

    invoke-virtual {p0}, Lcom/vladsch/flexmark/util/sequence/BasedSequenceImpl;->length()I

    move-result p4

    goto :goto_0

    :cond_1
    add-int/lit8 p4, p4, 0x1

    :goto_0
    add-int/lit8 v0, p4, -0x1

    if-le p4, p3, :cond_4

    .line 359
    invoke-virtual {p0, v0}, Lcom/vladsch/flexmark/util/sequence/BasedSequenceImpl;->charAt(I)C

    move-result p4

    if-eq p4, p1, :cond_3

    if-ne p4, p2, :cond_2

    goto :goto_1

    :cond_2
    move p4, v0

    goto :goto_0

    :cond_3
    :goto_1
    return v0

    :cond_4
    const/4 p1, -0x1

    return p1
.end method

.method public lastIndexOfAny(Ljava/lang/CharSequence;)I
    .locals 2

    const/4 v0, 0x0

    .line 335
    invoke-virtual {p0}, Lcom/vladsch/flexmark/util/sequence/BasedSequenceImpl;->length()I

    move-result v1

    invoke-virtual {p0, p1, v0, v1}, Lcom/vladsch/flexmark/util/sequence/BasedSequenceImpl;->lastIndexOfAny(Ljava/lang/CharSequence;II)I

    move-result p1

    return p1
.end method

.method public lastIndexOfAny(Ljava/lang/CharSequence;I)I
    .locals 1

    const/4 v0, 0x0

    .line 339
    invoke-virtual {p0, p1, v0, p2}, Lcom/vladsch/flexmark/util/sequence/BasedSequenceImpl;->lastIndexOfAny(Ljava/lang/CharSequence;II)I

    move-result p1

    return p1
.end method

.method public lastIndexOfAny(Ljava/lang/CharSequence;II)I
    .locals 8

    .line 379
    invoke-interface {p1}, Ljava/lang/CharSequence;->length()I

    move-result v0

    if-eqz v0, :cond_7

    const/4 v1, 0x0

    const/4 v2, 0x1

    if-eq v0, v2, :cond_6

    const/4 v3, 0x2

    if-eq v0, v3, :cond_5

    const/4 v4, 0x3

    if-eq v0, v4, :cond_4

    .line 390
    invoke-static {p1}, Lcom/vladsch/flexmark/util/sequence/BasedSequenceImpl;->of(Ljava/lang/CharSequence;)Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    move-result-object p1

    if-gez p2, :cond_0

    const/4 p2, 0x0

    .line 392
    :cond_0
    invoke-virtual {p0}, Lcom/vladsch/flexmark/util/sequence/BasedSequenceImpl;->length()I

    move-result v0

    if-lt p3, v0, :cond_1

    invoke-virtual {p0}, Lcom/vladsch/flexmark/util/sequence/BasedSequenceImpl;->length()I

    move-result p3

    goto :goto_0

    :cond_1
    add-int/2addr p3, v2

    :goto_0
    add-int/lit8 v0, p3, -0x1

    const/4 v1, -0x1

    if-le p3, p2, :cond_3

    .line 395
    invoke-virtual {p0, v0}, Lcom/vladsch/flexmark/util/sequence/BasedSequenceImpl;->charAt(I)C

    move-result p3

    .line 396
    invoke-interface {p1, p3}, Lcom/vladsch/flexmark/util/sequence/BasedSequence;->indexOf(C)I

    move-result p3

    if-eq p3, v1, :cond_2

    return v0

    :cond_2
    move p3, v0

    goto :goto_0

    :cond_3
    return v1

    :cond_4
    const/4 v0, 0x2

    .line 387
    invoke-interface {p1, v1}, Ljava/lang/CharSequence;->charAt(I)C

    move-result v3

    invoke-interface {p1, v2}, Ljava/lang/CharSequence;->charAt(I)C

    move-result v4

    invoke-interface {p1, v0}, Ljava/lang/CharSequence;->charAt(I)C

    move-result v5

    move-object v2, p0

    move v6, p2

    move v7, p3

    invoke-virtual/range {v2 .. v7}, Lcom/vladsch/flexmark/util/sequence/BasedSequenceImpl;->lastIndexOfAny(CCCII)I

    move-result p1

    move-object p2, v2

    return p1

    :cond_5
    move v6, p2

    move v7, p3

    move-object p2, p0

    .line 385
    invoke-interface {p1, v1}, Ljava/lang/CharSequence;->charAt(I)C

    move-result p3

    invoke-interface {p1, v2}, Ljava/lang/CharSequence;->charAt(I)C

    move-result p1

    invoke-virtual {p0, p3, p1, v6, v7}, Lcom/vladsch/flexmark/util/sequence/BasedSequenceImpl;->lastIndexOfAny(CCII)I

    move-result p1

    return p1

    :cond_6
    move v6, p2

    move v7, p3

    move-object p2, p0

    .line 383
    invoke-interface {p1, v1}, Ljava/lang/CharSequence;->charAt(I)C

    move-result p1

    invoke-virtual {p0, p1, v6, v7}, Lcom/vladsch/flexmark/util/sequence/BasedSequenceImpl;->lastIndexOf(CII)I

    move-result p1

    return p1

    :cond_7
    move v6, p2

    move-object p2, p0

    return v6
.end method

.method public lastIndexOfAnyNot(CC)I
    .locals 2

    const/4 v0, 0x0

    .line 404
    invoke-virtual {p0}, Lcom/vladsch/flexmark/util/sequence/BasedSequenceImpl;->length()I

    move-result v1

    invoke-virtual {p0, p1, p2, v0, v1}, Lcom/vladsch/flexmark/util/sequence/BasedSequenceImpl;->lastIndexOfAnyNot(CCII)I

    move-result p1

    return p1
.end method

.method public lastIndexOfAnyNot(CCC)I
    .locals 6

    const/4 v4, 0x0

    .line 405
    invoke-virtual {p0}, Lcom/vladsch/flexmark/util/sequence/BasedSequenceImpl;->length()I

    move-result v5

    move-object v0, p0

    move v1, p1

    move v2, p2

    move v3, p3

    invoke-virtual/range {v0 .. v5}, Lcom/vladsch/flexmark/util/sequence/BasedSequenceImpl;->lastIndexOfAnyNot(CCCII)I

    move-result p1

    return p1
.end method

.method public lastIndexOfAnyNot(CCCI)I
    .locals 6

    const/4 v4, 0x0

    move-object v0, p0

    move v1, p1

    move v2, p2

    move v3, p3

    move v5, p4

    .line 409
    invoke-virtual/range {v0 .. v5}, Lcom/vladsch/flexmark/util/sequence/BasedSequenceImpl;->lastIndexOfAnyNot(CCCII)I

    move-result p1

    return p1
.end method

.method public lastIndexOfAnyNot(CCCII)I
    .locals 1

    if-gez p4, :cond_0

    const/4 p4, 0x0

    .line 439
    :cond_0
    invoke-virtual {p0}, Lcom/vladsch/flexmark/util/sequence/BasedSequenceImpl;->length()I

    move-result v0

    if-lt p5, v0, :cond_1

    invoke-virtual {p0}, Lcom/vladsch/flexmark/util/sequence/BasedSequenceImpl;->length()I

    move-result p5

    goto :goto_0

    :cond_1
    add-int/lit8 p5, p5, 0x1

    :goto_0
    add-int/lit8 v0, p5, -0x1

    if-le p5, p4, :cond_3

    .line 442
    invoke-virtual {p0, v0}, Lcom/vladsch/flexmark/util/sequence/BasedSequenceImpl;->charAt(I)C

    move-result p5

    if-eq p5, p1, :cond_2

    if-eq p5, p2, :cond_2

    if-eq p5, p3, :cond_2

    return v0

    :cond_2
    move p5, v0

    goto :goto_0

    :cond_3
    const/4 p1, -0x1

    return p1
.end method

.method public lastIndexOfAnyNot(CCI)I
    .locals 1

    const/4 v0, 0x0

    .line 408
    invoke-virtual {p0, p1, p2, v0, p3}, Lcom/vladsch/flexmark/util/sequence/BasedSequenceImpl;->lastIndexOfAnyNot(CCII)I

    move-result p1

    return p1
.end method

.method public lastIndexOfAnyNot(CCII)I
    .locals 1

    if-gez p3, :cond_0

    const/4 p3, 0x0

    .line 427
    :cond_0
    invoke-virtual {p0}, Lcom/vladsch/flexmark/util/sequence/BasedSequenceImpl;->length()I

    move-result v0

    if-lt p4, v0, :cond_1

    invoke-virtual {p0}, Lcom/vladsch/flexmark/util/sequence/BasedSequenceImpl;->length()I

    move-result p4

    goto :goto_0

    :cond_1
    add-int/lit8 p4, p4, 0x1

    :goto_0
    add-int/lit8 v0, p4, -0x1

    if-le p4, p3, :cond_3

    .line 430
    invoke-virtual {p0, v0}, Lcom/vladsch/flexmark/util/sequence/BasedSequenceImpl;->charAt(I)C

    move-result p4

    if-eq p4, p1, :cond_2

    if-eq p4, p2, :cond_2

    return v0

    :cond_2
    move p4, v0

    goto :goto_0

    :cond_3
    const/4 p1, -0x1

    return p1
.end method

.method public lastIndexOfAnyNot(Ljava/lang/CharSequence;)I
    .locals 2

    const/4 v0, 0x0

    .line 406
    invoke-virtual {p0}, Lcom/vladsch/flexmark/util/sequence/BasedSequenceImpl;->length()I

    move-result v1

    invoke-virtual {p0, p1, v0, v1}, Lcom/vladsch/flexmark/util/sequence/BasedSequenceImpl;->lastIndexOfAnyNot(Ljava/lang/CharSequence;II)I

    move-result p1

    return p1
.end method

.method public lastIndexOfAnyNot(Ljava/lang/CharSequence;I)I
    .locals 1

    const/4 v0, 0x0

    .line 410
    invoke-virtual {p0, p1, v0, p2}, Lcom/vladsch/flexmark/util/sequence/BasedSequenceImpl;->lastIndexOfAnyNot(Ljava/lang/CharSequence;II)I

    move-result p1

    return p1
.end method

.method public lastIndexOfAnyNot(Ljava/lang/CharSequence;II)I
    .locals 8

    .line 450
    invoke-interface {p1}, Ljava/lang/CharSequence;->length()I

    move-result v0

    if-eqz v0, :cond_7

    const/4 v1, 0x0

    const/4 v2, 0x1

    if-eq v0, v2, :cond_6

    const/4 v3, 0x2

    if-eq v0, v3, :cond_5

    const/4 v4, 0x3

    if-eq v0, v4, :cond_4

    .line 461
    invoke-static {p1}, Lcom/vladsch/flexmark/util/sequence/BasedSequenceImpl;->of(Ljava/lang/CharSequence;)Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    move-result-object p1

    if-gez p2, :cond_0

    const/4 p2, 0x0

    .line 463
    :cond_0
    invoke-virtual {p0}, Lcom/vladsch/flexmark/util/sequence/BasedSequenceImpl;->length()I

    move-result v0

    if-lt p3, v0, :cond_1

    invoke-virtual {p0}, Lcom/vladsch/flexmark/util/sequence/BasedSequenceImpl;->length()I

    move-result p3

    goto :goto_0

    :cond_1
    add-int/2addr p3, v2

    :goto_0
    add-int/lit8 v0, p3, -0x1

    const/4 v1, -0x1

    if-le p3, p2, :cond_3

    .line 466
    invoke-virtual {p0, v0}, Lcom/vladsch/flexmark/util/sequence/BasedSequenceImpl;->charAt(I)C

    move-result p3

    .line 467
    invoke-interface {p1, p3}, Lcom/vladsch/flexmark/util/sequence/BasedSequence;->indexOf(C)I

    move-result p3

    if-ne p3, v1, :cond_2

    return v0

    :cond_2
    move p3, v0

    goto :goto_0

    :cond_3
    return v1

    :cond_4
    const/4 v0, 0x2

    .line 458
    invoke-interface {p1, v1}, Ljava/lang/CharSequence;->charAt(I)C

    move-result v3

    invoke-interface {p1, v2}, Ljava/lang/CharSequence;->charAt(I)C

    move-result v4

    invoke-interface {p1, v0}, Ljava/lang/CharSequence;->charAt(I)C

    move-result v5

    move-object v2, p0

    move v6, p2

    move v7, p3

    invoke-virtual/range {v2 .. v7}, Lcom/vladsch/flexmark/util/sequence/BasedSequenceImpl;->lastIndexOfAnyNot(CCCII)I

    move-result p1

    move-object p2, v2

    return p1

    :cond_5
    move v6, p2

    move v7, p3

    move-object p2, p0

    .line 456
    invoke-interface {p1, v1}, Ljava/lang/CharSequence;->charAt(I)C

    move-result p3

    invoke-interface {p1, v2}, Ljava/lang/CharSequence;->charAt(I)C

    move-result p1

    invoke-virtual {p0, p3, p1, v6, v7}, Lcom/vladsch/flexmark/util/sequence/BasedSequenceImpl;->lastIndexOfAnyNot(CCII)I

    move-result p1

    return p1

    :cond_6
    move v6, p2

    move v7, p3

    move-object p2, p0

    .line 454
    invoke-interface {p1, v1}, Ljava/lang/CharSequence;->charAt(I)C

    move-result p1

    invoke-virtual {p0, p1, v6, v7}, Lcom/vladsch/flexmark/util/sequence/BasedSequenceImpl;->lastIndexOfNot(CII)I

    move-result p1

    return p1

    :cond_7
    move v6, p2

    move-object p2, p0

    return v6
.end method

.method public lastIndexOfNot(C)I
    .locals 2

    const/4 v0, 0x0

    .line 403
    invoke-virtual {p0}, Lcom/vladsch/flexmark/util/sequence/BasedSequenceImpl;->length()I

    move-result v1

    invoke-virtual {p0, p1, v0, v1}, Lcom/vladsch/flexmark/util/sequence/BasedSequenceImpl;->lastIndexOfNot(CII)I

    move-result p1

    return p1
.end method

.method public lastIndexOfNot(CI)I
    .locals 1

    const/4 v0, 0x0

    .line 407
    invoke-virtual {p0, p1, v0, p2}, Lcom/vladsch/flexmark/util/sequence/BasedSequenceImpl;->lastIndexOfNot(CII)I

    move-result p1

    return p1
.end method

.method public lastIndexOfNot(CII)I
    .locals 1

    if-gez p2, :cond_0

    const/4 p2, 0x0

    .line 416
    :cond_0
    invoke-virtual {p0}, Lcom/vladsch/flexmark/util/sequence/BasedSequenceImpl;->length()I

    move-result v0

    if-lt p3, v0, :cond_1

    invoke-virtual {p0}, Lcom/vladsch/flexmark/util/sequence/BasedSequenceImpl;->length()I

    move-result p3

    goto :goto_0

    :cond_1
    add-int/lit8 p3, p3, 0x1

    :goto_0
    add-int/lit8 v0, p3, -0x1

    if-le p3, p2, :cond_3

    .line 419
    invoke-virtual {p0, v0}, Lcom/vladsch/flexmark/util/sequence/BasedSequenceImpl;->charAt(I)C

    move-result p3

    if-eq p3, p1, :cond_2

    return v0

    :cond_2
    move p3, v0

    goto :goto_0

    :cond_3
    const/4 p1, -0x1

    return p1
.end method

.method public lineAt(I)Lcom/vladsch/flexmark/util/sequence/BasedSequence;
    .locals 1

    .line 609
    invoke-virtual {p0, p1}, Lcom/vladsch/flexmark/util/sequence/BasedSequenceImpl;->startOfLine(I)I

    move-result v0

    invoke-virtual {p0, p1}, Lcom/vladsch/flexmark/util/sequence/BasedSequenceImpl;->endOfLine(I)I

    move-result p1

    invoke-virtual {p0, v0, p1}, Lcom/vladsch/flexmark/util/sequence/BasedSequenceImpl;->subSequence(II)Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    move-result-object p1

    return-object p1
.end method

.method public lineAtAnyEOL(I)Lcom/vladsch/flexmark/util/sequence/BasedSequence;
    .locals 1

    .line 614
    invoke-virtual {p0, p1}, Lcom/vladsch/flexmark/util/sequence/BasedSequenceImpl;->startOfLineAnyEOL(I)I

    move-result v0

    invoke-virtual {p0, p1}, Lcom/vladsch/flexmark/util/sequence/BasedSequenceImpl;->endOfLineAnyEOL(I)I

    move-result p1

    invoke-virtual {p0, v0, p1}, Lcom/vladsch/flexmark/util/sequence/BasedSequenceImpl;->subSequence(II)Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    move-result-object p1

    return-object p1
.end method

.method public matchChars(Ljava/lang/CharSequence;)Z
    .locals 1

    const/4 v0, 0x0

    .line 1188
    invoke-virtual {p0, p1, v0, v0}, Lcom/vladsch/flexmark/util/sequence/BasedSequenceImpl;->matchChars(Ljava/lang/CharSequence;IZ)Z

    move-result p1

    return p1
.end method

.method public matchChars(Ljava/lang/CharSequence;I)Z
    .locals 1

    const/4 v0, 0x0

    .line 1203
    invoke-virtual {p0, p1, p2, v0}, Lcom/vladsch/flexmark/util/sequence/BasedSequenceImpl;->matchChars(Ljava/lang/CharSequence;IZ)Z

    move-result p1

    return p1
.end method

.method public matchChars(Ljava/lang/CharSequence;IZ)Z
    .locals 4

    .line 1213
    invoke-interface {p1}, Ljava/lang/CharSequence;->length()I

    move-result v0

    .line 1214
    invoke-virtual {p0}, Lcom/vladsch/flexmark/util/sequence/BasedSequenceImpl;->length()I

    move-result v1

    sub-int/2addr v1, p2

    const/4 v2, 0x0

    if-le v0, v1, :cond_0

    return v2

    :cond_0
    if-eqz p3, :cond_4

    const/4 p3, 0x0

    :goto_0
    if-ge p3, v0, :cond_6

    .line 1218
    invoke-interface {p1, p3}, Ljava/lang/CharSequence;->charAt(I)C

    move-result v1

    add-int v3, p3, p2

    .line 1219
    invoke-virtual {p0, v3}, Lcom/vladsch/flexmark/util/sequence/BasedSequenceImpl;->charAt(I)C

    move-result v3

    if-eq v1, v3, :cond_3

    .line 1221
    invoke-static {v1}, Ljava/lang/Character;->toUpperCase(C)C

    move-result v1

    .line 1222
    invoke-static {v3}, Ljava/lang/Character;->toUpperCase(C)C

    move-result v3

    if-ne v1, v3, :cond_1

    goto :goto_1

    .line 1230
    :cond_1
    invoke-static {v1}, Ljava/lang/Character;->toLowerCase(C)C

    move-result v1

    invoke-static {v3}, Ljava/lang/Character;->toLowerCase(C)C

    move-result v3

    if-ne v1, v3, :cond_2

    goto :goto_1

    :cond_2
    return v2

    :cond_3
    :goto_1
    add-int/lit8 p3, p3, 0x1

    goto :goto_0

    :cond_4
    const/4 p3, 0x0

    :goto_2
    if-ge p3, v0, :cond_6

    .line 1238
    invoke-interface {p1, p3}, Ljava/lang/CharSequence;->charAt(I)C

    move-result v1

    add-int v3, p3, p2

    invoke-virtual {p0, v3}, Lcom/vladsch/flexmark/util/sequence/BasedSequenceImpl;->charAt(I)C

    move-result v3

    if-eq v1, v3, :cond_5

    return v2

    :cond_5
    add-int/lit8 p3, p3, 0x1

    goto :goto_2

    :cond_6
    const/4 p1, 0x1

    return p1
.end method

.method public matchChars(Ljava/lang/CharSequence;Z)Z
    .locals 1

    const/4 v0, 0x0

    .line 1198
    invoke-virtual {p0, p1, v0, p2}, Lcom/vladsch/flexmark/util/sequence/BasedSequenceImpl;->matchChars(Ljava/lang/CharSequence;IZ)Z

    move-result p1

    return p1
.end method

.method public matchCharsIgnoreCase(Ljava/lang/CharSequence;)Z
    .locals 2

    const/4 v0, 0x0

    const/4 v1, 0x1

    .line 1193
    invoke-virtual {p0, p1, v0, v1}, Lcom/vladsch/flexmark/util/sequence/BasedSequenceImpl;->matchChars(Ljava/lang/CharSequence;IZ)Z

    move-result p1

    return p1
.end method

.method public matchCharsIgnoreCase(Ljava/lang/CharSequence;I)Z
    .locals 1

    const/4 v0, 0x0

    .line 1208
    invoke-virtual {p0, p1, p2, v0}, Lcom/vladsch/flexmark/util/sequence/BasedSequenceImpl;->matchChars(Ljava/lang/CharSequence;IZ)Z

    move-result p1

    return p1
.end method

.method public matchCharsReversed(Ljava/lang/CharSequence;I)Z
    .locals 3

    const/4 v0, 0x1

    add-int/2addr p2, v0

    .line 1246
    invoke-interface {p1}, Ljava/lang/CharSequence;->length()I

    move-result v1

    const/4 v2, 0x0

    if-lt p2, v1, :cond_0

    invoke-interface {p1}, Ljava/lang/CharSequence;->length()I

    move-result v1

    sub-int/2addr p2, v1

    invoke-virtual {p0, p1, p2, v2}, Lcom/vladsch/flexmark/util/sequence/BasedSequenceImpl;->matchChars(Ljava/lang/CharSequence;IZ)Z

    move-result p1

    if-eqz p1, :cond_0

    return v0

    :cond_0
    return v2
.end method

.method public matchCharsReversed(Ljava/lang/CharSequence;IZ)Z
    .locals 2

    const/4 v0, 0x1

    add-int/2addr p2, v0

    .line 1256
    invoke-interface {p1}, Ljava/lang/CharSequence;->length()I

    move-result v1

    if-lt p2, v1, :cond_0

    invoke-interface {p1}, Ljava/lang/CharSequence;->length()I

    move-result v1

    sub-int/2addr p2, v1

    invoke-virtual {p0, p1, p2, p3}, Lcom/vladsch/flexmark/util/sequence/BasedSequenceImpl;->matchChars(Ljava/lang/CharSequence;IZ)Z

    move-result p1

    if-eqz p1, :cond_0

    return v0

    :cond_0
    const/4 p1, 0x0

    return p1
.end method

.method public matchCharsReversedIgnoreCase(Ljava/lang/CharSequence;I)Z
    .locals 2

    const/4 v0, 0x1

    add-int/2addr p2, v0

    .line 1251
    invoke-interface {p1}, Ljava/lang/CharSequence;->length()I

    move-result v1

    if-lt p2, v1, :cond_0

    invoke-interface {p1}, Ljava/lang/CharSequence;->length()I

    move-result v1

    sub-int/2addr p2, v1

    invoke-virtual {p0, p1, p2, v0}, Lcom/vladsch/flexmark/util/sequence/BasedSequenceImpl;->matchChars(Ljava/lang/CharSequence;IZ)Z

    move-result p1

    if-eqz p1, :cond_0

    return v0

    :cond_0
    const/4 p1, 0x0

    return p1
.end method

.method public matches(Ljava/lang/CharSequence;)Z
    .locals 3

    .line 1173
    invoke-interface {p1}, Ljava/lang/CharSequence;->length()I

    move-result v0

    invoke-virtual {p0}, Lcom/vladsch/flexmark/util/sequence/BasedSequenceImpl;->length()I

    move-result v1

    const/4 v2, 0x0

    if-ne v0, v1, :cond_0

    invoke-virtual {p0, p1, v2, v2}, Lcom/vladsch/flexmark/util/sequence/BasedSequenceImpl;->matchChars(Ljava/lang/CharSequence;IZ)Z

    move-result p1

    if-eqz p1, :cond_0

    const/4 p1, 0x1

    return p1

    :cond_0
    return v2
.end method

.method public matches(Ljava/lang/CharSequence;Z)Z
    .locals 3

    .line 1183
    invoke-interface {p1}, Ljava/lang/CharSequence;->length()I

    move-result v0

    invoke-virtual {p0}, Lcom/vladsch/flexmark/util/sequence/BasedSequenceImpl;->length()I

    move-result v1

    const/4 v2, 0x0

    if-ne v0, v1, :cond_0

    invoke-virtual {p0, p1, v2, p2}, Lcom/vladsch/flexmark/util/sequence/BasedSequenceImpl;->matchChars(Ljava/lang/CharSequence;IZ)Z

    move-result p1

    if-eqz p1, :cond_0

    const/4 p1, 0x1

    return p1

    :cond_0
    return v2
.end method

.method public matchesIgnoreCase(Ljava/lang/CharSequence;)Z
    .locals 3

    .line 1178
    invoke-interface {p1}, Ljava/lang/CharSequence;->length()I

    move-result v0

    invoke-virtual {p0}, Lcom/vladsch/flexmark/util/sequence/BasedSequenceImpl;->length()I

    move-result v1

    const/4 v2, 0x0

    if-ne v0, v1, :cond_0

    const/4 v0, 0x1

    invoke-virtual {p0, p1, v2, v0}, Lcom/vladsch/flexmark/util/sequence/BasedSequenceImpl;->matchChars(Ljava/lang/CharSequence;IZ)Z

    move-result p1

    if-eqz p1, :cond_0

    return v0

    :cond_0
    return v2
.end method

.method public midCharAt(I)C
    .locals 1

    .line 124
    invoke-virtual {p0}, Lcom/vladsch/flexmark/util/sequence/BasedSequenceImpl;->length()I

    move-result v0

    neg-int v0, v0

    if-lt p1, v0, :cond_2

    invoke-virtual {p0}, Lcom/vladsch/flexmark/util/sequence/BasedSequenceImpl;->length()I

    move-result v0

    if-lt p1, v0, :cond_0

    goto :goto_0

    :cond_0
    if-gez p1, :cond_1

    .line 125
    invoke-virtual {p0}, Lcom/vladsch/flexmark/util/sequence/BasedSequenceImpl;->length()I

    move-result v0

    add-int/2addr p1, v0

    :cond_1
    invoke-virtual {p0, p1}, Lcom/vladsch/flexmark/util/sequence/BasedSequenceImpl;->charAt(I)C

    move-result p1

    return p1

    :cond_2
    :goto_0
    const/4 p1, 0x0

    return p1
.end method

.method public midSequence(I)Lcom/vladsch/flexmark/util/sequence/BasedSequence;
    .locals 1

    .line 111
    invoke-virtual {p0}, Lcom/vladsch/flexmark/util/sequence/BasedSequenceImpl;->length()I

    move-result v0

    if-gez p1, :cond_0

    add-int/2addr p1, v0

    :cond_0
    if-gtz p1, :cond_1

    return-object p0

    :cond_1
    if-lt p1, v0, :cond_2

    .line 116
    invoke-virtual {p0, v0, v0}, Lcom/vladsch/flexmark/util/sequence/BasedSequenceImpl;->subSequence(II)Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    move-result-object p1

    return-object p1

    .line 118
    :cond_2
    invoke-virtual {p0, p1, v0}, Lcom/vladsch/flexmark/util/sequence/BasedSequenceImpl;->subSequence(II)Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    move-result-object p1

    return-object p1
.end method

.method public midSequence(II)Lcom/vladsch/flexmark/util/sequence/BasedSequence;
    .locals 2

    .line 92
    invoke-virtual {p0}, Lcom/vladsch/flexmark/util/sequence/BasedSequenceImpl;->length()I

    move-result v0

    if-gez p1, :cond_0

    add-int/2addr p1, v0

    :cond_0
    if-gez p2, :cond_1

    add-int/2addr p2, v0

    :cond_1
    const/4 v1, 0x0

    if-gez p1, :cond_2

    const/4 p1, 0x0

    goto :goto_0

    :cond_2
    if-le p1, v0, :cond_3

    move p1, v0

    :cond_3
    :goto_0
    if-gez p2, :cond_4

    const/4 p2, 0x0

    goto :goto_1

    :cond_4
    if-le p2, v0, :cond_5

    move p2, v0

    :cond_5
    :goto_1
    if-le p1, p2, :cond_6

    move p1, p2

    :cond_6
    if-nez p1, :cond_7

    if-ne p2, v0, :cond_7

    return-object p0

    .line 105
    :cond_7
    invoke-virtual {p0, p1, p2}, Lcom/vladsch/flexmark/util/sequence/BasedSequenceImpl;->subSequence(II)Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    move-result-object p1

    return-object p1
.end method

.method public normalizeEOL(Lcom/vladsch/flexmark/util/sequence/ReplacedTextMapper;)Lcom/vladsch/flexmark/util/sequence/BasedSequence;
    .locals 0

    .line 1340
    invoke-static {p0, p1}, Lcom/vladsch/flexmark/util/html/Escaping;->normalizeEOL(Lcom/vladsch/flexmark/util/sequence/BasedSequence;Lcom/vladsch/flexmark/util/sequence/ReplacedTextMapper;)Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    move-result-object p1

    return-object p1
.end method

.method public normalizeEOL()Ljava/lang/String;
    .locals 1

    .line 1335
    invoke-virtual {p0}, Lcom/vladsch/flexmark/util/sequence/BasedSequenceImpl;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Lcom/vladsch/flexmark/util/html/Escaping;->normalizeEOL(Ljava/lang/CharSequence;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public normalizeEndWithEOL(Lcom/vladsch/flexmark/util/sequence/ReplacedTextMapper;)Lcom/vladsch/flexmark/util/sequence/BasedSequence;
    .locals 0

    .line 1350
    invoke-static {p0, p1}, Lcom/vladsch/flexmark/util/html/Escaping;->normalizeEndWithEOL(Lcom/vladsch/flexmark/util/sequence/BasedSequence;Lcom/vladsch/flexmark/util/sequence/ReplacedTextMapper;)Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    move-result-object p1

    return-object p1
.end method

.method public normalizeEndWithEOL()Ljava/lang/String;
    .locals 1

    .line 1345
    invoke-virtual {p0}, Lcom/vladsch/flexmark/util/sequence/BasedSequenceImpl;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Lcom/vladsch/flexmark/util/html/Escaping;->normalizeEndWithEOL(Ljava/lang/CharSequence;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public nullIf(Z)Lcom/vladsch/flexmark/util/sequence/BasedSequence;
    .locals 0

    if-eqz p1, :cond_0

    .line 985
    sget-object p1, Lcom/vladsch/flexmark/util/sequence/BasedSequence;->NULL:Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    return-object p1

    :cond_0
    return-object p0
.end method

.method public varargs nullIf([Ljava/lang/CharSequence;)Lcom/vladsch/flexmark/util/sequence/BasedSequence;
    .locals 3

    .line 990
    array-length v0, p1

    const/4 v1, 0x0

    :goto_0
    if-ge v1, v0, :cond_1

    aget-object v2, p1, v1

    .line 991
    invoke-virtual {p0, v2}, Lcom/vladsch/flexmark/util/sequence/BasedSequenceImpl;->matches(Ljava/lang/CharSequence;)Z

    move-result v2

    if-eqz v2, :cond_0

    sget-object p1, Lcom/vladsch/flexmark/util/sequence/BasedSequence;->NULL:Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    return-object p1

    :cond_0
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    :cond_1
    return-object p0
.end method

.method public nullIfBlank()Lcom/vladsch/flexmark/util/sequence/BasedSequence;
    .locals 1

    .line 980
    invoke-virtual {p0}, Lcom/vladsch/flexmark/util/sequence/BasedSequenceImpl;->isBlank()Z

    move-result v0

    if-eqz v0, :cond_0

    sget-object v0, Lcom/vladsch/flexmark/util/sequence/BasedSequence;->NULL:Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    return-object v0

    :cond_0
    return-object p0
.end method

.method public nullIfEmpty()Lcom/vladsch/flexmark/util/sequence/BasedSequence;
    .locals 1

    .line 975
    invoke-virtual {p0}, Lcom/vladsch/flexmark/util/sequence/BasedSequenceImpl;->isEmpty()Z

    move-result v0

    if-eqz v0, :cond_0

    sget-object v0, Lcom/vladsch/flexmark/util/sequence/BasedSequence;->NULL:Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    return-object v0

    :cond_0
    return-object p0
.end method

.method public varargs nullIfEndsWith([Ljava/lang/CharSequence;)Lcom/vladsch/flexmark/util/sequence/BasedSequence;
    .locals 3

    .line 1022
    array-length v0, p1

    const/4 v1, 0x0

    :goto_0
    if-ge v1, v0, :cond_1

    aget-object v2, p1, v1

    .line 1023
    invoke-virtual {p0, v2}, Lcom/vladsch/flexmark/util/sequence/BasedSequenceImpl;->endsWith(Ljava/lang/CharSequence;)Z

    move-result v2

    if-eqz v2, :cond_0

    sget-object p1, Lcom/vladsch/flexmark/util/sequence/BasedSequence;->NULL:Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    return-object p1

    :cond_0
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    :cond_1
    return-object p0
.end method

.method public varargs nullIfEndsWithNot([Ljava/lang/CharSequence;)Lcom/vladsch/flexmark/util/sequence/BasedSequence;
    .locals 3

    .line 1030
    array-length v0, p1

    const/4 v1, 0x0

    :goto_0
    if-ge v1, v0, :cond_1

    aget-object v2, p1, v1

    .line 1031
    invoke-virtual {p0, v2}, Lcom/vladsch/flexmark/util/sequence/BasedSequenceImpl;->endsWith(Ljava/lang/CharSequence;)Z

    move-result v2

    if-eqz v2, :cond_0

    return-object p0

    :cond_0
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    .line 1033
    :cond_1
    sget-object p1, Lcom/vladsch/flexmark/util/sequence/BasedSequence;->NULL:Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    return-object p1
.end method

.method public varargs nullIfNot([Ljava/lang/CharSequence;)Lcom/vladsch/flexmark/util/sequence/BasedSequence;
    .locals 3

    .line 998
    array-length v0, p1

    const/4 v1, 0x0

    :goto_0
    if-ge v1, v0, :cond_1

    aget-object v2, p1, v1

    .line 999
    invoke-virtual {p0, v2}, Lcom/vladsch/flexmark/util/sequence/BasedSequenceImpl;->matches(Ljava/lang/CharSequence;)Z

    move-result v2

    if-eqz v2, :cond_0

    return-object p0

    :cond_0
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    .line 1001
    :cond_1
    sget-object p1, Lcom/vladsch/flexmark/util/sequence/BasedSequence;->NULL:Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    return-object p1
.end method

.method public varargs nullIfStartsWith([Ljava/lang/CharSequence;)Lcom/vladsch/flexmark/util/sequence/BasedSequence;
    .locals 3

    .line 1006
    array-length v0, p1

    const/4 v1, 0x0

    :goto_0
    if-ge v1, v0, :cond_1

    aget-object v2, p1, v1

    .line 1007
    invoke-virtual {p0, v2}, Lcom/vladsch/flexmark/util/sequence/BasedSequenceImpl;->startsWith(Ljava/lang/CharSequence;)Z

    move-result v2

    if-eqz v2, :cond_0

    sget-object p1, Lcom/vladsch/flexmark/util/sequence/BasedSequence;->NULL:Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    return-object p1

    :cond_0
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    :cond_1
    return-object p0
.end method

.method public varargs nullIfStartsWithNot([Ljava/lang/CharSequence;)Lcom/vladsch/flexmark/util/sequence/BasedSequence;
    .locals 3

    .line 1014
    array-length v0, p1

    const/4 v1, 0x0

    :goto_0
    if-ge v1, v0, :cond_1

    aget-object v2, p1, v1

    .line 1015
    invoke-virtual {p0, v2}, Lcom/vladsch/flexmark/util/sequence/BasedSequenceImpl;->startsWith(Ljava/lang/CharSequence;)Z

    move-result v2

    if-eqz v2, :cond_0

    return-object p0

    :cond_0
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    .line 1017
    :cond_1
    sget-object p1, Lcom/vladsch/flexmark/util/sequence/BasedSequence;->NULL:Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    return-object p1
.end method

.method public padEnd(I)Lcom/vladsch/flexmark/util/sequence/BasedSequence;
    .locals 1

    const/16 v0, 0x20

    .line 890
    invoke-virtual {p0, p1, v0}, Lcom/vladsch/flexmark/util/sequence/BasedSequenceImpl;->padEnd(IC)Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    move-result-object p1

    return-object p1
.end method

.method public padEnd(IC)Lcom/vladsch/flexmark/util/sequence/BasedSequence;
    .locals 3

    .line 880
    invoke-virtual {p0}, Lcom/vladsch/flexmark/util/sequence/BasedSequenceImpl;->length()I

    move-result v0

    if-gt p1, v0, :cond_0

    return-object p0

    :cond_0
    const/4 v0, 0x2

    new-array v0, v0, [Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    const/4 v1, 0x0

    aput-object p0, v0, v1

    invoke-virtual {p0}, Lcom/vladsch/flexmark/util/sequence/BasedSequenceImpl;->length()I

    move-result v1

    sub-int/2addr p1, v1

    invoke-virtual {p0}, Lcom/vladsch/flexmark/util/sequence/BasedSequenceImpl;->length()I

    move-result v1

    invoke-virtual {p0}, Lcom/vladsch/flexmark/util/sequence/BasedSequenceImpl;->length()I

    move-result v2

    invoke-virtual {p0, v1, v2}, Lcom/vladsch/flexmark/util/sequence/BasedSequenceImpl;->subSequence(II)Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    move-result-object v1

    invoke-static {p2, p1, v1}, Lcom/vladsch/flexmark/util/sequence/PrefixedSubSequence;->repeatOf(CILcom/vladsch/flexmark/util/sequence/BasedSequence;)Lcom/vladsch/flexmark/util/sequence/PrefixedSubSequence;

    move-result-object p1

    const/4 p2, 0x1

    aput-object p1, v0, p2

    invoke-static {v0}, Lcom/vladsch/flexmark/util/sequence/SegmentedSequence;->of([Lcom/vladsch/flexmark/util/sequence/BasedSequence;)Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    move-result-object p1

    return-object p1
.end method

.method public padStart(I)Lcom/vladsch/flexmark/util/sequence/BasedSequence;
    .locals 1

    const/16 v0, 0x20

    .line 885
    invoke-virtual {p0, p1, v0}, Lcom/vladsch/flexmark/util/sequence/BasedSequenceImpl;->padStart(IC)Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    move-result-object p1

    return-object p1
.end method

.method public padStart(IC)Lcom/vladsch/flexmark/util/sequence/BasedSequence;
    .locals 1

    .line 875
    invoke-virtual {p0}, Lcom/vladsch/flexmark/util/sequence/BasedSequenceImpl;->length()I

    move-result v0

    if-gt p1, v0, :cond_0

    return-object p0

    :cond_0
    invoke-virtual {p0}, Lcom/vladsch/flexmark/util/sequence/BasedSequenceImpl;->length()I

    move-result v0

    sub-int/2addr p1, v0

    invoke-static {p2, p1, p0}, Lcom/vladsch/flexmark/util/sequence/PrefixedSubSequence;->repeatOf(CILcom/vladsch/flexmark/util/sequence/BasedSequence;)Lcom/vladsch/flexmark/util/sequence/PrefixedSubSequence;

    move-result-object p1

    return-object p1
.end method

.method public prefixOf(Lcom/vladsch/flexmark/util/sequence/BasedSequence;)Lcom/vladsch/flexmark/util/sequence/BasedSequence;
    .locals 2

    .line 1411
    invoke-virtual {p0}, Lcom/vladsch/flexmark/util/sequence/BasedSequenceImpl;->getBase()Ljava/lang/Object;

    move-result-object v0

    invoke-interface {p1}, Lcom/vladsch/flexmark/util/sequence/BasedSequence;->getBase()Ljava/lang/Object;

    move-result-object v1

    if-eq v0, v1, :cond_0

    sget-object p1, Lcom/vladsch/flexmark/util/sequence/SubSequence;->NULL:Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    return-object p1

    .line 1412
    :cond_0
    invoke-interface {p1}, Lcom/vladsch/flexmark/util/sequence/BasedSequence;->getStartOffset()I

    move-result v0

    invoke-virtual {p0}, Lcom/vladsch/flexmark/util/sequence/BasedSequenceImpl;->getStartOffset()I

    move-result v1

    if-gt v0, v1, :cond_1

    const/4 p1, 0x0

    invoke-virtual {p0, p1, p1}, Lcom/vladsch/flexmark/util/sequence/BasedSequenceImpl;->subSequence(II)Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    move-result-object p1

    return-object p1

    .line 1413
    :cond_1
    invoke-interface {p1}, Lcom/vladsch/flexmark/util/sequence/BasedSequence;->getStartOffset()I

    move-result v0

    invoke-virtual {p0}, Lcom/vladsch/flexmark/util/sequence/BasedSequenceImpl;->getEndOffset()I

    move-result v1

    if-lt v0, v1, :cond_2

    return-object p0

    .line 1414
    :cond_2
    invoke-virtual {p0}, Lcom/vladsch/flexmark/util/sequence/BasedSequenceImpl;->getStartOffset()I

    move-result v0

    invoke-interface {p1}, Lcom/vladsch/flexmark/util/sequence/BasedSequence;->getStartOffset()I

    move-result p1

    invoke-virtual {p0, v0, p1}, Lcom/vladsch/flexmark/util/sequence/BasedSequenceImpl;->baseSubSequence(II)Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    move-result-object p1

    return-object p1
.end method

.method public removePrefix(Ljava/lang/CharSequence;)Lcom/vladsch/flexmark/util/sequence/BasedSequence;
    .locals 1

    .line 1073
    invoke-virtual {p0, p1}, Lcom/vladsch/flexmark/util/sequence/BasedSequenceImpl;->startsWith(Ljava/lang/CharSequence;)Z

    move-result v0

    if-nez v0, :cond_0

    return-object p0

    :cond_0
    invoke-interface {p1}, Ljava/lang/CharSequence;->length()I

    move-result p1

    invoke-virtual {p0}, Lcom/vladsch/flexmark/util/sequence/BasedSequenceImpl;->length()I

    move-result v0

    invoke-virtual {p0, p1, v0}, Lcom/vladsch/flexmark/util/sequence/BasedSequenceImpl;->subSequence(II)Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    move-result-object p1

    return-object p1
.end method

.method public removePrefix(Ljava/lang/CharSequence;Z)Lcom/vladsch/flexmark/util/sequence/BasedSequence;
    .locals 0

    .line 1133
    invoke-virtual {p0, p1, p2}, Lcom/vladsch/flexmark/util/sequence/BasedSequenceImpl;->startsWith(Ljava/lang/CharSequence;Z)Z

    move-result p2

    if-nez p2, :cond_0

    return-object p0

    :cond_0
    invoke-interface {p1}, Ljava/lang/CharSequence;->length()I

    move-result p1

    invoke-virtual {p0}, Lcom/vladsch/flexmark/util/sequence/BasedSequenceImpl;->length()I

    move-result p2

    invoke-virtual {p0, p1, p2}, Lcom/vladsch/flexmark/util/sequence/BasedSequenceImpl;->subSequence(II)Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    move-result-object p1

    return-object p1
.end method

.method public removePrefixIgnoreCase(Ljava/lang/CharSequence;)Lcom/vladsch/flexmark/util/sequence/BasedSequence;
    .locals 1

    .line 1103
    invoke-virtual {p0, p1}, Lcom/vladsch/flexmark/util/sequence/BasedSequenceImpl;->startsWithIgnoreCase(Ljava/lang/CharSequence;)Z

    move-result v0

    if-nez v0, :cond_0

    return-object p0

    :cond_0
    invoke-interface {p1}, Ljava/lang/CharSequence;->length()I

    move-result p1

    invoke-virtual {p0}, Lcom/vladsch/flexmark/util/sequence/BasedSequenceImpl;->length()I

    move-result v0

    invoke-virtual {p0, p1, v0}, Lcom/vladsch/flexmark/util/sequence/BasedSequenceImpl;->subSequence(II)Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    move-result-object p1

    return-object p1
.end method

.method public removeProperPrefix(Ljava/lang/CharSequence;)Lcom/vladsch/flexmark/util/sequence/BasedSequence;
    .locals 2

    .line 1083
    invoke-virtual {p0}, Lcom/vladsch/flexmark/util/sequence/BasedSequenceImpl;->length()I

    move-result v0

    invoke-interface {p1}, Ljava/lang/CharSequence;->length()I

    move-result v1

    if-le v0, v1, :cond_1

    invoke-virtual {p0, p1}, Lcom/vladsch/flexmark/util/sequence/BasedSequenceImpl;->startsWith(Ljava/lang/CharSequence;)Z

    move-result v0

    if-nez v0, :cond_0

    goto :goto_0

    :cond_0
    invoke-interface {p1}, Ljava/lang/CharSequence;->length()I

    move-result p1

    invoke-virtual {p0}, Lcom/vladsch/flexmark/util/sequence/BasedSequenceImpl;->length()I

    move-result v0

    invoke-virtual {p0, p1, v0}, Lcom/vladsch/flexmark/util/sequence/BasedSequenceImpl;->subSequence(II)Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    move-result-object p1

    return-object p1

    :cond_1
    :goto_0
    return-object p0
.end method

.method public removeProperPrefix(Ljava/lang/CharSequence;Z)Lcom/vladsch/flexmark/util/sequence/BasedSequence;
    .locals 2

    .line 1143
    invoke-virtual {p0}, Lcom/vladsch/flexmark/util/sequence/BasedSequenceImpl;->length()I

    move-result v0

    invoke-interface {p1}, Ljava/lang/CharSequence;->length()I

    move-result v1

    if-le v0, v1, :cond_1

    invoke-virtual {p0, p1, p2}, Lcom/vladsch/flexmark/util/sequence/BasedSequenceImpl;->startsWith(Ljava/lang/CharSequence;Z)Z

    move-result p2

    if-nez p2, :cond_0

    goto :goto_0

    :cond_0
    invoke-interface {p1}, Ljava/lang/CharSequence;->length()I

    move-result p1

    invoke-virtual {p0}, Lcom/vladsch/flexmark/util/sequence/BasedSequenceImpl;->length()I

    move-result p2

    invoke-virtual {p0, p1, p2}, Lcom/vladsch/flexmark/util/sequence/BasedSequenceImpl;->subSequence(II)Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    move-result-object p1

    return-object p1

    :cond_1
    :goto_0
    return-object p0
.end method

.method public removeProperPrefixIgnoreCase(Ljava/lang/CharSequence;)Lcom/vladsch/flexmark/util/sequence/BasedSequence;
    .locals 2

    .line 1113
    invoke-virtual {p0}, Lcom/vladsch/flexmark/util/sequence/BasedSequenceImpl;->length()I

    move-result v0

    invoke-interface {p1}, Ljava/lang/CharSequence;->length()I

    move-result v1

    if-le v0, v1, :cond_1

    invoke-virtual {p0, p1}, Lcom/vladsch/flexmark/util/sequence/BasedSequenceImpl;->startsWithIgnoreCase(Ljava/lang/CharSequence;)Z

    move-result v0

    if-nez v0, :cond_0

    goto :goto_0

    :cond_0
    invoke-interface {p1}, Ljava/lang/CharSequence;->length()I

    move-result p1

    invoke-virtual {p0}, Lcom/vladsch/flexmark/util/sequence/BasedSequenceImpl;->length()I

    move-result v0

    invoke-virtual {p0, p1, v0}, Lcom/vladsch/flexmark/util/sequence/BasedSequenceImpl;->subSequence(II)Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    move-result-object p1

    return-object p1

    :cond_1
    :goto_0
    return-object p0
.end method

.method public removeProperSuffix(Ljava/lang/CharSequence;)Lcom/vladsch/flexmark/util/sequence/BasedSequence;
    .locals 2

    .line 1078
    invoke-virtual {p0}, Lcom/vladsch/flexmark/util/sequence/BasedSequenceImpl;->length()I

    move-result v0

    invoke-interface {p1}, Ljava/lang/CharSequence;->length()I

    move-result v1

    if-le v0, v1, :cond_1

    invoke-virtual {p0, p1}, Lcom/vladsch/flexmark/util/sequence/BasedSequenceImpl;->endsWith(Ljava/lang/CharSequence;)Z

    move-result v0

    if-nez v0, :cond_0

    goto :goto_0

    :cond_0
    invoke-virtual {p0}, Lcom/vladsch/flexmark/util/sequence/BasedSequenceImpl;->length()I

    move-result v0

    invoke-interface {p1}, Ljava/lang/CharSequence;->length()I

    move-result p1

    sub-int/2addr v0, p1

    const/4 p1, 0x0

    invoke-virtual {p0, p1, v0}, Lcom/vladsch/flexmark/util/sequence/BasedSequenceImpl;->subSequence(II)Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    move-result-object p1

    return-object p1

    :cond_1
    :goto_0
    return-object p0
.end method

.method public removeProperSuffix(Ljava/lang/CharSequence;Z)Lcom/vladsch/flexmark/util/sequence/BasedSequence;
    .locals 2

    .line 1138
    invoke-virtual {p0}, Lcom/vladsch/flexmark/util/sequence/BasedSequenceImpl;->length()I

    move-result v0

    invoke-interface {p1}, Ljava/lang/CharSequence;->length()I

    move-result v1

    if-le v0, v1, :cond_1

    invoke-virtual {p0, p1, p2}, Lcom/vladsch/flexmark/util/sequence/BasedSequenceImpl;->endsWith(Ljava/lang/CharSequence;Z)Z

    move-result p2

    if-nez p2, :cond_0

    goto :goto_0

    :cond_0
    invoke-virtual {p0}, Lcom/vladsch/flexmark/util/sequence/BasedSequenceImpl;->length()I

    move-result p2

    invoke-interface {p1}, Ljava/lang/CharSequence;->length()I

    move-result p1

    sub-int/2addr p2, p1

    const/4 p1, 0x0

    invoke-virtual {p0, p1, p2}, Lcom/vladsch/flexmark/util/sequence/BasedSequenceImpl;->subSequence(II)Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    move-result-object p1

    return-object p1

    :cond_1
    :goto_0
    return-object p0
.end method

.method public removeProperSuffixIgnoreCase(Ljava/lang/CharSequence;)Lcom/vladsch/flexmark/util/sequence/BasedSequence;
    .locals 2

    .line 1108
    invoke-virtual {p0}, Lcom/vladsch/flexmark/util/sequence/BasedSequenceImpl;->length()I

    move-result v0

    invoke-interface {p1}, Ljava/lang/CharSequence;->length()I

    move-result v1

    if-le v0, v1, :cond_1

    invoke-virtual {p0, p1}, Lcom/vladsch/flexmark/util/sequence/BasedSequenceImpl;->endsWithIgnoreCase(Ljava/lang/CharSequence;)Z

    move-result v0

    if-nez v0, :cond_0

    goto :goto_0

    :cond_0
    invoke-virtual {p0}, Lcom/vladsch/flexmark/util/sequence/BasedSequenceImpl;->length()I

    move-result v0

    invoke-interface {p1}, Ljava/lang/CharSequence;->length()I

    move-result p1

    sub-int/2addr v0, p1

    const/4 p1, 0x0

    invoke-virtual {p0, p1, v0}, Lcom/vladsch/flexmark/util/sequence/BasedSequenceImpl;->subSequence(II)Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    move-result-object p1

    return-object p1

    :cond_1
    :goto_0
    return-object p0
.end method

.method public removeSuffix(Ljava/lang/CharSequence;)Lcom/vladsch/flexmark/util/sequence/BasedSequence;
    .locals 1

    .line 1068
    invoke-virtual {p0, p1}, Lcom/vladsch/flexmark/util/sequence/BasedSequenceImpl;->endsWith(Ljava/lang/CharSequence;)Z

    move-result v0

    if-nez v0, :cond_0

    return-object p0

    :cond_0
    invoke-virtual {p0}, Lcom/vladsch/flexmark/util/sequence/BasedSequenceImpl;->length()I

    move-result v0

    invoke-interface {p1}, Ljava/lang/CharSequence;->length()I

    move-result p1

    sub-int/2addr v0, p1

    const/4 p1, 0x0

    invoke-virtual {p0, p1, v0}, Lcom/vladsch/flexmark/util/sequence/BasedSequenceImpl;->subSequence(II)Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    move-result-object p1

    return-object p1
.end method

.method public removeSuffix(Ljava/lang/CharSequence;Z)Lcom/vladsch/flexmark/util/sequence/BasedSequence;
    .locals 0

    .line 1128
    invoke-virtual {p0, p1, p2}, Lcom/vladsch/flexmark/util/sequence/BasedSequenceImpl;->endsWith(Ljava/lang/CharSequence;Z)Z

    move-result p2

    if-nez p2, :cond_0

    return-object p0

    :cond_0
    invoke-virtual {p0}, Lcom/vladsch/flexmark/util/sequence/BasedSequenceImpl;->length()I

    move-result p2

    invoke-interface {p1}, Ljava/lang/CharSequence;->length()I

    move-result p1

    sub-int/2addr p2, p1

    const/4 p1, 0x0

    invoke-virtual {p0, p1, p2}, Lcom/vladsch/flexmark/util/sequence/BasedSequenceImpl;->subSequence(II)Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    move-result-object p1

    return-object p1
.end method

.method public removeSuffixIgnoreCase(Ljava/lang/CharSequence;)Lcom/vladsch/flexmark/util/sequence/BasedSequence;
    .locals 1

    .line 1098
    invoke-virtual {p0, p1}, Lcom/vladsch/flexmark/util/sequence/BasedSequenceImpl;->endsWithIgnoreCase(Ljava/lang/CharSequence;)Z

    move-result v0

    if-nez v0, :cond_0

    return-object p0

    :cond_0
    invoke-virtual {p0}, Lcom/vladsch/flexmark/util/sequence/BasedSequenceImpl;->length()I

    move-result v0

    invoke-interface {p1}, Ljava/lang/CharSequence;->length()I

    move-result p1

    sub-int/2addr v0, p1

    const/4 p1, 0x0

    invoke-virtual {p0, p1, v0}, Lcom/vladsch/flexmark/util/sequence/BasedSequenceImpl;->subSequence(II)Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    move-result-object p1

    return-object p1
.end method

.method public replace(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Lcom/vladsch/flexmark/util/sequence/BasedSequence;
    .locals 6

    .line 1605
    invoke-virtual {p0, p1}, Lcom/vladsch/flexmark/util/sequence/BasedSequenceImpl;->indexOfAll(Ljava/lang/CharSequence;)[I

    move-result-object v0

    .line 1606
    array-length v1, v0

    if-nez v1, :cond_0

    return-object p0

    .line 1608
    :cond_0
    array-length v1, v0

    .line 1609
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-virtual {p0}, Lcom/vladsch/flexmark/util/sequence/BasedSequenceImpl;->length()I

    move-result v3

    invoke-interface {p2}, Ljava/lang/CharSequence;->length()I

    move-result v4

    invoke-interface {p1}, Ljava/lang/CharSequence;->length()I

    move-result v5

    sub-int/2addr v4, v5

    mul-int v4, v4, v1

    add-int/2addr v3, v4

    invoke-direct {v2, v3}, Ljava/lang/StringBuilder;-><init>(I)V

    .line 1610
    invoke-static {p2}, Lcom/vladsch/flexmark/util/sequence/SubSequence;->of(Ljava/lang/CharSequence;)Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    move-result-object p2

    const/4 v3, 0x0

    const/4 v4, 0x0

    :goto_0
    if-ge v3, v1, :cond_2

    add-int/lit8 v5, v3, 0x1

    .line 1614
    aget v3, v0, v3

    if-ge v4, v3, :cond_1

    .line 1615
    invoke-virtual {p0, v2, v4, v3}, Lcom/vladsch/flexmark/util/sequence/BasedSequenceImpl;->appendTo(Ljava/lang/StringBuilder;II)Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    .line 1616
    :cond_1
    invoke-interface {p1}, Ljava/lang/CharSequence;->length()I

    move-result v4

    add-int/2addr v4, v3

    .line 1617
    invoke-interface {p2, v2}, Lcom/vladsch/flexmark/util/sequence/BasedSequence;->appendTo(Ljava/lang/StringBuilder;)Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    move v3, v5

    goto :goto_0

    .line 1620
    :cond_2
    invoke-virtual {p0}, Lcom/vladsch/flexmark/util/sequence/BasedSequenceImpl;->length()I

    move-result p1

    if-ge v4, p1, :cond_3

    .line 1621
    invoke-virtual {p0}, Lcom/vladsch/flexmark/util/sequence/BasedSequenceImpl;->length()I

    move-result p1

    invoke-virtual {p0, v2, v4, p1}, Lcom/vladsch/flexmark/util/sequence/BasedSequenceImpl;->appendTo(Ljava/lang/StringBuilder;II)Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    .line 1624
    :cond_3
    invoke-static {v2}, Lcom/vladsch/flexmark/util/sequence/CharSubSequence;->of(Ljava/lang/CharSequence;)Lcom/vladsch/flexmark/util/sequence/CharSubSequence;

    move-result-object p1

    return-object p1
.end method

.method public spliceAtEnd(Lcom/vladsch/flexmark/util/sequence/BasedSequence;)Lcom/vladsch/flexmark/util/sequence/BasedSequence;
    .locals 1

    .line 1382
    invoke-interface {p1}, Lcom/vladsch/flexmark/util/sequence/BasedSequence;->isEmpty()Z

    move-result v0

    if-eqz v0, :cond_0

    return-object p0

    .line 1384
    :cond_0
    invoke-virtual {p0}, Lcom/vladsch/flexmark/util/sequence/BasedSequenceImpl;->isEmpty()Z

    move-result v0

    if-eqz v0, :cond_1

    return-object p1

    .line 1388
    :cond_1
    invoke-virtual {p0}, Lcom/vladsch/flexmark/util/sequence/BasedSequenceImpl;->getStartOffset()I

    move-result v0

    invoke-interface {p1}, Lcom/vladsch/flexmark/util/sequence/BasedSequence;->getEndOffset()I

    move-result p1

    invoke-virtual {p0, v0, p1}, Lcom/vladsch/flexmark/util/sequence/BasedSequenceImpl;->baseSubSequence(II)Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    move-result-object p1

    return-object p1
.end method

.method public split(C)[Lcom/vladsch/flexmark/util/sequence/BasedSequence;
    .locals 1

    const/4 v0, 0x0

    .line 1427
    invoke-virtual {p0, p1, v0}, Lcom/vladsch/flexmark/util/sequence/BasedSequenceImpl;->split(CI)[Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    move-result-object p1

    return-object p1
.end method

.method public split(CI)[Lcom/vladsch/flexmark/util/sequence/BasedSequence;
    .locals 1

    const/4 v0, 0x0

    .line 1432
    invoke-virtual {p0, p1, p2, v0}, Lcom/vladsch/flexmark/util/sequence/BasedSequenceImpl;->split(CII)[Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    move-result-object p1

    return-object p1
.end method

.method public split(CII)[Lcom/vladsch/flexmark/util/sequence/BasedSequence;
    .locals 1

    .line 1437
    const-string v0, " \t\r\n"

    invoke-virtual {p0, p1, p2, p3, v0}, Lcom/vladsch/flexmark/util/sequence/BasedSequenceImpl;->split(CIILjava/lang/String;)[Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    move-result-object p1

    return-object p1
.end method

.method public split(CIILjava/lang/String;)[Lcom/vladsch/flexmark/util/sequence/BasedSequence;
    .locals 9

    if-nez p4, :cond_0

    .line 1457
    const-string p4, " \t\r\n"

    :cond_0
    const/4 v0, 0x1

    if-ge p2, v0, :cond_1

    const p2, 0x7fffffff

    :cond_1
    and-int/lit8 v1, p3, 0x8

    const/4 v2, 0x0

    if-eqz v1, :cond_2

    const/4 v1, 0x1

    goto :goto_0

    :cond_2
    const/4 v1, 0x0

    :goto_0
    if-nez v1, :cond_3

    and-int/lit8 v3, p3, 0x1

    if-eqz v3, :cond_3

    const/4 v3, 0x1

    goto :goto_1

    :cond_3
    const/4 v3, 0x0

    :goto_1
    and-int/lit8 v4, p3, 0x2

    if-eqz v4, :cond_4

    const/4 v4, 0x1

    goto :goto_2

    :cond_4
    const/4 v4, 0x0

    :goto_2
    and-int/lit8 p3, p3, 0x4

    if-eqz p3, :cond_5

    const/4 p3, 0x1

    goto :goto_3

    :cond_5
    const/4 p3, 0x0

    .line 1464
    :goto_3
    new-instance v5, Ljava/util/ArrayList;

    invoke-direct {v5}, Ljava/util/ArrayList;-><init>()V

    .line 1467
    invoke-virtual {p0}, Lcom/vladsch/flexmark/util/sequence/BasedSequenceImpl;->length()I

    move-result v6

    if-le p2, v0, :cond_c

    :goto_4
    if-ge v2, v6, :cond_c

    .line 1470
    invoke-virtual {p0, p1, v2}, Lcom/vladsch/flexmark/util/sequence/BasedSequenceImpl;->indexOf(CI)I

    move-result v7

    if-gez v7, :cond_6

    goto :goto_5

    :cond_6
    if-lt v2, v7, :cond_7

    if-nez p3, :cond_b

    :cond_7
    add-int v8, v7, v3

    .line 1474
    invoke-virtual {p0, v2, v8}, Lcom/vladsch/flexmark/util/sequence/BasedSequenceImpl;->subSequence(II)Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    move-result-object v2

    if-eqz v4, :cond_8

    .line 1475
    invoke-interface {v2, p4}, Lcom/vladsch/flexmark/util/sequence/BasedSequence;->trim(Ljava/lang/CharSequence;)Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    move-result-object v2

    .line 1476
    :cond_8
    invoke-interface {v2}, Lcom/vladsch/flexmark/util/sequence/BasedSequence;->isEmpty()Z

    move-result v8

    if-eqz v8, :cond_9

    if-nez p3, :cond_b

    .line 1477
    :cond_9
    invoke-virtual {v5, v2}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    if-eqz v1, :cond_a

    add-int/lit8 v2, v7, 0x1

    .line 1479
    invoke-virtual {p0, v7, v2}, Lcom/vladsch/flexmark/util/sequence/BasedSequenceImpl;->subSequence(II)Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    move-result-object v2

    invoke-virtual {v5, v2}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 1481
    :cond_a
    invoke-virtual {v5}, Ljava/util/ArrayList;->size()I

    move-result v2

    add-int/lit8 v8, p2, -0x1

    if-lt v2, v8, :cond_b

    add-int/lit8 v2, v7, 0x1

    goto :goto_5

    :cond_b
    add-int/lit8 v2, v7, 0x1

    goto :goto_4

    :cond_c
    :goto_5
    if-ge v2, v6, :cond_f

    .line 1492
    invoke-virtual {p0, v2, v6}, Lcom/vladsch/flexmark/util/sequence/BasedSequenceImpl;->subSequence(II)Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    move-result-object p1

    if-eqz v4, :cond_d

    .line 1493
    invoke-interface {p1, p4}, Lcom/vladsch/flexmark/util/sequence/BasedSequence;->trim(Ljava/lang/CharSequence;)Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    move-result-object p1

    .line 1494
    :cond_d
    invoke-interface {p1}, Lcom/vladsch/flexmark/util/sequence/BasedSequence;->isEmpty()Z

    move-result p2

    if-eqz p2, :cond_e

    if-nez p3, :cond_f

    .line 1495
    :cond_e
    invoke-virtual {v5, p1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 1498
    :cond_f
    invoke-virtual {v5}, Ljava/util/ArrayList;->size()I

    move-result p1

    new-array p1, p1, [Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    invoke-virtual {v5, p1}, Ljava/util/ArrayList;->toArray([Ljava/lang/Object;)[Ljava/lang/Object;

    move-result-object p1

    check-cast p1, [Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    return-object p1
.end method

.method public split(Ljava/lang/CharSequence;)[Lcom/vladsch/flexmark/util/sequence/BasedSequence;
    .locals 1

    const/4 v0, 0x0

    .line 1442
    invoke-virtual {p0, p1, v0}, Lcom/vladsch/flexmark/util/sequence/BasedSequenceImpl;->split(Ljava/lang/CharSequence;I)[Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    move-result-object p1

    return-object p1
.end method

.method public split(Ljava/lang/CharSequence;I)[Lcom/vladsch/flexmark/util/sequence/BasedSequence;
    .locals 1

    const/4 v0, 0x0

    .line 1447
    invoke-virtual {p0, p1, p2, v0}, Lcom/vladsch/flexmark/util/sequence/BasedSequenceImpl;->split(Ljava/lang/CharSequence;II)[Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    move-result-object p1

    return-object p1
.end method

.method public split(Ljava/lang/CharSequence;II)[Lcom/vladsch/flexmark/util/sequence/BasedSequence;
    .locals 1

    .line 1452
    const-string v0, " \t\r\n"

    invoke-virtual {p0, p1, p2, p3, v0}, Lcom/vladsch/flexmark/util/sequence/BasedSequenceImpl;->split(Ljava/lang/CharSequence;IILjava/lang/String;)[Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    move-result-object p1

    return-object p1
.end method

.method public split(Ljava/lang/CharSequence;IILjava/lang/String;)[Lcom/vladsch/flexmark/util/sequence/BasedSequence;
    .locals 9

    if-nez p4, :cond_0

    .line 1503
    const-string p4, " \t\r\n"

    :cond_0
    const/4 v0, 0x1

    if-ge p2, v0, :cond_1

    const p2, 0x7fffffff

    :cond_1
    and-int/lit8 v1, p3, 0x8

    const/4 v2, 0x0

    if-eqz v1, :cond_2

    const/4 v1, 0x1

    goto :goto_0

    :cond_2
    const/4 v1, 0x0

    :goto_0
    if-nez v1, :cond_3

    and-int/lit8 v3, p3, 0x1

    if-eqz v3, :cond_3

    .line 1507
    invoke-interface {p1}, Ljava/lang/CharSequence;->length()I

    move-result v3

    goto :goto_1

    :cond_3
    const/4 v3, 0x0

    :goto_1
    and-int/lit8 v4, p3, 0x2

    if-eqz v4, :cond_4

    const/4 v4, 0x1

    goto :goto_2

    :cond_4
    const/4 v4, 0x0

    :goto_2
    and-int/lit8 p3, p3, 0x4

    if-eqz p3, :cond_5

    const/4 p3, 0x1

    goto :goto_3

    :cond_5
    const/4 p3, 0x0

    .line 1510
    :goto_3
    new-instance v5, Ljava/util/ArrayList;

    invoke-direct {v5}, Ljava/util/ArrayList;-><init>()V

    .line 1513
    invoke-virtual {p0}, Lcom/vladsch/flexmark/util/sequence/BasedSequenceImpl;->length()I

    move-result v6

    if-le p2, v0, :cond_c

    :goto_4
    if-ge v2, v6, :cond_c

    .line 1516
    invoke-virtual {p0, p1, v2}, Lcom/vladsch/flexmark/util/sequence/BasedSequenceImpl;->indexOf(Ljava/lang/CharSequence;I)I

    move-result v7

    if-gez v7, :cond_6

    goto :goto_5

    :cond_6
    if-lt v2, v7, :cond_7

    if-nez p3, :cond_b

    :cond_7
    add-int v8, v7, v3

    .line 1520
    invoke-virtual {p0, v2, v8}, Lcom/vladsch/flexmark/util/sequence/BasedSequenceImpl;->subSequence(II)Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    move-result-object v2

    if-eqz v4, :cond_8

    .line 1521
    invoke-interface {v2, p4}, Lcom/vladsch/flexmark/util/sequence/BasedSequence;->trim(Ljava/lang/CharSequence;)Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    move-result-object v2

    .line 1522
    :cond_8
    invoke-interface {v2}, Lcom/vladsch/flexmark/util/sequence/BasedSequence;->isEmpty()Z

    move-result v8

    if-eqz v8, :cond_9

    if-nez p3, :cond_b

    .line 1523
    :cond_9
    invoke-virtual {v5, v2}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    if-eqz v1, :cond_a

    .line 1525
    invoke-interface {p1}, Ljava/lang/CharSequence;->length()I

    move-result v2

    add-int/2addr v2, v7

    invoke-virtual {p0, v7, v2}, Lcom/vladsch/flexmark/util/sequence/BasedSequenceImpl;->subSequence(II)Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    move-result-object v2

    invoke-virtual {v5, v2}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 1527
    :cond_a
    invoke-virtual {v5}, Ljava/util/ArrayList;->size()I

    move-result v2

    add-int/lit8 v8, p2, -0x1

    if-lt v2, v8, :cond_b

    add-int/lit8 v2, v7, 0x1

    goto :goto_5

    :cond_b
    add-int/lit8 v2, v7, 0x1

    goto :goto_4

    :cond_c
    :goto_5
    if-ge v2, v6, :cond_f

    .line 1538
    invoke-virtual {p0, v2, v6}, Lcom/vladsch/flexmark/util/sequence/BasedSequenceImpl;->subSequence(II)Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    move-result-object p1

    if-eqz v4, :cond_d

    .line 1539
    invoke-interface {p1, p4}, Lcom/vladsch/flexmark/util/sequence/BasedSequence;->trim(Ljava/lang/CharSequence;)Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    move-result-object p1

    .line 1540
    :cond_d
    invoke-interface {p1}, Lcom/vladsch/flexmark/util/sequence/BasedSequence;->isEmpty()Z

    move-result p2

    if-eqz p2, :cond_e

    if-nez p3, :cond_f

    .line 1541
    :cond_e
    invoke-virtual {v5, p1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 1544
    :cond_f
    invoke-virtual {v5}, Ljava/util/ArrayList;->size()I

    move-result p1

    new-array p1, p1, [Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    invoke-virtual {v5, p1}, Ljava/util/ArrayList;->toArray([Ljava/lang/Object;)[Ljava/lang/Object;

    move-result-object p1

    check-cast p1, [Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    return-object p1
.end method

.method public startOfDelimitedBy(Ljava/lang/CharSequence;I)I
    .locals 2

    const/4 v0, 0x0

    if-gez p2, :cond_0

    const/4 p2, 0x0

    goto :goto_0

    .line 542
    :cond_0
    invoke-virtual {p0}, Lcom/vladsch/flexmark/util/sequence/BasedSequenceImpl;->length()I

    move-result v1

    if-le p2, v1, :cond_1

    invoke-virtual {p0}, Lcom/vladsch/flexmark/util/sequence/BasedSequenceImpl;->length()I

    move-result p2

    :cond_1
    :goto_0
    add-int/lit8 p2, p2, -0x1

    .line 543
    invoke-virtual {p0, p1, p2}, Lcom/vladsch/flexmark/util/sequence/BasedSequenceImpl;->lastIndexOf(Ljava/lang/CharSequence;I)I

    move-result p1

    const/4 p2, -0x1

    if-ne p1, p2, :cond_2

    return v0

    :cond_2
    add-int/lit8 p1, p1, 0x1

    return p1
.end method

.method public startOfDelimitedByAny(Ljava/lang/CharSequence;I)I
    .locals 2

    const/4 v0, 0x0

    if-gez p2, :cond_0

    const/4 p2, 0x0

    goto :goto_0

    .line 550
    :cond_0
    invoke-virtual {p0}, Lcom/vladsch/flexmark/util/sequence/BasedSequenceImpl;->length()I

    move-result v1

    if-le p2, v1, :cond_1

    invoke-virtual {p0}, Lcom/vladsch/flexmark/util/sequence/BasedSequenceImpl;->length()I

    move-result p2

    :cond_1
    :goto_0
    add-int/lit8 p2, p2, -0x1

    .line 551
    invoke-virtual {p0, p1, p2}, Lcom/vladsch/flexmark/util/sequence/BasedSequenceImpl;->lastIndexOfAny(Ljava/lang/CharSequence;I)I

    move-result p1

    const/4 p2, -0x1

    if-ne p1, p2, :cond_2

    return v0

    :cond_2
    add-int/lit8 p1, p1, 0x1

    return p1
.end method

.method public startOfDelimitedByAnyNot(Ljava/lang/CharSequence;I)I
    .locals 2

    const/4 v0, 0x0

    if-gez p2, :cond_0

    const/4 p2, 0x0

    goto :goto_0

    .line 558
    :cond_0
    invoke-virtual {p0}, Lcom/vladsch/flexmark/util/sequence/BasedSequenceImpl;->length()I

    move-result v1

    if-le p2, v1, :cond_1

    invoke-virtual {p0}, Lcom/vladsch/flexmark/util/sequence/BasedSequenceImpl;->length()I

    move-result p2

    :cond_1
    :goto_0
    add-int/lit8 p2, p2, -0x1

    .line 559
    invoke-virtual {p0, p1, p2}, Lcom/vladsch/flexmark/util/sequence/BasedSequenceImpl;->lastIndexOfAnyNot(Ljava/lang/CharSequence;I)I

    move-result p1

    const/4 p2, -0x1

    if-ne p1, p2, :cond_2

    return v0

    :cond_2
    add-int/lit8 p1, p1, 0x1

    return p1
.end method

.method public startOfLine(I)I
    .locals 1

    .line 599
    sget-object v0, Lcom/vladsch/flexmark/util/sequence/BasedSequenceImpl;->EOL:Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    invoke-virtual {p0, v0, p1}, Lcom/vladsch/flexmark/util/sequence/BasedSequenceImpl;->startOfDelimitedBy(Ljava/lang/CharSequence;I)I

    move-result p1

    return p1
.end method

.method public startOfLineAnyEOL(I)I
    .locals 1

    .line 604
    const-string v0, "\r\n"

    invoke-virtual {p0, v0, p1}, Lcom/vladsch/flexmark/util/sequence/BasedSequenceImpl;->startOfDelimitedByAny(Ljava/lang/CharSequence;I)I

    move-result p1

    return p1
.end method

.method public startsWith(Ljava/lang/CharSequence;)Z
    .locals 2

    .line 1063
    invoke-virtual {p0}, Lcom/vladsch/flexmark/util/sequence/BasedSequenceImpl;->length()I

    move-result v0

    const/4 v1, 0x0

    if-lez v0, :cond_0

    invoke-virtual {p0, p1, v1, v1}, Lcom/vladsch/flexmark/util/sequence/BasedSequenceImpl;->matchChars(Ljava/lang/CharSequence;IZ)Z

    move-result p1

    if-eqz p1, :cond_0

    const/4 p1, 0x1

    return p1

    :cond_0
    return v1
.end method

.method public startsWith(Ljava/lang/CharSequence;Z)Z
    .locals 2

    .line 1123
    invoke-virtual {p0}, Lcom/vladsch/flexmark/util/sequence/BasedSequenceImpl;->length()I

    move-result v0

    const/4 v1, 0x0

    if-lez v0, :cond_0

    invoke-virtual {p0, p1, v1, p2}, Lcom/vladsch/flexmark/util/sequence/BasedSequenceImpl;->matchChars(Ljava/lang/CharSequence;IZ)Z

    move-result p1

    if-eqz p1, :cond_0

    const/4 p1, 0x1

    return p1

    :cond_0
    return v1
.end method

.method public startsWithIgnoreCase(Ljava/lang/CharSequence;)Z
    .locals 2

    .line 1093
    invoke-virtual {p0}, Lcom/vladsch/flexmark/util/sequence/BasedSequenceImpl;->length()I

    move-result v0

    const/4 v1, 0x0

    if-lez v0, :cond_0

    const/4 v0, 0x1

    invoke-virtual {p0, p1, v1, v0}, Lcom/vladsch/flexmark/util/sequence/BasedSequenceImpl;->matchChars(Ljava/lang/CharSequence;IZ)Z

    move-result p1

    if-eqz p1, :cond_0

    return v0

    :cond_0
    return v1
.end method

.method public subSequence(I)Lcom/vladsch/flexmark/util/sequence/BasedSequence;
    .locals 1

    .line 1266
    invoke-virtual {p0}, Lcom/vladsch/flexmark/util/sequence/BasedSequenceImpl;->length()I

    move-result v0

    invoke-virtual {p0, p1, v0}, Lcom/vladsch/flexmark/util/sequence/BasedSequenceImpl;->subSequence(II)Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    move-result-object p1

    return-object p1
.end method

.method public subSequence(Lcom/vladsch/flexmark/util/sequence/Range;)Lcom/vladsch/flexmark/util/sequence/BasedSequence;
    .locals 1

    .line 1261
    invoke-virtual {p1}, Lcom/vladsch/flexmark/util/sequence/Range;->getStart()I

    move-result v0

    invoke-virtual {p1}, Lcom/vladsch/flexmark/util/sequence/Range;->getEnd()I

    move-result p1

    invoke-virtual {p0, v0, p1}, Lcom/vladsch/flexmark/util/sequence/BasedSequenceImpl;->subSequence(II)Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    move-result-object p1

    return-object p1
.end method

.method public suffixOf(Lcom/vladsch/flexmark/util/sequence/BasedSequence;)Lcom/vladsch/flexmark/util/sequence/BasedSequence;
    .locals 2

    .line 1419
    invoke-virtual {p0}, Lcom/vladsch/flexmark/util/sequence/BasedSequenceImpl;->getBase()Ljava/lang/Object;

    move-result-object v0

    invoke-interface {p1}, Lcom/vladsch/flexmark/util/sequence/BasedSequence;->getBase()Ljava/lang/Object;

    move-result-object v1

    if-eq v0, v1, :cond_0

    sget-object p1, Lcom/vladsch/flexmark/util/sequence/SubSequence;->NULL:Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    return-object p1

    .line 1420
    :cond_0
    invoke-interface {p1}, Lcom/vladsch/flexmark/util/sequence/BasedSequence;->getEndOffset()I

    move-result v0

    invoke-virtual {p0}, Lcom/vladsch/flexmark/util/sequence/BasedSequenceImpl;->getEndOffset()I

    move-result v1

    if-lt v0, v1, :cond_1

    invoke-virtual {p0}, Lcom/vladsch/flexmark/util/sequence/BasedSequenceImpl;->length()I

    move-result p1

    invoke-virtual {p0}, Lcom/vladsch/flexmark/util/sequence/BasedSequenceImpl;->length()I

    move-result v0

    invoke-virtual {p0, p1, v0}, Lcom/vladsch/flexmark/util/sequence/BasedSequenceImpl;->subSequence(II)Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    move-result-object p1

    return-object p1

    .line 1421
    :cond_1
    invoke-interface {p1}, Lcom/vladsch/flexmark/util/sequence/BasedSequence;->getEndOffset()I

    move-result v0

    invoke-virtual {p0}, Lcom/vladsch/flexmark/util/sequence/BasedSequenceImpl;->getStartOffset()I

    move-result v1

    if-gt v0, v1, :cond_2

    return-object p0

    .line 1422
    :cond_2
    invoke-interface {p1}, Lcom/vladsch/flexmark/util/sequence/BasedSequence;->getEndOffset()I

    move-result p1

    invoke-virtual {p0}, Lcom/vladsch/flexmark/util/sequence/BasedSequenceImpl;->getEndOffset()I

    move-result v0

    invoke-virtual {p0, p1, v0}, Lcom/vladsch/flexmark/util/sequence/BasedSequenceImpl;->baseSubSequence(II)Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    move-result-object p1

    return-object p1
.end method

.method public toLowerCase()Lcom/vladsch/flexmark/util/sequence/MappedSequence;
    .locals 1

    .line 1148
    sget-object v0, Lcom/vladsch/flexmark/util/mappers/LowerCaseMapper;->INSTANCE:Lcom/vladsch/flexmark/util/mappers/LowerCaseMapper;

    invoke-virtual {p0, v0}, Lcom/vladsch/flexmark/util/sequence/BasedSequenceImpl;->toMapped(Lcom/vladsch/flexmark/util/mappers/CharMapper;)Lcom/vladsch/flexmark/util/sequence/MappedSequence;

    move-result-object v0

    return-object v0
.end method

.method public toLowerCase(Ljava/util/Locale;)Lcom/vladsch/flexmark/util/sequence/MappedSequence;
    .locals 1

    .line 1158
    new-instance v0, Lcom/vladsch/flexmark/util/mappers/LowerCaseMapper;

    invoke-direct {v0, p1}, Lcom/vladsch/flexmark/util/mappers/LowerCaseMapper;-><init>(Ljava/util/Locale;)V

    invoke-virtual {p0, v0}, Lcom/vladsch/flexmark/util/sequence/BasedSequenceImpl;->toMapped(Lcom/vladsch/flexmark/util/mappers/CharMapper;)Lcom/vladsch/flexmark/util/sequence/MappedSequence;

    move-result-object p1

    return-object p1
.end method

.method public final toMapped(Lcom/vladsch/flexmark/util/mappers/CharMapper;)Lcom/vladsch/flexmark/util/sequence/MappedSequence;
    .locals 0

    .line 1168
    invoke-static {p1, p0}, Lcom/vladsch/flexmark/util/sequence/MappedSequence;->of(Lcom/vladsch/flexmark/util/mappers/CharMapper;Ljava/lang/CharSequence;)Lcom/vladsch/flexmark/util/sequence/MappedSequence;

    move-result-object p1

    return-object p1
.end method

.method public toString()Ljava/lang/String;
    .locals 4

    .line 1308
    invoke-virtual {p0}, Lcom/vladsch/flexmark/util/sequence/BasedSequenceImpl;->length()I

    move-result v0

    .line 1309
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1, v0}, Ljava/lang/StringBuilder;-><init>(I)V

    const/4 v2, 0x0

    :goto_0
    if-ge v2, v0, :cond_0

    .line 1312
    invoke-virtual {p0, v2}, Lcom/vladsch/flexmark/util/sequence/BasedSequenceImpl;->charAt(I)C

    move-result v3

    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    .line 1315
    :cond_0
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public toUpperCase()Lcom/vladsch/flexmark/util/sequence/MappedSequence;
    .locals 1

    .line 1153
    sget-object v0, Lcom/vladsch/flexmark/util/mappers/UpperCaseMapper;->INSTANCE:Lcom/vladsch/flexmark/util/mappers/UpperCaseMapper;

    invoke-virtual {p0, v0}, Lcom/vladsch/flexmark/util/sequence/BasedSequenceImpl;->toMapped(Lcom/vladsch/flexmark/util/mappers/CharMapper;)Lcom/vladsch/flexmark/util/sequence/MappedSequence;

    move-result-object v0

    return-object v0
.end method

.method public toUpperCase(Ljava/util/Locale;)Lcom/vladsch/flexmark/util/sequence/MappedSequence;
    .locals 1

    .line 1163
    new-instance v0, Lcom/vladsch/flexmark/util/mappers/UpperCaseMapper;

    invoke-direct {v0, p1}, Lcom/vladsch/flexmark/util/mappers/UpperCaseMapper;-><init>(Ljava/util/Locale;)V

    invoke-virtual {p0, v0}, Lcom/vladsch/flexmark/util/sequence/BasedSequenceImpl;->toMapped(Lcom/vladsch/flexmark/util/mappers/CharMapper;)Lcom/vladsch/flexmark/util/sequence/MappedSequence;

    move-result-object p1

    return-object p1
.end method

.method public toVisibleWhitespaceString()Ljava/lang/String;
    .locals 6

    .line 1355
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 1356
    invoke-virtual {p0}, Lcom/vladsch/flexmark/util/sequence/BasedSequenceImpl;->length()I

    move-result v1

    const/4 v2, 0x0

    :goto_0
    if-ge v2, v1, :cond_1

    .line 1358
    invoke-virtual {p0, v2}, Lcom/vladsch/flexmark/util/sequence/BasedSequenceImpl;->charAt(I)C

    move-result v3

    .line 1359
    sget-object v4, Lcom/vladsch/flexmark/util/sequence/BasedSequenceImpl;->visibleSpacesMap:Ljava/util/Map;

    invoke-static {v3}, Ljava/lang/Character;->valueOf(C)Ljava/lang/Character;

    move-result-object v5

    invoke-interface {v4, v5}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Ljava/lang/String;

    if-eqz v4, :cond_0

    .line 1362
    invoke-virtual {v0, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    goto :goto_1

    .line 1364
    :cond_0
    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    :goto_1
    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    .line 1367
    :cond_1
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public trim()Lcom/vladsch/flexmark/util/sequence/BasedSequence;
    .locals 4

    .line 949
    invoke-virtual {p0}, Lcom/vladsch/flexmark/util/sequence/BasedSequenceImpl;->length()I

    move-result v0

    const-string v1, " \t\r\n"

    const/4 v2, 0x0

    invoke-virtual {p0, v1, v2, v0}, Lcom/vladsch/flexmark/util/sequence/BasedSequenceImpl;->countLeading(Ljava/lang/CharSequence;II)I

    move-result v0

    .line 950
    invoke-virtual {p0}, Lcom/vladsch/flexmark/util/sequence/BasedSequenceImpl;->length()I

    move-result v3

    if-ne v0, v3, :cond_0

    .line 951
    invoke-virtual {p0, v0, v0}, Lcom/vladsch/flexmark/util/sequence/BasedSequenceImpl;->subSequence(II)Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    move-result-object v0

    return-object v0

    .line 954
    :cond_0
    invoke-virtual {p0}, Lcom/vladsch/flexmark/util/sequence/BasedSequenceImpl;->length()I

    move-result v3

    invoke-virtual {p0, v1, v2, v3}, Lcom/vladsch/flexmark/util/sequence/BasedSequenceImpl;->countTrailing(Ljava/lang/CharSequence;II)I

    move-result v1

    if-gtz v0, :cond_2

    if-lez v1, :cond_1

    goto :goto_0

    :cond_1
    return-object p0

    .line 955
    :cond_2
    :goto_0
    invoke-virtual {p0}, Lcom/vladsch/flexmark/util/sequence/BasedSequenceImpl;->length()I

    move-result v2

    sub-int/2addr v2, v1

    invoke-virtual {p0, v0, v2}, Lcom/vladsch/flexmark/util/sequence/BasedSequenceImpl;->subSequence(II)Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    move-result-object v0

    return-object v0
.end method

.method public trim(Ljava/lang/CharSequence;)Lcom/vladsch/flexmark/util/sequence/BasedSequence;
    .locals 4

    .line 827
    invoke-virtual {p0}, Lcom/vladsch/flexmark/util/sequence/BasedSequenceImpl;->length()I

    move-result v0

    const/4 v1, 0x0

    invoke-virtual {p0, p1, v1, v0}, Lcom/vladsch/flexmark/util/sequence/BasedSequenceImpl;->countLeading(Ljava/lang/CharSequence;II)I

    move-result v0

    .line 828
    invoke-virtual {p0}, Lcom/vladsch/flexmark/util/sequence/BasedSequenceImpl;->length()I

    move-result v2

    invoke-virtual {p0, p1, v1, v2}, Lcom/vladsch/flexmark/util/sequence/BasedSequenceImpl;->countTrailing(Ljava/lang/CharSequence;II)I

    move-result p1

    add-int v2, v0, p1

    if-lez v2, :cond_1

    .line 830
    invoke-virtual {p0}, Lcom/vladsch/flexmark/util/sequence/BasedSequenceImpl;->length()I

    move-result v3

    if-lt v2, v3, :cond_0

    invoke-virtual {p0, v1, v1}, Lcom/vladsch/flexmark/util/sequence/BasedSequenceImpl;->subSequence(II)Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    move-result-object p1

    return-object p1

    :cond_0
    invoke-virtual {p0}, Lcom/vladsch/flexmark/util/sequence/BasedSequenceImpl;->length()I

    move-result v1

    sub-int/2addr v1, p1

    invoke-virtual {p0, v0, v1}, Lcom/vladsch/flexmark/util/sequence/BasedSequenceImpl;->subSequence(II)Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    move-result-object p1

    return-object p1

    :cond_1
    return-object p0
.end method

.method public trimEOL()Lcom/vladsch/flexmark/util/sequence/BasedSequence;
    .locals 2

    .line 937
    invoke-virtual {p0}, Lcom/vladsch/flexmark/util/sequence/BasedSequenceImpl;->eolLength()I

    move-result v0

    if-lez v0, :cond_0

    .line 938
    invoke-virtual {p0}, Lcom/vladsch/flexmark/util/sequence/BasedSequenceImpl;->length()I

    move-result v1

    sub-int/2addr v1, v0

    const/4 v0, 0x0

    invoke-virtual {p0, v0, v1}, Lcom/vladsch/flexmark/util/sequence/BasedSequenceImpl;->subSequence(II)Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    move-result-object v0

    return-object v0

    :cond_0
    return-object p0
.end method

.method public trimEnd()Lcom/vladsch/flexmark/util/sequence/BasedSequence;
    .locals 2

    const/4 v0, 0x0

    .line 865
    const-string v1, " \t\r\n"

    invoke-virtual {p0, v0, v1}, Lcom/vladsch/flexmark/util/sequence/BasedSequenceImpl;->trimEnd(ILjava/lang/CharSequence;)Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    move-result-object v0

    return-object v0
.end method

.method public trimEnd(I)Lcom/vladsch/flexmark/util/sequence/BasedSequence;
    .locals 1

    .line 845
    const-string v0, " \t\r\n"

    invoke-virtual {p0, p1, v0}, Lcom/vladsch/flexmark/util/sequence/BasedSequenceImpl;->trimEnd(ILjava/lang/CharSequence;)Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    move-result-object p1

    return-object p1
.end method

.method public trimEnd(ILjava/lang/CharSequence;)Lcom/vladsch/flexmark/util/sequence/BasedSequence;
    .locals 2

    .line 795
    invoke-virtual {p0}, Lcom/vladsch/flexmark/util/sequence/BasedSequenceImpl;->length()I

    move-result v0

    const/4 v1, 0x0

    invoke-virtual {p0, p2, v1, v0}, Lcom/vladsch/flexmark/util/sequence/BasedSequenceImpl;->countTrailing(Ljava/lang/CharSequence;II)I

    move-result p2

    invoke-virtual {p0}, Lcom/vladsch/flexmark/util/sequence/BasedSequenceImpl;->length()I

    move-result v0

    sub-int/2addr v0, p1

    filled-new-array {v0}, [I

    move-result-object p1

    invoke-static {p2, p1}, Lcom/vladsch/flexmark/util/Utils;->maxLimit(I[I)I

    move-result p1

    if-lez p1, :cond_0

    .line 796
    invoke-virtual {p0}, Lcom/vladsch/flexmark/util/sequence/BasedSequenceImpl;->length()I

    move-result p2

    sub-int/2addr p2, p1

    invoke-virtual {p0, v1, p2}, Lcom/vladsch/flexmark/util/sequence/BasedSequenceImpl;->subSequence(II)Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    move-result-object p1

    return-object p1

    :cond_0
    return-object p0
.end method

.method public trimEnd(Ljava/lang/CharSequence;)Lcom/vladsch/flexmark/util/sequence/BasedSequence;
    .locals 1

    const/4 v0, 0x0

    .line 817
    invoke-virtual {p0, v0, p1}, Lcom/vladsch/flexmark/util/sequence/BasedSequenceImpl;->trimEnd(ILjava/lang/CharSequence;)Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    move-result-object p1

    return-object p1
.end method

.method public trimLeadBlankLines()Lcom/vladsch/flexmark/util/sequence/BasedSequence;
    .locals 5

    .line 1292
    invoke-virtual {p0}, Lcom/vladsch/flexmark/util/sequence/BasedSequenceImpl;->length()I

    move-result v0

    const/4 v1, 0x0

    const/4 v2, 0x0

    :goto_0
    if-ge v1, v0, :cond_2

    .line 1297
    invoke-virtual {p0, v1}, Lcom/vladsch/flexmark/util/sequence/BasedSequenceImpl;->charAt(I)C

    move-result v3

    const/16 v4, 0xa

    if-ne v3, v4, :cond_0

    add-int/lit8 v2, v1, 0x1

    goto :goto_1

    :cond_0
    const/16 v4, 0x20

    if-eq v3, v4, :cond_1

    const/16 v4, 0x9

    if-eq v3, v4, :cond_1

    goto :goto_2

    :cond_1
    :goto_1
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    :cond_2
    :goto_2
    if-ne v1, v0, :cond_3

    .line 1301
    invoke-virtual {p0, v0, v0}, Lcom/vladsch/flexmark/util/sequence/BasedSequenceImpl;->subSequence(II)Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    move-result-object v0

    return-object v0

    :cond_3
    if-eqz v2, :cond_4

    .line 1302
    invoke-virtual {p0, v2}, Lcom/vladsch/flexmark/util/sequence/BasedSequenceImpl;->subSequence(I)Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    move-result-object v0

    return-object v0

    :cond_4
    return-object p0
.end method

.method public trimStart()Lcom/vladsch/flexmark/util/sequence/BasedSequence;
    .locals 2

    const/4 v0, 0x0

    .line 855
    const-string v1, " \t\r\n"

    invoke-virtual {p0, v0, v1}, Lcom/vladsch/flexmark/util/sequence/BasedSequenceImpl;->trimStart(ILjava/lang/CharSequence;)Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    move-result-object v0

    return-object v0
.end method

.method public trimStart(I)Lcom/vladsch/flexmark/util/sequence/BasedSequence;
    .locals 1

    .line 835
    const-string v0, " \t\r\n"

    invoke-virtual {p0, p1, v0}, Lcom/vladsch/flexmark/util/sequence/BasedSequenceImpl;->trimStart(ILjava/lang/CharSequence;)Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    move-result-object p1

    return-object p1
.end method

.method public trimStart(ILjava/lang/CharSequence;)Lcom/vladsch/flexmark/util/sequence/BasedSequence;
    .locals 2

    const/4 v0, 0x0

    .line 783
    invoke-virtual {p0}, Lcom/vladsch/flexmark/util/sequence/BasedSequenceImpl;->length()I

    move-result v1

    invoke-virtual {p0, p2, v0, v1}, Lcom/vladsch/flexmark/util/sequence/BasedSequenceImpl;->countLeading(Ljava/lang/CharSequence;II)I

    move-result p2

    invoke-virtual {p0}, Lcom/vladsch/flexmark/util/sequence/BasedSequenceImpl;->length()I

    move-result v0

    sub-int/2addr v0, p1

    filled-new-array {v0}, [I

    move-result-object p1

    invoke-static {p2, p1}, Lcom/vladsch/flexmark/util/Utils;->maxLimit(I[I)I

    move-result p1

    if-lez p1, :cond_0

    .line 784
    invoke-virtual {p0}, Lcom/vladsch/flexmark/util/sequence/BasedSequenceImpl;->length()I

    move-result p2

    invoke-virtual {p0, p1, p2}, Lcom/vladsch/flexmark/util/sequence/BasedSequenceImpl;->subSequence(II)Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    move-result-object p1

    return-object p1

    :cond_0
    return-object p0
.end method

.method public trimStart(Ljava/lang/CharSequence;)Lcom/vladsch/flexmark/util/sequence/BasedSequence;
    .locals 1

    const/4 v0, 0x0

    .line 807
    invoke-virtual {p0, v0, p1}, Lcom/vladsch/flexmark/util/sequence/BasedSequenceImpl;->trimStart(ILjava/lang/CharSequence;)Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    move-result-object p1

    return-object p1
.end method

.method public trimTailBlankLines()Lcom/vladsch/flexmark/util/sequence/BasedSequence;
    .locals 6

    .line 1276
    invoke-virtual {p0}, Lcom/vladsch/flexmark/util/sequence/BasedSequenceImpl;->length()I

    move-result v0

    move v1, v0

    move v2, v1

    :goto_0
    add-int/lit8 v3, v1, -0x1

    if-lez v1, :cond_2

    .line 1281
    invoke-virtual {p0, v3}, Lcom/vladsch/flexmark/util/sequence/BasedSequenceImpl;->charAt(I)C

    move-result v4

    const/16 v5, 0xa

    if-ne v4, v5, :cond_0

    move v2, v1

    goto :goto_1

    :cond_0
    if-eq v2, v0, :cond_2

    const/16 v1, 0x20

    if-eq v4, v1, :cond_1

    const/16 v1, 0x9

    if-eq v4, v1, :cond_1

    goto :goto_2

    :cond_1
    :goto_1
    move v1, v3

    goto :goto_0

    :cond_2
    :goto_2
    const/4 v1, 0x0

    if-gez v3, :cond_3

    .line 1285
    invoke-virtual {p0, v1, v1}, Lcom/vladsch/flexmark/util/sequence/BasedSequenceImpl;->subSequence(II)Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    move-result-object v0

    return-object v0

    :cond_3
    if-eq v2, v0, :cond_4

    .line 1286
    invoke-virtual {p0, v1, v2}, Lcom/vladsch/flexmark/util/sequence/BasedSequenceImpl;->subSequence(II)Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    move-result-object v0

    return-object v0

    :cond_4
    return-object p0
.end method

.method public trimmedEOL()Lcom/vladsch/flexmark/util/sequence/BasedSequence;
    .locals 2

    .line 943
    invoke-virtual {p0}, Lcom/vladsch/flexmark/util/sequence/BasedSequenceImpl;->eolLength()I

    move-result v0

    if-lez v0, :cond_0

    .line 944
    invoke-virtual {p0}, Lcom/vladsch/flexmark/util/sequence/BasedSequenceImpl;->length()I

    move-result v1

    sub-int/2addr v1, v0

    invoke-virtual {p0, v1}, Lcom/vladsch/flexmark/util/sequence/BasedSequenceImpl;->subSequence(I)Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    move-result-object v0

    return-object v0

    :cond_0
    sget-object v0, Lcom/vladsch/flexmark/util/sequence/BasedSequence;->NULL:Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    return-object v0
.end method

.method public trimmedEnd()Lcom/vladsch/flexmark/util/sequence/BasedSequence;
    .locals 2

    const/4 v0, 0x0

    .line 870
    const-string v1, " \t\r\n"

    invoke-virtual {p0, v0, v1}, Lcom/vladsch/flexmark/util/sequence/BasedSequenceImpl;->trimmedEnd(ILjava/lang/CharSequence;)Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    move-result-object v0

    return-object v0
.end method

.method public trimmedEnd(I)Lcom/vladsch/flexmark/util/sequence/BasedSequence;
    .locals 1

    .line 850
    const-string v0, " \t\r\n"

    invoke-virtual {p0, p1, v0}, Lcom/vladsch/flexmark/util/sequence/BasedSequenceImpl;->trimmedEnd(ILjava/lang/CharSequence;)Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    move-result-object p1

    return-object p1
.end method

.method public trimmedEnd(ILjava/lang/CharSequence;)Lcom/vladsch/flexmark/util/sequence/BasedSequence;
    .locals 2

    const/4 v0, 0x0

    .line 801
    invoke-virtual {p0}, Lcom/vladsch/flexmark/util/sequence/BasedSequenceImpl;->length()I

    move-result v1

    invoke-virtual {p0, p2, v0, v1}, Lcom/vladsch/flexmark/util/sequence/BasedSequenceImpl;->countTrailing(Ljava/lang/CharSequence;II)I

    move-result p2

    invoke-virtual {p0}, Lcom/vladsch/flexmark/util/sequence/BasedSequenceImpl;->length()I

    move-result v0

    sub-int/2addr v0, p1

    filled-new-array {v0}, [I

    move-result-object p1

    invoke-static {p2, p1}, Lcom/vladsch/flexmark/util/Utils;->maxLimit(I[I)I

    move-result p1

    if-lez p1, :cond_0

    .line 802
    invoke-virtual {p0}, Lcom/vladsch/flexmark/util/sequence/BasedSequenceImpl;->length()I

    move-result p2

    sub-int/2addr p2, p1

    invoke-virtual {p0, p2}, Lcom/vladsch/flexmark/util/sequence/BasedSequenceImpl;->subSequence(I)Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    move-result-object p1

    return-object p1

    :cond_0
    sget-object p1, Lcom/vladsch/flexmark/util/sequence/BasedSequence;->NULL:Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    return-object p1
.end method

.method public trimmedEnd(Ljava/lang/CharSequence;)Lcom/vladsch/flexmark/util/sequence/BasedSequence;
    .locals 1

    const/4 v0, 0x0

    .line 822
    invoke-virtual {p0, v0, p1}, Lcom/vladsch/flexmark/util/sequence/BasedSequenceImpl;->trimmedEnd(ILjava/lang/CharSequence;)Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    move-result-object p1

    return-object p1
.end method

.method public trimmedStart()Lcom/vladsch/flexmark/util/sequence/BasedSequence;
    .locals 2

    const/4 v0, 0x0

    .line 860
    const-string v1, " \t\r\n"

    invoke-virtual {p0, v0, v1}, Lcom/vladsch/flexmark/util/sequence/BasedSequenceImpl;->trimmedStart(ILjava/lang/CharSequence;)Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    move-result-object v0

    return-object v0
.end method

.method public trimmedStart(I)Lcom/vladsch/flexmark/util/sequence/BasedSequence;
    .locals 1

    .line 840
    const-string v0, " \t\r\n"

    invoke-virtual {p0, p1, v0}, Lcom/vladsch/flexmark/util/sequence/BasedSequenceImpl;->trimmedStart(ILjava/lang/CharSequence;)Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    move-result-object p1

    return-object p1
.end method

.method public trimmedStart(ILjava/lang/CharSequence;)Lcom/vladsch/flexmark/util/sequence/BasedSequence;
    .locals 2

    .line 789
    invoke-virtual {p0}, Lcom/vladsch/flexmark/util/sequence/BasedSequenceImpl;->length()I

    move-result v0

    const/4 v1, 0x0

    invoke-virtual {p0, p2, v1, v0}, Lcom/vladsch/flexmark/util/sequence/BasedSequenceImpl;->countLeading(Ljava/lang/CharSequence;II)I

    move-result p2

    invoke-virtual {p0}, Lcom/vladsch/flexmark/util/sequence/BasedSequenceImpl;->length()I

    move-result v0

    sub-int/2addr v0, p1

    filled-new-array {v0}, [I

    move-result-object p1

    invoke-static {p2, p1}, Lcom/vladsch/flexmark/util/Utils;->maxLimit(I[I)I

    move-result p1

    if-lez p1, :cond_0

    .line 790
    invoke-virtual {p0, v1, p1}, Lcom/vladsch/flexmark/util/sequence/BasedSequenceImpl;->subSequence(II)Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    move-result-object p1

    return-object p1

    :cond_0
    sget-object p1, Lcom/vladsch/flexmark/util/sequence/BasedSequence;->NULL:Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    return-object p1
.end method

.method public trimmedStart(Ljava/lang/CharSequence;)Lcom/vladsch/flexmark/util/sequence/BasedSequence;
    .locals 1

    const/4 v0, 0x0

    .line 812
    invoke-virtual {p0, v0, p1}, Lcom/vladsch/flexmark/util/sequence/BasedSequenceImpl;->trimmedStart(ILjava/lang/CharSequence;)Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    move-result-object p1

    return-object p1
.end method

.method public unescape(Lcom/vladsch/flexmark/util/sequence/ReplacedTextMapper;)Lcom/vladsch/flexmark/util/sequence/BasedSequence;
    .locals 0

    .line 1330
    invoke-static {p0, p1}, Lcom/vladsch/flexmark/util/html/Escaping;->unescape(Lcom/vladsch/flexmark/util/sequence/BasedSequence;Lcom/vladsch/flexmark/util/sequence/ReplacedTextMapper;)Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    move-result-object p1

    return-object p1
.end method

.method public unescape()Ljava/lang/String;
    .locals 1

    .line 1320
    invoke-static {p0}, Lcom/vladsch/flexmark/util/html/Escaping;->unescapeString(Ljava/lang/CharSequence;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public unescapeNoEntities()Ljava/lang/String;
    .locals 1

    const/4 v0, 0x0

    .line 1325
    invoke-static {p0, v0}, Lcom/vladsch/flexmark/util/html/Escaping;->unescapeString(Ljava/lang/CharSequence;Z)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method
