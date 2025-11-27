.class public Lcom/vladsch/flexmark/ast/HtmlInnerBlockComment;
.super Lcom/vladsch/flexmark/ast/HtmlBlockBase;
.source "HtmlInnerBlockComment.java"


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 21
    invoke-direct {p0}, Lcom/vladsch/flexmark/ast/HtmlBlockBase;-><init>()V

    return-void
.end method

.method public constructor <init>(Lcom/vladsch/flexmark/util/sequence/BasedSequence;)V
    .locals 0

    .line 25
    invoke-direct {p0, p1}, Lcom/vladsch/flexmark/ast/HtmlBlockBase;-><init>(Lcom/vladsch/flexmark/util/sequence/BasedSequence;)V

    return-void
.end method


# virtual methods
.method public getAstExtra(Ljava/lang/StringBuilder;)V
    .locals 0

    .line 18
    invoke-virtual {p0, p1}, Lcom/vladsch/flexmark/ast/HtmlInnerBlockComment;->astExtraChars(Ljava/lang/StringBuilder;)V

    return-void
.end method

.method public getSegments()[Lcom/vladsch/flexmark/util/sequence/BasedSequence;
    .locals 1

    .line 13
    sget-object v0, Lcom/vladsch/flexmark/ast/HtmlInnerBlockComment;->EMPTY_SEGMENTS:[Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    return-object v0
.end method
