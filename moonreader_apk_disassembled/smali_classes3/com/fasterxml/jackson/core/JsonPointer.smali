.class public Lcom/fasterxml/jackson/core/JsonPointer;
.super Ljava/lang/Object;
.source "JsonPointer.java"

# interfaces
.implements Ljava/io/Serializable;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/fasterxml/jackson/core/JsonPointer$Serialization;,
        Lcom/fasterxml/jackson/core/JsonPointer$PointerSegment;,
        Lcom/fasterxml/jackson/core/JsonPointer$PointerParent;
    }
.end annotation


# static fields
.field protected static final EMPTY:Lcom/fasterxml/jackson/core/JsonPointer;

.field public static final SEPARATOR:C = '/'

.field private static final serialVersionUID:J = 0x1L


# instance fields
.field protected final _asString:Ljava/lang/String;

.field protected final _asStringOffset:I

.field protected _hashCode:I

.field protected volatile _head:Lcom/fasterxml/jackson/core/JsonPointer;

.field protected final _matchingElementIndex:I

.field protected final _matchingPropertyName:Ljava/lang/String;

.field protected final _nextSegment:Lcom/fasterxml/jackson/core/JsonPointer;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 42
    new-instance v0, Lcom/fasterxml/jackson/core/JsonPointer;

    invoke-direct {v0}, Lcom/fasterxml/jackson/core/JsonPointer;-><init>()V

    sput-object v0, Lcom/fasterxml/jackson/core/JsonPointer;->EMPTY:Lcom/fasterxml/jackson/core/JsonPointer;

    return-void
.end method

.method protected constructor <init>()V
    .locals 1

    .line 104
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const/4 v0, 0x0

    .line 105
    iput-object v0, p0, Lcom/fasterxml/jackson/core/JsonPointer;->_nextSegment:Lcom/fasterxml/jackson/core/JsonPointer;

    .line 107
    iput-object v0, p0, Lcom/fasterxml/jackson/core/JsonPointer;->_matchingPropertyName:Ljava/lang/String;

    const/4 v0, -0x1

    .line 108
    iput v0, p0, Lcom/fasterxml/jackson/core/JsonPointer;->_matchingElementIndex:I

    .line 109
    const-string v0, ""

    iput-object v0, p0, Lcom/fasterxml/jackson/core/JsonPointer;->_asString:Ljava/lang/String;

    const/4 v0, 0x0

    .line 110
    iput v0, p0, Lcom/fasterxml/jackson/core/JsonPointer;->_asStringOffset:I

    return-void
.end method

.method protected constructor <init>(Ljava/lang/String;ILjava/lang/String;ILcom/fasterxml/jackson/core/JsonPointer;)V
    .locals 0

    .line 127
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 128
    iput-object p1, p0, Lcom/fasterxml/jackson/core/JsonPointer;->_asString:Ljava/lang/String;

    .line 129
    iput p2, p0, Lcom/fasterxml/jackson/core/JsonPointer;->_asStringOffset:I

    .line 130
    iput-object p5, p0, Lcom/fasterxml/jackson/core/JsonPointer;->_nextSegment:Lcom/fasterxml/jackson/core/JsonPointer;

    .line 131
    iput-object p3, p0, Lcom/fasterxml/jackson/core/JsonPointer;->_matchingPropertyName:Ljava/lang/String;

    .line 132
    iput p4, p0, Lcom/fasterxml/jackson/core/JsonPointer;->_matchingElementIndex:I

    return-void
.end method

.method protected constructor <init>(Ljava/lang/String;ILjava/lang/String;Lcom/fasterxml/jackson/core/JsonPointer;)V
    .locals 0

    .line 116
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 117
    iput-object p1, p0, Lcom/fasterxml/jackson/core/JsonPointer;->_asString:Ljava/lang/String;

    .line 118
    iput p2, p0, Lcom/fasterxml/jackson/core/JsonPointer;->_asStringOffset:I

    .line 119
    iput-object p4, p0, Lcom/fasterxml/jackson/core/JsonPointer;->_nextSegment:Lcom/fasterxml/jackson/core/JsonPointer;

    .line 121
    iput-object p3, p0, Lcom/fasterxml/jackson/core/JsonPointer;->_matchingPropertyName:Ljava/lang/String;

    .line 123
    invoke-static {p3}, Lcom/fasterxml/jackson/core/JsonPointer;->_parseIndex(Ljava/lang/String;)I

    move-result p1

    iput p1, p0, Lcom/fasterxml/jackson/core/JsonPointer;->_matchingElementIndex:I

    return-void
.end method

.method private static _appendEscape(Ljava/lang/StringBuilder;C)V
    .locals 2

    const/16 v0, 0x30

    const/16 v1, 0x7e

    if-ne p1, v0, :cond_0

    const/16 p1, 0x7e

    goto :goto_0

    :cond_0
    const/16 v0, 0x31

    if-ne p1, v0, :cond_1

    const/16 p1, 0x2f

    goto :goto_0

    .line 740
    :cond_1
    invoke-virtual {p0, v1}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 742
    :goto_0
    invoke-virtual {p0, p1}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    return-void
.end method

.method private static _appendEscaped(Ljava/lang/StringBuilder;Ljava/lang/String;)V
    .locals 4

    .line 282
    invoke-virtual {p1}, Ljava/lang/String;->length()I

    move-result v0

    const/4 v1, 0x0

    :goto_0
    if-ge v1, v0, :cond_2

    .line 283
    invoke-virtual {p1, v1}, Ljava/lang/String;->charAt(I)C

    move-result v2

    const/16 v3, 0x2f

    if-ne v2, v3, :cond_0

    .line 285
    const-string v2, "~1"

    invoke-virtual {p0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    goto :goto_1

    :cond_0
    const/16 v3, 0x7e

    if-ne v2, v3, :cond_1

    .line 289
    const-string v2, "~0"

    invoke-virtual {p0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    goto :goto_1

    .line 292
    :cond_1
    invoke-virtual {p0, v2}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    :goto_1
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    :cond_2
    return-void
.end method

.method private static _buildPath(Ljava/lang/String;ILjava/lang/String;Lcom/fasterxml/jackson/core/JsonPointer$PointerParent;)Lcom/fasterxml/jackson/core/JsonPointer;
    .locals 2

    .line 687
    new-instance v0, Lcom/fasterxml/jackson/core/JsonPointer;

    sget-object v1, Lcom/fasterxml/jackson/core/JsonPointer;->EMPTY:Lcom/fasterxml/jackson/core/JsonPointer;

    invoke-direct {v0, p0, p1, p2, v1}, Lcom/fasterxml/jackson/core/JsonPointer;-><init>(Ljava/lang/String;ILjava/lang/String;Lcom/fasterxml/jackson/core/JsonPointer;)V

    :goto_0
    if-eqz p3, :cond_0

    .line 689
    new-instance p1, Lcom/fasterxml/jackson/core/JsonPointer;

    iget p2, p3, Lcom/fasterxml/jackson/core/JsonPointer$PointerParent;->fullPathOffset:I

    iget-object v1, p3, Lcom/fasterxml/jackson/core/JsonPointer$PointerParent;->segment:Ljava/lang/String;

    invoke-direct {p1, p0, p2, v1, v0}, Lcom/fasterxml/jackson/core/JsonPointer;-><init>(Ljava/lang/String;ILjava/lang/String;Lcom/fasterxml/jackson/core/JsonPointer;)V

    .line 688
    iget-object p3, p3, Lcom/fasterxml/jackson/core/JsonPointer$PointerParent;->parent:Lcom/fasterxml/jackson/core/JsonPointer$PointerParent;

    move-object v0, p1

    goto :goto_0

    :cond_0
    return-object v0
.end method

.method private final _compare(Ljava/lang/String;ILjava/lang/String;I)Z
    .locals 4

    .line 593
    invoke-virtual {p1}, Ljava/lang/String;->length()I

    move-result v0

    sub-int v1, v0, p2

    .line 596
    invoke-virtual {p3}, Ljava/lang/String;->length()I

    move-result v2

    sub-int/2addr v2, p4

    const/4 v3, 0x0

    if-eq v1, v2, :cond_0

    return v3

    :cond_0
    :goto_0
    if-ge p2, v0, :cond_2

    add-int/lit8 v1, p2, 0x1

    .line 601
    invoke-virtual {p1, p2}, Ljava/lang/String;->charAt(I)C

    move-result p2

    add-int/lit8 v2, p4, 0x1

    invoke-virtual {p3, p4}, Ljava/lang/String;->charAt(I)C

    move-result p4

    if-eq p2, p4, :cond_1

    return v3

    :cond_1
    move p2, v1

    move p4, v2

    goto :goto_0

    :cond_2
    const/4 p1, 0x1

    return p1
.end method

.method protected static _extractEscapedSegment(Ljava/lang/String;IILjava/lang/StringBuilder;)I
    .locals 3

    .line 712
    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result v0

    add-int/lit8 v1, p2, -0x1

    sub-int v2, v1, p1

    if-lez v2, :cond_0

    .line 715
    invoke-virtual {p3, p0, p1, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/CharSequence;II)Ljava/lang/StringBuilder;

    :cond_0
    add-int/lit8 p1, p2, 0x1

    .line 717
    invoke-virtual {p0, p2}, Ljava/lang/String;->charAt(I)C

    move-result p2

    invoke-static {p3, p2}, Lcom/fasterxml/jackson/core/JsonPointer;->_appendEscape(Ljava/lang/StringBuilder;C)V

    :goto_0
    if-ge p1, v0, :cond_3

    .line 719
    invoke-virtual {p0, p1}, Ljava/lang/String;->charAt(I)C

    move-result p2

    const/16 v1, 0x2f

    if-ne p2, v1, :cond_1

    return p1

    :cond_1
    add-int/lit8 v1, p1, 0x1

    const/16 v2, 0x7e

    if-ne p2, v2, :cond_2

    if-ge v1, v0, :cond_2

    add-int/lit8 p1, p1, 0x2

    .line 725
    invoke-virtual {p0, v1}, Ljava/lang/String;->charAt(I)C

    move-result p2

    invoke-static {p3, p2}, Lcom/fasterxml/jackson/core/JsonPointer;->_appendEscape(Ljava/lang/StringBuilder;C)V

    goto :goto_0

    .line 728
    :cond_2
    invoke-virtual {p3, p2}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    move p1, v1

    goto :goto_0

    :cond_3
    const/4 p0, -0x1

    return p0
.end method

.method private static final _parseIndex(Ljava/lang/String;)I
    .locals 7

    .line 616
    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result v0

    const/4 v1, -0x1

    if-eqz v0, :cond_8

    const/16 v2, 0xa

    if-le v0, v2, :cond_0

    goto :goto_2

    :cond_0
    const/4 v3, 0x0

    .line 623
    invoke-virtual {p0, v3}, Ljava/lang/String;->charAt(I)C

    move-result v4

    const/4 v5, 0x1

    const/16 v6, 0x30

    if-gt v4, v6, :cond_2

    if-ne v0, v5, :cond_1

    if-ne v4, v6, :cond_1

    return v3

    :cond_1
    return v1

    :cond_2
    const/16 v3, 0x39

    if-le v4, v3, :cond_3

    return v1

    :cond_3
    :goto_0
    if-ge v5, v0, :cond_6

    .line 631
    invoke-virtual {p0, v5}, Ljava/lang/String;->charAt(I)C

    move-result v4

    if-gt v4, v3, :cond_5

    if-ge v4, v6, :cond_4

    goto :goto_1

    :cond_4
    add-int/lit8 v5, v5, 0x1

    goto :goto_0

    :cond_5
    :goto_1
    return v1

    :cond_6
    if-ne v0, v2, :cond_7

    .line 637
    invoke-static {p0}, Lcom/fasterxml/jackson/core/io/NumberInput;->parseLong(Ljava/lang/String;)J

    move-result-wide v2

    const-wide/32 v4, 0x7fffffff

    cmp-long v0, v2, v4

    if-lez v0, :cond_7

    return v1

    .line 642
    :cond_7
    invoke-static {p0}, Lcom/fasterxml/jackson/core/io/NumberInput;->parseInt(Ljava/lang/String;)I

    move-result p0

    return p0

    :cond_8
    :goto_2
    return v1
.end method

.method protected static _parseTail(Ljava/lang/String;)Lcom/fasterxml/jackson/core/JsonPointer;
    .locals 6

    .line 651
    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result v0

    const/4 v1, 0x0

    const/4 v2, 0x1

    const/4 v3, 0x0

    :cond_0
    :goto_0
    if-ge v2, v0, :cond_3

    .line 655
    invoke-virtual {p0, v2}, Ljava/lang/String;->charAt(I)C

    move-result v4

    const/16 v5, 0x2f

    if-ne v4, v5, :cond_1

    .line 657
    new-instance v4, Lcom/fasterxml/jackson/core/JsonPointer$PointerParent;

    add-int/lit8 v5, v3, 0x1

    .line 658
    invoke-virtual {p0, v5, v2}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v5

    invoke-direct {v4, v1, v3, v5}, Lcom/fasterxml/jackson/core/JsonPointer$PointerParent;-><init>(Lcom/fasterxml/jackson/core/JsonPointer$PointerParent;ILjava/lang/String;)V

    add-int/lit8 v1, v2, 0x1

    move v3, v2

    move v2, v1

    move-object v1, v4

    goto :goto_0

    :cond_1
    add-int/lit8 v2, v2, 0x1

    const/16 v5, 0x7e

    if-ne v4, v5, :cond_0

    if-ge v2, v0, :cond_0

    .line 668
    new-instance v4, Ljava/lang/StringBuilder;

    const/16 v5, 0x20

    invoke-direct {v4, v5}, Ljava/lang/StringBuilder;-><init>(I)V

    add-int/lit8 v5, v3, 0x1

    .line 669
    invoke-static {p0, v5, v2, v4}, Lcom/fasterxml/jackson/core/JsonPointer;->_extractEscapedSegment(Ljava/lang/String;IILjava/lang/StringBuilder;)I

    move-result v2

    .line 670
    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    if-gez v2, :cond_2

    .line 672
    invoke-static {p0, v3, v4, v1}, Lcom/fasterxml/jackson/core/JsonPointer;->_buildPath(Ljava/lang/String;ILjava/lang/String;Lcom/fasterxml/jackson/core/JsonPointer$PointerParent;)Lcom/fasterxml/jackson/core/JsonPointer;

    move-result-object p0

    return-object p0

    .line 674
    :cond_2
    new-instance v5, Lcom/fasterxml/jackson/core/JsonPointer$PointerParent;

    invoke-direct {v5, v1, v3, v4}, Lcom/fasterxml/jackson/core/JsonPointer$PointerParent;-><init>(Lcom/fasterxml/jackson/core/JsonPointer$PointerParent;ILjava/lang/String;)V

    add-int/lit8 v1, v2, 0x1

    move v3, v2

    move v2, v1

    move-object v1, v5

    goto :goto_0

    :cond_3
    add-int/lit8 v0, v3, 0x1

    .line 682
    invoke-virtual {p0, v0}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v0

    invoke-static {p0, v3, v0, v1}, Lcom/fasterxml/jackson/core/JsonPointer;->_buildPath(Ljava/lang/String;ILjava/lang/String;Lcom/fasterxml/jackson/core/JsonPointer$PointerParent;)Lcom/fasterxml/jackson/core/JsonPointer;

    move-result-object p0

    return-object p0
.end method

.method public static compile(Ljava/lang/String;)Lcom/fasterxml/jackson/core/JsonPointer;
    .locals 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/IllegalArgumentException;
        }
    .end annotation

    if-eqz p0, :cond_2

    .line 157
    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result v0

    if-nez v0, :cond_0

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    .line 161
    invoke-virtual {p0, v0}, Ljava/lang/String;->charAt(I)C

    move-result v0

    const/16 v1, 0x2f

    if-ne v0, v1, :cond_1

    .line 164
    invoke-static {p0}, Lcom/fasterxml/jackson/core/JsonPointer;->_parseTail(Ljava/lang/String;)Lcom/fasterxml/jackson/core/JsonPointer;

    move-result-object p0

    return-object p0

    .line 162
    :cond_1
    new-instance v0, Ljava/lang/IllegalArgumentException;

    new-instance v1, Ljava/lang/StringBuilder;

    const-string v2, "Invalid input: JSON Pointer expression must start with \'/\': \""

    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string p0, "\""

    invoke-virtual {v1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    invoke-direct {v0, p0}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 158
    :cond_2
    :goto_0
    sget-object p0, Lcom/fasterxml/jackson/core/JsonPointer;->EMPTY:Lcom/fasterxml/jackson/core/JsonPointer;

    return-object p0
.end method

.method public static empty()Lcom/fasterxml/jackson/core/JsonPointer;
    .locals 1

    .line 188
    sget-object v0, Lcom/fasterxml/jackson/core/JsonPointer;->EMPTY:Lcom/fasterxml/jackson/core/JsonPointer;

    return-object v0
.end method

.method public static forPath(Lcom/fasterxml/jackson/core/JsonStreamContext;Z)Lcom/fasterxml/jackson/core/JsonPointer;
    .locals 8

    if-nez p0, :cond_0

    .line 208
    sget-object p0, Lcom/fasterxml/jackson/core/JsonPointer;->EMPTY:Lcom/fasterxml/jackson/core/JsonPointer;

    return-object p0

    .line 212
    :cond_0
    invoke-virtual {p0}, Lcom/fasterxml/jackson/core/JsonStreamContext;->hasPathSegment()Z

    move-result v0

    if-nez v0, :cond_2

    if-eqz p1, :cond_1

    .line 214
    invoke-virtual {p0}, Lcom/fasterxml/jackson/core/JsonStreamContext;->inRoot()Z

    move-result v0

    if-eqz v0, :cond_1

    invoke-virtual {p0}, Lcom/fasterxml/jackson/core/JsonStreamContext;->hasCurrentIndex()Z

    move-result v0

    if-nez v0, :cond_2

    .line 215
    :cond_1
    invoke-virtual {p0}, Lcom/fasterxml/jackson/core/JsonStreamContext;->getParent()Lcom/fasterxml/jackson/core/JsonStreamContext;

    move-result-object p0

    :cond_2
    const/4 v0, 0x0

    const/4 v1, 0x0

    move-object v2, v0

    :goto_0
    if-eqz p0, :cond_7

    .line 223
    invoke-virtual {p0}, Lcom/fasterxml/jackson/core/JsonStreamContext;->inObject()Z

    move-result v3

    if-eqz v3, :cond_4

    .line 224
    invoke-virtual {p0}, Lcom/fasterxml/jackson/core/JsonStreamContext;->getCurrentName()Ljava/lang/String;

    move-result-object v3

    if-nez v3, :cond_3

    .line 226
    const-string v3, ""

    .line 228
    :cond_3
    invoke-virtual {v3}, Ljava/lang/String;->length()I

    move-result v4

    add-int/lit8 v4, v4, 0x2

    add-int/2addr v1, v4

    .line 229
    new-instance v4, Lcom/fasterxml/jackson/core/JsonPointer$PointerSegment;

    const/4 v5, -0x1

    invoke-direct {v4, v2, v3, v5}, Lcom/fasterxml/jackson/core/JsonPointer$PointerSegment;-><init>(Lcom/fasterxml/jackson/core/JsonPointer$PointerSegment;Ljava/lang/String;I)V

    goto :goto_1

    .line 230
    :cond_4
    invoke-virtual {p0}, Lcom/fasterxml/jackson/core/JsonStreamContext;->inArray()Z

    move-result v3

    if-nez v3, :cond_5

    if-eqz p1, :cond_6

    .line 231
    :cond_5
    invoke-virtual {p0}, Lcom/fasterxml/jackson/core/JsonStreamContext;->getCurrentIndex()I

    move-result v3

    add-int/lit8 v1, v1, 0x6

    .line 233
    new-instance v4, Lcom/fasterxml/jackson/core/JsonPointer$PointerSegment;

    invoke-direct {v4, v2, v0, v3}, Lcom/fasterxml/jackson/core/JsonPointer$PointerSegment;-><init>(Lcom/fasterxml/jackson/core/JsonPointer$PointerSegment;Ljava/lang/String;I)V

    :goto_1
    move-object v2, v4

    .line 222
    :cond_6
    invoke-virtual {p0}, Lcom/fasterxml/jackson/core/JsonStreamContext;->getParent()Lcom/fasterxml/jackson/core/JsonStreamContext;

    move-result-object p0

    goto :goto_0

    :cond_7
    if-nez v2, :cond_8

    .line 240
    sget-object p0, Lcom/fasterxml/jackson/core/JsonPointer;->EMPTY:Lcom/fasterxml/jackson/core/JsonPointer;

    return-object p0

    .line 245
    :cond_8
    new-instance p0, Ljava/lang/StringBuilder;

    invoke-direct {p0, v1}, Ljava/lang/StringBuilder;-><init>(I)V

    move-object p1, v0

    move-object v0, v2

    :goto_2
    if-eqz v0, :cond_a

    .line 251
    invoke-virtual {p0}, Ljava/lang/StringBuilder;->length()I

    move-result p1

    iput p1, v0, Lcom/fasterxml/jackson/core/JsonPointer$PointerSegment;->pathOffset:I

    const/16 p1, 0x2f

    .line 252
    invoke-virtual {p0, p1}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 253
    iget-object p1, v0, Lcom/fasterxml/jackson/core/JsonPointer$PointerSegment;->property:Ljava/lang/String;

    if-eqz p1, :cond_9

    .line 254
    iget-object p1, v0, Lcom/fasterxml/jackson/core/JsonPointer$PointerSegment;->property:Ljava/lang/String;

    invoke-static {p0, p1}, Lcom/fasterxml/jackson/core/JsonPointer;->_appendEscaped(Ljava/lang/StringBuilder;Ljava/lang/String;)V

    goto :goto_3

    .line 256
    :cond_9
    iget p1, v0, Lcom/fasterxml/jackson/core/JsonPointer$PointerSegment;->index:I

    invoke-virtual {p0, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 248
    :goto_3
    iget-object p1, v0, Lcom/fasterxml/jackson/core/JsonPointer$PointerSegment;->next:Lcom/fasterxml/jackson/core/JsonPointer$PointerSegment;

    move-object v7, v0

    move-object v0, p1

    move-object p1, v7

    goto :goto_2

    .line 259
    :cond_a
    invoke-virtual {p0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    .line 264
    sget-object p0, Lcom/fasterxml/jackson/core/JsonPointer;->EMPTY:Lcom/fasterxml/jackson/core/JsonPointer;

    move-object v6, p0

    :goto_4
    if-eqz p1, :cond_c

    .line 267
    iget-object p0, p1, Lcom/fasterxml/jackson/core/JsonPointer$PointerSegment;->property:Ljava/lang/String;

    if-eqz p0, :cond_b

    .line 268
    new-instance p0, Lcom/fasterxml/jackson/core/JsonPointer;

    iget v0, p1, Lcom/fasterxml/jackson/core/JsonPointer$PointerSegment;->pathOffset:I

    iget-object v1, p1, Lcom/fasterxml/jackson/core/JsonPointer$PointerSegment;->property:Ljava/lang/String;

    invoke-direct {p0, v2, v0, v1, v6}, Lcom/fasterxml/jackson/core/JsonPointer;-><init>(Ljava/lang/String;ILjava/lang/String;Lcom/fasterxml/jackson/core/JsonPointer;)V

    move-object v6, p0

    goto :goto_5

    .line 271
    :cond_b
    iget v5, p1, Lcom/fasterxml/jackson/core/JsonPointer$PointerSegment;->index:I

    .line 272
    new-instance v1, Lcom/fasterxml/jackson/core/JsonPointer;

    iget v3, p1, Lcom/fasterxml/jackson/core/JsonPointer$PointerSegment;->pathOffset:I

    .line 273
    invoke-static {v5}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    move-result-object v4

    invoke-direct/range {v1 .. v6}, Lcom/fasterxml/jackson/core/JsonPointer;-><init>(Ljava/lang/String;ILjava/lang/String;ILcom/fasterxml/jackson/core/JsonPointer;)V

    move-object v6, v1

    .line 266
    :goto_5
    iget-object p1, p1, Lcom/fasterxml/jackson/core/JsonPointer$PointerSegment;->prev:Lcom/fasterxml/jackson/core/JsonPointer$PointerSegment;

    goto :goto_4

    :cond_c
    return-object v6
.end method

.method public static valueOf(Ljava/lang/String;)Lcom/fasterxml/jackson/core/JsonPointer;
    .locals 0

    .line 175
    invoke-static {p0}, Lcom/fasterxml/jackson/core/JsonPointer;->compile(Ljava/lang/String;)Lcom/fasterxml/jackson/core/JsonPointer;

    move-result-object p0

    return-object p0
.end method

.method private writeReplace()Ljava/lang/Object;
    .locals 2

    .line 832
    new-instance v0, Lcom/fasterxml/jackson/core/JsonPointer$Serialization;

    invoke-virtual {p0}, Lcom/fasterxml/jackson/core/JsonPointer;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Lcom/fasterxml/jackson/core/JsonPointer$Serialization;-><init>(Ljava/lang/String;)V

    return-object v0
.end method


# virtual methods
.method protected _constructHead()Lcom/fasterxml/jackson/core/JsonPointer;
    .locals 10

    .line 748
    invoke-virtual {p0}, Lcom/fasterxml/jackson/core/JsonPointer;->last()Lcom/fasterxml/jackson/core/JsonPointer;

    move-result-object v0

    if-ne v0, p0, :cond_0

    .line 750
    sget-object v0, Lcom/fasterxml/jackson/core/JsonPointer;->EMPTY:Lcom/fasterxml/jackson/core/JsonPointer;

    return-object v0

    .line 753
    :cond_0
    invoke-virtual {v0}, Lcom/fasterxml/jackson/core/JsonPointer;->length()I

    move-result v1

    .line 754
    iget-object v2, p0, Lcom/fasterxml/jackson/core/JsonPointer;->_nextSegment:Lcom/fasterxml/jackson/core/JsonPointer;

    .line 756
    invoke-virtual {p0}, Lcom/fasterxml/jackson/core/JsonPointer;->toString()Ljava/lang/String;

    move-result-object v3

    .line 757
    new-instance v4, Lcom/fasterxml/jackson/core/JsonPointer;

    invoke-virtual {v3}, Ljava/lang/String;->length()I

    move-result v5

    sub-int/2addr v5, v1

    const/4 v6, 0x0

    invoke-virtual {v3, v6, v5}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v5

    iget-object v7, p0, Lcom/fasterxml/jackson/core/JsonPointer;->_matchingPropertyName:Ljava/lang/String;

    iget v8, p0, Lcom/fasterxml/jackson/core/JsonPointer;->_matchingElementIndex:I

    .line 759
    invoke-virtual {v2, v1, v0}, Lcom/fasterxml/jackson/core/JsonPointer;->_constructHead(ILcom/fasterxml/jackson/core/JsonPointer;)Lcom/fasterxml/jackson/core/JsonPointer;

    move-result-object v9

    invoke-direct/range {v4 .. v9}, Lcom/fasterxml/jackson/core/JsonPointer;-><init>(Ljava/lang/String;ILjava/lang/String;ILcom/fasterxml/jackson/core/JsonPointer;)V

    return-object v4
.end method

.method protected _constructHead(ILcom/fasterxml/jackson/core/JsonPointer;)Lcom/fasterxml/jackson/core/JsonPointer;
    .locals 8

    if-ne p0, p2, :cond_0

    .line 765
    sget-object p1, Lcom/fasterxml/jackson/core/JsonPointer;->EMPTY:Lcom/fasterxml/jackson/core/JsonPointer;

    return-object p1

    .line 767
    :cond_0
    iget-object v0, p0, Lcom/fasterxml/jackson/core/JsonPointer;->_nextSegment:Lcom/fasterxml/jackson/core/JsonPointer;

    .line 768
    invoke-virtual {p0}, Lcom/fasterxml/jackson/core/JsonPointer;->toString()Ljava/lang/String;

    move-result-object v1

    .line 770
    new-instance v2, Lcom/fasterxml/jackson/core/JsonPointer;

    invoke-virtual {v1}, Ljava/lang/String;->length()I

    move-result v3

    sub-int/2addr v3, p1

    const/4 v4, 0x0

    invoke-virtual {v1, v4, v3}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v3

    iget-object v5, p0, Lcom/fasterxml/jackson/core/JsonPointer;->_matchingPropertyName:Ljava/lang/String;

    iget v6, p0, Lcom/fasterxml/jackson/core/JsonPointer;->_matchingElementIndex:I

    .line 772
    invoke-virtual {v0, p1, p2}, Lcom/fasterxml/jackson/core/JsonPointer;->_constructHead(ILcom/fasterxml/jackson/core/JsonPointer;)Lcom/fasterxml/jackson/core/JsonPointer;

    move-result-object v7

    invoke-direct/range {v2 .. v7}, Lcom/fasterxml/jackson/core/JsonPointer;-><init>(Ljava/lang/String;ILjava/lang/String;ILcom/fasterxml/jackson/core/JsonPointer;)V

    return-object v2
.end method

.method public append(Lcom/fasterxml/jackson/core/JsonPointer;)Lcom/fasterxml/jackson/core/JsonPointer;
    .locals 3

    .line 366
    sget-object v0, Lcom/fasterxml/jackson/core/JsonPointer;->EMPTY:Lcom/fasterxml/jackson/core/JsonPointer;

    if-ne p0, v0, :cond_0

    return-object p1

    :cond_0
    if-ne p1, v0, :cond_1

    return-object p0

    .line 375
    :cond_1
    iget-object v0, p0, Lcom/fasterxml/jackson/core/JsonPointer;->_asString:Ljava/lang/String;

    .line 376
    const-string v1, "/"

    invoke-virtual {v0, v1}, Ljava/lang/String;->endsWith(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_2

    .line 378
    invoke-virtual {v0}, Ljava/lang/String;->length()I

    move-result v1

    add-int/lit8 v1, v1, -0x1

    const/4 v2, 0x0

    invoke-virtual {v0, v2, v1}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v0

    .line 380
    :cond_2
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object p1, p1, Lcom/fasterxml/jackson/core/JsonPointer;->_asString:Ljava/lang/String;

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-static {p1}, Lcom/fasterxml/jackson/core/JsonPointer;->compile(Ljava/lang/String;)Lcom/fasterxml/jackson/core/JsonPointer;

    move-result-object p1

    return-object p1
.end method

.method public appendIndex(I)Lcom/fasterxml/jackson/core/JsonPointer;
    .locals 3

    if-ltz p1, :cond_1

    .line 433
    iget-object v0, p0, Lcom/fasterxml/jackson/core/JsonPointer;->_asString:Ljava/lang/String;

    .line 434
    const-string v1, "/"

    invoke-virtual {v0, v1}, Ljava/lang/String;->endsWith(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_0

    .line 436
    invoke-virtual {v0}, Ljava/lang/String;->length()I

    move-result v1

    add-int/lit8 v1, v1, -0x1

    const/4 v2, 0x0

    invoke-virtual {v0, v2, v1}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v0

    .line 438
    :cond_0
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const/16 v0, 0x2f

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-static {p1}, Lcom/fasterxml/jackson/core/JsonPointer;->compile(Ljava/lang/String;)Lcom/fasterxml/jackson/core/JsonPointer;

    move-result-object p1

    return-object p1

    .line 431
    :cond_1
    new-instance p1, Ljava/lang/IllegalArgumentException;

    const-string v0, "Negative index cannot be appended"

    invoke-direct {p1, v0}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p1
.end method

.method public appendProperty(Ljava/lang/String;)Lcom/fasterxml/jackson/core/JsonPointer;
    .locals 4

    if-eqz p1, :cond_3

    .line 403
    invoke-virtual {p1}, Ljava/lang/String;->isEmpty()Z

    move-result v0

    if-eqz v0, :cond_0

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    .line 406
    invoke-virtual {p1, v0}, Ljava/lang/String;->charAt(I)C

    move-result v1

    const/16 v2, 0x2f

    const-string v3, "/"

    if-eq v1, v2, :cond_1

    .line 407
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    .line 409
    :cond_1
    iget-object v1, p0, Lcom/fasterxml/jackson/core/JsonPointer;->_asString:Ljava/lang/String;

    .line 410
    invoke-virtual {v1, v3}, Ljava/lang/String;->endsWith(Ljava/lang/String;)Z

    move-result v2

    if-eqz v2, :cond_2

    .line 412
    invoke-virtual {v1}, Ljava/lang/String;->length()I

    move-result v2

    add-int/lit8 v2, v2, -0x1

    invoke-virtual {v1, v0, v2}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v1

    .line 414
    :cond_2
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-static {p1}, Lcom/fasterxml/jackson/core/JsonPointer;->compile(Ljava/lang/String;)Lcom/fasterxml/jackson/core/JsonPointer;

    move-result-object p1

    return-object p1

    :cond_3
    :goto_0
    return-object p0
.end method

.method public equals(Ljava/lang/Object;)Z
    .locals 3

    if-ne p1, p0, :cond_0

    const/4 p1, 0x1

    return p1

    :cond_0
    const/4 v0, 0x0

    if-nez p1, :cond_1

    return v0

    .line 582
    :cond_1
    instance-of v1, p1, Lcom/fasterxml/jackson/core/JsonPointer;

    if-nez v1, :cond_2

    return v0

    .line 583
    :cond_2
    check-cast p1, Lcom/fasterxml/jackson/core/JsonPointer;

    .line 587
    iget-object v0, p0, Lcom/fasterxml/jackson/core/JsonPointer;->_asString:Ljava/lang/String;

    iget v1, p0, Lcom/fasterxml/jackson/core/JsonPointer;->_asStringOffset:I

    iget-object v2, p1, Lcom/fasterxml/jackson/core/JsonPointer;->_asString:Ljava/lang/String;

    iget p1, p1, Lcom/fasterxml/jackson/core/JsonPointer;->_asStringOffset:I

    invoke-direct {p0, v0, v1, v2, p1}, Lcom/fasterxml/jackson/core/JsonPointer;->_compare(Ljava/lang/String;ILjava/lang/String;I)Z

    move-result p1

    return p1
.end method

.method public getMatchingIndex()I
    .locals 1

    .line 317
    iget v0, p0, Lcom/fasterxml/jackson/core/JsonPointer;->_matchingElementIndex:I

    return v0
.end method

.method public getMatchingProperty()Ljava/lang/String;
    .locals 1

    .line 316
    iget-object v0, p0, Lcom/fasterxml/jackson/core/JsonPointer;->_matchingPropertyName:Ljava/lang/String;

    return-object v0
.end method

.method public hashCode()I
    .locals 1

    .line 565
    iget v0, p0, Lcom/fasterxml/jackson/core/JsonPointer;->_hashCode:I

    if-nez v0, :cond_1

    .line 570
    invoke-virtual {p0}, Lcom/fasterxml/jackson/core/JsonPointer;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/String;->hashCode()I

    move-result v0

    if-nez v0, :cond_0

    const/4 v0, -0x1

    .line 574
    :cond_0
    iput v0, p0, Lcom/fasterxml/jackson/core/JsonPointer;->_hashCode:I

    :cond_1
    return v0
.end method

.method public head()Lcom/fasterxml/jackson/core/JsonPointer;
    .locals 2

    .line 541
    iget-object v0, p0, Lcom/fasterxml/jackson/core/JsonPointer;->_head:Lcom/fasterxml/jackson/core/JsonPointer;

    if-nez v0, :cond_1

    .line 543
    sget-object v1, Lcom/fasterxml/jackson/core/JsonPointer;->EMPTY:Lcom/fasterxml/jackson/core/JsonPointer;

    if-eq p0, v1, :cond_0

    .line 544
    invoke-virtual {p0}, Lcom/fasterxml/jackson/core/JsonPointer;->_constructHead()Lcom/fasterxml/jackson/core/JsonPointer;

    move-result-object v0

    .line 546
    :cond_0
    iput-object v0, p0, Lcom/fasterxml/jackson/core/JsonPointer;->_head:Lcom/fasterxml/jackson/core/JsonPointer;

    :cond_1
    return-object v0
.end method

.method public last()Lcom/fasterxml/jackson/core/JsonPointer;
    .locals 3

    .line 339
    sget-object v0, Lcom/fasterxml/jackson/core/JsonPointer;->EMPTY:Lcom/fasterxml/jackson/core/JsonPointer;

    if-ne p0, v0, :cond_0

    const/4 v0, 0x0

    return-object v0

    :cond_0
    move-object v0, p0

    .line 343
    :goto_0
    iget-object v1, v0, Lcom/fasterxml/jackson/core/JsonPointer;->_nextSegment:Lcom/fasterxml/jackson/core/JsonPointer;

    sget-object v2, Lcom/fasterxml/jackson/core/JsonPointer;->EMPTY:Lcom/fasterxml/jackson/core/JsonPointer;

    if-eq v1, v2, :cond_1

    move-object v0, v1

    goto :goto_0

    :cond_1
    return-object v0
.end method

.method public length()I
    .locals 2

    .line 312
    iget-object v0, p0, Lcom/fasterxml/jackson/core/JsonPointer;->_asString:Ljava/lang/String;

    invoke-virtual {v0}, Ljava/lang/String;->length()I

    move-result v0

    iget v1, p0, Lcom/fasterxml/jackson/core/JsonPointer;->_asStringOffset:I

    sub-int/2addr v0, v1

    return v0
.end method

.method public matchElement(I)Lcom/fasterxml/jackson/core/JsonPointer;
    .locals 1

    .line 501
    iget v0, p0, Lcom/fasterxml/jackson/core/JsonPointer;->_matchingElementIndex:I

    if-ne p1, v0, :cond_1

    if-gez p1, :cond_0

    goto :goto_0

    .line 504
    :cond_0
    iget-object p1, p0, Lcom/fasterxml/jackson/core/JsonPointer;->_nextSegment:Lcom/fasterxml/jackson/core/JsonPointer;

    return-object p1

    :cond_1
    :goto_0
    const/4 p1, 0x0

    return-object p1
.end method

.method public matchProperty(Ljava/lang/String;)Lcom/fasterxml/jackson/core/JsonPointer;
    .locals 1

    .line 467
    iget-object v0, p0, Lcom/fasterxml/jackson/core/JsonPointer;->_nextSegment:Lcom/fasterxml/jackson/core/JsonPointer;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/fasterxml/jackson/core/JsonPointer;->_matchingPropertyName:Ljava/lang/String;

    invoke-virtual {v0, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p1

    if-eqz p1, :cond_0

    .line 468
    iget-object p1, p0, Lcom/fasterxml/jackson/core/JsonPointer;->_nextSegment:Lcom/fasterxml/jackson/core/JsonPointer;

    return-object p1

    :cond_0
    const/4 p1, 0x0

    return-object p1
.end method

.method public matches()Z
    .locals 1

    .line 315
    iget-object v0, p0, Lcom/fasterxml/jackson/core/JsonPointer;->_nextSegment:Lcom/fasterxml/jackson/core/JsonPointer;

    if-nez v0, :cond_0

    const/4 v0, 0x1

    return v0

    :cond_0
    const/4 v0, 0x0

    return v0
.end method

.method public matchesElement(I)Z
    .locals 1

    .line 484
    iget v0, p0, Lcom/fasterxml/jackson/core/JsonPointer;->_matchingElementIndex:I

    if-ne p1, v0, :cond_0

    if-ltz p1, :cond_0

    const/4 p1, 0x1

    return p1

    :cond_0
    const/4 p1, 0x0

    return p1
.end method

.method public matchesProperty(Ljava/lang/String;)Z
    .locals 1

    .line 452
    iget-object v0, p0, Lcom/fasterxml/jackson/core/JsonPointer;->_nextSegment:Lcom/fasterxml/jackson/core/JsonPointer;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/fasterxml/jackson/core/JsonPointer;->_matchingPropertyName:Ljava/lang/String;

    invoke-virtual {v0, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p1

    if-eqz p1, :cond_0

    const/4 p1, 0x1

    return p1

    :cond_0
    const/4 p1, 0x0

    return p1
.end method

.method public mayMatchElement()Z
    .locals 1

    .line 329
    iget v0, p0, Lcom/fasterxml/jackson/core/JsonPointer;->_matchingElementIndex:I

    if-ltz v0, :cond_0

    const/4 v0, 0x1

    return v0

    :cond_0
    const/4 v0, 0x0

    return v0
.end method

.method public mayMatchProperty()Z
    .locals 1

    .line 323
    iget-object v0, p0, Lcom/fasterxml/jackson/core/JsonPointer;->_matchingPropertyName:Ljava/lang/String;

    if-eqz v0, :cond_0

    const/4 v0, 0x1

    return v0

    :cond_0
    const/4 v0, 0x0

    return v0
.end method

.method public tail()Lcom/fasterxml/jackson/core/JsonPointer;
    .locals 1

    .line 521
    iget-object v0, p0, Lcom/fasterxml/jackson/core/JsonPointer;->_nextSegment:Lcom/fasterxml/jackson/core/JsonPointer;

    return-object v0
.end method

.method public toString()Ljava/lang/String;
    .locals 2

    .line 558
    iget v0, p0, Lcom/fasterxml/jackson/core/JsonPointer;->_asStringOffset:I

    if-gtz v0, :cond_0

    .line 559
    iget-object v0, p0, Lcom/fasterxml/jackson/core/JsonPointer;->_asString:Ljava/lang/String;

    return-object v0

    .line 561
    :cond_0
    iget-object v1, p0, Lcom/fasterxml/jackson/core/JsonPointer;->_asString:Ljava/lang/String;

    invoke-virtual {v1, v0}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method
