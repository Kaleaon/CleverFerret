.class public Lcom/vladsch/flexmark/util/sequence/ReplacedTextRegion;
.super Ljava/lang/Object;
.source "ReplacedTextRegion.java"


# instance fields
.field private final base:Lcom/vladsch/flexmark/util/sequence/Range;

.field private final original:Lcom/vladsch/flexmark/util/sequence/Range;

.field private final replaced:Lcom/vladsch/flexmark/util/sequence/Range;


# direct methods
.method public constructor <init>(Lcom/vladsch/flexmark/util/sequence/Range;Lcom/vladsch/flexmark/util/sequence/Range;Lcom/vladsch/flexmark/util/sequence/Range;)V
    .locals 0

    .line 8
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 9
    iput-object p1, p0, Lcom/vladsch/flexmark/util/sequence/ReplacedTextRegion;->base:Lcom/vladsch/flexmark/util/sequence/Range;

    .line 10
    iput-object p2, p0, Lcom/vladsch/flexmark/util/sequence/ReplacedTextRegion;->original:Lcom/vladsch/flexmark/util/sequence/Range;

    .line 11
    iput-object p3, p0, Lcom/vladsch/flexmark/util/sequence/ReplacedTextRegion;->replaced:Lcom/vladsch/flexmark/util/sequence/Range;

    return-void
.end method


# virtual methods
.method public containsBaseIndex(I)Z
    .locals 1

    .line 31
    iget-object v0, p0, Lcom/vladsch/flexmark/util/sequence/ReplacedTextRegion;->base:Lcom/vladsch/flexmark/util/sequence/Range;

    invoke-virtual {v0, p1}, Lcom/vladsch/flexmark/util/sequence/Range;->contains(I)Z

    move-result p1

    return p1
.end method

.method public containsOriginalIndex(I)Z
    .locals 1

    .line 35
    iget-object v0, p0, Lcom/vladsch/flexmark/util/sequence/ReplacedTextRegion;->original:Lcom/vladsch/flexmark/util/sequence/Range;

    invoke-virtual {v0, p1}, Lcom/vladsch/flexmark/util/sequence/Range;->contains(I)Z

    move-result p1

    return p1
.end method

.method public containsReplacedIndex(I)Z
    .locals 1

    .line 27
    iget-object v0, p0, Lcom/vladsch/flexmark/util/sequence/ReplacedTextRegion;->replaced:Lcom/vladsch/flexmark/util/sequence/Range;

    invoke-virtual {v0, p1}, Lcom/vladsch/flexmark/util/sequence/Range;->contains(I)Z

    move-result p1

    return p1
.end method

.method public getBaseRange()Lcom/vladsch/flexmark/util/sequence/Range;
    .locals 1

    .line 15
    iget-object v0, p0, Lcom/vladsch/flexmark/util/sequence/ReplacedTextRegion;->base:Lcom/vladsch/flexmark/util/sequence/Range;

    return-object v0
.end method

.method public getOriginalRange()Lcom/vladsch/flexmark/util/sequence/Range;
    .locals 1

    .line 19
    iget-object v0, p0, Lcom/vladsch/flexmark/util/sequence/ReplacedTextRegion;->original:Lcom/vladsch/flexmark/util/sequence/Range;

    return-object v0
.end method

.method public getReplacedRange()Lcom/vladsch/flexmark/util/sequence/Range;
    .locals 1

    .line 23
    iget-object v0, p0, Lcom/vladsch/flexmark/util/sequence/ReplacedTextRegion;->replaced:Lcom/vladsch/flexmark/util/sequence/Range;

    return-object v0
.end method
