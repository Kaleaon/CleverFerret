.class public abstract Lcom/vladsch/flexmark/ast/ListItem;
.super Lcom/vladsch/flexmark/util/ast/Block;
.source "ListItem.java"

# interfaces
.implements Lcom/vladsch/flexmark/ast/ParagraphItemContainer;
.implements Lcom/vladsch/flexmark/util/ast/BlankLineContainer;


# static fields
.field static final synthetic $assertionsDisabled:Z


# instance fields
.field private containsBlankLine:Z

.field private hadBlankAfterItemParagraph:Z

.field protected markerSuffix:Lcom/vladsch/flexmark/util/sequence/BasedSequence;

.field protected openingMarker:Lcom/vladsch/flexmark/util/sequence/BasedSequence;

.field private tight:Z


# direct methods
.method static constructor <clinit>()V
    .locals 0

    return-void
.end method

.method public constructor <init>()V
    .locals 1

    .line 119
    invoke-direct {p0}, Lcom/vladsch/flexmark/util/ast/Block;-><init>()V

    .line 14
    sget-object v0, Lcom/vladsch/flexmark/util/sequence/BasedSequence;->NULL:Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    iput-object v0, p0, Lcom/vladsch/flexmark/ast/ListItem;->openingMarker:Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    .line 15
    sget-object v0, Lcom/vladsch/flexmark/util/sequence/BasedSequence;->NULL:Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    iput-object v0, p0, Lcom/vladsch/flexmark/ast/ListItem;->markerSuffix:Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    const/4 v0, 0x1

    .line 16
    iput-boolean v0, p0, Lcom/vladsch/flexmark/ast/ListItem;->tight:Z

    const/4 v0, 0x0

    .line 17
    iput-boolean v0, p0, Lcom/vladsch/flexmark/ast/ListItem;->hadBlankAfterItemParagraph:Z

    .line 18
    iput-boolean v0, p0, Lcom/vladsch/flexmark/ast/ListItem;->containsBlankLine:Z

    return-void
.end method

.method public constructor <init>(Lcom/vladsch/flexmark/ast/ListItem;)V
    .locals 1

    .line 122
    invoke-direct {p0}, Lcom/vladsch/flexmark/util/ast/Block;-><init>()V

    .line 14
    sget-object v0, Lcom/vladsch/flexmark/util/sequence/BasedSequence;->NULL:Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    iput-object v0, p0, Lcom/vladsch/flexmark/ast/ListItem;->openingMarker:Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    .line 15
    sget-object v0, Lcom/vladsch/flexmark/util/sequence/BasedSequence;->NULL:Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    iput-object v0, p0, Lcom/vladsch/flexmark/ast/ListItem;->markerSuffix:Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    const/4 v0, 0x1

    .line 16
    iput-boolean v0, p0, Lcom/vladsch/flexmark/ast/ListItem;->tight:Z

    const/4 v0, 0x0

    .line 17
    iput-boolean v0, p0, Lcom/vladsch/flexmark/ast/ListItem;->hadBlankAfterItemParagraph:Z

    .line 18
    iput-boolean v0, p0, Lcom/vladsch/flexmark/ast/ListItem;->containsBlankLine:Z

    .line 123
    iget-object v0, p1, Lcom/vladsch/flexmark/ast/ListItem;->openingMarker:Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    iput-object v0, p0, Lcom/vladsch/flexmark/ast/ListItem;->openingMarker:Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    .line 124
    iget-object v0, p1, Lcom/vladsch/flexmark/ast/ListItem;->markerSuffix:Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    iput-object v0, p0, Lcom/vladsch/flexmark/ast/ListItem;->markerSuffix:Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    .line 125
    iget-boolean v0, p1, Lcom/vladsch/flexmark/ast/ListItem;->tight:Z

    iput-boolean v0, p0, Lcom/vladsch/flexmark/ast/ListItem;->tight:Z

    .line 126
    iget-boolean v0, p1, Lcom/vladsch/flexmark/ast/ListItem;->hadBlankAfterItemParagraph:Z

    iput-boolean v0, p0, Lcom/vladsch/flexmark/ast/ListItem;->hadBlankAfterItemParagraph:Z

    .line 128
    invoke-virtual {p0, p1}, Lcom/vladsch/flexmark/ast/ListItem;->takeChildren(Lcom/vladsch/flexmark/util/ast/Node;)V

    .line 129
    invoke-virtual {p0}, Lcom/vladsch/flexmark/ast/ListItem;->setCharsFromContent()V

    return-void
.end method

.method public constructor <init>(Lcom/vladsch/flexmark/util/ast/BlockContent;)V
    .locals 0

    .line 141
    invoke-direct {p0, p1}, Lcom/vladsch/flexmark/util/ast/Block;-><init>(Lcom/vladsch/flexmark/util/ast/BlockContent;)V

    .line 14
    sget-object p1, Lcom/vladsch/flexmark/util/sequence/BasedSequence;->NULL:Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    iput-object p1, p0, Lcom/vladsch/flexmark/ast/ListItem;->openingMarker:Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    .line 15
    sget-object p1, Lcom/vladsch/flexmark/util/sequence/BasedSequence;->NULL:Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    iput-object p1, p0, Lcom/vladsch/flexmark/ast/ListItem;->markerSuffix:Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    const/4 p1, 0x1

    .line 16
    iput-boolean p1, p0, Lcom/vladsch/flexmark/ast/ListItem;->tight:Z

    const/4 p1, 0x0

    .line 17
    iput-boolean p1, p0, Lcom/vladsch/flexmark/ast/ListItem;->hadBlankAfterItemParagraph:Z

    .line 18
    iput-boolean p1, p0, Lcom/vladsch/flexmark/ast/ListItem;->containsBlankLine:Z

    return-void
.end method

.method public constructor <init>(Lcom/vladsch/flexmark/util/sequence/BasedSequence;)V
    .locals 0

    .line 133
    invoke-direct {p0, p1}, Lcom/vladsch/flexmark/util/ast/Block;-><init>(Lcom/vladsch/flexmark/util/sequence/BasedSequence;)V

    .line 14
    sget-object p1, Lcom/vladsch/flexmark/util/sequence/BasedSequence;->NULL:Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    iput-object p1, p0, Lcom/vladsch/flexmark/ast/ListItem;->openingMarker:Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    .line 15
    sget-object p1, Lcom/vladsch/flexmark/util/sequence/BasedSequence;->NULL:Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    iput-object p1, p0, Lcom/vladsch/flexmark/ast/ListItem;->markerSuffix:Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    const/4 p1, 0x1

    .line 16
    iput-boolean p1, p0, Lcom/vladsch/flexmark/ast/ListItem;->tight:Z

    const/4 p1, 0x0

    .line 17
    iput-boolean p1, p0, Lcom/vladsch/flexmark/ast/ListItem;->hadBlankAfterItemParagraph:Z

    .line 18
    iput-boolean p1, p0, Lcom/vladsch/flexmark/ast/ListItem;->containsBlankLine:Z

    return-void
.end method

.method public constructor <init>(Lcom/vladsch/flexmark/util/sequence/BasedSequence;Ljava/util/List;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/vladsch/flexmark/util/sequence/BasedSequence;",
            "Ljava/util/List<",
            "Lcom/vladsch/flexmark/util/sequence/BasedSequence;",
            ">;)V"
        }
    .end annotation

    .line 137
    invoke-direct {p0, p1, p2}, Lcom/vladsch/flexmark/util/ast/Block;-><init>(Lcom/vladsch/flexmark/util/sequence/BasedSequence;Ljava/util/List;)V

    .line 14
    sget-object p1, Lcom/vladsch/flexmark/util/sequence/BasedSequence;->NULL:Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    iput-object p1, p0, Lcom/vladsch/flexmark/ast/ListItem;->openingMarker:Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    .line 15
    sget-object p1, Lcom/vladsch/flexmark/util/sequence/BasedSequence;->NULL:Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    iput-object p1, p0, Lcom/vladsch/flexmark/ast/ListItem;->markerSuffix:Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    const/4 p1, 0x1

    .line 16
    iput-boolean p1, p0, Lcom/vladsch/flexmark/ast/ListItem;->tight:Z

    const/4 p1, 0x0

    .line 17
    iput-boolean p1, p0, Lcom/vladsch/flexmark/ast/ListItem;->hadBlankAfterItemParagraph:Z

    .line 18
    iput-boolean p1, p0, Lcom/vladsch/flexmark/ast/ListItem;->containsBlankLine:Z

    return-void
.end method


# virtual methods
.method public getAstExtra(Ljava/lang/StringBuilder;)V
    .locals 2

    .line 22
    iget-object v0, p0, Lcom/vladsch/flexmark/ast/ListItem;->openingMarker:Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    const-string v1, "open"

    invoke-static {p1, v0, v1}, Lcom/vladsch/flexmark/ast/ListItem;->segmentSpanChars(Ljava/lang/StringBuilder;Lcom/vladsch/flexmark/util/sequence/BasedSequence;Ljava/lang/String;)V

    .line 23
    iget-object v0, p0, Lcom/vladsch/flexmark/ast/ListItem;->markerSuffix:Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    const-string v1, "openSuffix"

    invoke-static {p1, v0, v1}, Lcom/vladsch/flexmark/ast/ListItem;->segmentSpanChars(Ljava/lang/StringBuilder;Lcom/vladsch/flexmark/util/sequence/BasedSequence;Ljava/lang/String;)V

    .line 24
    invoke-virtual {p0}, Lcom/vladsch/flexmark/ast/ListItem;->isTight()Z

    move-result v0

    if-eqz v0, :cond_0

    const-string v0, " isTight"

    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    goto :goto_0

    .line 25
    :cond_0
    const-string v0, " isLoose"

    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 26
    :goto_0
    invoke-virtual {p0}, Lcom/vladsch/flexmark/ast/ListItem;->isHadBlankAfterItemParagraph()Z

    move-result v0

    if-eqz v0, :cond_1

    const-string v0, " hadBlankLineAfter"

    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    return-void

    .line 27
    :cond_1
    invoke-virtual {p0}, Lcom/vladsch/flexmark/ast/ListItem;->isContainsBlankLine()Z

    move-result v0

    if-eqz v0, :cond_2

    const-string v0, " hadBlankLine"

    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    :cond_2
    return-void
.end method

.method public getLastBlankLineChild()Lcom/vladsch/flexmark/util/ast/Node;
    .locals 1

    .line 116
    invoke-virtual {p0}, Lcom/vladsch/flexmark/ast/ListItem;->getLastChild()Lcom/vladsch/flexmark/util/ast/Node;

    move-result-object v0

    return-object v0
.end method

.method public getMarkerSuffix()Lcom/vladsch/flexmark/util/sequence/BasedSequence;
    .locals 1

    .line 44
    iget-object v0, p0, Lcom/vladsch/flexmark/ast/ListItem;->markerSuffix:Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    return-object v0
.end method

.method public getOpeningMarker()Lcom/vladsch/flexmark/util/sequence/BasedSequence;
    .locals 1

    .line 36
    iget-object v0, p0, Lcom/vladsch/flexmark/ast/ListItem;->openingMarker:Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    return-object v0
.end method

.method public getSegments()[Lcom/vladsch/flexmark/util/sequence/BasedSequence;
    .locals 3

    const/4 v0, 0x2

    .line 32
    new-array v0, v0, [Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    const/4 v1, 0x0

    iget-object v2, p0, Lcom/vladsch/flexmark/ast/ListItem;->openingMarker:Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    aput-object v2, v0, v1

    const/4 v1, 0x1

    iget-object v2, p0, Lcom/vladsch/flexmark/ast/ListItem;->markerSuffix:Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    aput-object v2, v0, v1

    return-object v0
.end method

.method public isContainsBlankLine()Z
    .locals 1

    .line 102
    iget-boolean v0, p0, Lcom/vladsch/flexmark/ast/ListItem;->containsBlankLine:Z

    return v0
.end method

.method public isHadBlankAfterItemParagraph()Z
    .locals 1

    .line 98
    iget-boolean v0, p0, Lcom/vladsch/flexmark/ast/ListItem;->hadBlankAfterItemParagraph:Z

    return v0
.end method

.method public isInTightList()Z
    .locals 1

    .line 94
    invoke-virtual {p0}, Lcom/vladsch/flexmark/ast/ListItem;->getParent()Lcom/vladsch/flexmark/util/ast/Block;

    move-result-object v0

    instance-of v0, v0, Lcom/vladsch/flexmark/ast/ListBlock;

    if-eqz v0, :cond_1

    invoke-virtual {p0}, Lcom/vladsch/flexmark/ast/ListItem;->getParent()Lcom/vladsch/flexmark/util/ast/Block;

    move-result-object v0

    check-cast v0, Lcom/vladsch/flexmark/ast/ListBlock;

    invoke-virtual {v0}, Lcom/vladsch/flexmark/ast/ListBlock;->isTight()Z

    move-result v0

    if-eqz v0, :cond_0

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    return v0

    :cond_1
    :goto_0
    const/4 v0, 0x1

    return v0
.end method

.method public isItemParagraph(Lcom/vladsch/flexmark/ast/Paragraph;)Z
    .locals 2

    .line 82
    invoke-virtual {p0}, Lcom/vladsch/flexmark/ast/ListItem;->getFirstChild()Lcom/vladsch/flexmark/util/ast/Node;

    move-result-object v0

    :goto_0
    if-eqz v0, :cond_0

    .line 83
    instance-of v1, v0, Lcom/vladsch/flexmark/ast/Paragraph;

    if-nez v1, :cond_0

    invoke-virtual {v0}, Lcom/vladsch/flexmark/util/ast/Node;->getNext()Lcom/vladsch/flexmark/util/ast/Node;

    move-result-object v0

    goto :goto_0

    :cond_0
    if-ne v0, p1, :cond_1

    const/4 p1, 0x1

    return p1

    :cond_1
    const/4 p1, 0x0

    return p1
.end method

.method public isLoose()Z
    .locals 1

    .line 70
    invoke-virtual {p0}, Lcom/vladsch/flexmark/ast/ListItem;->isTight()Z

    move-result v0

    xor-int/lit8 v0, v0, 0x1

    return v0
.end method

.method public isOwnTight()Z
    .locals 1

    .line 66
    iget-boolean v0, p0, Lcom/vladsch/flexmark/ast/ListItem;->tight:Z

    return v0
.end method

.method public isParagraphInTightListItem(Lcom/vladsch/flexmark/ast/Paragraph;)Z
    .locals 1

    .line 74
    invoke-virtual {p0}, Lcom/vladsch/flexmark/ast/ListItem;->isTight()Z

    move-result v0

    if-nez v0, :cond_0

    const/4 p1, 0x0

    return p1

    .line 77
    :cond_0
    invoke-virtual {p0, p1}, Lcom/vladsch/flexmark/ast/ListItem;->isItemParagraph(Lcom/vladsch/flexmark/ast/Paragraph;)Z

    move-result p1

    return p1
.end method

.method public isParagraphWrappingDisabled(Lcom/vladsch/flexmark/ast/Paragraph;Lcom/vladsch/flexmark/parser/ListOptions;Lcom/vladsch/flexmark/util/options/DataHolder;)Z
    .locals 0

    .line 90
    invoke-virtual {p2, p1}, Lcom/vladsch/flexmark/parser/ListOptions;->isInTightListItem(Lcom/vladsch/flexmark/ast/Paragraph;)Z

    move-result p1

    return p1
.end method

.method public isTight()Z
    .locals 1

    .line 62
    iget-boolean v0, p0, Lcom/vladsch/flexmark/ast/ListItem;->tight:Z

    if-eqz v0, :cond_0

    invoke-virtual {p0}, Lcom/vladsch/flexmark/ast/ListItem;->isInTightList()Z

    move-result v0

    if-eqz v0, :cond_0

    const/4 v0, 0x1

    return v0

    :cond_0
    const/4 v0, 0x0

    return v0
.end method

.method public setContainsBlankLine(Z)V
    .locals 0

    .line 106
    iput-boolean p1, p0, Lcom/vladsch/flexmark/ast/ListItem;->containsBlankLine:Z

    return-void
.end method

.method public setHadBlankAfterItemParagraph(Z)V
    .locals 0

    .line 111
    iput-boolean p1, p0, Lcom/vladsch/flexmark/ast/ListItem;->hadBlankAfterItemParagraph:Z

    return-void
.end method

.method public setLoose(Z)V
    .locals 0

    xor-int/lit8 p1, p1, 0x1

    .line 58
    iput-boolean p1, p0, Lcom/vladsch/flexmark/ast/ListItem;->tight:Z

    return-void
.end method

.method public setMarkerSuffix(Lcom/vladsch/flexmark/util/sequence/BasedSequence;)V
    .locals 0

    .line 50
    iput-object p1, p0, Lcom/vladsch/flexmark/ast/ListItem;->markerSuffix:Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    return-void
.end method

.method public setOpeningMarker(Lcom/vladsch/flexmark/util/sequence/BasedSequence;)V
    .locals 0

    .line 40
    iput-object p1, p0, Lcom/vladsch/flexmark/ast/ListItem;->openingMarker:Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    return-void
.end method

.method public setTight(Z)V
    .locals 0

    .line 54
    iput-boolean p1, p0, Lcom/vladsch/flexmark/ast/ListItem;->tight:Z

    return-void
.end method
