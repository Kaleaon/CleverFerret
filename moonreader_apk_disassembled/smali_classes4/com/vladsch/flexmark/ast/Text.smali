.class public final Lcom/vladsch/flexmark/ast/Text;
.super Lcom/vladsch/flexmark/util/ast/Node;
.source "Text.java"


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 9
    invoke-direct {p0}, Lcom/vladsch/flexmark/util/ast/Node;-><init>()V

    return-void
.end method

.method public constructor <init>(Lcom/vladsch/flexmark/util/sequence/BasedSequence;)V
    .locals 0

    .line 13
    invoke-direct {p0, p1}, Lcom/vladsch/flexmark/util/ast/Node;-><init>(Lcom/vladsch/flexmark/util/sequence/BasedSequence;)V

    return-void
.end method

.method public constructor <init>(Ljava/lang/String;)V
    .locals 0

    .line 17
    invoke-static {p1}, Lcom/vladsch/flexmark/util/sequence/CharSubSequence;->of(Ljava/lang/CharSequence;)Lcom/vladsch/flexmark/util/sequence/CharSubSequence;

    move-result-object p1

    invoke-direct {p0, p1}, Lcom/vladsch/flexmark/util/ast/Node;-><init>(Lcom/vladsch/flexmark/util/sequence/BasedSequence;)V

    return-void
.end method

.method public constructor <init>(Ljava/lang/String;Lcom/vladsch/flexmark/util/sequence/BasedSequence;)V
    .locals 0

    .line 21
    invoke-static {p1, p2}, Lcom/vladsch/flexmark/util/sequence/PrefixedSubSequence;->of(Ljava/lang/String;Lcom/vladsch/flexmark/util/sequence/BasedSequence;)Lcom/vladsch/flexmark/util/sequence/PrefixedSubSequence;

    move-result-object p1

    invoke-direct {p0, p1}, Lcom/vladsch/flexmark/util/ast/Node;-><init>(Lcom/vladsch/flexmark/util/sequence/BasedSequence;)V

    return-void
.end method


# virtual methods
.method public getAstExtra(Ljava/lang/StringBuilder;)V
    .locals 2

    .line 31
    invoke-virtual {p0, p1}, Lcom/vladsch/flexmark/ast/Text;->astExtraChars(Ljava/lang/StringBuilder;)V

    .line 32
    invoke-virtual {p0}, Lcom/vladsch/flexmark/ast/Text;->getChars()Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    move-result-object v0

    instance-of v0, v0, Lcom/vladsch/flexmark/util/sequence/PrefixedSubSequence;

    if-eqz v0, :cond_0

    .line 33
    invoke-virtual {p0}, Lcom/vladsch/flexmark/ast/Text;->getChars()Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    move-result-object v0

    const-string v1, "text"

    invoke-static {p1, v0, v1}, Lcom/vladsch/flexmark/ast/Text;->astChars(Ljava/lang/StringBuilder;Ljava/lang/CharSequence;Ljava/lang/String;)V

    :cond_0
    return-void
.end method

.method public getSegments()[Lcom/vladsch/flexmark/util/sequence/BasedSequence;
    .locals 1

    .line 26
    sget-object v0, Lcom/vladsch/flexmark/ast/Text;->EMPTY_SEGMENTS:[Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    return-object v0
.end method

.method protected toStringAttributes()Ljava/lang/String;
    .locals 2

    .line 39
    new-instance v0, Ljava/lang/StringBuilder;

    const-string v1, "text="

    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {p0}, Lcom/vladsch/flexmark/ast/Text;->getChars()Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method
