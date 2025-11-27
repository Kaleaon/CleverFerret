.class public Lcom/vladsch/flexmark/util/sequence/ReplacedTextMapper;
.super Ljava/lang/Object;
.source "ReplacedTextMapper.java"


# static fields
.field static final synthetic $assertionsDisabled:Z


# instance fields
.field private original:Lcom/vladsch/flexmark/util/sequence/BasedSequence;

.field private parent:Lcom/vladsch/flexmark/util/sequence/ReplacedTextMapper;

.field private regions:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList<",
            "Lcom/vladsch/flexmark/util/sequence/ReplacedTextRegion;",
            ">;"
        }
    .end annotation
.end field

.field private replacedLength:I

.field private replacedSegments:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList<",
            "Lcom/vladsch/flexmark/util/sequence/BasedSequence;",
            ">;"
        }
    .end annotation
.end field

.field private replacedSequence:Lcom/vladsch/flexmark/util/sequence/BasedSequence;


# direct methods
.method static constructor <clinit>()V
    .locals 0

    return-void
.end method

.method public constructor <init>(Lcom/vladsch/flexmark/util/sequence/BasedSequence;)V
    .locals 1

    .line 25
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 20
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lcom/vladsch/flexmark/util/sequence/ReplacedTextMapper;->regions:Ljava/util/ArrayList;

    .line 21
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lcom/vladsch/flexmark/util/sequence/ReplacedTextMapper;->replacedSegments:Ljava/util/ArrayList;

    const/4 v0, 0x0

    .line 22
    iput v0, p0, Lcom/vladsch/flexmark/util/sequence/ReplacedTextMapper;->replacedLength:I

    const/4 v0, 0x0

    .line 23
    iput-object v0, p0, Lcom/vladsch/flexmark/util/sequence/ReplacedTextMapper;->replacedSequence:Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    .line 26
    iput-object p1, p0, Lcom/vladsch/flexmark/util/sequence/ReplacedTextMapper;->original:Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    .line 27
    iput-object v0, p0, Lcom/vladsch/flexmark/util/sequence/ReplacedTextMapper;->parent:Lcom/vladsch/flexmark/util/sequence/ReplacedTextMapper;

    return-void
.end method

.method private constructor <init>(Lcom/vladsch/flexmark/util/sequence/ReplacedTextMapper;)V
    .locals 1

    .line 30
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 20
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lcom/vladsch/flexmark/util/sequence/ReplacedTextMapper;->regions:Ljava/util/ArrayList;

    .line 21
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lcom/vladsch/flexmark/util/sequence/ReplacedTextMapper;->replacedSegments:Ljava/util/ArrayList;

    const/4 v0, 0x0

    .line 22
    iput v0, p0, Lcom/vladsch/flexmark/util/sequence/ReplacedTextMapper;->replacedLength:I

    const/4 v0, 0x0

    .line 23
    iput-object v0, p0, Lcom/vladsch/flexmark/util/sequence/ReplacedTextMapper;->replacedSequence:Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    .line 31
    iget-object v0, p1, Lcom/vladsch/flexmark/util/sequence/ReplacedTextMapper;->parent:Lcom/vladsch/flexmark/util/sequence/ReplacedTextMapper;

    iput-object v0, p0, Lcom/vladsch/flexmark/util/sequence/ReplacedTextMapper;->parent:Lcom/vladsch/flexmark/util/sequence/ReplacedTextMapper;

    .line 32
    iget-object v0, p1, Lcom/vladsch/flexmark/util/sequence/ReplacedTextMapper;->original:Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    iput-object v0, p0, Lcom/vladsch/flexmark/util/sequence/ReplacedTextMapper;->original:Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    .line 33
    iget-object v0, p1, Lcom/vladsch/flexmark/util/sequence/ReplacedTextMapper;->regions:Ljava/util/ArrayList;

    iput-object v0, p0, Lcom/vladsch/flexmark/util/sequence/ReplacedTextMapper;->regions:Ljava/util/ArrayList;

    .line 34
    iget-object v0, p1, Lcom/vladsch/flexmark/util/sequence/ReplacedTextMapper;->replacedSegments:Ljava/util/ArrayList;

    iput-object v0, p0, Lcom/vladsch/flexmark/util/sequence/ReplacedTextMapper;->replacedSegments:Ljava/util/ArrayList;

    .line 35
    iget v0, p1, Lcom/vladsch/flexmark/util/sequence/ReplacedTextMapper;->replacedLength:I

    iput v0, p0, Lcom/vladsch/flexmark/util/sequence/ReplacedTextMapper;->replacedLength:I

    .line 36
    invoke-virtual {p1}, Lcom/vladsch/flexmark/util/sequence/ReplacedTextMapper;->getReplacedSequence()Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    move-result-object p1

    iput-object p1, p0, Lcom/vladsch/flexmark/util/sequence/ReplacedTextMapper;->replacedSequence:Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    return-void
.end method

.method private finalizeMods()V
    .locals 1

    .line 60
    iget-object v0, p0, Lcom/vladsch/flexmark/util/sequence/ReplacedTextMapper;->replacedSequence:Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    if-nez v0, :cond_0

    .line 61
    iget-object v0, p0, Lcom/vladsch/flexmark/util/sequence/ReplacedTextMapper;->replacedSegments:Ljava/util/ArrayList;

    invoke-static {v0}, Lcom/vladsch/flexmark/util/sequence/SegmentedSequence;->of(Ljava/util/List;)Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    move-result-object v0

    iput-object v0, p0, Lcom/vladsch/flexmark/util/sequence/ReplacedTextMapper;->replacedSequence:Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    :cond_0
    return-void
.end method

.method private parentOriginalOffset(I)I
    .locals 1

    .line 109
    iget-object v0, p0, Lcom/vladsch/flexmark/util/sequence/ReplacedTextMapper;->parent:Lcom/vladsch/flexmark/util/sequence/ReplacedTextMapper;

    if-eqz v0, :cond_0

    invoke-virtual {v0, p1}, Lcom/vladsch/flexmark/util/sequence/ReplacedTextMapper;->originalOffset(I)I

    move-result p1

    :cond_0
    return p1
.end method


# virtual methods
.method public addOriginalText(II)V
    .locals 6

    .line 78
    invoke-virtual {p0}, Lcom/vladsch/flexmark/util/sequence/ReplacedTextMapper;->isFinalized()Z

    move-result v0

    if-nez v0, :cond_1

    if-ge p1, p2, :cond_0

    .line 81
    iget-object v0, p0, Lcom/vladsch/flexmark/util/sequence/ReplacedTextMapper;->original:Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    invoke-interface {v0, p1, p2}, Lcom/vladsch/flexmark/util/sequence/BasedSequence;->subSequence(II)Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    move-result-object v0

    .line 82
    iget-object v1, p0, Lcom/vladsch/flexmark/util/sequence/ReplacedTextMapper;->regions:Ljava/util/ArrayList;

    new-instance v2, Lcom/vladsch/flexmark/util/sequence/ReplacedTextRegion;

    invoke-interface {v0}, Lcom/vladsch/flexmark/util/sequence/BasedSequence;->getSourceRange()Lcom/vladsch/flexmark/util/sequence/Range;

    move-result-object v3

    new-instance v4, Lcom/vladsch/flexmark/util/sequence/Range;

    invoke-direct {v4, p1, p2}, Lcom/vladsch/flexmark/util/sequence/Range;-><init>(II)V

    new-instance p1, Lcom/vladsch/flexmark/util/sequence/Range;

    iget p2, p0, Lcom/vladsch/flexmark/util/sequence/ReplacedTextMapper;->replacedLength:I

    invoke-interface {v0}, Lcom/vladsch/flexmark/util/sequence/BasedSequence;->length()I

    move-result v5

    add-int/2addr v5, p2

    invoke-direct {p1, p2, v5}, Lcom/vladsch/flexmark/util/sequence/Range;-><init>(II)V

    invoke-direct {v2, v3, v4, p1}, Lcom/vladsch/flexmark/util/sequence/ReplacedTextRegion;-><init>(Lcom/vladsch/flexmark/util/sequence/Range;Lcom/vladsch/flexmark/util/sequence/Range;Lcom/vladsch/flexmark/util/sequence/Range;)V

    invoke-virtual {v1, v2}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 83
    iget p1, p0, Lcom/vladsch/flexmark/util/sequence/ReplacedTextMapper;->replacedLength:I

    invoke-interface {v0}, Lcom/vladsch/flexmark/util/sequence/BasedSequence;->length()I

    move-result p2

    add-int/2addr p1, p2

    iput p1, p0, Lcom/vladsch/flexmark/util/sequence/ReplacedTextMapper;->replacedLength:I

    .line 84
    iget-object p1, p0, Lcom/vladsch/flexmark/util/sequence/ReplacedTextMapper;->replacedSegments:Ljava/util/ArrayList;

    invoke-virtual {p1, v0}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    :cond_0
    return-void

    .line 78
    :cond_1
    new-instance p1, Ljava/lang/IllegalStateException;

    const-string p2, "Cannot modify finalized ReplacedTextMapper"

    invoke-direct {p1, p2}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw p1
.end method

.method public addReplacedText(IILcom/vladsch/flexmark/util/sequence/BasedSequence;)V
    .locals 5

    .line 70
    invoke-virtual {p0}, Lcom/vladsch/flexmark/util/sequence/ReplacedTextMapper;->isFinalized()Z

    move-result v0

    if-nez v0, :cond_0

    .line 72
    iget-object v0, p0, Lcom/vladsch/flexmark/util/sequence/ReplacedTextMapper;->regions:Ljava/util/ArrayList;

    new-instance v1, Lcom/vladsch/flexmark/util/sequence/ReplacedTextRegion;

    iget-object v2, p0, Lcom/vladsch/flexmark/util/sequence/ReplacedTextMapper;->original:Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    invoke-interface {v2, p1, p2}, Lcom/vladsch/flexmark/util/sequence/BasedSequence;->subSequence(II)Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    move-result-object v2

    invoke-interface {v2}, Lcom/vladsch/flexmark/util/sequence/BasedSequence;->getSourceRange()Lcom/vladsch/flexmark/util/sequence/Range;

    move-result-object v2

    new-instance v3, Lcom/vladsch/flexmark/util/sequence/Range;

    invoke-direct {v3, p1, p2}, Lcom/vladsch/flexmark/util/sequence/Range;-><init>(II)V

    new-instance p1, Lcom/vladsch/flexmark/util/sequence/Range;

    iget p2, p0, Lcom/vladsch/flexmark/util/sequence/ReplacedTextMapper;->replacedLength:I

    invoke-interface {p3}, Lcom/vladsch/flexmark/util/sequence/BasedSequence;->length()I

    move-result v4

    add-int/2addr v4, p2

    invoke-direct {p1, p2, v4}, Lcom/vladsch/flexmark/util/sequence/Range;-><init>(II)V

    invoke-direct {v1, v2, v3, p1}, Lcom/vladsch/flexmark/util/sequence/ReplacedTextRegion;-><init>(Lcom/vladsch/flexmark/util/sequence/Range;Lcom/vladsch/flexmark/util/sequence/Range;Lcom/vladsch/flexmark/util/sequence/Range;)V

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 73
    iget p1, p0, Lcom/vladsch/flexmark/util/sequence/ReplacedTextMapper;->replacedLength:I

    invoke-interface {p3}, Lcom/vladsch/flexmark/util/sequence/BasedSequence;->length()I

    move-result p2

    add-int/2addr p1, p2

    iput p1, p0, Lcom/vladsch/flexmark/util/sequence/ReplacedTextMapper;->replacedLength:I

    .line 74
    iget-object p1, p0, Lcom/vladsch/flexmark/util/sequence/ReplacedTextMapper;->replacedSegments:Ljava/util/ArrayList;

    invoke-virtual {p1, p3}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    return-void

    .line 70
    :cond_0
    new-instance p1, Ljava/lang/IllegalStateException;

    const-string p2, "Cannot modify finalized ReplacedTextMapper"

    invoke-direct {p1, p2}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw p1
.end method

.method public getParent()Lcom/vladsch/flexmark/util/sequence/ReplacedTextMapper;
    .locals 1

    .line 66
    iget-object v0, p0, Lcom/vladsch/flexmark/util/sequence/ReplacedTextMapper;->parent:Lcom/vladsch/flexmark/util/sequence/ReplacedTextMapper;

    return-object v0
.end method

.method public getRegions()Ljava/util/ArrayList;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/ArrayList<",
            "Lcom/vladsch/flexmark/util/sequence/ReplacedTextRegion;",
            ">;"
        }
    .end annotation

    .line 89
    invoke-direct {p0}, Lcom/vladsch/flexmark/util/sequence/ReplacedTextMapper;->finalizeMods()V

    .line 90
    iget-object v0, p0, Lcom/vladsch/flexmark/util/sequence/ReplacedTextMapper;->regions:Ljava/util/ArrayList;

    return-object v0
.end method

.method public getReplacedLength()I
    .locals 1

    .line 104
    invoke-direct {p0}, Lcom/vladsch/flexmark/util/sequence/ReplacedTextMapper;->finalizeMods()V

    .line 105
    iget v0, p0, Lcom/vladsch/flexmark/util/sequence/ReplacedTextMapper;->replacedLength:I

    return v0
.end method

.method public getReplacedSegments()Ljava/util/ArrayList;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/ArrayList<",
            "Lcom/vladsch/flexmark/util/sequence/BasedSequence;",
            ">;"
        }
    .end annotation

    .line 94
    invoke-direct {p0}, Lcom/vladsch/flexmark/util/sequence/ReplacedTextMapper;->finalizeMods()V

    .line 95
    iget-object v0, p0, Lcom/vladsch/flexmark/util/sequence/ReplacedTextMapper;->replacedSegments:Ljava/util/ArrayList;

    return-object v0
.end method

.method public getReplacedSequence()Lcom/vladsch/flexmark/util/sequence/BasedSequence;
    .locals 1

    .line 99
    invoke-direct {p0}, Lcom/vladsch/flexmark/util/sequence/ReplacedTextMapper;->finalizeMods()V

    .line 100
    iget-object v0, p0, Lcom/vladsch/flexmark/util/sequence/ReplacedTextMapper;->replacedSequence:Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    return-object v0
.end method

.method public isFinalized()Z
    .locals 1

    .line 56
    iget-object v0, p0, Lcom/vladsch/flexmark/util/sequence/ReplacedTextMapper;->replacedSequence:Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    if-eqz v0, :cond_0

    const/4 v0, 0x1

    return v0

    :cond_0
    const/4 v0, 0x0

    return v0
.end method

.method public isModified()Z
    .locals 1

    .line 52
    iget v0, p0, Lcom/vladsch/flexmark/util/sequence/ReplacedTextMapper;->replacedLength:I

    if-lez v0, :cond_0

    const/4 v0, 0x1

    return v0

    :cond_0
    const/4 v0, 0x0

    return v0
.end method

.method public originalOffset(I)I
    .locals 3

    .line 113
    invoke-direct {p0}, Lcom/vladsch/flexmark/util/sequence/ReplacedTextMapper;->finalizeMods()V

    .line 115
    iget-object v0, p0, Lcom/vladsch/flexmark/util/sequence/ReplacedTextMapper;->regions:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->isEmpty()Z

    move-result v0

    if-eqz v0, :cond_0

    invoke-direct {p0, p1}, Lcom/vladsch/flexmark/util/sequence/ReplacedTextMapper;->parentOriginalOffset(I)I

    move-result p1

    return p1

    .line 116
    :cond_0
    iget v0, p0, Lcom/vladsch/flexmark/util/sequence/ReplacedTextMapper;->replacedLength:I

    if-ne p1, v0, :cond_1

    iget-object p1, p0, Lcom/vladsch/flexmark/util/sequence/ReplacedTextMapper;->original:Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    invoke-interface {p1}, Lcom/vladsch/flexmark/util/sequence/BasedSequence;->length()I

    move-result p1

    invoke-direct {p0, p1}, Lcom/vladsch/flexmark/util/sequence/ReplacedTextMapper;->parentOriginalOffset(I)I

    move-result p1

    return p1

    .line 120
    :cond_1
    iget-object v0, p0, Lcom/vladsch/flexmark/util/sequence/ReplacedTextMapper;->regions:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :cond_2
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_3

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/vladsch/flexmark/util/sequence/ReplacedTextRegion;

    .line 121
    invoke-virtual {v1, p1}, Lcom/vladsch/flexmark/util/sequence/ReplacedTextRegion;->containsReplacedIndex(I)Z

    move-result v2

    if-eqz v2, :cond_2

    .line 122
    invoke-virtual {v1}, Lcom/vladsch/flexmark/util/sequence/ReplacedTextRegion;->getOriginalRange()Lcom/vladsch/flexmark/util/sequence/Range;

    move-result-object v0

    invoke-virtual {v0}, Lcom/vladsch/flexmark/util/sequence/Range;->getStart()I

    move-result v0

    add-int/2addr v0, p1

    invoke-virtual {v1}, Lcom/vladsch/flexmark/util/sequence/ReplacedTextRegion;->getReplacedRange()Lcom/vladsch/flexmark/util/sequence/Range;

    move-result-object p1

    invoke-virtual {p1}, Lcom/vladsch/flexmark/util/sequence/Range;->getStart()I

    move-result p1

    sub-int p1, v0, p1

    .line 123
    invoke-virtual {v1}, Lcom/vladsch/flexmark/util/sequence/ReplacedTextRegion;->getOriginalRange()Lcom/vladsch/flexmark/util/sequence/Range;

    move-result-object v0

    invoke-virtual {v0}, Lcom/vladsch/flexmark/util/sequence/Range;->getEnd()I

    move-result v0

    if-le p1, v0, :cond_3

    .line 124
    invoke-virtual {v1}, Lcom/vladsch/flexmark/util/sequence/ReplacedTextRegion;->getOriginalRange()Lcom/vladsch/flexmark/util/sequence/Range;

    move-result-object p1

    invoke-virtual {p1}, Lcom/vladsch/flexmark/util/sequence/Range;->getEnd()I

    move-result p1

    .line 137
    :cond_3
    invoke-direct {p0, p1}, Lcom/vladsch/flexmark/util/sequence/ReplacedTextMapper;->parentOriginalOffset(I)I

    move-result p1

    return p1
.end method

.method public startNestedReplacement(Lcom/vladsch/flexmark/util/sequence/BasedSequence;)V
    .locals 1

    .line 43
    new-instance v0, Lcom/vladsch/flexmark/util/sequence/ReplacedTextMapper;

    invoke-direct {v0, p0}, Lcom/vladsch/flexmark/util/sequence/ReplacedTextMapper;-><init>(Lcom/vladsch/flexmark/util/sequence/ReplacedTextMapper;)V

    iput-object v0, p0, Lcom/vladsch/flexmark/util/sequence/ReplacedTextMapper;->parent:Lcom/vladsch/flexmark/util/sequence/ReplacedTextMapper;

    .line 44
    iput-object p1, p0, Lcom/vladsch/flexmark/util/sequence/ReplacedTextMapper;->original:Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    .line 45
    new-instance p1, Ljava/util/ArrayList;

    invoke-direct {p1}, Ljava/util/ArrayList;-><init>()V

    iput-object p1, p0, Lcom/vladsch/flexmark/util/sequence/ReplacedTextMapper;->regions:Ljava/util/ArrayList;

    .line 46
    new-instance p1, Ljava/util/ArrayList;

    invoke-direct {p1}, Ljava/util/ArrayList;-><init>()V

    iput-object p1, p0, Lcom/vladsch/flexmark/util/sequence/ReplacedTextMapper;->replacedSegments:Ljava/util/ArrayList;

    const/4 p1, 0x0

    .line 47
    iput p1, p0, Lcom/vladsch/flexmark/util/sequence/ReplacedTextMapper;->replacedLength:I

    const/4 p1, 0x0

    .line 48
    iput-object p1, p0, Lcom/vladsch/flexmark/util/sequence/ReplacedTextMapper;->replacedSequence:Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    return-void
.end method
