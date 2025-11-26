.class public abstract Lcom/vladsch/flexmark/ast/HtmlInlineBase;
.super Lcom/vladsch/flexmark/util/ast/Node;
.source "HtmlInlineBase.java"


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 22
    invoke-direct {p0}, Lcom/vladsch/flexmark/util/ast/Node;-><init>()V

    return-void
.end method

.method public constructor <init>(Lcom/vladsch/flexmark/util/sequence/BasedSequence;)V
    .locals 0

    .line 26
    invoke-direct {p0, p1}, Lcom/vladsch/flexmark/util/ast/Node;-><init>(Lcom/vladsch/flexmark/util/sequence/BasedSequence;)V

    return-void
.end method


# virtual methods
.method public getAstExtra(Ljava/lang/StringBuilder;)V
    .locals 0

    .line 19
    invoke-virtual {p0, p1}, Lcom/vladsch/flexmark/ast/HtmlInlineBase;->astExtraChars(Ljava/lang/StringBuilder;)V

    return-void
.end method

.method public getSegments()[Lcom/vladsch/flexmark/util/sequence/BasedSequence;
    .locals 1

    .line 14
    sget-object v0, Lcom/vladsch/flexmark/ast/HtmlInlineBase;->EMPTY_SEGMENTS:[Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    return-object v0
.end method
