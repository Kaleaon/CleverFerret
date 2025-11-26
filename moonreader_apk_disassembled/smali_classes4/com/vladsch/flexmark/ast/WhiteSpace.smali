.class public Lcom/vladsch/flexmark/ast/WhiteSpace;
.super Lcom/vladsch/flexmark/util/ast/Node;
.source "WhiteSpace.java"


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 10
    invoke-direct {p0}, Lcom/vladsch/flexmark/util/ast/Node;-><init>()V

    return-void
.end method

.method public constructor <init>(Lcom/vladsch/flexmark/util/sequence/BasedSequence;)V
    .locals 0

    .line 14
    invoke-direct {p0, p1}, Lcom/vladsch/flexmark/util/ast/Node;-><init>(Lcom/vladsch/flexmark/util/sequence/BasedSequence;)V

    return-void
.end method


# virtual methods
.method public getAstExtra(Ljava/lang/StringBuilder;)V
    .locals 0

    .line 24
    invoke-virtual {p0, p1}, Lcom/vladsch/flexmark/ast/WhiteSpace;->astExtraChars(Ljava/lang/StringBuilder;)V

    return-void
.end method

.method public getSegments()[Lcom/vladsch/flexmark/util/sequence/BasedSequence;
    .locals 1

    .line 19
    sget-object v0, Lcom/vladsch/flexmark/ast/WhiteSpace;->EMPTY_SEGMENTS:[Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    return-object v0
.end method

.method protected toStringAttributes()Ljava/lang/String;
    .locals 2

    .line 29
    new-instance v0, Ljava/lang/StringBuilder;

    const-string v1, "text="

    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {p0}, Lcom/vladsch/flexmark/ast/WhiteSpace;->getChars()Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method
