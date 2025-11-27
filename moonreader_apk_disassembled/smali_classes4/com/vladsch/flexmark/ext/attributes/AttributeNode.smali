.class public Lcom/vladsch/flexmark/ext/attributes/AttributeNode;
.super Lcom/vladsch/flexmark/util/ast/Node;
.source "AttributeNode.java"

# interfaces
.implements Lcom/vladsch/flexmark/util/ast/DoNotDecorate;


# instance fields
.field protected attributeSeparator:Lcom/vladsch/flexmark/util/sequence/BasedSequence;

.field protected closingMarker:Lcom/vladsch/flexmark/util/sequence/BasedSequence;

.field protected name:Lcom/vladsch/flexmark/util/sequence/BasedSequence;

.field protected openingMarker:Lcom/vladsch/flexmark/util/sequence/BasedSequence;

.field protected value:Lcom/vladsch/flexmark/util/sequence/BasedSequence;


# direct methods
.method public constructor <init>()V
    .locals 1

    .line 34
    invoke-direct {p0}, Lcom/vladsch/flexmark/util/ast/Node;-><init>()V

    .line 12
    sget-object v0, Lcom/vladsch/flexmark/util/sequence/BasedSequence;->NULL:Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    iput-object v0, p0, Lcom/vladsch/flexmark/ext/attributes/AttributeNode;->name:Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    .line 13
    sget-object v0, Lcom/vladsch/flexmark/util/sequence/BasedSequence;->NULL:Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    iput-object v0, p0, Lcom/vladsch/flexmark/ext/attributes/AttributeNode;->attributeSeparator:Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    .line 14
    sget-object v0, Lcom/vladsch/flexmark/util/sequence/BasedSequence;->NULL:Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    iput-object v0, p0, Lcom/vladsch/flexmark/ext/attributes/AttributeNode;->openingMarker:Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    .line 15
    sget-object v0, Lcom/vladsch/flexmark/util/sequence/BasedSequence;->NULL:Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    iput-object v0, p0, Lcom/vladsch/flexmark/ext/attributes/AttributeNode;->value:Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    .line 16
    sget-object v0, Lcom/vladsch/flexmark/util/sequence/BasedSequence;->NULL:Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    iput-object v0, p0, Lcom/vladsch/flexmark/ext/attributes/AttributeNode;->closingMarker:Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    return-void
.end method

.method public constructor <init>(Lcom/vladsch/flexmark/util/sequence/BasedSequence;)V
    .locals 0

    .line 38
    invoke-direct {p0, p1}, Lcom/vladsch/flexmark/util/ast/Node;-><init>(Lcom/vladsch/flexmark/util/sequence/BasedSequence;)V

    .line 12
    sget-object p1, Lcom/vladsch/flexmark/util/sequence/BasedSequence;->NULL:Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    iput-object p1, p0, Lcom/vladsch/flexmark/ext/attributes/AttributeNode;->name:Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    .line 13
    sget-object p1, Lcom/vladsch/flexmark/util/sequence/BasedSequence;->NULL:Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    iput-object p1, p0, Lcom/vladsch/flexmark/ext/attributes/AttributeNode;->attributeSeparator:Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    .line 14
    sget-object p1, Lcom/vladsch/flexmark/util/sequence/BasedSequence;->NULL:Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    iput-object p1, p0, Lcom/vladsch/flexmark/ext/attributes/AttributeNode;->openingMarker:Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    .line 15
    sget-object p1, Lcom/vladsch/flexmark/util/sequence/BasedSequence;->NULL:Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    iput-object p1, p0, Lcom/vladsch/flexmark/ext/attributes/AttributeNode;->value:Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    .line 16
    sget-object p1, Lcom/vladsch/flexmark/util/sequence/BasedSequence;->NULL:Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    iput-object p1, p0, Lcom/vladsch/flexmark/ext/attributes/AttributeNode;->closingMarker:Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    return-void
.end method

.method public constructor <init>(Lcom/vladsch/flexmark/util/sequence/BasedSequence;Lcom/vladsch/flexmark/util/sequence/BasedSequence;Lcom/vladsch/flexmark/util/sequence/BasedSequence;Lcom/vladsch/flexmark/util/sequence/BasedSequence;Lcom/vladsch/flexmark/util/sequence/BasedSequence;)V
    .locals 2

    const/4 v0, 0x5

    .line 42
    new-array v0, v0, [Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    const/4 v1, 0x0

    aput-object p1, v0, v1

    const/4 v1, 0x1

    aput-object p2, v0, v1

    const/4 v1, 0x2

    aput-object p3, v0, v1

    const/4 v1, 0x3

    aput-object p4, v0, v1

    const/4 v1, 0x4

    aput-object p5, v0, v1

    invoke-static {v0}, Lcom/vladsch/flexmark/ext/attributes/AttributeNode;->spanningChars([Lcom/vladsch/flexmark/util/sequence/BasedSequence;)Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    move-result-object v0

    invoke-direct {p0, v0}, Lcom/vladsch/flexmark/util/ast/Node;-><init>(Lcom/vladsch/flexmark/util/sequence/BasedSequence;)V

    .line 12
    sget-object v0, Lcom/vladsch/flexmark/util/sequence/BasedSequence;->NULL:Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    iput-object v0, p0, Lcom/vladsch/flexmark/ext/attributes/AttributeNode;->name:Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    .line 13
    sget-object v0, Lcom/vladsch/flexmark/util/sequence/BasedSequence;->NULL:Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    iput-object v0, p0, Lcom/vladsch/flexmark/ext/attributes/AttributeNode;->attributeSeparator:Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    .line 14
    sget-object v0, Lcom/vladsch/flexmark/util/sequence/BasedSequence;->NULL:Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    iput-object v0, p0, Lcom/vladsch/flexmark/ext/attributes/AttributeNode;->openingMarker:Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    .line 15
    sget-object v0, Lcom/vladsch/flexmark/util/sequence/BasedSequence;->NULL:Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    iput-object v0, p0, Lcom/vladsch/flexmark/ext/attributes/AttributeNode;->value:Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    .line 16
    sget-object v0, Lcom/vladsch/flexmark/util/sequence/BasedSequence;->NULL:Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    iput-object v0, p0, Lcom/vladsch/flexmark/ext/attributes/AttributeNode;->closingMarker:Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    if-eqz p1, :cond_0

    goto :goto_0

    .line 43
    :cond_0
    sget-object p1, Lcom/vladsch/flexmark/util/sequence/BasedSequence;->NULL:Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    :goto_0
    iput-object p1, p0, Lcom/vladsch/flexmark/ext/attributes/AttributeNode;->name:Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    if-eqz p2, :cond_1

    goto :goto_1

    .line 44
    :cond_1
    sget-object p2, Lcom/vladsch/flexmark/util/sequence/BasedSequence;->NULL:Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    :goto_1
    iput-object p2, p0, Lcom/vladsch/flexmark/ext/attributes/AttributeNode;->attributeSeparator:Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    if-eqz p3, :cond_2

    goto :goto_2

    .line 45
    :cond_2
    sget-object p3, Lcom/vladsch/flexmark/util/sequence/BasedSequence;->NULL:Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    :goto_2
    iput-object p3, p0, Lcom/vladsch/flexmark/ext/attributes/AttributeNode;->openingMarker:Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    if-eqz p4, :cond_3

    goto :goto_3

    .line 46
    :cond_3
    sget-object p4, Lcom/vladsch/flexmark/util/sequence/BasedSequence;->NULL:Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    :goto_3
    iput-object p4, p0, Lcom/vladsch/flexmark/ext/attributes/AttributeNode;->value:Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    if-eqz p5, :cond_4

    goto :goto_4

    .line 47
    :cond_4
    sget-object p5, Lcom/vladsch/flexmark/util/sequence/BasedSequence;->NULL:Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    :goto_4
    iput-object p5, p0, Lcom/vladsch/flexmark/ext/attributes/AttributeNode;->closingMarker:Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    return-void
.end method

.method public static isImplicitName(Ljava/lang/CharSequence;)Z
    .locals 3

    .line 51
    invoke-interface {p0}, Ljava/lang/CharSequence;->length()I

    move-result v0

    const/4 v1, 0x0

    if-lez v0, :cond_1

    invoke-interface {p0, v1}, Ljava/lang/CharSequence;->charAt(I)C

    move-result v0

    const/16 v2, 0x2e

    if-eq v0, v2, :cond_0

    invoke-interface {p0, v1}, Ljava/lang/CharSequence;->charAt(I)C

    move-result p0

    const/16 v0, 0x23

    if-ne p0, v0, :cond_1

    :cond_0
    const/4 p0, 0x1

    return p0

    :cond_1
    return v1
.end method


# virtual methods
.method public getAstExtra(Ljava/lang/StringBuilder;)V
    .locals 4

    .line 26
    iget-object v0, p0, Lcom/vladsch/flexmark/ext/attributes/AttributeNode;->name:Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    const-string v1, "name"

    invoke-static {p1, v0, v1}, Lcom/vladsch/flexmark/ext/attributes/AttributeNode;->segmentSpanChars(Ljava/lang/StringBuilder;Lcom/vladsch/flexmark/util/sequence/BasedSequence;Ljava/lang/String;)V

    .line 27
    iget-object v0, p0, Lcom/vladsch/flexmark/ext/attributes/AttributeNode;->attributeSeparator:Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    const-string v1, "sep"

    invoke-static {p1, v0, v1}, Lcom/vladsch/flexmark/ext/attributes/AttributeNode;->segmentSpanChars(Ljava/lang/StringBuilder;Lcom/vladsch/flexmark/util/sequence/BasedSequence;Ljava/lang/String;)V

    .line 28
    iget-object v0, p0, Lcom/vladsch/flexmark/ext/attributes/AttributeNode;->openingMarker:Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    iget-object v1, p0, Lcom/vladsch/flexmark/ext/attributes/AttributeNode;->value:Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    iget-object v2, p0, Lcom/vladsch/flexmark/ext/attributes/AttributeNode;->closingMarker:Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    const-string v3, "value"

    invoke-static {p1, v0, v1, v2, v3}, Lcom/vladsch/flexmark/ext/attributes/AttributeNode;->delimitedSegmentSpanChars(Ljava/lang/StringBuilder;Lcom/vladsch/flexmark/util/sequence/BasedSequence;Lcom/vladsch/flexmark/util/sequence/BasedSequence;Lcom/vladsch/flexmark/util/sequence/BasedSequence;Ljava/lang/String;)V

    .line 29
    invoke-virtual {p0}, Lcom/vladsch/flexmark/ext/attributes/AttributeNode;->isImplicitName()Z

    move-result v0

    if-eqz v0, :cond_0

    const-string v0, " isImplicit"

    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 30
    :cond_0
    invoke-virtual {p0}, Lcom/vladsch/flexmark/ext/attributes/AttributeNode;->isClass()Z

    move-result v0

    if-eqz v0, :cond_1

    const-string v0, " isClass"

    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 31
    :cond_1
    invoke-virtual {p0}, Lcom/vladsch/flexmark/ext/attributes/AttributeNode;->isId()Z

    move-result v0

    if-eqz v0, :cond_2

    const-string v0, " isId"

    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    :cond_2
    return-void
.end method

.method public getAttributeSeparator()Lcom/vladsch/flexmark/util/sequence/BasedSequence;
    .locals 1

    .line 75
    iget-object v0, p0, Lcom/vladsch/flexmark/ext/attributes/AttributeNode;->attributeSeparator:Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    return-object v0
.end method

.method public getClosingMarker()Lcom/vladsch/flexmark/util/sequence/BasedSequence;
    .locals 1

    .line 99
    iget-object v0, p0, Lcom/vladsch/flexmark/ext/attributes/AttributeNode;->closingMarker:Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    return-object v0
.end method

.method public getName()Lcom/vladsch/flexmark/util/sequence/BasedSequence;
    .locals 1

    .line 67
    iget-object v0, p0, Lcom/vladsch/flexmark/ext/attributes/AttributeNode;->name:Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    return-object v0
.end method

.method public getOpeningMarker()Lcom/vladsch/flexmark/util/sequence/BasedSequence;
    .locals 1

    .line 91
    iget-object v0, p0, Lcom/vladsch/flexmark/ext/attributes/AttributeNode;->openingMarker:Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    return-object v0
.end method

.method public getSegments()[Lcom/vladsch/flexmark/util/sequence/BasedSequence;
    .locals 3

    const/4 v0, 0x5

    .line 21
    new-array v0, v0, [Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    const/4 v1, 0x0

    iget-object v2, p0, Lcom/vladsch/flexmark/ext/attributes/AttributeNode;->name:Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    aput-object v2, v0, v1

    const/4 v1, 0x1

    iget-object v2, p0, Lcom/vladsch/flexmark/ext/attributes/AttributeNode;->attributeSeparator:Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    aput-object v2, v0, v1

    const/4 v1, 0x2

    iget-object v2, p0, Lcom/vladsch/flexmark/ext/attributes/AttributeNode;->openingMarker:Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    aput-object v2, v0, v1

    const/4 v1, 0x3

    iget-object v2, p0, Lcom/vladsch/flexmark/ext/attributes/AttributeNode;->value:Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    aput-object v2, v0, v1

    const/4 v1, 0x4

    iget-object v2, p0, Lcom/vladsch/flexmark/ext/attributes/AttributeNode;->closingMarker:Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    aput-object v2, v0, v1

    return-object v0
.end method

.method public getValue()Lcom/vladsch/flexmark/util/sequence/BasedSequence;
    .locals 1

    .line 83
    iget-object v0, p0, Lcom/vladsch/flexmark/ext/attributes/AttributeNode;->value:Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    return-object v0
.end method

.method public isClass()Z
    .locals 2

    .line 59
    invoke-virtual {p0}, Lcom/vladsch/flexmark/ext/attributes/AttributeNode;->isImplicitName()Z

    move-result v0

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/vladsch/flexmark/ext/attributes/AttributeNode;->name:Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    const-string v1, "."

    invoke-virtual {v0, v1}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_1

    :cond_0
    invoke-virtual {p0}, Lcom/vladsch/flexmark/ext/attributes/AttributeNode;->isImplicitName()Z

    move-result v0

    if-nez v0, :cond_2

    iget-object v0, p0, Lcom/vladsch/flexmark/ext/attributes/AttributeNode;->name:Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    const-string v1, "class"

    invoke-virtual {v0, v1}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_2

    :cond_1
    const/4 v0, 0x1

    return v0

    :cond_2
    const/4 v0, 0x0

    return v0
.end method

.method public isId()Z
    .locals 2

    .line 63
    invoke-virtual {p0}, Lcom/vladsch/flexmark/ext/attributes/AttributeNode;->isImplicitName()Z

    move-result v0

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/vladsch/flexmark/ext/attributes/AttributeNode;->name:Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    const-string v1, "#"

    invoke-virtual {v0, v1}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_1

    :cond_0
    invoke-virtual {p0}, Lcom/vladsch/flexmark/ext/attributes/AttributeNode;->isImplicitName()Z

    move-result v0

    if-nez v0, :cond_2

    iget-object v0, p0, Lcom/vladsch/flexmark/ext/attributes/AttributeNode;->name:Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    const-string v1, "id"

    invoke-virtual {v0, v1}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_2

    :cond_1
    const/4 v0, 0x1

    return v0

    :cond_2
    const/4 v0, 0x0

    return v0
.end method

.method public isImplicitName()Z
    .locals 1

    .line 55
    iget-object v0, p0, Lcom/vladsch/flexmark/ext/attributes/AttributeNode;->value:Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    invoke-interface {v0}, Lcom/vladsch/flexmark/util/sequence/BasedSequence;->isNotNull()Z

    move-result v0

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/vladsch/flexmark/ext/attributes/AttributeNode;->attributeSeparator:Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    invoke-interface {v0}, Lcom/vladsch/flexmark/util/sequence/BasedSequence;->isNull()Z

    move-result v0

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/vladsch/flexmark/ext/attributes/AttributeNode;->name:Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    invoke-interface {v0}, Lcom/vladsch/flexmark/util/sequence/BasedSequence;->isNotNull()Z

    move-result v0

    if-eqz v0, :cond_0

    const/4 v0, 0x1

    return v0

    :cond_0
    const/4 v0, 0x0

    return v0
.end method

.method public setAttributeSeparator(Lcom/vladsch/flexmark/util/sequence/BasedSequence;)V
    .locals 0

    .line 79
    iput-object p1, p0, Lcom/vladsch/flexmark/ext/attributes/AttributeNode;->attributeSeparator:Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    return-void
.end method

.method public setClosingMarker(Lcom/vladsch/flexmark/util/sequence/BasedSequence;)V
    .locals 0

    .line 103
    iput-object p1, p0, Lcom/vladsch/flexmark/ext/attributes/AttributeNode;->closingMarker:Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    return-void
.end method

.method public setName(Lcom/vladsch/flexmark/util/sequence/BasedSequence;)V
    .locals 0

    .line 71
    iput-object p1, p0, Lcom/vladsch/flexmark/ext/attributes/AttributeNode;->name:Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    return-void
.end method

.method public setOpeningMarker(Lcom/vladsch/flexmark/util/sequence/BasedSequence;)V
    .locals 0

    .line 95
    iput-object p1, p0, Lcom/vladsch/flexmark/ext/attributes/AttributeNode;->openingMarker:Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    return-void
.end method

.method public setValue(Lcom/vladsch/flexmark/util/sequence/BasedSequence;)V
    .locals 0

    .line 87
    iput-object p1, p0, Lcom/vladsch/flexmark/ext/attributes/AttributeNode;->value:Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    return-void
.end method
