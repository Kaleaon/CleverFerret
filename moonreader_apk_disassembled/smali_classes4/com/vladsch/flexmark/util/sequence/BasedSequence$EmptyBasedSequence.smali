.class public Lcom/vladsch/flexmark/util/sequence/BasedSequence$EmptyBasedSequence;
.super Lcom/vladsch/flexmark/util/sequence/BasedSequenceImpl;
.source "BasedSequence.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/vladsch/flexmark/util/sequence/BasedSequence;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "EmptyBasedSequence"
.end annotation


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 1131
    invoke-direct {p0}, Lcom/vladsch/flexmark/util/sequence/BasedSequenceImpl;-><init>()V

    return-void
.end method


# virtual methods
.method public baseSubSequence(II)Lcom/vladsch/flexmark/util/sequence/BasedSequence;
    .locals 0

    .line 1156
    invoke-virtual {p0, p1, p2}, Lcom/vladsch/flexmark/util/sequence/BasedSequence$EmptyBasedSequence;->subSequence(II)Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    move-result-object p1

    return-object p1
.end method

.method public charAt(I)C
    .locals 3

    .line 1139
    new-instance v0, Ljava/lang/StringIndexOutOfBoundsException;

    new-instance v1, Ljava/lang/StringBuilder;

    const-string v2, "String index: "

    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string p1, " out of range: 0, "

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p0}, Lcom/vladsch/flexmark/util/sequence/BasedSequence$EmptyBasedSequence;->length()I

    move-result p1

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-direct {v0, p1}, Ljava/lang/StringIndexOutOfBoundsException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public getBase()Lcom/vladsch/flexmark/util/sequence/BasedSequence;
    .locals 1

    .line 1166
    sget-object v0, Lcom/vladsch/flexmark/util/sequence/BasedSequence;->NULL:Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    return-object v0
.end method

.method public bridge synthetic getBase()Ljava/lang/Object;
    .locals 1

    .line 1131
    invoke-virtual {p0}, Lcom/vladsch/flexmark/util/sequence/BasedSequence$EmptyBasedSequence;->getBase()Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    move-result-object v0

    return-object v0
.end method

.method public getBaseSequence()Lcom/vladsch/flexmark/util/sequence/BasedSequence;
    .locals 1

    .line 1161
    sget-object v0, Lcom/vladsch/flexmark/util/sequence/BasedSequence;->NULL:Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    return-object v0
.end method

.method public getEndOffset()I
    .locals 1

    const/4 v0, 0x0

    return v0
.end method

.method public getIndexOffset(I)I
    .locals 3

    if-nez p1, :cond_0

    const/4 p1, 0x0

    return p1

    .line 1145
    :cond_0
    new-instance v0, Ljava/lang/StringIndexOutOfBoundsException;

    new-instance v1, Ljava/lang/StringBuilder;

    const-string v2, "String index: "

    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string p1, " out of range: 0, "

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p0}, Lcom/vladsch/flexmark/util/sequence/BasedSequence$EmptyBasedSequence;->length()I

    move-result p1

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-direct {v0, p1}, Ljava/lang/StringIndexOutOfBoundsException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public getSourceRange()Lcom/vladsch/flexmark/util/sequence/Range;
    .locals 1

    .line 1181
    sget-object v0, Lcom/vladsch/flexmark/util/sequence/Range;->NULL:Lcom/vladsch/flexmark/util/sequence/Range;

    return-object v0
.end method

.method public getStartOffset()I
    .locals 1

    const/4 v0, 0x0

    return v0
.end method

.method public length()I
    .locals 1

    const/4 v0, 0x0

    return v0
.end method

.method public subSequence(II)Lcom/vladsch/flexmark/util/sequence/BasedSequence;
    .locals 3

    if-nez p1, :cond_0

    if-nez p2, :cond_0

    return-object p0

    .line 1151
    :cond_0
    new-instance v0, Ljava/lang/StringIndexOutOfBoundsException;

    new-instance v1, Ljava/lang/StringBuilder;

    const-string v2, "EMPTY subSequence("

    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string p1, ","

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1, p2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string p1, ") only subSequence(0, 0) is allowed"

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-direct {v0, p1}, Ljava/lang/StringIndexOutOfBoundsException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public bridge synthetic subSequence(II)Ljava/lang/CharSequence;
    .locals 0

    .line 1131
    invoke-virtual {p0, p1, p2}, Lcom/vladsch/flexmark/util/sequence/BasedSequence$EmptyBasedSequence;->subSequence(II)Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    move-result-object p1

    return-object p1
.end method

.method public toString()Ljava/lang/String;
    .locals 1

    .line 1186
    const-string v0, ""

    return-object v0
.end method
