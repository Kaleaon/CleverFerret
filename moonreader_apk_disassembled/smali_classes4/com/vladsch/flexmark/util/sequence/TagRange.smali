.class public Lcom/vladsch/flexmark/util/sequence/TagRange;
.super Lcom/vladsch/flexmark/util/sequence/Range;
.source "TagRange.java"


# instance fields
.field protected final tag:Ljava/lang/String;


# direct methods
.method public constructor <init>(Ljava/lang/CharSequence;II)V
    .locals 0

    .line 16
    invoke-direct {p0, p2, p3}, Lcom/vladsch/flexmark/util/sequence/Range;-><init>(II)V

    .line 17
    invoke-static {p1}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object p1

    iput-object p1, p0, Lcom/vladsch/flexmark/util/sequence/TagRange;->tag:Ljava/lang/String;

    return-void
.end method

.method public constructor <init>(Ljava/lang/CharSequence;Lcom/vladsch/flexmark/util/sequence/Range;)V
    .locals 0

    .line 11
    invoke-direct {p0, p2}, Lcom/vladsch/flexmark/util/sequence/Range;-><init>(Lcom/vladsch/flexmark/util/sequence/Range;)V

    .line 12
    invoke-static {p1}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object p1

    iput-object p1, p0, Lcom/vladsch/flexmark/util/sequence/TagRange;->tag:Ljava/lang/String;

    return-void
.end method

.method public static of(Ljava/lang/CharSequence;II)Lcom/vladsch/flexmark/util/sequence/TagRange;
    .locals 1

    .line 7
    new-instance v0, Lcom/vladsch/flexmark/util/sequence/TagRange;

    invoke-direct {v0, p0, p1, p2}, Lcom/vladsch/flexmark/util/sequence/TagRange;-><init>(Ljava/lang/CharSequence;II)V

    return-object v0
.end method


# virtual methods
.method public getTag()Ljava/lang/String;
    .locals 1

    .line 21
    iget-object v0, p0, Lcom/vladsch/flexmark/util/sequence/TagRange;->tag:Ljava/lang/String;

    return-object v0
.end method

.method public bridge synthetic withEnd(I)Lcom/vladsch/flexmark/util/sequence/Range;
    .locals 0

    .line 3
    invoke-virtual {p0, p1}, Lcom/vladsch/flexmark/util/sequence/TagRange;->withEnd(I)Lcom/vladsch/flexmark/util/sequence/TagRange;

    move-result-object p1

    return-object p1
.end method

.method public withEnd(I)Lcom/vladsch/flexmark/util/sequence/TagRange;
    .locals 3

    .line 35
    invoke-virtual {p0}, Lcom/vladsch/flexmark/util/sequence/TagRange;->getEnd()I

    move-result v0

    if-ne p1, v0, :cond_0

    return-object p0

    :cond_0
    new-instance v0, Lcom/vladsch/flexmark/util/sequence/TagRange;

    invoke-virtual {p0}, Lcom/vladsch/flexmark/util/sequence/TagRange;->getTag()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p0}, Lcom/vladsch/flexmark/util/sequence/TagRange;->getStart()I

    move-result v2

    invoke-direct {v0, v1, v2, p1}, Lcom/vladsch/flexmark/util/sequence/TagRange;-><init>(Ljava/lang/CharSequence;II)V

    return-object v0
.end method

.method public bridge synthetic withRange(II)Lcom/vladsch/flexmark/util/sequence/Range;
    .locals 0

    .line 3
    invoke-virtual {p0, p1, p2}, Lcom/vladsch/flexmark/util/sequence/TagRange;->withRange(II)Lcom/vladsch/flexmark/util/sequence/TagRange;

    move-result-object p1

    return-object p1
.end method

.method public withRange(II)Lcom/vladsch/flexmark/util/sequence/TagRange;
    .locals 2

    .line 40
    invoke-virtual {p0}, Lcom/vladsch/flexmark/util/sequence/TagRange;->getStart()I

    move-result v0

    if-ne p1, v0, :cond_0

    invoke-virtual {p0}, Lcom/vladsch/flexmark/util/sequence/TagRange;->getEnd()I

    move-result v0

    if-ne p2, v0, :cond_0

    return-object p0

    :cond_0
    new-instance v0, Lcom/vladsch/flexmark/util/sequence/TagRange;

    invoke-virtual {p0}, Lcom/vladsch/flexmark/util/sequence/TagRange;->getTag()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1, p1, p2}, Lcom/vladsch/flexmark/util/sequence/TagRange;-><init>(Ljava/lang/CharSequence;II)V

    return-object v0
.end method

.method public bridge synthetic withStart(I)Lcom/vladsch/flexmark/util/sequence/Range;
    .locals 0

    .line 3
    invoke-virtual {p0, p1}, Lcom/vladsch/flexmark/util/sequence/TagRange;->withStart(I)Lcom/vladsch/flexmark/util/sequence/TagRange;

    move-result-object p1

    return-object p1
.end method

.method public withStart(I)Lcom/vladsch/flexmark/util/sequence/TagRange;
    .locals 3

    .line 30
    invoke-virtual {p0}, Lcom/vladsch/flexmark/util/sequence/TagRange;->getStart()I

    move-result v0

    if-ne p1, v0, :cond_0

    return-object p0

    :cond_0
    new-instance v0, Lcom/vladsch/flexmark/util/sequence/TagRange;

    invoke-virtual {p0}, Lcom/vladsch/flexmark/util/sequence/TagRange;->getTag()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p0}, Lcom/vladsch/flexmark/util/sequence/TagRange;->getEnd()I

    move-result v2

    invoke-direct {v0, v1, p1, v2}, Lcom/vladsch/flexmark/util/sequence/TagRange;-><init>(Ljava/lang/CharSequence;II)V

    return-object v0
.end method

.method public withTag(Ljava/lang/CharSequence;)Lcom/vladsch/flexmark/util/sequence/TagRange;
    .locals 3

    .line 25
    iget-object v0, p0, Lcom/vladsch/flexmark/util/sequence/TagRange;->tag:Ljava/lang/String;

    invoke-static {p1}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_0

    return-object p0

    :cond_0
    new-instance v0, Lcom/vladsch/flexmark/util/sequence/TagRange;

    invoke-virtual {p0}, Lcom/vladsch/flexmark/util/sequence/TagRange;->getStart()I

    move-result v1

    invoke-virtual {p0}, Lcom/vladsch/flexmark/util/sequence/TagRange;->getEnd()I

    move-result v2

    invoke-direct {v0, p1, v1, v2}, Lcom/vladsch/flexmark/util/sequence/TagRange;-><init>(Ljava/lang/CharSequence;II)V

    return-object v0
.end method
