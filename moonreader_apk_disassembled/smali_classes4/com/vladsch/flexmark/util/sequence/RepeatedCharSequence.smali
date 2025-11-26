.class public Lcom/vladsch/flexmark/util/sequence/RepeatedCharSequence;
.super Ljava/lang/Object;
.source "RepeatedCharSequence.java"

# interfaces
.implements Ljava/lang/CharSequence;


# static fields
.field public static NULL:Lcom/vladsch/flexmark/util/sequence/RepeatedCharSequence;


# instance fields
.field private final myChars:Ljava/lang/CharSequence;

.field private final myEndIndex:I

.field private myHash:I

.field private final myStartIndex:I


# direct methods
.method static constructor <clinit>()V
    .locals 3

    .line 11
    new-instance v0, Lcom/vladsch/flexmark/util/sequence/RepeatedCharSequence;

    sget-object v1, Lcom/vladsch/flexmark/util/sequence/SubSequence;->NULL:Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    const/4 v2, 0x0

    invoke-direct {v0, v1, v2, v2}, Lcom/vladsch/flexmark/util/sequence/RepeatedCharSequence;-><init>(Ljava/lang/CharSequence;II)V

    sput-object v0, Lcom/vladsch/flexmark/util/sequence/RepeatedCharSequence;->NULL:Lcom/vladsch/flexmark/util/sequence/RepeatedCharSequence;

    return-void
.end method

.method private constructor <init>(Ljava/lang/CharSequence;II)V
    .locals 0

    .line 18
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 19
    iput-object p1, p0, Lcom/vladsch/flexmark/util/sequence/RepeatedCharSequence;->myChars:Ljava/lang/CharSequence;

    .line 20
    iput p2, p0, Lcom/vladsch/flexmark/util/sequence/RepeatedCharSequence;->myStartIndex:I

    .line 21
    iput p3, p0, Lcom/vladsch/flexmark/util/sequence/RepeatedCharSequence;->myEndIndex:I

    return-void
.end method

.method public static of(CI)Lcom/vladsch/flexmark/util/sequence/RepeatedCharSequence;
    .locals 2

    .line 74
    new-instance v0, Lcom/vladsch/flexmark/util/sequence/RepeatedCharSequence;

    invoke-static {p0}, Ljava/lang/String;->valueOf(C)Ljava/lang/String;

    move-result-object p0

    const/4 v1, 0x0

    invoke-direct {v0, p0, v1, p1}, Lcom/vladsch/flexmark/util/sequence/RepeatedCharSequence;-><init>(Ljava/lang/CharSequence;II)V

    return-object v0
.end method

.method public static of(Ljava/lang/CharSequence;I)Lcom/vladsch/flexmark/util/sequence/RepeatedCharSequence;
    .locals 2

    .line 78
    new-instance v0, Lcom/vladsch/flexmark/util/sequence/RepeatedCharSequence;

    invoke-interface {p0}, Ljava/lang/CharSequence;->length()I

    move-result v1

    mul-int v1, v1, p1

    const/4 p1, 0x0

    invoke-direct {v0, p0, p1, v1}, Lcom/vladsch/flexmark/util/sequence/RepeatedCharSequence;-><init>(Ljava/lang/CharSequence;II)V

    return-object v0
.end method

.method public static of(Ljava/lang/CharSequence;II)Lcom/vladsch/flexmark/util/sequence/RepeatedCharSequence;
    .locals 1

    .line 82
    new-instance v0, Lcom/vladsch/flexmark/util/sequence/RepeatedCharSequence;

    invoke-direct {v0, p0, p1, p2}, Lcom/vladsch/flexmark/util/sequence/RepeatedCharSequence;-><init>(Ljava/lang/CharSequence;II)V

    return-object v0
.end method


# virtual methods
.method public charAt(I)C
    .locals 2

    if-ltz p1, :cond_0

    .line 31
    iget v0, p0, Lcom/vladsch/flexmark/util/sequence/RepeatedCharSequence;->myEndIndex:I

    iget v1, p0, Lcom/vladsch/flexmark/util/sequence/RepeatedCharSequence;->myStartIndex:I

    sub-int/2addr v0, v1

    if-ge p1, v0, :cond_0

    .line 32
    iget-object v0, p0, Lcom/vladsch/flexmark/util/sequence/RepeatedCharSequence;->myChars:Ljava/lang/CharSequence;

    add-int/2addr v1, p1

    invoke-interface {v0}, Ljava/lang/CharSequence;->length()I

    move-result p1

    rem-int/2addr v1, p1

    invoke-interface {v0, v1}, Ljava/lang/CharSequence;->charAt(I)C

    move-result p1

    return p1

    .line 31
    :cond_0
    new-instance p1, Ljava/lang/IndexOutOfBoundsException;

    invoke-direct {p1}, Ljava/lang/IndexOutOfBoundsException;-><init>()V

    throw p1
.end method

.method public equals(Ljava/lang/Object;)Z
    .locals 1

    if-eq p1, p0, :cond_1

    .line 63
    instance-of v0, p1, Ljava/lang/CharSequence;

    if-eqz v0, :cond_0

    invoke-virtual {p0}, Lcom/vladsch/flexmark/util/sequence/RepeatedCharSequence;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p1}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-virtual {v0, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p1

    if-eqz p1, :cond_0

    goto :goto_0

    :cond_0
    const/4 p1, 0x0

    return p1

    :cond_1
    :goto_0
    const/4 p1, 0x1

    return p1
.end method

.method public hashCode()I
    .locals 3

    .line 51
    iget v0, p0, Lcom/vladsch/flexmark/util/sequence/RepeatedCharSequence;->myHash:I

    if-nez v0, :cond_1

    .line 52
    invoke-virtual {p0}, Lcom/vladsch/flexmark/util/sequence/RepeatedCharSequence;->length()I

    move-result v1

    if-lez v1, :cond_1

    const/4 v1, 0x0

    .line 53
    :goto_0
    invoke-virtual {p0}, Lcom/vladsch/flexmark/util/sequence/RepeatedCharSequence;->length()I

    move-result v2

    if-ge v1, v2, :cond_0

    mul-int/lit8 v0, v0, 0x1f

    .line 54
    invoke-virtual {p0, v1}, Lcom/vladsch/flexmark/util/sequence/RepeatedCharSequence;->charAt(I)C

    move-result v2

    add-int/2addr v0, v2

    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    .line 56
    :cond_0
    iput v0, p0, Lcom/vladsch/flexmark/util/sequence/RepeatedCharSequence;->myHash:I

    :cond_1
    return v0
.end method

.method public length()I
    .locals 2

    .line 26
    iget v0, p0, Lcom/vladsch/flexmark/util/sequence/RepeatedCharSequence;->myEndIndex:I

    iget v1, p0, Lcom/vladsch/flexmark/util/sequence/RepeatedCharSequence;->myStartIndex:I

    sub-int/2addr v0, v1

    return v0
.end method

.method public repeat(I)Lcom/vladsch/flexmark/util/sequence/RepeatedCharSequence;
    .locals 3

    .line 45
    iget v0, p0, Lcom/vladsch/flexmark/util/sequence/RepeatedCharSequence;->myStartIndex:I

    iget v1, p0, Lcom/vladsch/flexmark/util/sequence/RepeatedCharSequence;->myEndIndex:I

    sub-int v2, v1, v0

    mul-int v2, v2, p1

    add-int/2addr v2, v0

    if-lt v0, v1, :cond_0

    .line 46
    sget-object p1, Lcom/vladsch/flexmark/util/sequence/RepeatedCharSequence;->NULL:Lcom/vladsch/flexmark/util/sequence/RepeatedCharSequence;

    return-object p1

    :cond_0
    if-ne v1, v2, :cond_1

    return-object p0

    :cond_1
    new-instance p1, Lcom/vladsch/flexmark/util/sequence/RepeatedCharSequence;

    iget-object v1, p0, Lcom/vladsch/flexmark/util/sequence/RepeatedCharSequence;->myChars:Ljava/lang/CharSequence;

    invoke-direct {p1, v1, v0, v2}, Lcom/vladsch/flexmark/util/sequence/RepeatedCharSequence;-><init>(Ljava/lang/CharSequence;II)V

    return-object p1
.end method

.method public subSequence(II)Ljava/lang/CharSequence;
    .locals 3

    if-ltz p1, :cond_2

    if-gt p1, p2, :cond_2

    .line 37
    iget v0, p0, Lcom/vladsch/flexmark/util/sequence/RepeatedCharSequence;->myEndIndex:I

    iget v1, p0, Lcom/vladsch/flexmark/util/sequence/RepeatedCharSequence;->myStartIndex:I

    sub-int v2, v0, v1

    if-gt p2, v2, :cond_2

    if-ne p1, p2, :cond_0

    .line 38
    sget-object p1, Lcom/vladsch/flexmark/util/sequence/RepeatedCharSequence;->NULL:Lcom/vladsch/flexmark/util/sequence/RepeatedCharSequence;

    return-object p1

    :cond_0
    if-ne p1, v1, :cond_1

    if-ne p2, v0, :cond_1

    return-object p0

    :cond_1
    new-instance v0, Lcom/vladsch/flexmark/util/sequence/RepeatedCharSequence;

    iget-object v2, p0, Lcom/vladsch/flexmark/util/sequence/RepeatedCharSequence;->myChars:Ljava/lang/CharSequence;

    add-int/2addr p1, v1

    add-int/2addr v1, p2

    invoke-direct {v0, v2, p1, v1}, Lcom/vladsch/flexmark/util/sequence/RepeatedCharSequence;-><init>(Ljava/lang/CharSequence;II)V

    return-object v0

    .line 41
    :cond_2
    new-instance p1, Ljava/lang/IllegalArgumentException;

    new-instance p2, Ljava/lang/StringBuilder;

    const-string v0, "subSequence($startIndex, $endIndex) in RepeatedCharSequence(\'\', "

    invoke-direct {p2, v0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    iget v0, p0, Lcom/vladsch/flexmark/util/sequence/RepeatedCharSequence;->myStartIndex:I

    invoke-virtual {p2, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v0, ", "

    invoke-virtual {p2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget v0, p0, Lcom/vladsch/flexmark/util/sequence/RepeatedCharSequence;->myEndIndex:I

    invoke-virtual {p2, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v0, ")"

    invoke-virtual {p2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p2

    invoke-direct {p1, p2}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p1
.end method

.method public toString()Ljava/lang/String;
    .locals 3

    .line 68
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const/4 v1, 0x0

    .line 69
    invoke-virtual {p0}, Lcom/vladsch/flexmark/util/sequence/RepeatedCharSequence;->length()I

    move-result v2

    invoke-virtual {v0, p0, v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/CharSequence;II)Ljava/lang/StringBuilder;

    .line 70
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method
